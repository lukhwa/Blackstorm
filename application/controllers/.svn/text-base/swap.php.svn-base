<?php
class Swap extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->model('swap_model');
		$this->load->model('product_model');
		$this->load->model('user_model');
		$this->load->model('province_model');
	}
	
	function index($offerID)
	{	
		$results = $this->product_model->get(array('id' => $offerID));
		$result = $results[0];
	
		// if the person is the owner, redirect to front page
		if($result->UserID==$this->session->userdata('id')) {
			$this->session->set_flashdata('notice', 'ไม่สามารถแลกสินค้าของตัวเองได้ค่ะ');
			redirect('product/show/'.$offerID);
		}
	
		$thumb = explode(';', $result->Image);
		for($i=0; $i<count($thumb); $i++)
		{
			if($thumb[$i] == "")
				unset($thumb[$i]);
			else
				$thumb[$i]=trim($thumb[$i]);
		}
		$result->Image = base_url().'images/product/thumb/'.$thumb[0];
		$user_results = $this->user_model->get(array('ID'=>$result->UserID))->result();
		$result->Username = $user_results[0]->Username;
		$province_results = $this->province_model->get(array('id'=>$result->ProvinceID));
		$result->Province = $province_results[0]->name;
	
		// get province
		$provinces = $this->province_model->get();
		$this->cismarty->assign('provinces', $provinces);
		$this->cismarty->assign('product', $result);
		$this->cismarty->assign('url', base_url());
		$this->cismarty->display('exchange.tpl');
	}
	
	function exchanges($prodID)
	{
		$results = $this->Swap_model->get(array('OfferID'=>$prodID, 'status !='=>-1));

		$swaps = array();
		foreach($results as $res) {
			$swapID = $res->ID;
			
			// get swapper product info
			$product = $this->Product_model->get(array('ID' => $res->SwapperID));			
			$user = $this->User_model->get(array('ID' => $product[0]->UserID));

			$product[0]->SwapID = $swapID;
			$product[0]->OfferDate = $res->ModifiedDate;
			$product[0]->Username = $user->first_row()->Username;
			$images = explode(';', $product[0]->Image);
			for($i=0; $i<count($images); $i++)
			{
				if($images[$i] == "")
					unset($images[$i]);
				else
					$images[$i]=trim($images[$i]);
			}
			$product[0]->Image = $images[0];		
			
			$swaps[] = $product[0];
		}		
		
		$this->cismarty->assign('url', base_url());
		$this->cismarty->assign('results', $swaps);
		$this->cismarty->display('swap.tpl');
	}
	
	function delete($swapID=NULL)
	{
		$this->swap_model->delete($swapID);
	}
	
	function accept($swapID=NULL)
	{
		$this->swap_model->edit($swapID, array('Status'=>1));
		
		// return other swap item ids
		$swapItem = $this->swap_model->get(array('ID'=>$swapID));
		$offerProd = $swapItem[0]->OfferID;
		
		$toReturn = array();
		$all_swaps = $this->swap_model->get(array('OfferID'=>$offerProd));
		foreach($all_swaps as $swap) {
			if($swap->ID != $swapID) $toReturn[] = $swap->ID;
		}
		
		echo json_encode($toReturn);
	}
	
	function reject($swapID=NULL)
	{
		// see the previous status
		$swapItem = $this->swap_model->get(array('ID'=>$swapID));
		$orig_status = $swapItem[0]->Status;
		$offerProd = $swapItem[0]->OfferID;
		
		$this->swap_model->edit($swapID, array('Status'=>2));
		
		if($orig_status==1) { // if it used to be "accept" we have to return the list of ids of the swap entry that will now become exchangeable
			$toReturn = array();
			$all_swaps = $this->swap_model->get(array('OfferID'=>$offerProd));
			foreach($all_swaps as $swap) {
				if($swap->ID != $swapID) $toReturn[] = $swap->ID;
			}
			
			echo json_encode($toReturn);
		} else {
			echo json_encode(array());
		}
	}
	
	function shipped($swapID=NULL)
	{
		$this->swap_model->edit($swapID, array('Status'=>3));
		
		$result = $this->swap_model->get(array('ID'=>$swapID));
		$offerID = $result[0]->OfferID;
		
		// the offered product's status will set to "close"
		$this->product_model->edit($offerID, array('Status'=>0));
		
		// all other items will be set to "rejected" immediately		
		$results = $this->swap_model->get(array('OfferID'=>$offerID));
		foreach($results as $res) {
			if($res->ID != $swapID) {
				$this->swap_model->edit($res->ID, array('Status'=>2));
			}
		}
		
		echo $offerID;
	}
}
?>