<?php

class Swap_model extends Model {

    function Swap_model()
    {
        parent::Model();
    }
	
	function create($swap=array())
	{
		$insert = $this->db->insert('swap', $swap);
		$message_id = $this->db->insert_id();
		
		$this->session->set_flashdata('notice', "เริ่มการแลกเปลี่ยนสินค้าแล้วค่ะ");
		
		return $message_id;
	}

	function edit($id, $message=array())
	{
		$this->db->where('ID', $id);
		$insert = $this->db->update('swap', $message);
	}

	function delete($id)
	{
		$this->db->where('ID', $id);
		$this->db->delete('swap'); 
		
		$this->session->set_flashdata('notice', 'ลบข้อมูลแลกเปลี่ยนสินค้าเรียบร้อยแล้วค่ะ');
	}

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		foreach($order as $key => $val)
		{
			$this->db->order_by($key, $val);
		}
		
        $query = $this->db->get_where('Swap', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }	   

	function getSwapIn($id)
	{
		/*
			SELECT product.ID AS OfferID, product.Name AS OfferName, product.Image AS OfferImage, p2.ID AS SwapperID, p2.Name AS SwapperName, p2.Image AS SwapperImage, swap.Status AS SwapStatus, product.Status AS ProductStatus
			FROM swap 
			INNER JOIN product ON product.id = swap.offerid
			INNER JOIN user ON user.id = product.UserID
			INNER JOIN product p2 on p2.id = swap.swapperid
			WHERE product.UserID = 1
			ORDER BY swap.ModifiedDate DESC
			*/

		$this->db->select('product.ID AS OfferID, product.Name AS OfferName, product.Image AS OfferImage, p2.ID AS SwapperID, p2.Name AS SwapperName, p2.Image AS SwapperImage, swap.Status AS SwapStatus, product.Status AS ProductStatus, swap.ID AS swapID ');
		$this->db->from('swap');
		$this->db->join('product', 'product.id = swap.offerid');
		$this->db->join('user', 'user.id = product.UserID');
		$this->db->join('product p2', 'p2.id = swap.swapperid');
		$this->db->where('product.UserID', $id);
		$this->db->where('swap.Status !=', 2);
		$this->db->order_by("swap.ModifiedDate", "desc"); 

		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}

	function getCountSwapIn($id)
	{
		/*
			SELECT product.ID, product.Name, product.Image, count( swap.id ) AS CountSwap
			FROM swap
			RIGHT JOIN product ON product.id = swap.offerid
			GROUP BY product.id
			ORDER BY swap.modifieddate
		*/

		$this->db->select('product.ID, product.Name, product.Image, count( swap.id ) AS CountSwap ');
		$this->db->from('swap');
		$this->db->join('product', 'product.id = swap.offerid', 'right');	
		$this->db->where('product.UserID', $id);
		$this->db->where('product.Type', 0);
		$this->db->where('product.Status', 1);
		$this->db->group_by("product.id"); 
		$this->db->order_by("swap.ModifiedDate", "desc"); 

		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}

	function getHistory($id)
	{
		$this->db->select('product.ID, product.Name, product.Image, swap.id AS SwapID, count( swap.id ) AS CountSwap ');
		$this->db->from('swap');
		$this->db->join('product', 'product.id = swap.offerid', 'right');	
		$this->db->where('product.UserID', $id);
		$this->db->where('product.Type', 0);
		$this->db->where('product.Status', 0);
		$this->db->group_by("product.id");
		$this->db->order_by("swap.ModifiedDate", "desc"); 

		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}
	
// not use
	function getSwapOut($id)
	{
		/*
			SELECT *
			FROM swap 
			INNER JOIN product ON product.id = swap.swapperid
			INNER JOIN user ON user.id = product.UserID
			WHERE product.UserID = 1
			ORDER BY swap.ModifiedDate DESC
			*/

		$this->db->select('product.ID, product.Name, product.Image, product.Status AS ProductStatus, swap.Status AS SwapStatus, swap.ID AS SwapID');
		$this->db->from('swap');
		$this->db->join('product', 'product.id = swap.swapperid');
		$this->db->join('user', 'user.id = product.UserID');
		$this->db->where('product.UserID', $id);
		$this->db->order_by("swap.ModifiedDate", "desc"); 

		$query = $this->db->get();
		$results = $query->result();

        return $results;
	}
}

?>