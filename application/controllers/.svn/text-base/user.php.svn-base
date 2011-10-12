<?php
class User extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->model('swap_model');
		$this->load->model('user_model');
		$this->load->model('rating_model');
		$this->load->model('product_model');
		$this->cismarty->assign('url', base_url());
	}

	function profile()
	{		
		$userid = $this->session->userdata('id');
	
		$getSwapIn = $this->swap_model->getSwapIn($userid);
		$getSwapOut = $this->swap_model->getSwapOut($userid);
		$userInfo = $this->user_model->get(array("ID" => $userid));
		$offerProducts = $this->swap_model->getCountSwapIn($userid);
		$getHistory = $this->swap_model->getHistory($userid);
		
		$gotFeedback = array();
		foreach($getHistory as $history) {
			$swapID = $history->SwapID;
			
			// check whether this swap entry has been given a feedback by the seller
			$exist = $this->rating_model->feedback_exists_for_swap($swapID, $userid);
			if ($exist) {
				$gotFeedback[$swapID] = true;
			} else {
				$gotFeedback[$swapID] = false;
			}
		}
		
		$gaveFeedback = array();
		foreach($getSwapOut as $swap) {
			$swapID = $swap->SwapID;
			
			// check whether this swap entry has been given a feedback by the seller
			$exist = $this->rating_model->feedback_exists_for_swap($swapID, $userid);
			if ($exist) {
				$gaveFeedback[$swapID] = true;
			} else {
				$gaveFeedback[$swapID] = false;
			}
		}
		
		$getReceivedFeedback = $this->rating_model->get_feedback_received(10, $userid);
		foreach($getReceivedFeedback as $fb) {
			$fb->thumb = $this->product_model->get_product_thumb_from_user_swap($userid, $fb->SwapID);
		}
		
		if(count($getSwapIn)>0 && count($this->swap_model->get(array('OfferID'=>$getSwapIn[0]->OfferID, 'Status'=>1)))>0)
			$this->cismarty->assign("chatting", 1);
		
		$this->cismarty->assign("userInfo", $userInfo->first_row('array'));
		$this->cismarty->assign("offerProducts", $offerProducts);
		$this->cismarty->assign("getSwapIn", $getSwapIn);
		$this->cismarty->assign("getSwapOut", $getSwapOut);
		$this->cismarty->assign("getHistory", $getHistory);
		$this->cismarty->assign("getReceivedFeedback", $getReceivedFeedback);
		$this->cismarty->assign("feedback", $gotFeedback);
		$this->cismarty->assign("feedback_swapper", $gaveFeedback);
		$this->cismarty->display('mywe2share.tpl');
	}
	
	function publicprofile($id)
	{
		$userid = $id;
		$getSwapIn = $this->swap_model->getSwapIn($userid);
		$getSwapOut = $this->swap_model->getSwapOut($userid);
		$userInfo = $this->user_model->get(array("ID" => $userid));		
		
		$offerProducts = $this->swap_model->getCountSwapIn($userid);
		$getHistory = $this->swap_model->getHistory($userid);
		$getReceivedFeedback = $this->rating_model->get_feedback_received(10, $userid);
		foreach($getReceivedFeedback as $fb) {
			$fb->thumb = $this->product_model->get_product_thumb_from_user_swap($userid, $fb->SwapID);
		}
		
		if(count($getSwapIn)>0 && count($this->swap_model->get(array('OfferID'=>$getSwapIn[0]->OfferID, 'Status'=>1)))>0)
			$this->cismarty->assign("chatting", 1);
		
		$this->cismarty->assign("userInfo", $userInfo->first_row('array'));
		$this->cismarty->assign("offerProducts", $offerProducts);
		$this->cismarty->assign("getSwapIn", $getSwapIn);
		$this->cismarty->assign("getSwapOut", $getSwapOut);
		$this->cismarty->assign("getHistory", $getHistory);
		$this->cismarty->assign("getReceivedFeedback", $getReceivedFeedback);
		$this->cismarty->display('yourwe2share.tpl');
		

	}
	
	function ratinghistory($id)
	{
		$totalScore = $this->rating_model->get_feedback_received_avg($id);
		$ratings = $this->rating_model->get(array('UserID'=>$id), '', '', array('CreatedDate'=>'desc'));
		
		$usernameArr = array();
		foreach($ratings as $rating) {
			$userInfo = $this->user_model->get(array("ID" => $rating->RaterID))->first_row();
			$usernameArr[$rating->ID] = $userInfo->Username;
			$rating->Thumb = $this->product_model->get_product_thumb_from_user_swap($id, $rating->SwapID);
		}
		$scoreCount = count($ratings);
		
		$this->cismarty->assign("pageTitle", 'รายละเอียดการให้คะแนนผู้ใช้');
		$this->cismarty->assign("totalScore", $totalScore);
		$this->cismarty->assign("scoreCount", $scoreCount);
		$this->cismarty->assign("ratings", $ratings);
		$this->cismarty->assign("usernameArr", $usernameArr);
		$this->cismarty->display('ratingHistory.tpl');
	}
	
	function ratings($id)
	{
		$totalScore = $this->rating_model->get_feedback_received_avg($id);
		$ratings = $this->rating_model->get(array('UserID'=>$id), '', '', array('CreatedDate'=>'desc'));
		foreach($ratings as $fb) {
			$fb->Thumb = $this->product_model->get_product_thumb_from_user_swap($id, $fb->SwapID);
		}
		
		$usernameArr = array();
		foreach($ratings as $rating) {
			$userInfo = $this->user_model->get(array("ID" => $rating->RaterID))->first_row();
			$usernameArr[$rating->ID] = $userInfo->Username;
		}
		
		$scoreCount = count($ratings);
		$givenRatings = $this->rating_model->get(array('RaterID'=>$id), '', '', array('CreatedDate'=>'desc'));
		
		$givenNameArr = array();
		foreach($givenRatings as $rating) {
			$userInfo = $this->user_model->get(array("ID" => $rating->UserID))->first_row();
			$givenNameArr[$rating->ID] = $userInfo->Username;
			$rating->Thumb = $this->product_model->get_product_thumb_from_user_swap($rating->UserID, $rating->SwapID);
		}
		
		$this->cismarty->assign("pageTitle", 'รายละเอียดการให้คะแนนผู้ใช้');
		$this->cismarty->assign("totalScore", $totalScore);
		$this->cismarty->assign("scoreCount", $scoreCount);
		$this->cismarty->assign("ratings", $ratings);
		$this->cismarty->assign("givenRatings", $givenRatings);
		$this->cismarty->assign("usernameArr", $usernameArr);
		$this->cismarty->assign("givenNameArr", $givenNameArr);
		$this->cismarty->display('ratings.tpl');
	}
	
	function edit()
	{
		$userid = intval($this->session->userdata('id'));
		if($userid==null) redirect('user/signin');
		$userInfo = $this->user_model->get(array("ID" => $userid))->first_row('array');
		
		$submit = array ( "name"=>"submit", "value"=>"แก้ไข");
		$form = form_open_multipart('user/db_edit', array('class' => 'user_form')).
				form_fieldset().
				form_label('ชื่อจริง :', 'FName', array('class' => 'flabel')).
				form_input(array('name'=>'FName', 'value'=>$userInfo['FName'])).
				form_fieldset_close().
				form_fieldset().
				form_label('นามสกุล :', 'LName', array('class' => 'flabel')).
				form_input(array('name'=>'LName', 'value'=>$userInfo['LName'])).
				form_fieldset_close().
				form_fieldset().
				form_label('อีเมล์ :', 'Email', array('class' => 'flabel')).
				form_input(array('name'=>'Email', 'value'=>$userInfo['Email'])).
				form_fieldset_close().
				form_fieldset().
				form_label('Avatar :', 'Avatar', array('class' => 'flabel')).
				form_upload(array('name'=>'avatar','value'=>'avatar')).
				form_fieldset_close().
				form_submit($submit).
				form_close();
		
		$this->cismarty->assign('form', $form);
		$this->cismarty->display('editUser.tpl');	
	}
	
	function db_edit()
	{
		$userid = intval($this->session->userdata('id'));
		if($userid==null) redirect('user/signin');
		
		// field name, error message, validation rules
		$this->form_validation->set_rules('FName', 'First name', 'trim|required');
		
		//check duplicate email
		$this->form_validation->set_rules('Email', 'Email address', 'trim|required|valid_email|callback_email_duplicate_except_self');
		
		if($this->form_validation->run() == TRUE)
		{
			$user = array();
			foreach($_POST as $key => $val){
				if($key != "submit")
				{
					$user[$key] = $val;
				}
			}
				
			//upload avatar
			if(!empty($_FILES['avatar']['name']))
			{
				$user = $this->user_model->upload($user, $userid);
			}
		
			$this->user_model->edit($userid, $user);
			redirect('user/profile');
		} else {
			$this->session->set_flashdata('notice', 'ใส่ข้อมูลไม่ถูกต้องค่ะ กรุณาใส่ข้อมูลใหม่ค่ะ');
			echo validation_errors();
		}		
	}
	
	function resetpass()
	{
		$userid = intval($this->session->userdata('id'));
		if($userid==null) redirect('user/signin');
		$userInfo = $this->user_model->get(array("ID" => $userid));
		
		$submit = array ( "name"=>"edit_button", "value"=>"ตกลง");
		$form = form_open('user/db_resetpass', array('class' => 'user_form')).
				form_fieldset().
				form_label('รหัสผ่านเดิม :', 'Password', array('class' => 'flabel')).
				form_password(array('name'=>'Password')).
				form_fieldset_close().
				form_fieldset().
				form_label('รหัสผ่านใหม่ :', 'New_password', array('class' => 'flabel')).
				form_password(array('name'=>'New_password')).
				form_fieldset_close().
				form_fieldset().
				form_label('รหัสผ่านใหม่อีกครั้ง :', 'New_password_confirm', array('class' => 'flabel')).
				form_password(array('name'=>'New_password_confirm')).
				form_fieldset_close().
				form_submit($submit).
				form_close();
		
		$this->cismarty->assign('form', $form);
		$this->cismarty->display('editUser.tpl');
	}
	
	function db_resetpass()
	{
		$userid = intval($this->session->userdata('id'));
		if($userid==null) redirect('user/signin');
		
		$this->form_validation->set_rules('New_password', 'New_password', 'trim|required|min_length[4]|max_length[32]');
		$this->form_validation->set_rules('New_password_confirm', 'Password New_password_confirm', 'trim|required|matches[New_password]');
		
		if($this->form_validation->run() == TRUE)
		{
			// check if the old password was provided correctly
			if($this->user_model->checkPassword($userid, md5($this->input->post('Password')))) {
				// update password
				$this->user_model->edit($userid, array('Password'=>md5($this->input->post('New_password'))));
				redirect('user/profile');
			} else {
				$this->session->set_flashdata('notice', 'ใส่รหัสผ่านเดิมผิดค่ะ กรุณาลองอีกครั้งค่ะ');
				redirect('user/resetpass');
			}
		} else {
			$this->session->set_flashdata('notice', 'ใส่ข้อมูลไม่ถูกต้องค่ะ กรุณาใส่ข้อมูลใหม่ค่ะ');
			echo validation_errors();
		}
	}
	
	/* sign in page*/
	function signin()
	{
		$this->cismarty->assign('pageTitle', 'เข้าสู่ระบบ');
		$this->cismarty->display('signin.tpl');	
	}
	
	/* validate user credential when sign in */
	function db_signin()
	{
		// field name, error message, validation rules
		$this->form_validation->set_rules('Username', 'Username', 'trim|required');
		$this->form_validation->set_rules('Password', 'Password', 'trim|required|min_length[4]|max_length[32]');
		
		if($this->form_validation->run() == TRUE)
		{
			if($query = $this->user_model->validate()) // if the user's credentials validated...
			{
				//echo 'valid';
				//login
				$this->user_model->login($query->row()->ID);
				
				//redirect to page after login
				redirect('');	
			}
			else // incorrect username or password
			{
				//echo 'invalid';
				$this->session->set_flashdata('notice', 'username และ/หรือ password ไม่่ถูกต้อง');
				redirect('user/signin');
			}
		} else {
			$this->session->set_flashdata('notice', 'username และ/หรือ password ไม่่ถูกต้อง');
			redirect('user/signin');
		}
	}
	
	/* signup page */
	function signup()
	{	
		$this->cismarty->assign('pageTitle', 'สมัครสมาชิก');
		$this->cismarty->display('signup.tpl');	
	}	
	
	/* insert user */
	function db_signup()
	{
		// field name, error message, validation rules
		$this->form_validation->set_rules('Username', 'Username', 'trim|required');
		$this->form_validation->set_rules('Password', 'Password', 'trim|required|min_length[4]|max_length[32]');
		$this->form_validation->set_rules('Password_confirmation', 'Password Confirmation', 'trim|required|matches[Password]');
		$this->form_validation->set_rules('FName', 'First name', 'trim|required');
		
		//check duplicate email
		$this->form_validation->set_rules('Email', 'Email address', 'trim|required|valid_email|callback_email_duplicate_check');
		
		//if validation is not ok, redirect to the signup page again
		if($this->form_validation->run() == TRUE)
		{
			$user = array();
			foreach($_POST as $key => $val){
				if($key != "submit" && $key != "Password_confirmation")
				{
					$user[$key] = $val;
				}
			}	
		
			//encrypt password
			$user['Password'] = md5($user['Password']);
		
			$user_id = $this->user_model->create($user);
			$this->user_model->login($user_id);
			
			//upload avatar
			$user = $this->user_model->upload($user, $user_id);
			
			//edit the avatar dir
			$this->user_model->edit($user_id, $user);
			
			redirect('');
		}
		else
		{
			$this->session->set_flashdata('notice', 'ใส่ข้อมูลไม่ถูกต้องค่ะ กรุณาใส่ข้อมูลใหม่ค่ะ');
			echo validation_errors();
		}
	}
	
	//for checking duplicating email
	function email_duplicate_check($str)
	{
		$result = $this->user_model->get(array())->result();
		
		foreach($result as $row)
		{
			if ($str == $row->Email)
			{
				$this->form_validation->set_message('email_duplicate_check', 'อีเมล์นี้ถูกใช้งานแล้วค่ะ');
				return FALSE;
			}	
		}
		
		return TRUE;
	}
	
	function email_duplicate_except_self($str)
	{		
		$result = $this->user_model->get(array('email'=>$str))->result();
		
		if (count($result)>0) // email already belongs to someone
		{
			if(count($this->user_model->get(array('email'=>$str, 'id'=>intval($this->session->userdata('id'))))->result())==0){ // and not the user's own email
				$this->form_validation->set_message('email_duplicate_except_self', 'อีเมล์นี้ถูกใช้งานแล้วค่ะ');
				return FALSE;
			}
		}	
		
		return TRUE;
	}
	
	//for logging out
	function signout()
	{
		$this->session->unset_userdata('id', 'username');
		redirect('');
	}
}
?>