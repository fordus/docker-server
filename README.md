## Packetriot Tunnel

### Configure pktriot:

Register at https://packetriot.com/ and activate a domain, create a CNAME record for your domain pointing to the address of your tunnel server.


```bash
docker exec -it tunnel pktriot configure
docker exec -it tunnel pktriot tunnel http add --domain [custom-domain] --destination frontend --http 80
docker restart tunnel
```

## Docker utils 

Run the following commands to clean up your docker environment:

```bash
docker rm -f $(docker ps -aq) 
sudo docker rmi -f $(docker images -aq)
docker-compose up --build --force-recreate -d
```