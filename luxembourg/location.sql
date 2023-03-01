select
	L."LOCATION_KEY"  as location_id ,
	L."PARENT_KEY" as parent_location_id ,
	'' as higher_geography_id ,  -- not explicitly  in Recorder
	'' as higher_geography ,  -- not explicitly  in Recorder
	'' as continent ,  -- not explicitly in Recorder
	'' as water_body ,  -- not in recorder
	'' as island_group ,   -- not in recorder
	'' as island ,  -- not in recorder
	'' as country ,  -- not explicitly  in Recorder
	'' as country_code ,  -- not explicitly  in Recorder
	'' as state_province ,  -- not explicitly  in Recorder
	'' as county ,  -- not explicitly  in Recorder
	'' as municipality ,  -- not explicitly  in Recorder
	'' as locality ,
	'' as minimum_elevation_in_meters ,
	'' as maximum_elevation_in_meters ,
	'' as minimum_distance_above_surface_in_meters ,
	'' as maximum_distance_above_surface_in_meters ,
	'' as minimum_depth_in_meters ,
	'' as maximum_depth_in_meters ,
	'' as vertical_datum ,
	'' as location_according_to ,
	'' as location_remarks ,
	'' as accepted_georeference_id ,
	'' as accepted_geological_context_id 
from foreign_all."LOCATION" L
