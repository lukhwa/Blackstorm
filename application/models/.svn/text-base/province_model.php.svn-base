<?php

class Province_model extends Model {

    function Province_model()
    {
        parent::Model();
    }

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		foreach($order as $key => $val)
		{
			$this->db->order_by($key, $val);
		}
		
        $query = $this->db->get_where('province', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }	   
}

?>