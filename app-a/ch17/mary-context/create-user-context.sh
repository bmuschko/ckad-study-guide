openssl genrsa -out mary.key 2048
openssl req -new -key mary.key -out mary.csr -subj "/CN=mary"
csr=$(cat mary.csr | base64 | tr -d "\n")

cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: mary
spec:
  request: $csr
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400
  usages:
  - client auth
EOF

kubectl certificate approve mary
kubectl get csr mary -o jsonpath='{.status.certificate}'| base64 -d > mary.crt
kubectl config set-credentials mary --client-key=mary.key --client-certificate=mary.crt --embed-certs=true
kubectl config set-context mary-context --cluster=minikube --user=mary
