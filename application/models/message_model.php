<?php

class Message_model extends Model {

    function Message_model()
    {
        parent::Model();
    }
	
	function create($message=array())
	{
		$insert = $this->db->insert('message', $message);
		$message_id = $this->db->insert_id();
		
		$this->session->set_flashdata('notice', "Message has already been successfully created.");
		
		return $message_id;
	}

	function edit($id, $message=array())
	{
		$this->db->where('id', $id);
		$insert = $this->db->update('message', $message);
		
		$this->session->set_flashdata('notice', 'Message has already been successfully saved.');
	}

	function delete($id)
	{
		$this->db->where('ID', $id);
		$this->db->delete('message'); 
		
		$this->session->set_flashdata('notice', 'Message has already been successfully deleted.');
	}

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		foreach($order as $key => $val)
		{
			$this->db->order_by($key, $val);
		}
		
        $query = $this->db->get_where('message', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }
	
	function getMessages($swapID) {
		$this->db->select('message.UserID as userID, message.Message as msg, user.Avatar as avatar, user.Username as uname, message.CreatedDate as senttime');
		$this->db->from('message');
		$this->db->join('user', 'message.UserID = user.ID');
		$this->db->where('message.SwapID', $swapID);
		$this->db->order_by('message.CreatedDate', 'asc');

		$query = $this->db->get();
		$results = $query->result();

        return $results;	
	}

	function checkUserPermission($userID, $swapID)
	{
		$this->db->select('*');
		$this->db->from('swap');
		$this->db->join('product', 'swap.OfferID = product.ID or swap.SwapperID = product.ID');
		$this->db->where('product.UserID', $userID);
		$this->db->where('swap.ID', $swapID);
		
		if($this->db->get()->num_rows()>0)
			return true;
			
		return false;
	}
}

?>