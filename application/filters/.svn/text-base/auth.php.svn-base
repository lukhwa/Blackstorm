<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
* Test filter - logs message on filter enter and exit
*/
class Auth_filter extends Filter {
    
	function before() {
	  $this->CI =& get_instance();
	  $this->CI->load->model('user_model');
	  $this->CI->user_model->is_authenticated();
	
		//echo "****Under Testing: this page will be under filter function:If not yet logged in, go to sign in page:";
		//log_message('debug', 'Before '.$this->controller.' -> '.$this->method);
    }
    
    function after() {
    }
}
?>