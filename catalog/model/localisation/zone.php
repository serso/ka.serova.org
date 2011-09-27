<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
        $language_id = $this->registry->get('language')->language_id;

        if (isset($language_id)) {
            $query = $this->db->query("SELECT IFNULL(( select zn.name
	   from zone_name zn
	  where zn.zone_id = z.zone_id
	    and zn.language_id = ". (int)$language_id. " ), z.name) name, z.code, z.country_id, z.status, z.zone_id FROM " . DB_PREFIX . "zone z WHERE z.zone_id = '" . (int)$zone_id . "' AND z.status = '1'");

        } else {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");
        }

		return $query->row;
	}		
	
	public function getZonesByCountryId($country_id) {

        $language_id = $this->registry->get('language')->language_id;

        if (isset($language_id)) {
            $zone_data = $this->cache->get('zone.' . $country_id . '_lang' . $language_id);

           if (!$zone_data) {
                $query = $this->db->query("SELECT IFNULL(( select zn.name
	   from zone_name zn
	  where zn.zone_id = z.zone_id
	    and zn.language_id = ".(int)$language_id." ), z.name) name, z.code, z.country_id, z.status, z.zone_id FROM " . DB_PREFIX . "zone z WHERE z.country_id = '" . (int)$country_id . "' AND z.status = '1' ORDER BY z.name");

                $zone_data = $query->rows;

                $this->cache->set('zone.' . $country_id. '_lang' . $language_id, $zone_data);
            }
        } else {
            $zone_data = $this->cache->get('zone.' . $country_id);

            if (!$zone_data) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");

                $zone_data = $query->rows;

                $this->cache->set('zone.' . $country_id, $zone_data);
            }
        }
	
		return $zone_data;
	}
}
?>