Value Required LOCAL_INTERFACE (\S+)
Value CHASSIS_ID (.+?)
Value MANUFACTURER_NAME (.*?)
Value MODEL_NAME (.*?)
Value NEIGHBOR_PORT_ID (.*?)
Value NEIGHBOR_INTERFACE (.*?)
Value NEIGHBOR (.+?)
Value List SYSTEM_DESCRIPTION (.*)
Value CAPABILITIES (.*?)
Value MANAGEMENT_IP (\S+)
Value VLAN (\d+)
Value SERIAL (\S+)

Start
  ^${LOCAL_INTERFACE}\s+has\s+\d+\s+neighbors:$$
  ^\S+\s+has\s+\d+\s+neighbors
  ^Neighbor\s+index
  ^Chassis\s+type
  ^Chassis\s+ID\s+:${CHASSIS_ID}$$
  ^Port\s+ID\s+type
  ^Port\s+ID\s+:${NEIGHBOR_PORT_ID}\s*$$
  ^Port\s+description\s+:${NEIGHBOR_INTERFACE}\s*$$
  ^System\s+name\s+:${NEIGHBOR}\s*$$
  ^System\s+description\s+:${SYSTEM_DESCRIPTION} -> SystemDescription
  ^System\s+capabilities\s+supported
  ^System\s+capabilities\s+enabled\s+:${CAPABILITIES}\s*$$
  ^Management\s+address\s+type
  ^Management\s+address\s*:\s*${MANAGEMENT_IP}
  ^Expired\s+time
  ^Port\s+VLAN\s+ID\(PVID\)\s+:${VLAN}
  ^VLAN\s+name\s+of\s+VLAN
  ^Protocol\s+identity
  ^Auto-negotiation
  ^OperMau
  ^Power
  ^PSE
  ^Port\s+power
  ^Link\s+aggregation
  ^Aggregation
  ^Maximum\s+frame\s+Size
  ^MED\s+Device\s+information -> MED
  ^\s*$$
  ^. -> Error

SystemDescription
  ^${SYSTEM_DESCRIPTION} -> IgnoreDescription

IgnoreDescription
  ^System\s+capabilities\s+supported -> Start
  ^${SYSTEM_DESCRIPTION}
  ^\s*$$
  ^.*$$ -> Error

MED
  ^Device\s+class
  ^HardwareRev
  ^FirmwareRev
  ^SoftwareRev
  ^SerialNum\s+:${SERIAL}
  ^Manufacturer\s+name\s+:${MANUFACTURER_NAME}\s*$$
  ^Model\s+name\s+:${MODEL_NAME}\s*$$
  ^Asset\s+tracking
  ^Media\s+policy\s+type
  ^Unknown\s+Policy
  ^VLAN\s+tagged
  ^Media
  ^Power
  ^PoE
  ^Port\s+PSE\s+Priority
  ^Port\s+Available\s+power
  ^Location\s+format
  ^Location\s+information
  ^Ca
  ^\S+\s+has\s+\d+\s+neighbors -> Record Start
  ^\s*$$
  ^. -> Error