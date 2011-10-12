<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class  Bootstrap {
	function __construct()
	{
	  //เราสามารถเรียก ci มาใช้งานตรงนี้ได้เช่น
	  $this->CI =& get_instance();
	  $this->CI->load->model('user_model');
	}
	function preloading()
	{
		//printing notice if any
		if($this->CI->session->flashdata('notice'))
			$this->CI->cismarty->assign('notice', "<h3 class='notice'>".$this->CI->session->flashdata('notice')."</h3>");

		$this->CI->cismarty->assign('url', base_url());
		// check login session
		if($this->CI->user_model->is_logged_in()) {
			$this->CI->cismarty->assign('user', $this->CI->user_model->get_logged_user());
			$this->CI->cismarty->assign('user_actions', '<a href="'.base_url().'user/signout">ออกจากระบบ</a>');
			$this->CI->cismarty->assign('userID', $this->CI->session->userdata('id'));
		} else {
			$this->CI->cismarty->assign('user', 'ผู้มาเยือน');
			$this->CI->cismarty->assign('user_actions', '<a href="'.base_url().'user/signin">เข้าสู่ระบบ</a> | <a href="'.base_url().'user/signup">ลงทะเบียน</a>');
		}
	}
}
?>