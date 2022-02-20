param keyVaultName string

var kvBaseUri = 'https://${keyVaultName}${environment().suffixes.keyvaultDns}/secrets'

output aadClientIdRef string = '@Microsoft.KeyVault(SecretUri=${kvBaseUri}/aadClientId)'
output aadClientSecretRef string = '@Microsoft.KeyVault(SecretUri=${kvBaseUri}/aadClientSecret)'
