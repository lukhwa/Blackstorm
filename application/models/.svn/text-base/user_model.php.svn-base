<?php
class User_model extends Model {

    function User_model()
    {
        parent::Model();
    }
	
	/*
	
	@method: get
	@params: 
			$where: 	Array,
			$limit: 	int,
			$offset: 	int,
			$order:		Array
	
	@return: query
		
	*/
	
	function create($user=array())
	{
		$insert = $this->db->insert('user', $user);
		$user_id = $this->db->insert_id();
		
		return $user_id;
	}
	
	/*
	
	@method: validate
	@return: query
		
	*/
	function validate()
	{
		$this->db->where('Username', $this->input->post('Username'));
		$this->db->where('Password', md5($this->input->post('Password')));
		$query = $this->db->get('user');
		
		if($query->num_rows == 1)
		{
			return $query;
		}
	}
	
	// check if the provided password is correct for the given user id
	function checkPassword($userid, $password)
	{
		$this->db->where('ID', $userid);
		$this->db->where('Password', $password);
		$query = $this->db->get('user');
		
		if($query->num_rows == 1)
		{
			return true;
		}

		return false;
	}
	
	//setting session for login
	function login($id)
	{
		$username = $this->get(array('id' => $id))->row()->Username;
		
		$data = array(
			'id'	=> $id,
			'username' => $username
		);
		
		//setting session data
		$this->session->set_userdata($data);
	}
	
	function get_logged_user()
	{
		return $this->session->userdata('username');
	}
	
	//return true if login
	function is_logged_in()
	{
		$is_logged_in = $this->session->userdata('id');
		if(!isset($is_logged_in) || $is_logged_in != true)
			return false;
		else return true;
	}	

	function is_authenticated()
	{
		if(!$this->is_logged_in()) {
			$this->session->set_flashdata('notice', 'กรุณาล็อกอินเข้าสู่ระบบก่อนค่ะ');
			redirect('user/signin');
		}
	}
	
	function edit($id, $user=array())
	{
		$this->db->where('id', $id);
		$insert = $this->db->update('user', $user);
		
		$this->session->set_flashdata('notice', 'แก้ไขข้อมูลเรียบร้อยแล้วค่ะ');
	}

	function delete($userID)
	{
		$this->db->where('UserID', $userID);
		$this->db->delete('user'); 
		
		$this->session->set_flashdata('notice', 'ทำการลบบัญชีผู้ใช้เรียบร้อยแล้วค่ะ');
		//redirect('/site/news', 'refresh');
	}

	function get($where=array(), $limit="", $offset="", $order=array())
    {
		foreach($order as $key => $val)
		{
			$this->db->order_by($key, $val);
		}
		
        $query = $this->db->get_where('user', $where, $limit, $offset);

        return $query;
    }	   
	
	function upload($user, $user_id)
	{
		/* Create the config for upload library */ 
		$config['upload_path'] = './images/user';
		$config['allowed_types'] = 'gif|jpg|png|';
		$config['max_size']	= '0';
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
		$configThumb['height'] = 120;
		$configThumb['width'] = 120;
		$configThumb['thumb_marker'] = "";
		$configThumb['quality'] ="100%";
		$configThumb['maintain_ratio'] = TRUE;  
		
		/* Load the image library */  
		$this->load->library('image_lib');  
		
		/* We have 1 files to upload 
       	* If you want more - change the 2 below as needed 
       	*/  
		
		$user['Avatar'] = "";
		
		/* Handle the file upload */  
        $upload = $this->upload->do_upload('avatar', time());  
		
        /* File failed to upload - continue */  
        if($upload === FALSE)
		{ 
			$user['Avatar'] = "default_avatar.gif";
			return $user;  
		}
		
		/* Get the data about the file */  
        $data = $this->upload->data();  
  
        /* If the file is an image - create a thumbnail */  
        if($data['is_image'] == 1) {  
          	$configThumb['source_image'] = $data['full_path'];  
			$configThumb['new_image'] = $data['file_path']."thumb/".$data['file_name'];
          	$this->image_lib->initialize($configThumb);  
          	$this->image_lib->resize();  
        }  
			
			$user['Avatar'] = $data['file_name'];
		
		return $user;
	}
}
?>