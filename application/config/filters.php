<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
|  Filters configuration
| -------------------------------------------------------------------
|
| Note: The filters will be applied in the order that they are defined
|
| Example configuration:
|
| $filter['auth'] = array('exclude', array('login/*', 'about/*'));
| $filter['cache'] = array('include', array('login/index', 'about/*', 'register/form,rules,privacy'));
|
*/

$filter['auth'] = array('include', array('user/profile', 'product/create', 'product/db_create_swap', 'product/db_create', 'swap/*', 'talk/*', 'news/*', 'user/ratings/*'));



?>