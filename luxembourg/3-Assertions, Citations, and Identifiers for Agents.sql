
select 
I.NAME_KEY as identifierTargetID,
'AGENT' as identifierTargetType,
	CASE	
		WHEN 
			SF.FILE_NAME like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF.FILE_NAME like  '%ORCID%' 
				THEN 'ORCID' 
		END as identifierType,
	SF.FILE_NAME as identifierValue

from INDIVIDUAL I
	join NAME_SOURCES NS on I.name_key =  NS.name_key
	join SOURCE_FILE SF on NS.SOURCE_KEY = SF.SOURCE_KEY
where FILE_NAME like '%wikidata%' or FILE_NAME like '%ORCID%'
	UNION
select 
O.NAME_KEY as identifierTargetID,
'AGENT' as identifierTargetType,
	CASE	
		WHEN 
			SF.FILE_NAME like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF.FILE_NAME like  '%ROR%' 
				THEN 'ROR' 
		END as identifierType,
	SF.FILE_NAME as identifierValue

from ORGANISATION O
	join NAME_SOURCES NS on O.name_key =  NS.name_key
	join SOURCE_FILE SF on NS.SOURCE_KEY = SF.SOURCE_KEY
where FILE_NAME like '%wikidata%' or FILE_NAME like '%ROR%'
UNION
select 
C.Collection_Unit_Key as identifierTargetID,
'COLLECTION' as identifierTargetType,
	CASE	
		WHEN 
			SF.FILE_NAME like  '%wikidata%' 
				THEN 'WIKIDATA'
		WHEN 
			SF.FILE_NAME like  '%grscicoll%' 
				THEN 'GRSCICOLL' 
		END as identifierType,
	SF.FILE_NAME as identifierValue

from Collection C
	 join Source_Join SJ on C.Collection_Unit_Key =  SJ.Record_Key
	 join SOURCE_FILE SF on SJ.SOURCE_KEY = SF.SOURCE_KEY
where SF.FILE_NAME like '%wikidata%' or SF.FILE_NAME like '%gbif%'

