<?php
class Zend extends Controller {
	function __constuct()
	{
		parent::Controller();
	}
	
	function twitter()
	{
		// Doc: http://framework.zend.com/manual/en/zend.service.twitter.html
		require_once('Zend/Service/Twitter.php');
		$config = array(
		  'callbackUrl' => 'http://dev.shoppingstreet.in.th',
		  'siteUrl' => 'https://api.twitter.com/oauth/request_token',
		  'consumerKey' => 'kJ5N5Y42a8lPCn5a5ixgw',
		  'consumerSecret' => 'aIMMbDFgGHEGWajFvaIIrGhmWCcYLIEhX77WYd8'
		);
		
		$consumer = new Zend_Oauth_Consumer($config);
		$token = $consumer->getRequestToken();
		$_SESSION['TWITTER_REQUEST_TOKEN'] = serialize($token);
		
		$consumer->redirect();
	}
}
?>