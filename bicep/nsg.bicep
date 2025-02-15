param location string = 'eastus'

resource hubNSG 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'hub-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'allow-ssh-rdp-from-bastion'
        properties: {
          access: 'Allow'
          destinationPortRange: '22-3389'
          direction: 'Inbound'
          priority: 100
          protocol: 'Tcp'
          sourceAddressPrefix: '10.0.1.0/27'
          sourcePortRange: '*'
          destinationAddressPrefix: '10.0.0.0/16'
        }
      }
      {
        name: 'deny-all-inbound'
        properties: {
          access: 'Deny'
          destinationPortRange: '*'
          direction: 'Inbound'
          priority: 4096
          protocol: '*'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'allow-outbound-internet'
        properties: {
          access: 'Allow'
          destinationAddressPrefix: '*'
          destinationPortRange: '*'
          direction: 'Outbound'
          priority: 100
          protocol: '*'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
        }
      }
      {
        name: 'allow-vnet-communication'
        properties: {
          access: 'Allow'
          destinationAddressPrefix: '10.0.0.0/16'
          destinationPortRange: '*'
          direction: 'Inbound'
          priority: 200
          protocol: '*'
          sourceAddressPrefix: '10.0.0.0/16'
          sourcePortRange: '*'
        }
      }
    ]
  }
}
