select
	SU."Collection_Unit_Key" ,
	SU."Parent_Collection_Collection_Unit_Key" ,
	C."Item_Name" as colelctionName ,
	CON."Published_Term" as specimenType ,
	CUN."Number" as catalogueNumber,
	CUN1."Number" as otherCatalogueNumber
from foreign_all."Specimen_Unit" SU
join foreign_all."Collection" C on SU."Parent_Collection_Collection_Unit_Key" = C."Collection_Unit_Key"  
join foreign_all."Collection_Unit_Number" CUN on SU."Collection_Unit_Key" = CUN."Collection_Unit_Key" and CUN."Preferred" ='1'
left join foreign_all."Collection_Unit_Number" CUN1 on SU."Collection_Unit_Key" = CUN1."Collection_Unit_Key" and CUN."Preferred" ='0'
join foreign_all."Concept" CON on SU."Specimen_Type_Concept_Key" = CON."Concept_Key" 
where SU."Parent_Collection_Collection_Unit_Key" = 'DSS0043900001VPF' -- specimens from a specific collection
;

