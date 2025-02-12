# Azure Hub-Spoke Network Architecture Design

## Network Structure

### Hub VNet (10.0.0.0/16)
- **AzureBastionSubnet**: 10.0.1.0/27
- **GatewaySubnet**: 10.0.2.0/27  
- **SharedServicesSubnet**: 10.0.3.0/24 (optional)

### Spoke VNets
- **Spoke 1 (10.1.0.0/16)**: AppSubnet: 10.1.0.0/24
- **Spoke 2 (10.2.0.0/16)**: DbSubnet: 10.2.0.0/24

## Connectivity
- **VNet Peering**: Bidirectional peering between Hub and each Spoke
- **VPN Gateway**: Deployed in Hub for external connectivity
- **Azure Bastion**: For secure management access

## Security
- **NSG Rules**:
  - Allow SSH/RDP from Bastion subnet only
  - Deny all inbound traffic from internet
  - Allow outbound internet access
  - Allow intra-VNet communication

## Resource Tagging Strategy
- **Environment**: Production/Development
- **CostCenter**: [Department Code]
- **Application**: [Application Name]
- **Owner**: [Team Name]

## Network Diagram Description
```
[Hub VNet] (10.0.0.0/16)
   ├── AzureBastionSubnet (10.0.1.0/27)
   ├── GatewaySubnet (10.0.2.0/27)
   ├── SharedServicesSubnet (10.0.3.0/24)
   │
   ├── [Spoke 1] (10.1.0.0/16)
   │     └── AppSubnet (10.1.0.0/24)
   │
   └── [Spoke 2] (10.2.0.0/16)
         └── DbSubnet (10.2.0.0/24)
```

## Peering Configuration
- **Allow forwarded traffic**: Yes
- **Allow gateway transit**: Yes (Hub to Spoke)
- **Use remote gateways**: No (Spoke to Hub)
- **Traffic flow**: Hub ↔ Spoke1, Hub ↔ Spoke2

## Implementation Notes
1. Deploy resources in East US region
2. Apply NSG rules to all subnets
3. Implement resource tagging as specified
4. Configure monitoring alerts for critical resources
