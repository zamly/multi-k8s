docker build -t zamlythaha/multi-client -f ./client/Dockerfile ./client
docker build -t zamlythaha/multi-server -f ./server/Dockerfile ./server
docker build -t zamlythaha/multi-worker -f ./worker/Dockerfile ./worker
docker push zamlythaha/multi-client
docker push zamlythaha/multi-server
docker push zamlythaha/multi-worker