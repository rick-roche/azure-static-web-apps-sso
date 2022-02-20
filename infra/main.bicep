param appName string
param location string
param repositoryUrl string
param repositoryToken string
param tags object

module kv 'key-vault.bicep' = {
  name: 'deploy-kv-${appName}'
  params: {
    enableSoftDelete: false
    keyVaultName: 'kv-${appName}'
    location: location
    tags: tags
  }
}

module swa 'static-sites.bicep' = {
  name: 'deploy-swa-${appName}'
  params: {
    buildProperties: {
      skipGithubActionWorkflowGeneration: true
    }
    location: location
    repositoryBranch: 'main'
    repositoryUrl: repositoryUrl
    repositoryToken: repositoryToken
    sku: {
      name: 'Standard'
      tier: 'Standard'
    }
    stagingEnvironmentPolicy: 'Enabled'
    staticSiteName: 'stapp-${appName}'
    tags: tags
  }
}

output keyVaultName string = kv.outputs.keyVaultName
output siteName string = swa.outputs.siteName
output siteDefaultHostname string = swa.outputs.defaultHostName
