<?php

class Rating_model extends Model {

    function Product_model()
    {
        parent::Model();
    }
	
	function create($rating=array())
	{		
		$insert = $this->db->insert('rating', $rating);
		$rating_id = $this->db->insert_id();
		
		$this->session->set_flashdata('notice', 'ให้คะแนนสำหรับการแลกเปลี่ยนเข้าสู่ระบบเรียบร้อยแล้วค่ะ');
		
		return $rating_id;
	}

	function delete($id)
	{
		$this->db->where('ID', $id);
		$this->db->delete('rating'); 
		
		$this->session->set_flashdata('notice', 'ทำการลบคะแนนออกจากระบบเรียบร้อยแล้วค่ะ');
		//redirect('/site/news', 'refresh');
	}

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		if(!empty($order))
		{
			foreach($order as $key => $val)
			{
				$this->db->order_by($key, $val);
			}
		}
	
		$query = $this->db->get_where('rating', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }	

	function get_feedback_received($numberToGet, $userID)
	{
		$offset = '';
		
		$this->db->select('Rating.SwapID, Rating.ID, Rating.UserID, Rating.RaterID, User.UserName AS RaterName, Rating.Score, Rating.Comment, Rating.CreatedDate ');
		$this->db->from('Rating');
		$this->db->join('User', 'Rating.RaterID = User.ID');
		$this->db->where('UserID', $userID);
		$this->db->order_by("Rating.CreatedDate", "desc"); 
		$this->db->limit($numberToGet, $offset);
		
		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}
	
	function get_feedback_given($numberToGet, $swapperID)
	{
		$offset = '';
		
		$this->db->select('Rating.ID, Rating.UserID, Rating.RaterID, User.UserName AS UserName, Rating.Score, Rating.Comment, Rating.CreatedDate ');
		$this->db->from('Rating');
		$this->db->join('User', 'Rating.RaterID = User.ID');
		$this->db->order_by("Rating.CreatedDate", "desc"); 
		$this->db->limit($numberToGet, $offset);
		
		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}
	
	function get_feedback_received_avg($userID)
	{
		// SELECT AVG(score) FROM Rating 
		// WHERE UserID = $userID
		
		$this->db->select_avg('Score');
		$this->db->from('Rating');
		$this->db->where('UserID', $userID);
		
		$query = $this->db->get();
		$results = $query->first_row();

		return $results->Score;		
	}
	
	function feedback_exists_for_swap($swapID, $raterID)
	{
		$this->db->select('*');
		$this->db->from('rating');
		$this->db->where('SwapID', $swapID);
		$this->db->where('RaterID', $raterID);
		$num = $this->db->get()->num_rows();
		if( $num>0 ) return true;
		else return false;
	}

}

?>