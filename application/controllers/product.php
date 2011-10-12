<?php
/*******************************
Controller: 		Product
Last Modified by:	Chaky
*******************************/

class Product extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->model('product_model');
		$this->load->model('province_model');
		$this->load->model('user_model');
		$this->load->model('swap_model', '', true);
		$this->load->model('rating_model');
		$this->load->helper('date');
		
		// get province
		$provinces = $this->province_model->get();
		$this->cismarty->assign('provinces', $provinces);
	}
	
	function page($offset = 0)
	{
		$this->load->library('pagination');
			
		$results = $this->product_model->get(array('Type'=>0,'Status'=>1), 4, $offset,array('CreatedDate' => 'desc'));
		
		$products = array();
		foreach($results as $prod) {
			$each_product = array();
			$thumb = explode(';', $prod->Image);
			$each_product['id'] = $prod->ID;
			$each_product['name'] = $prod->Name;
			$user_results = $this->user_model->get(array('ID'=>$prod->UserID))->result();
			$each_product['seller'] = $user_results[0]->Username;
			$province_results = $this->province_model->get(array('id'=>$prod->ProvinceID));
			$each_product['province'] = $province_results[0]->name;
			$each_product['date'] = date_when(date('U', strtotime($prod->CreatedDate)));;
			$each_product['thumbnail'] = 'images/product/thumb/'.$thumb[0];
			
			$products[] = $each_product;
		}
		$this->cismarty->assign('products', $products);
		
		$config['base_url'] = base_url().'product/page/';
		$config['total_rows'] = count($this->product_model->get(array('Type'=>0,'Status'=>1)));
		$config['per_page'] = '4';
		
		$this->pagination->initialize($config);
		
		$this->cismarty->assign('url', base_url());
		$this->cismarty->assign('pageTitle', 'แคทตาล็อกสินค้า');
		$this->cismarty->assign('links', $this->pagination->create_links());
		$this->cismarty->display('productView.tpl');
	}
	
	//view for creating product
	function create()
	{
		$results = $this->province_model->get();
		
		$this->cismarty->assign('pageTitle', 'ป้อนข้อมูลสินค้า');
		$this->cismarty->assign('url', base_url());
		$this->cismarty->assign('results', $results);
		$this->cismarty->display('createProduct.tpl');
	}
	
	// create product for swapping
	function db_create_swap()
	{
		// field name, error message, validation rules
		$this->form_validation->set_rules('Name', 'Name', 'required');
		$this->form_validation->set_rules('Description', 'Description', 'required');
		
		//1. if validation is ok, insert; validation is handled in client side
		if($this->form_validation->run() == TRUE)
		{	
			$product = array();
			foreach($_POST as $key => $val){
				if($key != "submit" && $key != "OfferID")
				{
					$product[$key] = $val;
				}
			}
			
			$product['Status'] = 1;
			$product['Type'] = 1;
			$product['Remark'] = '';
			$product['UserID'] = $this->session->userdata('id');		
			
			$insert_id = $this->product_model->create($product);
			
			//upload to image
			$product = $this->product_model->upload($product, $insert_id);
		
			//edit the image dir
			$this->product_model->edit($insert_id, $product);			
			
			$offerID = intval($this->input->post('OfferID'));
			
			//2. also create a swap object
			$this->swap_model->create(array('OfferID'=>$offerID, 'SwapperID'=>$insert_id, 'Status'=>0));
			
			redirect('product/show/'.$offerID);
		} else {
			
		}
	}
	
	//insert product to db
	function db_create()
	{
		// field name, error message, validation rules
		$this->form_validation->set_rules('Name', 'Name', 'required');
		$this->form_validation->set_rules('Description', 'Description', 'required');
		
		//1. if validation is ok, insert; validation is handled in client side
		if($this->form_validation->run() == TRUE)
		{	
			$product = array();
			foreach($_POST as $key => $val){
				if($key != "submit")
				{
					$product[$key] = $val;
				}
			}
			
			$product['Status'] = 1;
			$product['UserID'] = $this->session->userdata('id');		
			
			//upload to image
			$product = $this->product_model->upload($product);
			
			if($product==null) redirect('product/create');
			
			$this->product_model->create($product);
			
			redirect('user/profile/'.$product['UserID']);
		}
	}
	
	//for showing product description
	//product/show/$id
	function show($id)
	{
		$results = $this->product_model->get(array('id' => $id));
		$result = $results[0];
		
		$product = array();
		$thumb = explode(';', $result->Image);
		
		for($i=0; $i<count($thumb); $i++)
		{
			if($thumb[$i] == "")
				unset($thumb[$i]);
			else
				$thumb[$i]=trim($thumb[$i]);
		}
		
		$product['id'] = $result->ID;
		$product['name'] = $result->Name;
		$product['description'] = $result->Description;
		$product['condition'] = $result->Condition;
		$product['type'] = $result->Type;
		$product['estimatedPrice'] = $result->EstimatedPrice;
		$product['remark'] = $result->Remark;
		$product['status'] = $result->Status;
		
		$user_results = $this->user_model->get(array('ID'=>$result->UserID))->result();
		$product['seller_avatar'] = $user_results[0]->Avatar;
		$product['seller'] = $user_results[0]->Username;
		$product['sellerID'] = $result->UserID;
		$province_results = $this->province_model->get(array('id'=>$result->ProvinceID));
		$product['province'] = $province_results[0]->name;
		$product['date'] = date_when(date('U', strtotime($result->CreatedDate)));
		$product['thumbnail'] = 'images/product/thumb/'.$thumb[0];
		
		if($product['type']==0) {
			// list of swap products
			$swapProducts = $this->swap_model->get(array('OfferID'=>$product['id'], 'status !='=>-1));
			$swaps = array();
			foreach($swapProducts as $res) {
				$swapID = $res->ID;
				
				// get swapper product info
				$swapProd = $this->product_model->get(array('ID' => $res->SwapperID));			
				$user = $this->user_model->get(array('ID' => $swapProd[0]->UserID));

				$swapProd[0]->SwapID = $swapID;
				$swapProd[0]->OfferDate = $res->ModifiedDate;
				$swapProd[0]->Username = $user->first_row()->Username;
				$images = explode(';', $swapProd[0]->Image);
				for($i=0; $i<count($images); $i++)
				{
					if($images[$i] == "")
						unset($images[$i]);
					else
						$images[$i]=trim($images[$i]);
				}
				$swapProd[0]->Image = base_url().'images/product/thumb/'.$images[0];
				
				switch($res->Status) {
					case 0:
						$swapProd[0]->Status = 'รอการตอบรับ';
						break;
					case 1:
						$swapProd[0]->Status = 'ระหว่างการเจรจา';
						break;
					case 2:
						$swapProd[0]->Status = 'ไม่แลก';
						break;
					case 3:
						$swapProd[0]->Status = 'การแลกเสร็จสิ้น';
						break;
				}		
				
				$swaps[] = $swapProd[0];
			}
			$this->cismarty->assign('swaps', $swaps);
		}
		else {
			// in case this product is for swapping, show the details of the product intended to swap with
			$swap_detail = $this->swap_model->get(array('SwapperID'=>$product['id']));
			$offerProduct = $this->product_model->get(array('ID'=>$swap_detail[0]->OfferID));
			$offerProduct = $offerProduct[0];
			
			$province_results = $this->province_model->get(array('id'=>$offerProduct->ProvinceID));
			$offerProduct->Province = $province_results[0]->name;
			$images = explode(';', $offerProduct->Image);
		
			for($i=0; $i<count($images); $i++)
			{
				if($images[$i] == "")
					unset($images[$i]);
				else
					$images[$i]=trim($images[$i]);
			}
			$offerProduct->Image = base_url().'images/product/thumb/'.$images[0];
			$user_results = $this->user_model->get(array('ID'=>$offerProduct->UserID))->result();
			$offerProduct->Username = $user_results[0]->Username;
			
			$this->cismarty->assign('offer', $offerProduct);
		}
		
		$this->cismarty->assign('url', base_url());
		$this->cismarty->assign('product', $product);
		$this->cismarty->assign('thumbnails', $thumb);
		$this->cismarty->display('showProductDesc.tpl');
	}
	
	//search product
	function search()
	{
		$this->load->library('pagination');
		$page = $this->uri->segment(3);
		if($page==null) $page = 1;
	
		$offset = (intval($page)-1) * 2;
		
		if($this->input->get_post('searchterms'))
		{	
			$keyword = $this->input->get_post('searchterms');
			if($keyword == "Seller or product name")
				$keyword = "";
		}
		else if($this->input->get_post('seller'))
			$keyword = $this->input->get_post('seller');
		else
			$keyword = $this->session->userdata('keyword');
		
		if($this->input->get('orderby'))
			$order = $this->input->get('orderby');
		elseif($this->session->userdata('orderby'))
			$order = $this->session->userdata('orderby');
		else
			$order = "";
			
		//province as -1 means default
		if($this->input->get_post('province'))
		{
			$province = $this->input->get_post('province');
		}
		elseif($this->session->userdata('province'))
		{
			$province = $this->session->userdata('province');
		}
		else
		{
			$province = -1;
		}
		
		
		$searchResults = $this->product_model->search($keyword, $province, $order, 2, $offset);
		$products = array();
		foreach($searchResults as $prod) {
			$each_product = array();
			$thumb = explode(';', $prod->Image);
			$each_product['id'] = $prod->ID;
			$each_product['name'] = $prod->Name;
			$user_results = $this->user_model->get(array('ID'=>$prod->UserID))->result();
			$each_product['seller'] = $user_results[0]->Username;
			$province_results = $this->province_model->get(array('id'=>$prod->ProvinceID));
			$each_product['province'] = $province_results[0]->name;
			$each_product['date'] = date_when(date('U', strtotime($prod->CreatedDate)));
			$each_product['thumbnail'] = 'images/product/thumb/'.$thumb[0];

			$products[] = $each_product;
		} 
		$this->cismarty->assign('products', $products);
		
		//save session
		$searcharray = array(
			'keyword' => $keyword,
			'province' => $province,
			'orderby' => $order
		);	
		
		$this->session->set_userdata($searcharray);

		$config['base_url'] = base_url().'product/search/';
		$config['total_rows'] = count($this->product_model->search($keyword, $province, $order));
		$config['per_page'] = '2';
		
		$this->pagination->initialize($config);
		
		$this->cismarty->assign('url', base_url());
		$pageTitle = 'ผลการค้นหาสินค้า<br/>keyword: '.$keyword.'<br/>Results Found: '.count($this->product_model->search($keyword, $province));
		$this->cismarty->assign('pageTitle', $pageTitle);
		$this->cismarty->assign('links', $this->pagination->create_links());
		$this->cismarty->assign('searchResults', $searchResults);
		$this->cismarty->display('productView.tpl');
	}
	
	function rating()
	{
		$swapID = $this->input->post('swapId');
		$comment = $this->input->post('commentTxt');
		$rating = $this->input->post('rate');
		$raterID = $this->session->userdata('id');
		
		$swapEntry = $this->swap_model->get(array('ID'=>$swapID));
		$swapperID = $swapEntry[0]->SwapperID;
		$offerID = $swapEntry[0]->OfferID;
		
		$swapperEntry = $this->product_model->get(array('ID'=>$swapperID));
		$swapperUser = $swapperEntry[0]->UserID;
		$offerEntry = $this->product_model->get(array('ID'=>$offerID));
		$offerUser = $offerEntry[0]->UserID;
		
		if($raterID==$offerUser) $userID = $swapperUser;
		else $userID = $offerUser;
		
		$this->rating_model->create(array('UserID'=>$userID, 'RaterID'=>$raterID , 'swapID'=>$swapID, 'Score'=>$rating, 'Comment'=>$comment));
	}
	
}

?>