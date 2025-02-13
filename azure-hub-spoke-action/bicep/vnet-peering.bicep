param location string = 'eastus'

resource hubVNetPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = {
  name: 'hub-vnet/peer-to-spoke1'
  properties: {
    remoteVirtualNetwork: {
      id: resourceId('Microsoft.Network/virtualNetworks', 'spoke1-vnet')
    }
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource spoke1VNetPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = {
  name: 'spoke1-vnet/peer-to-hub'
  properties: {
    remoteVirtualNetwork: {
      id: resourceId('Microsoft.Network/virtualNetworks', 'hub-vnet')
    }
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}

resource hubVNetPeering2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = {
  name: 'hub-vnet/peer-to-spoke2'
  properties: {
    remoteVirtualNetwork: {
      id: resourceId('Microsoft.Network/virtualNetworks', 'spoke2-vnet')
    }
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
  }
}

resource spoke2VNetPeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01' = {
  name: 'spoke2-vnet/peer-to-hub'
  properties: {
    remoteVirtualNetwork: {
      id: resourceId('Microsoft.Network/virtualNetworks', 'hub-vnet')
    }
    allowForwardedTraffic: true
    allowGatewayTransit: false
    useRemoteGateways: true
  }
}
