param location string = 'eastus'

resource hubVNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'hub-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.1.0/27'
        }
      }
      {
        name: 'GatewaySubnet'
        properties: {
          addressPrefix: '10.0.2.0/27'
        }
      }
      {
        name: 'SharedServicesSubnet'
        properties: {
          addressPrefix: '10.0.3.0/24'
        }
      }
    ]
  }
}
