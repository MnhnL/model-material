select
	D."Determination_Key" as identification_id,
	DT."LONG_NAME" as identification_type,
  	'' as   taxon_formula,
	  '' as   verbatim_identification,
  	C."Published_Term"   as   type_status,
 	  '' as   identified_by,
    '' as   identified_by_id,
    '' as   date_identified,
    '' as   identification_references,
    D."Confidence" as   identification_verification_status,
    D."Notes" as   identification_remarks,
    '' as   type_designation_type,
    '' as   type_designated_by
from foreign_all."Determination" D
left join foreign_all."DETERMINATION_TYPE" DT on D."Determination_Type_Key" = DT."DETERMINATION_TYPE_KEY"
left  join foreign_all."Concept" C on D."Nomenclatural_Status_Concept_Key" = C."Concept_Key" 
;
