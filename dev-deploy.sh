#!/bin/bash

# ip adresses for dev, stage, and prod
DEV_IP: 172.20.20.84
STAGE_IP: 45.144.133.39
PROD_IP: 45.144.133.48

# Connect to the remote server via SSH
ssh specht@DEV_IP

# Change directory to /var/www/admin.ergo-kampagne.de/
cd /var/www/admin.ergo-kampagne.de/

# Move the existing directus-be.tar.gz file to the 'old' directory
sudo mv directus-be.tar.gz old/

# Create a new tar.gz file named directus-be.tar.gz from the directus-be directory
sudo tar czf directus-be.tar.gz directus-be

# Exit the SSH session
exit

# Copy the directus-be.tar.gz file from the remote server to the local ~/Projects/ERGO/ directory
scp jansen@DEV_IP:/var/www/admin.ergo-kampagne.de/directus-be.tar.gz ~/Projects/ERGO/

# Copy the directus-be.tar.gz file to the remote server at STAGE_IP using the specified SSH key and disable strict host key checking
scp -i ~/.ssh/id_ergo_server -o StrictHostKeyChecking=no directus-be.tar.gz forge@STAGE_IP:~/

# Connect to the remote server at STAGE_IP using the specified SSH key
ssh -i ~/.ssh/id_ergo_server forge@STAGE_IP

# Change directory to ergo-pflegequiz.stage.p-bm.com/
cd ergo-pflegequiz.stage.p-bm.com/

# Move the existing directus-be.tar.gz file to the 'old' directory
mv directus-be.tar.gz old/

# Move the directus-be.tar.gz file from the parent directory to the current directory
mv ../directus-be.tar.gz ~/ergo-pflegequiz.stage.p-bm.com/

# Remove the existing directus-be directory
rm -rf directus-be

# Extract the contents of the directus-be.tar.gz file to the directus-be directory
tar xzf directus-be.tar.gz directus-be

# Change directory to directus-be/
cd directus-be/

# List running Docker containers
docker ps

# Stop and remove the Docker containers for the 'stage' project
docker compose -p stage down

# Start the Docker containers for the 'stage' project in detached mode
docker compose -p stage up -d

# sudo chmod -R 777 ./
# sudo chown -R $USER:$USER ./