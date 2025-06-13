Pre-Reqs:
EKS, Docker CLI, Python3.8+

1. Create a Docker image using the provided docker file and push it to your ECR. This contains the logic to build you application
2. Setup a codebuild project in AWS using the buildspec.yml provided and also connect it to your github repository.
You will need to setup the env variables in the codebuild project that are needed by the yml above.
DB_USERNAME
DB_PASSWORD
DB_HOST (defaults to 127.0.0.1)
DB_PORT (defaults to 5432)
DB_NAME (defaults to postgres)
3. Using the supplied files in deployment directory create your deployment
eg: kubectl apply -f <file-name.yml>
4. Check CloudWatch Logs to see the logs of you application and that it is successfully deployed.
5. Verify the application works. See example below:
List your pods
app root$ kubectl get pods
NAME                          READY   STATUS    RESTARTS   AGE
coworking-d9c995b7b-5zk25     1/1     Running   0          77m
postgresql-77b49c94cd-zflff   1/1     Running   0          137m

Try hitting the application URL via curl
app root$ curl a1ad333ad9f464833a67c9c2370d1c71-1040151302.us-east-1.elb.amazonaws.com:5153/api/reports/daily_usage
{"2023-02-07":42,"2023-02-08":209,"2023-02-09":191,"2023-02-10":169,"2023-02-11":156,"2023-02-12":189,"2023-02-13":207,"2023-02-14":148}
