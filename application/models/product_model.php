<?php

class Product_model extends Model {

    function Product_model()
    {
        parent::Model();
    }
	
	function create($product=array())
	{		
		$insert = $this->db->insert('product', $product);
		$product_id = $this->db->insert_id();
		
		$this->session->set_flashdata('notice', 'นำสินค้าเข้าสู่ระบบเรียบร้อยแล้วค่ะ');
		
		return $product_id;
	}

	function edit($id, $product=array())
	{
		$this->db->where('id', $id);
		$insert = $this->db->update('product', $product);
		
		$this->session->set_flashdata('notice', 'เเก้ไขข้อมูลสินค้าเรียบร้อยแล้วค่ะ');
	}

	function delete($id)
	{
		$this->db->where('ID', $id);
		$this->db->delete('product'); 
		
		$this->session->set_flashdata('notice', 'ทำการลบสินค้าออกจากระบบเรียบร้อยแล้วค่ะ');
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
	
		$query = $this->db->get_where('product', $where, $limit, $offset);
		$results = $query->result();

        return $results;
    }	

	function search($keyword, $provinceID, $order='', $limit='', $offset='')
	{
		// SELECT * 
		// FROM product 
		// JOIN user ON user.ID = product.UserID
		// WHERE (product.Name LIKE $keyword) OR (user.Username LIKE $keyword)
		//			AND (Status = 1)

		$this->db->select('product.ID as ID, product.UserID as UserID, Name, Description, Image, Condition, Type, EstimatedPrice, ProvinceID, Remark, product.Status as Status, IsFeature, product.CreatedDate as CreatedDate, product.ModifiedDate as ModifiedDate, Username, Password, FName, LName, Email, CitizenID');
		$this->db->from('product');
		$this->db->join('user', 'product.UserID = user.ID');
		
		if($keyword != "")
		{
			$this->db->like('product.Name', $keyword);
			$this->db->or_like('user.Username', $keyword);
		}
		
		$this->db->having(array('product.status =' => 1, 'product.type =' => 0));
		
		//$this->db->where('product.Status', 1);
		//$this->db->where('product.Type', 0);

		if($provinceID != -1)
		{
			//$this->db->where('product.provinceID', $provinceID);
			$this->db->having(array('product.provinceID =' => $provinceID));
		}

		if($order!="")
		{
			$this->db->order_by('product.'.$order, "desc");
		}
		
		$this->db->limit($limit, $offset);
		
		$query = $this->db->get();
		
		$results = $query->result();

        return $results;
	}

	function search_user($userID)
	{
		$where = array('UserID' => $userID);
		$limit = "";
		$offset = "";
		$order = array("CreatedDate" => "desc");
		
		$results = $this->get($where, $limit, $offset, $order);

        return $results;
	}

	function get_recent($numberToGet)
	{
		$where = array('product.type' => 0, 'product.status' => 1);
		$limit = $numberToGet;
		$offset = "";
		$order = array("CreatedDate" => "desc");

		$results = $this->get($where, $limit, $offset, $order);

        return $results;
	}

	function get_feature()
	{
		$where = array('IsFeature' => 1, 'product.status' => 1);
		$limit = "";
		$offset = "";
		$order = array("CreatedDate" => "desc");

		$results = $this->get($where, $limit, $offset, $order);

        return $results;
	}

	function get_hot($numberToGet)
	{
		/*
		SELECT *
		FROM
			(SELECT id, max(countProduct) FROM 
					(SELECT id, count(id) as countProduct FROM swap GROUP BY id)  AS temp
				GROUP BY id 
				ORDER BY countProduct ) as hotproduct
		JOIN product on hotproduct.id = product.id
		*/

		$str = 'SELECT * FROM ';
		$str .= '(SELECT offerID, max(countProduct) FROM ';
		$str .= '(SELECT offerID, count(offerID) as countProduct FROM swap GROUP BY offerID)  AS temp ';
		$str .= 'GROUP BY offerID ';
		$str .= 'ORDER BY countProduct ) as hotproduct ';
		$str .= 'JOIN product on hotproduct.offerID = product.id ';
		$str .= 'WHERE product.Type = 0 ';
		$str .= 'AND product.Status = 1 ';
		$str .= 'LIMIT 0,'.$numberToGet." ";

		$query = $this->db->query($str);
		$results = $query->result();

		return $results;
	}
	
	function upload($product)
	{
		/* Create the config for upload library */ 
		$config['upload_path'] = './images/product';
		$config['allowed_types'] = 'gif|jpg|png|';
		$config['max_size']	= '300';
		$config['max_width']  = '0';
		$config['max_height']  = '0';
		
		/* Load the upload library */  
		$this->load->library('upload', $config);
		$this->upload->initialize($config); 
		
		/* Create the config for image library */  
      	/* (pretty self-explanatory) */  
		$configThumb = array();  
		$configThumb['image_library'] = 'gd2';  
		$configThumb['source_image'] = '';  
		$configThumb['create_thumb'] = TRUE;  
		$configThumb['height'] = 110;
		$configThumb['width'] = 100;
		$configThumb['thumb_marker'] = "";
		$configThumb['master_dim'] = "width";
		$configThumb['quality'] ="100%";
		$configThumb['maintain_ratio'] = TRUE;  
		
		/* Load the image library */  
		$this->load->library('image_lib');  
		
		/* We have 1 files to upload 
       	* If you want more - change the 2 below as needed 
       	*/  
		
		$product['Image'] = "";
      	
		for($i = 1; $i < 6; $i++) {  
        	/* Handle the file upload */  
        	$upload = $this->upload->do_upload('image'.$i, time());  
					
       		/* Get the data about the file */  
        	$data = $this->upload->data();  
  			
  			if(empty($_FILES['image'.$i]['name']))
			{
				continue;	
			}
			
        	/* File failed to upload - continue */  
        	if($upload === FALSE) {
				$this->session->set_flashdata('notice', 'กรุณาตรวจสอบประเภทไฟล์และขนาดของรูปสินค้าที่ '.$i.' แล้วลองใหม่ค่ะ');
				return null;
			}
			
        	$uploadedFiles[$i] = $data;  
        	/* If the file is an image - create a thumbnail */  
        	if($data['is_image'] == 1) {  
          		$configThumb['source_image'] = $data['full_path'];  
				$configThumb['new_image'] = $data['file_path']."thumb/".$data['file_name'];
          		$this->image_lib->initialize($configThumb);  
          		$this->image_lib->resize();  
        	}  
			
			$product['Image'] .= $data['file_name'].';';
		}
		return $product;
	}
    
	function get_product_thumb_from_user_swap($user, $swap)
	{
		$result = $this->db->query('select Image from product,swap where (product.UserID='.$user.' and swap.ID='.$swap.' and offerID=product.ID) or (product.UserID='.$user.' and swap.ID='.$swap.' and swapperID=product.ID)')->first_row();
		$images = explode(';',$result->Image);
		return $images[0];
	}
	
}

?>