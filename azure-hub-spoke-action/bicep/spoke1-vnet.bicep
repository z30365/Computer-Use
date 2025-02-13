param location string = 'eastus'

resource spoke1VNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'spoke1-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'AppSubnet'
        properties: {
          addressPrefix: '10.1.0.0/24'
        }
      }
    ]
  }
}
