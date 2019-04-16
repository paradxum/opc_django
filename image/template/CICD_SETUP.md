# CI / CD Setup
There are a couple steps to setting up the CI/CD pipelines that I can't do automatically.

A quick note. prefixing any stage with a . in the .gitlab-ci.yml file disables it.

The Primary thing you need to do is set up the following:
* Configure your Chart repository
* Create an access token for Gitlab
* Add your kubeconfig for auto-deployment

It's all optional of course,
* If you don't want to use a chart repo just disable build_charts and deploy-master
* If you don't want to deploy a "testing" version just disable deploy-master

## Setting CI/CD Variables
For most of this, you'll need to set Environment variables that are only used during
the CI/CD pipelines. To do this, within the project go to Settings -> CI/CD -> 
Environment variables

### Chart Repo
I use chartmuseum with basic auth. For this to work I need to set three CI variables.
* CI_HELM_REPO - The main repo url (ex. https://charts.mydomain.com/bob.billings )
* CI_HELM_REPO_API - The api url for the repo (ex. https://charts.mydomain.com/api/bob.billings/charts )
* CI_HELM_AUTH - Username:Password pair for basic auth (ex. bobbillings:letmein )

### NPA Password
To allow auto-symantec-tagging for the prod branch we need a gitlab username/token pair.
You can create this by going to the settings for you account (upper right hand corner)
then Access Tokens. Create one with api permissions.
* NPA - Gitlab api access token (ex. bob.billings:09nasjb2clkJFGscna )

### Kube Config
WARNING: setting this up potentially gives all your developers full control of the cluster
so be careful. This really should NOT be your Primary / Production Cluster
1. Create a base64 encoded version of your kubeconfig ```cat ~/.kube/config |base64```
2. Set KUBECONFIG CI variable to the long string generated above


