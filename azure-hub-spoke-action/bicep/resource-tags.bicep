param location string = 'eastus'
param environment string = 'Production'
param costCenter string = '[Department Code]'
param application string = '[Application Name]'
param owner string = '[Team Name]'

resource taggedResources 'Microsoft.Resources/tags@2021-04-01' = {
  name: 'default'
  properties: {
    tags: {
      Environment: environment
      CostCenter: costCenter
      Application: application
      Owner: owner
    }
  }
}
