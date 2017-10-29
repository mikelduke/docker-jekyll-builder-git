# jekyll-builder-git

Uses docker image jekyll/builder from https://github.com/jekyll/docker

## Environment Variables
Set these variables in a run command or elsewhere:
* GIT_HOST - Hostname for git repo
* GIT_REPO - Path to git repo
* SCP_HOST - Hostname for SCP destination
* SCP_DEST - SCP Copy Destination
* KEY - Private key for Git over SSH and SCP

## Heroku

* Create a new app
``` heroku create jekyll-builder ```
* Push the Docker Image
``` heroku container:push builder --app jekyll-builder ```
* Create the Environment variables above in the Heroku admin console
* Run the builder
``` heroku run -a jekyll-builder --type builder bash build.sh ```

## Docker Build

``` docker build -t jekyll-builder-git . ```

## Sample Docker Run Command

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
