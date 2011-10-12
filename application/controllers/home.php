<?php

/*******************************
Controller: 		Home
Last Modified by:	Chaky
*******************************/

class Home extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->helper('date');
		$this->load->model('product_model');
		$this->load->model('province_model');
		$this->load->model('user_model');
		$this->load->model('news_model');
	}
	function index()
	{
		// get province
		$provinces = $this->province_model->get();
		$this->cismarty->assign('provinces', $provinces);
	
		//get recent product
		$recentProductsData = array();
		$recentProducts = $this->product_model->get_recent(5);
		foreach($recentProducts as $prod) {
			$thumb = explode(';', $prod->Image);
			$recentProductsData[$prod->ID]['thumb'] = 'images/product/thumb/'.$thumb[0];
			$recentProductsData[$prod->ID]['seller'] = $this->user_model->get(array('ID'=>$prod->UserID))->first_row()->Username;
			$recentProductsData[$prod->ID]['date'] = date_when(date('U', strtotime($prod->CreatedDate)));
		}
		$this->cismarty->assign('recentProductsData', $recentProductsData);
		$this->cismarty->assign('recentProducts', $recentProducts);
		
		//get recommended product
		$featuredProductsData = array();
		$featuredProducts = $this->product_model->get_feature();
		foreach($featuredProducts as $prod) {
			$thumb = explode(';', $prod->Image);
			$featuredProductsData[$prod->ID]['thumb'] = 'images/product/thumb/'.$thumb[0];
			$featuredProductsData[$prod->ID]['seller'] = $this->user_model->get(array('ID'=>$prod->UserID))->first_row()->Username;
			$featuredProductsData[$prod->ID]['date'] = date_when(date('U', strtotime($prod->CreatedDate)));
		}
		$this->cismarty->assign('featuredProductsData', $featuredProductsData);
		$this->cismarty->assign('featuredProducts', $featuredProducts);
		
		//get popular product
		$hotProductsData = array();
		$hotProducts = $this->product_model->get_hot(5);
		foreach($hotProducts as $prod) {
			$thumb = explode(';', $prod->Image);
			$hotProductsData[$prod->ID]['thumb'] = 'images/product/thumb/'.$thumb[0];
			$hotProductsData[$prod->ID]['seller'] = $this->user_model->get(array('ID'=>$prod->UserID))->first_row()->Username;
			$hotProductsData[$prod->ID]['date'] = date_when(date('U', strtotime($prod->CreatedDate)));
		}
		$this->cismarty->assign('hotProductsData', $hotProductsData);
		$this->cismarty->assign('hotProducts', $hotProducts);
		
		//get news
		$news = $this->news_model->get(array('Promoted'=>1), 1);
		if(count($news)>0)
			$this->cismarty->assign('news', $news[0]->News);
		else
			$this->cismarty->assign('news', 'ไม่มีข่าวสารใหม่');
		
		$this->cismarty->assign('url', base_url());
		$this->cismarty->display('index.tpl');
	}

}
?>