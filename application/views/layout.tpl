<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{block name=title}We 2 Share แลกเปลี่ยนสินค้า แลกของ{/block}</title>
<link href="{$url}css/style.css" rel="stylesheet" type="text/css" />
<link href="{$url}css/jquery-ui-1.8.9.custom.css" rel="stylesheet" type="text/css" />
<link href="{$url}css/jquery.ui.stars.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{$url}js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="{$url}js/jquery-ui-1.8.9.custom.min.js"></script>
<script type="text/javascript" src="{$url}js/easySlider1.7.js"></script>
<script type="text/javascript" src="{$url}js/cufon-yui.js"></script>
<script type="text/javascript" src="{$url}js/supermarket_400.font.js"></script>
<script type="text/javascript" src="{$url}js/jquery.ui.stars.min.js"></script>
<script type="text/javascript" src="{$url}js/ui.js"></script>

<script>
 $(function() {
	$('.input-text-form').focus(function () {
		if ($(this).val() == "Seller or product name") {
			$(this).val("");
			$(this).css("color","black");
		}
	}).blur(function () {
		if ($(this).val() == "") {
			$(this).css("color","#bbb");
			$(this).val("Seller or product name");
		}
	});
 });
</script>
{block name=cssjavascript}{/block}

</head>

<body>
<div id="wrapper">
	<div id="header">
		<div id="header-left"><a href="{$url}"><img src="{$url}images/logo.png" alt="want 2 share"/></a></div>
		<div id="header-right">
			<div id="menu-helper">ช่วยเหลือ | ติดต่อโฆษณา | คำถามที่พบบ่อย</div>
			<div id="userinfo">ยินดีต้อนรับ {$user} ({$user_actions})</div>
			<div id="navigation">
				<ul>
					<li><a href="{$url}">หน้าแรก</a></li>
					<li><a href="{$url}product/page">แคทตาล็อกสินค้า</a></li>
					<li><a href="{$url}user/profile">บัญชีของฉัน</a></li>
					<li><a href="#">วิธีแลกเปลี่ยน</a></li>
					<li><a href="{$url}news">ข่าวสาร-โปรโมชั่น</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="content">
		<div id="content-right">
			<div id="search-block">
				<div id="search-block-header">:: ค้นหาสินค้าง่ายๆ 1 2 3</div>
				<div id="search-form">
					<form method="post" action="{$url}product/search">
						<fieldset>
							<label>1. ใส่คำค้นหา : </label>
							<input type="text" name="searchterms" class="input-text-form" value="Seller or product name"/>
					  </fieldset>
						<fieldset>
							<label>2. เลือกจังหวัด : </label>
							<select class="input-select-form" name="province">
								<option value="-1" selected>ทั้งหมด</option>
								{foreach $provinces as $province}
									<option value="{$province->id}">{$province->name}</option>
								{/foreach}								
							</select>
						</fieldset>
						<fieldset>
							<label>3. กดปุ่มค้นหา : </label>
							<input type="submit" id="form-button" value="ค้นหา!"/>
						</fieldset>
					</form>
				</div>
			</div>
			{block name=sellerDescription}
			<div id="twitter-block" class="block">
				<script src="http://widgets.twimg.com/j/2/widget.js"></script>
				<script>
				new TWTR.Widget({
				  version: 2,
				  type: 'search',
				  search: 'to:nopash OR from:nopash OR @nopash',
				  interval: 6000,
				  title: 'Tweets which relate to @nopash',
				  subject: 'FOLLOW @NOPASH',
				  width: 'auto',
				  height: 300,
				  theme: {
					shell: {
					  background: '#8ec1da',
					  color: '#ffffff'
					},
					tweets: {
					  background: '#ffffff',
					  color: '#444444',
					  links: '#1985b5'
					}
				  },
				  features: {
					scrollbar: false,
					loop: true,
					live: true,
					hashtags: true,
					timestamp: true,
					avatars: true,
					toptweets: false,
					behavior: 'default'
				  }
				}).render().start();
				</script>
			</div>
			<div id="facebook-block" class="block">
				<script src="http://connect.facebook.net/en_US/all.js#xfbml=1"></script><fb:like-box href="http://www.facebook.com/#!/pages/eDecalShop-Signs-and-Graphics/131500433528016" width="280" show_faces="true" stream="false" header="true"></fb:like-box>
			</div>	
			<div class="block">
				<a href="http://track.thailandpost.co.th/trackinternet/Default.aspx" target="_blank" ><img src="{$url}images/banner_wetrust_th.gif" /></a>
			</div>	
			{/block}	
		</div>
		<div id="content-left">
		
		{$notice}
			
		{block name=resultContent}
		{/block}
		
		{block name=hotnew}
		{/block}
		
		{block name=slider}
		{/block}
		
		{block name=productlist}			
		{/block}
		
		{block name=swaprule}
		{/block}			
		
		</div>	
		<div class="clearall"></div>	
	</div>
	<div id="footer">&copy; 2011 สงวนลิขสิทธิ์ we2share.com</div>
	<div class="clearall"></div>
</div>
</body>
</html>
