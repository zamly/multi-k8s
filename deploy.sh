docker build -t zamlythaha/multi-client:latest -t zamlythaha/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t zamlythaha/multi-server:latest -t zamlythaha/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t zamlythaha/multi-worker:latest -t zamlythaha/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push zamlythaha/multi-client:latest
docker push zamlythaha/multi-server:latest
docker push zamlythaha/multi-worker:latest

docker push zamlythaha/multi-client:$SHA
docker push zamlythaha/multi-server:$SHA
docker push zamlythaha/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=zamlythaha/multi-server:$SHA
kubectl set image deployments/client-deployment client=zamlythaha/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=zamlythaha/multi-worker:$SHA