#!/bin/bash

# Save the kubeconfig locally
if [ "$#" -ne 0 ]
  then 
    echo "Converting kubeconfig..."
    echo $1
    echo $1 > kube.config.b64
    cat kube.config.b64 | base64 --decode > kube.config
    cat kube.config
    echo "Converted kubeconfig."
  else 
    echo "Getting kubeconfig using az get-creadentials..."
    az aks get-credentials --resource-group amaaksv2 --name amaaks --admin
    echo "Completed kubeconfig"
fi

cat <<EOF | kubectl apply --kubeconfig=kube.config -f -
apiVersion: v1
kind: Secret
metadata:
  name: registry-ca
  namespace: kube-system
type: Opaque
data:
  registry-ca: $(cat ./harbor/ca.crt | base64 -w 0 | tr -d '\n')
EOF

kubectl apply -f aks-harbor-ca-daemonset.yaml  --kubeconfig=kube.config 
kubectl create secret docker-registry amaaksregcred --docker-server=amaaks --docker-username=susendocker --docker-password=Test2022@123 --docker-email=ssenani@gmail.com --kubeconfig=kube.config

# Deploy containers
kubectl apply -f kanary-deployment.yaml --kubeconfig=kube.config

cat <<EOF | kubectl apply --kubeconfig=kube.config -f -
apiVersion: v1
kind: Service
metadata:
  name: kanary-service
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-resource-group: $2
spec:
  type: LoadBalancer
  selector:
    app: kanary
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  loadBalancerIP: $3
EOF


exit;
