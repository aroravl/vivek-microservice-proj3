echo Step 1
aws configure
aws sts get-caller-identity
echo Step 2
aws eks --region us-east-1 update-kubeconfig --name my-cluster
kubectl config current-context
kubectl get svc
kubectl port-forward svc/postgresql-service 5433:5432 &
echo Step 3
apt update
apt install build-essential libpq-dev -y
sleep 2
echo Step 4
apt install postgresql postgresql-contrib -y
sleep 2
echo Step 5
pip install --upgrade pip setuptools wheel
echo Step 6
cd analytics/
cd
export DB_USERNAME=myuser; export DB_PASSWORD=mypassword; export DB_PORT=5433 ; export DB_NAME=mydatabase ; export POSTGRES_PASSWORD=mypassword
echo Step 7
apt install docker-ce docker-ce-cli containerd.io -y

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin  333514637410.dkr.ecr.us-east-1.amazonaws.com

kubectl get pods
kubectl exec -it postgresql-77b49c94cd-gb566 -- bash


# ssh-keygen -t ed25519 -C "vivek.arora1@natwest.comcom"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed