<?php
class ModelLocalisationCountry extends Model
{
    public function getCountry($country_id)
    {

        $language_id = $this->registry->get('language')->language_id;

        if (isset($language_id)) {
            $query = $this->db->query("SELECT IFNULL(( select cn.name
           from country_name cn
          where cn.country_id = c.country_id
            and cn.language_id = " . (int)$language_id . " ), c.name) name
         , c.country_id, c.iso_code_2, c.iso_code_3, c.address_format, c.postcode_required, c.status FROM " . DB_PREFIX . "country c WHERE c.country_id = '" . (int)$country_id . "' AND c.status = '1'");
        } else {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE country_id = '" . (int)$country_id . "' AND status = '1'");
        }

        return $query->row;
    }

    public function getCountries() {

        $language_id = $this->registry->get('language')->language_id;

        if (isset($language_id)) {
            $country_data = $this->cache->get('country_lang' . $language_id);
            if (!$country_data) {
                $query = $this->db->query("SELECT IFNULL(( select cn.name
	   from country_name cn
	  where cn.country_id = c.country_id
	    and cn.language_id = " . (int)$language_id . " ), c.name) name
     , c.country_id, c.iso_code_2, c.iso_code_3, c.address_format, c.postcode_required, c.status FROM " . DB_PREFIX . "country c WHERE c.status = '1' ORDER BY c.name ASC");

                $country_data = $query->rows;

                $this->cache->set('country_lang' . $language_id, $country_data);
            }
        } else {
            $country_data = $this->cache->get('country');
            if (!$country_data) {
                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "country WHERE status = '1' ORDER BY name ASC");

                $country_data = $query->rows;

                $this->cache->set('country', $country_data);
            }
        }

        return $country_data;
    }
}

?>