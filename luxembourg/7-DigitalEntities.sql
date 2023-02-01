select 
	'STILL_IMAGE' as digital_entity_type,
	'https://archimg.mnhn.lu/' || replace(substr (sf."FILE_NAME",23), E'\\', '/')   as access_uri,
	'' as web_statement,
	'' as format,
	'CC-BY' as license,
	'' as  rights,
	'' as rights_uri,
	'' as  access_rights,
	'MNHNL' as rights_holder,
	'' as source,
	'' as  source_uri,
	'MNHNL' as creator,
	'' as  created,
	'' as modified,
	'' as language ,
	'' as bibliographic_citation
from foreign_all."SOURCE_FILE" sf 
where sf."FILE_NAME" ilike '%SERV-ARCHIMG%'
;
