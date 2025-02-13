param location string = 'eastus'

resource spoke2VNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'spoke2-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.2.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'DbSubnet'
        properties: {
          addressPrefix: '10.2.0.0/24'
        }
      }
    ]
  }
}
