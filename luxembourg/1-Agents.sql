#### queries data for AGENTS  

select 
	I."NAME_KEY" as agentID,
	TRIM(concat(I."FORENAME" , ' ', I."SURNAME" )) as preferredAgentName,
	'PERSON' as agentType
from foreign_all."PERSON" I

union 

select 
	O."NAME_KEY" as agentID,
	O."FULL_NAME" as preferredAgentName,
	'ORGANISATION' as agentType
from foreign_all."ORGANISATION" O

#### queries data for COLLECTIONS  

select 
	C."Item_Name" as preferredAgentName,
	C."Collection_Unit_Key" as agentID,
	'COLLECTION' as agentType
from foreign_all."Collection" C

#### queries data for AGENTRALATIONSHIP  

select 
	NR."NAME_KEY_1" as subjectAgentID,
	NR."ROLE" as relationshipTo,
	NR."NAME_KEY_1" as objectAgentID
from foreign_all."NAME_RELATION" NR

	union 
	
select 
	C."Parent_Collection_Collection_Unit_Key" as subjectAgentID,
	'parent of' as relationshipTo,
	C."Collection_Unit_Key" as objectAgentID
from foreign_all."Collection" C
