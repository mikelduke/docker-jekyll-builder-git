# jekyll-builder-git

Docker image to checkout a git repo, run a jekyll build, and the SCP the generated _site folder to 
somewhere else.

This lets you use a short lived free Heroku one-off dyno to build a Jekyll app that is hosted somewhere else.

Uses docker image jekyll/builder from https://github.com/jekyll/docker

### Environment Variables
Set these variables in a run command or elsewhere:
* GIT_HOST - Hostname for git repo
* GIT_REPO - Path to git repo
* SCP_HOST - Hostname for SCP destination
* SCP_DEST - SCP Copy Destination
* KEY - Private key for Git over SSH and SCP

# Heroku
* Create a new app
``` heroku create jekyll-builder ```
* Push the Docker Image
``` heroku container:push builder --app jekyll-builder ```
* Create the Environment variables above in the Heroku admin console
* Run the builder
``` heroku run -a jekyll-builder --type builder bash build.sh ```

## Heroku Trigger Script

The script ```run-heroku-jekyll-build.sh``` is an example Heroku API curl request to trigger the 
jekyll builder. 

* Set your app name in the APP_ID_OR_NAME variable
* Get a Heroku API Token by running ```heroku auth:token```
* Set TOKEN= to the token
* Run ```./run-heroku-jekyll-build.sh``` to trigger a build. 
* Logs can be viewed from the Heroku Dev console log viewer. Make sure you have it up when 
running the build, the logs are not saved.

# Docker

* Docker Build
``` docker build -t jekyll-builder-git . ```
* Sample Docker Run Command
```
docker run \
  --rm \
  -it \
  -e "GIT_HOST=github.com" \
  -e "SCP_HOST=yoursite.com" \
  -e "GIT_REPO=https://something" \
  -e "SCP_DEST=you@yoursite.com:/path/to/dest/" \
  -e "KEY=-----BEGIN RSA PRIVATE KEY-----
1234567890
-----END RSA PRIVATE KEY-----"  \
  jekyll-builder-git
```
