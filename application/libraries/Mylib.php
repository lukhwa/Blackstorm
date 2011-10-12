<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mylib {

	var $var1 = 'aa';
	var $var2 = 'bb';

	function Mylib($params)
	{
		if ($params[0])
			$this->var1 = $params[0];
		if ($params[1])
			$this->var2 = $params[1];
	}

	function method_a()
	{
		echo $this->var1;
		echo "<hr />";
		echo $this->var2;
	}
}
?>

