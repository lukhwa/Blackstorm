<?php
class Adodb {
	function __construct()
	{
		require_once(APPPATH.'config/database.php');

		$this->dbConf = $db[$active_group];

		if ($this->dbConf['cache_on'] && is_dir(APPPATH.$this->dbConf['cachedir']))
		{
			GLOBAL $ADODB_CACHE_DIR;
			$ADODB_CACHE_DIR = APPPATH.$this->dbConf['cachedir'];
		}

		require_once(dirname(__FILE__).'/adodb5/adodb.inc.php');

		$this->obj =& get_instance();
		$this->obj->db =& NewADOConnection($this->dbConf['dbdriver']);

		if ($this->dbConf['db_debug']) { $this->conn->debug = true; }

		$this->obj->db->Connect(
			$this->dbConf['hostname'],
			$this->dbConf['username'],
			$this->dbConf['password'],
			$this->dbConf['database']
		);

		if ($this->dbConf['char_set'] && $this->dbConf['dbcollat'])
		{
			$this->obj->db->Execute('SET character_set_results='.$this->dbConf['char_set']);
			$this->obj->db->Execute('SET collation_connection='.$this->dbConf['dbcollat']);
			$this->obj->db->Execute('SET NAMES '.$this->dbConf['char_set']);
		}
		
		return true;
	}
}

?>