@description('Resource tags.')
param tags object

@description('Resource location.')
param location string

@description('The name of the key vault. e.g. kv-swa-sso')
param keyVaultName string

@description('The name of the SKU for the key vault.')
param sku string = 'Standard'

@description('Tenant id for the subscription.')
param tenant string = subscription().tenantId

@description('Enables soft delete.')
param enableSoftDelete bool = true

@description('Soft delete retention period.')
param softDeleteRetentionInDays int =  7

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  tags: tags
  properties: {
    sku: {
      name: sku
      family: 'A'
    }
    tenantId: tenant
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    enableSoftDelete: enableSoftDelete
    softDeleteRetentionInDays: softDeleteRetentionInDays
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
  }
}

output keyVaultName string = keyVault.name
output keyVaultResourceId string = keyVault.id
