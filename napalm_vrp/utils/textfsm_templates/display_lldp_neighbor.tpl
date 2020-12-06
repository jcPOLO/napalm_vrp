Value Required LOCAL_INTERFACE (\S+)
Value REMOTE_CHASSIS_ID (.+?)
Value REMOTE_SYSTEM_DESCRIPTION (.*)
Value REMOTE_PORT (.*?)
Value REMOTE_SYSTEM_NAME (.+?)
Value REMOTE_PORT_DESCRIPTION (.*?)
Value REMOTE_SYSTEM_ENABLE_CAPAB (.*?)
Value REMOTE_SYSTEM_CAPAB (.*)


Start
  ^${LOCAL_INTERFACE}\s+has\s+\d+\s+neighbors:$$
  ^\S+\s+has\s+\d+\s+neighbors
  ^Neighbor\s+index
  ^Chassis\s+type
  ^Chassis\s+ID\s+:${REMOTE_CHASSIS_ID}$$
  ^Port\s+ID\s+type
  ^Port\s+ID\s+:${REMOTE_PORT}\s*$$
  ^Port\s+description\s+:${REMOTE_PORT_DESCRIPTION}\s*$$
  ^System\s+name\s+:${REMOTE_SYSTEM_NAME}\s*$$
  ^System\s+description\s+:${REMOTE_SYSTEM_DESCRIPTION}\s*$$
  ^System\s+capabilities\s+supported\s+:${REMOTE_SYSTEM_CAPAB}\s*$$
  ^System\s+capabilities\s+enabled\s+:${REMOTE_SYSTEM_ENABLE_CAPAB}\s*$$ -> Record