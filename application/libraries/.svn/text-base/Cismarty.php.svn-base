<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once(dirname(__FILE__).'/Smarty/Smarty.class.php');
class Cismarty extends Smarty {
	  function __construct()
	  {
			  $this->template_dir = APPPATH.'views/';
			  $this->compile_dir = APPPATH.'templates_c/';
			  $this->compile_check = true; // should be false for production
			  $this->force_compile = true; // should be false for production
	  }
}
?>