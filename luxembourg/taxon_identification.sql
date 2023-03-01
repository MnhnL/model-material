select 
	D."Concept_Key" as taxon_id ,
	D."Determination_Key" as identification_id ,
	'' as taxon_order , --  not sure about this, numerique seuqence?
	'' as taxon_authority , -- not sure what this is
	'' as taxon_confidence_percent  -- not something used by MNHNL
  --? PRIMARY KEY (taxon_id, identification_id, taxon_order)
	
from foreign_all."Determination" D 
