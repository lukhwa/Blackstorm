<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| Hooks
| -------------------------------------------------------------------------
| This file lets you define "hooks" to extend CI without hacking the core
| files.  Please see the user guide for info:
|
|	http://codeigniter.com/user_guide/general/hooks.html
|
*/
								
$hook['post_controller_constructor'][] = array(
        'class' => 'Bootstrap',
        'function' => 'preloading',
        'filename' => 'Bootstrap.php',
        'filepath' => 'hooks',
        'params' => ''
);

$hook['pre_controller'][] = array(
        'class' => 'ExLibs',
        'function' => 'index',
        'filename' => 'ExLibs.php',
        'filepath' => 'hooks'
);

$hook['post_controller_constructor'][] = array(
		'class'    => '',
		'function' => 'pre_filter',
		'filename' => 'init.php',
		'filepath' => 'hooks/filters',
		'params'   => array()
		);

$hook['post_controller_constructor'][] = array(
		'class'    => '',
		'function' => 'post_filter',
		'filename' => 'init.php',
		'filepath' => 'hooks/filters',
		'params'   => array()
		);

/* End of file hooks.php */
/* Location: ./system/application/config/hooks.php */