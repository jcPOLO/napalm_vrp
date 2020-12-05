Value Required LOCAL_INTERFACE (\S+)
Value REMOTE_CHASSIS_ID (.+?)
Value MANUFACTURER_NAME (.*?)
Value MODEL_NAME (.*?)
Value NEIGHBOR_PORT_ID (.*?)
Value REMOTE_PORT (.*?)
Value REMOTE_SYSTEM_NAME (.+?)
Value List REMOTE_PORT_DESCRIPTION (.*)
Value REMOTE_SYSTEM_ENABLE_CAPAB (.*?)
Value MANAGEMENT_IP (\S+)
Value VLAN (\d+)
Value SERIAL (\S+)
Value REMOTE_SYSTEM_CAPAB (.*)



Start
  ^${LOCAL_INTERFACE}\s+has\s+\d+\s+neighbors:$$
  ^\S+\s+has\s+\d+\s+neighbors
  ^Neighbor\s+index
  ^Chassis\s+type
  ^Chassis\s+ID\s+:${REMOTE_CHASSIS_ID}$$
  ^Port\s+ID\s+type
  ^Port\s+ID\s+:${NEIGHBOR_PORT_ID}\s*$$
  ^Port\s+description\s+:${REMOTE_PORT}\s*$$
  ^System\s+name\s+:${REMOTE_SYSTEM_NAME}\s*$$
  ^System\s+description\s+:${REMOTE_PORT_DESCRIPTION} -> SystemDescription
  ^System\s+capabilities\s+supporteds+:${REMOTE_SYSTEM_CAPAB}\s*$$
  ^System\s+capabilities\s+enabled\s+:${REMOTE_SYSTEM_ENABLE_CAPAB}\s*$$
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
  ^${REMOTE_PORT_DESCRIPTION} -> IgnoreDescription

IgnoreDescription
  ^System\s+capabilities\s+supported -> Start
  ^${REMOTE_PORT_DESCRIPTION}
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