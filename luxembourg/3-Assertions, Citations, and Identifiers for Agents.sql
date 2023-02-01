
##### gets IDs for people
select 
I."NAME_KEY" as identifierTargetID,
'AGENT' as identifierTargetType,
	CASE	
		WHEN 
			SF."FILE_NAME" like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF."FILE_NAME" like  '%orcid%' 
				THEN 'ORCID' 
		END as identifierType,
	SF."FILE_NAME" as identifierValue
from foreign_all."INDIVIDUAL" I
	join foreign_all."NAME_SOURCES" NS on I."NAME_KEY" =  NS."NAME_KEY"
	join foreign_all."SOURCE_FILE" SF on NS."SOURCE_KEY" = SF."SOURCE_KEY"
where SF."FILE_NAME" like '%wikidata%' or SF."FILE_NAME" like '%ORCID%'
	union 
##### gets IDs for organisations
select 
O."NAME_KEY" as identifierTargetID,
'AGENT' as identifierTargetType,
	CASE	
		WHEN 
			SF."FILE_NAME" like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF."FILE_NAME" like  '%ror%' 
				THEN 'ROR' 
		END as identifierType,
	SF."FILE_NAME" as identifierValue
from foreign_all."ORGANISATION" O
	join foreign_all."NAME_SOURCES" NS on O."NAME_KEY" =  NS."NAME_KEY"
	join foreign_all."SOURCE_FILE" SF on NS."SOURCE_KEY" = SF."SOURCE_KEY"
where "FILE_NAME" like '%wikidata%' or "FILE_NAME" like '%ROR%'
UNION
##### gets IDs for collections
select 
C."Collection_Unit_Key" as identifierTargetID,
'COLLECTION' as identifierTargetType,
	CASE	
		WHEN 
			SF."FILE_NAME" like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF."FILE_NAME" like  '%grscicoll%' 
				THEN 'GRSCICOLL' 
		END as identifierType,
	SF."FILE_NAME" as identifierValue
from foreign_all."Collection" C
	 join foreign_all."Source_Join" SJ on C."Collection_Unit_Key" =  SJ."Record_Key"
	 join foreign_all."SOURCE_FILE" SF on SJ."Record_Key" = SF."SOURCE_KEY"
where SF."FILE_NAME" like '%wikidata%' or SF."FILE_NAME" like '%gbif%'
