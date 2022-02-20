param appName string
param location string
param repositoryUrl string
param repositoryToken string
param tags object

module swa 'static-sites.bicep' = {
  name: 'swa-${appName}'
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

output siteName string = swa.outputs.siteName
output siteDefaultHostname string = swa.outputs.defaultHostName
