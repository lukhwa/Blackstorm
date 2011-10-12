<?php
class News extends Controller {
	
	function __construct()
	{
		parent::Controller();
		$this->load->model('news_model', '', true);
	}
	function index()
	{
		// list all news
		$results = $this->news_model->get(array(), "", "", array("ModifiedDate" => "asc"));
		
		$this->cismarty->assign('url', base_url());
		$this->cismarty->assign('results', $results);
		$this->cismarty->display('news.tpl');
	}	
	
	function create()
	{
		$submit = array ( "name"=>"create_button", "value"=>"สร้าง");
		$form = form_open('news/createNews', array('class' => 'news_form')).
				form_textarea(array('name'=>'news_area', 'id'=>'news', 'rows'=>10, 'cols'=>30)).
				'<div class="form_button" style="float:right; margin-top: 15px;">'.form_submit($submit).'</div>'.
				form_close();
	
		$this->cismarty->assign('h1', "เพิ่มข่าว");
		$this->cismarty->assign('form', $form);
		$this->cismarty->assign('url', base_url());
		$this->cismarty->display('createNews.tpl');
	}
	
	function createNews()
	{
		$news = $this->input->post('news_area');
		//$userID = $this->input->post('userID');
		$userID = 1;
		$this->news_model->create(array('News'=>$news, 'UserID'=>$userID));
		
		//redirect back to 'news' page
		redirect('news');
	}
	
	function edit($newsID)
	{
		$results = $this->news_model->get(array('ID'=>$newsID));
		if(count($results)==0) redirect('news');
	
		$submit = array ( "name"=>"create_button", "value"=>"แก้ไข");
		$form = form_open('news/editNews', array('class' => 'news_form')).
				form_textarea(array('name'=>'news_area', 'id'=>'news', 'value'=> $results[0]->News,'rows'=>10, 'cols'=>30)).
				form_hidden('news_id', $results[0]->ID).
				'<div class="form_button" style="float:right; margin-top: 15px;">'.form_submit($submit).'</div>'.
				form_close();
	
		$this->cismarty->assign('h1', "เเก้ไขข่าว");
		$this->cismarty->assign('form', $form);
		$this->cismarty->assign('url', base_url());
		$this->cismarty->display('createNews.tpl');
	}
	
	function editNews()
	{	
		$newsID = $this->input->post('news_id');
		$content = $this->input->post('news_area');
		$this->news_model->edit($newsID, array('News'=>$content, "ModifiedDate" => date("Y-m-d H:i:s")));
		
		//redirect back to 'news' page
		redirect('news');
	}
	
	function promote($newsID)
	{
		//the selected one becomes promoted; others should be unpromoted
		$results = $this->news_model->get();
		
		foreach($results as $res) {
			if($res->ID==$newsID)
				$this->news_model->edit($res->ID, array('Promoted'=>1));
			else
				$this->news_model->edit($res->ID, array('Promoted'=>0));
		}
		
		//redirect back to 'news' page
		redirect('news');
	}
	
	function delete($newsID)
	{		
		$this->news_model->delete($newsID);
		
		//redirect back to 'news' page
		redirect('news');
	}
	
	function latest()
	{
		// list all news
		$results = $this->news_model->get(array(), 5);
		
		$this->cismarty->assign('results', $results);
		$this->cismarty->display('news.tpl');
	}
}
?>