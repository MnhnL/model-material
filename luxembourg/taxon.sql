select 
  -- common to all
	C."Concept_Key"  as taxon_id ,
	-- TRIM(concat( T."Item_Name", ' ', TV."Author_And_Date" )) as scientific_name , -- should work but some issue with encoding of special characters?
	-- TV."Author_And_Date" as scientific_name_authorship ,  -- should work but some issue with encoding of special characters?
	'' as name_according_to ,   -- not something we use at MNHNL
	'' as name_according_to_id ,  -- not something we use at MNHNL
	CR."Item_Name" as taxon_rank ,
	'' as taxon_source , -- From what taxonomic authority is the information taken -- not something we use at MNHNL
	'' as scientific_name_id , -- not something we use at MNHNL
	'' as taxon_remarks ,  -- not something we use at MNHNL
  -- normalized view
	'' as parent_taxon_id , 
	T1."Item_Name"  as taxonomic_status ,
  -- denormalized
	'' as kingdom ,
 	'' as phylum ,
	'' as class ,
	'' as order ,
	'' as family ,
	'' as subfamily ,
	'' as genus ,
	'' as subgenus ,
	'' as accepted_scientific_name  -- populated only when scientific name is a synonym
from foreign_all."Concept" C
left join foreign_all."Term_Version" TV on C."Term_Version_Key" = TV."Term_Version_Key" 
left join foreign_all."Term" T on C."Term_Key" = T."Term_Key" 
left join foreign_all."Concept_Rank" CR on C."Concept_Rank_Key"  = CR."Concept_Rank_Key" 
left join foreign_all."Concept" C1 on C."Name_Type_Concept_Key" = C1."Concept_Key" 
left join foreign_all."Term" T1 on C1."Term_Key" = T1."Term_Key" 
left join foreign_all."Concept_Group" CG on C."Concept_Group_Key" = CG."Concept_Group_Key" 
left join foreign_all."Local_Domain" LD on CG."Local_Domain_Key" = LD."Local_Domain_Key" 

where LD."Domain_Key" = 'DSS0039400000002'





