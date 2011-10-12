<?php
class Talk extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->model('Message_model', '', true);
		$this->load->model('User_model', '', true);
		$this->load->model('Product_model', '', true);
		$this->load->model('Swap_model', '', true);
	}
	
	function messages($swapID=NULL)
	{
		$userID = $this->session->userdata('id');
	
		if($this->Message_model->checkUserPermission($userID, $swapID)) {
			$results = $this->Message_model->getMessages($swapID);
			
			$users = $this->User_model->get(array('ID'=>$userID))->result();
			
			$curr_user_avatar = $users[0]->Avatar;
			
			$swapItem = $this->Swap_model->get(array('ID'=>$swapID));
			$offerProd = $this->Product_model->get(array('ID'=>$swapItem[0]->OfferID));
			
			if($offerProd[0]->UserID == $userID) $isOfferUser = 1;
			else $isOfferUser = 0;
			
			$this->cismarty->assign('results', $results);
			$this->cismarty->assign('swapID', $swapID);
			$this->cismarty->assign('isOfferUser', $isOfferUser);
			$this->cismarty->assign('curr_user_avatar', $curr_user_avatar);
			$this->cismarty->display('messages.tpl');
		}
		else {
			$this->session->set_flashdata('notice', 'You are not authorized to participate in this chat session.');
			redirect('user/profile/'.$userID);
		}
	}
	
	function create()
	{
		$message = $this->input->post('message');
		$swapID = $this->input->post('swapID');
		$userID = $this->session->userdata('id');
		
		// make sure that this user can really participate in the chat session
		if($this->Message_model->checkUserPermission($userID, $swapID)) {
			$this->Message_model->create(array('Message'=>$message, 'SwapID'=>$swapID, 'UserID'=>$userID));
			redirect('talk/messages/'.$swapID);
		}
		else {
			$this->session->set_flashdata('notice', 'You are not authorized to participate in this chat session.');
			redirect('user/profile/'.$userID);
		}
	}
}
?>