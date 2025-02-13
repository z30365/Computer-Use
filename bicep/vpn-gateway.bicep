param location string = 'eastus'

resource vpnGateway 'Microsoft.Network/virtualNetworkGateways@2021-05-01' = {
  name: 'hub-vnet-gateway'
  location: location
  properties: {
    gatewayType: 'Vpn'
    vpnType: 'RouteBased'
    enableBgp: false
    activeActive: false
    sku: {
      name: 'VpnGw1'
      tier: 'VpnGw1'
    }
    ipConfigurations: [
      {
        name: 'default'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'hub-vnet', 'GatewaySubnet')
          }
        }
      }
    ]
  }
}
