param location string = 'eastus'

resource bastionHost 'Microsoft.Network/bastionHosts@2021-05-01' = {
  name: 'hub-bastion'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'IpConf'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'hub-vnet', 'AzureBastionSubnet')
          }
          publicIPAddress: {
            id: resourceId('Microsoft.Network/publicIPAddresses', 'hub-bastion-pip')
          }
        }
      }
    ]
  }
}

resource bastionPIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: 'hub-bastion-pip'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}
