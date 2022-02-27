param appName string
param location string
param repositoryUrl string
param repositoryToken string
param tags object

var keyVaultName = 'kv-${appName}'

module refs 'get-kv-secrets-refs.bicep' = {
  name: 'get-kv-secrets-refs-${appName}'
  params: {
    keyVaultName: keyVaultName
  }
}

module swa 'static-sites.bicep' = {
  name: 'deploy-swa-${appName}'
  params: {
    appSettings: {
      AAD_CLIENT_ID: refs.outputs.aadClientIdRef
      AAD_CLIENT_SECRET: refs.outputs.aadClientSecretRef
    }
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

// https://docs.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli#azure-built-in-roles-for-key-vault-data-plane-operations
var keyVaultSecretsUserRole = '4633458b-17de-408a-b874-0445c86b69e6'

module kv 'key-vault.bicep' = {
  name: 'deploy-kv-${appName}'
  params: {
    enableSoftDelete: false
    keyVaultName: keyVaultName
    location: location
    roleAssignments: [
      {
        roleDefinitionId: keyVaultSecretsUserRole
        principalType: 'ServicePrincipal'
        principalId: swa.outputs.siteSystemAssignedIdentityId
      }
    ]
    tags: tags
  }
}

output keyVaultName string = kv.outputs.keyVaultName
output siteName string = swa.outputs.siteName
output siteDefaultHostname string = swa.outputs.defaultHostName
