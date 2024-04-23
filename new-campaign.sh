#!/bin/bash

# prompt for entering the branch name
read -p "Enter branch name: " branch_name

# checkout the master branch
git checkout master

# fetch and pull the latest changes from the remote master repository
git fetch --all
git pull origin master

# creates the new branches for the campaign regarding to the branch name
git branch "campaign/$branch_name/dev"
git branch "campaign/$branch_name/release/master"
git branch "campaign/$branch_name/release/stage"
git branch "campaign/$branch_name/release/prod"

# push the new branches to the remote repository
git push origin "campaign/$branch_name/dev"
git push origin "campaign/$branch_name/release/master"
git push origin "campaign/$branch_name/release/stage"
git push origin "campaign/$branch_name/release/prod"

# checkout the dev branch
git checkout "campaign/$branch_name/dev"

exit


# change the permissions of the new-campaign.sh file if needed
# sudo chmod -R 777 ./new-campaign.sh
