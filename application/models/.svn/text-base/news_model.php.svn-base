<?php

class News_model extends Model {

    function News_model()
    {
        parent::Model();
    }
	
	function create($news=array())
	{
		$insert = $this->db->insert('news', $news);
		$message_id = $this->db->insert_id();
		
		$this->session->set_flashdata('notice', "News has already been successfully created.");
		
		return $message_id;
	}

	function edit($id, $news=array())
	{
		$this->db->where('id', $id);
		$insert = $this->db->update('news', $news);
		
		$this->session->set_flashdata('notice', 'News has already been successfully saved.');
	}

	function delete($id)
	{
		$this->db->where('ID', $id);
		$this->db->delete('news'); 
		
		$this->session->set_flashdata('notice', 'News has already been successfully deleted.');
	}

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		foreach($order as $key => $val)
		{
			$this->db->order_by($key, $val);
		}
		
        $query = $this->db->get_where('news', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }	   
}

?>