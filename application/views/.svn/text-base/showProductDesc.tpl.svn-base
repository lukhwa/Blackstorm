{extends file="layout.tpl"}

{block name=cssjavascript}
<link rel="stylesheet" href="{$url}css/imageflow.css" type="text/css" />
<script src="{$url}js/imageflow.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	var instanceOne = new ImageFlow();
	instanceOne.init({ ImageFlowID: 'productimgs' });
});

function toggleList()
{
	if($('.collapse').length) {
		$('#swapDiv').hide();
		$('.collapse').removeClass('collapse').addClass('expand');
	}
	else {
		$('#swapDiv').show();
		$('.expand').removeClass('expand').addClass('collapse');
	}
}
</script>
{/block}

{block name=title}{$product['name']} by We2Share{/block}

{block name=sellerDescription}
<div class="description-block block">
	<div class="itemheader"><img src="{$url}images/personICON.jpg"/> ข้อมูลเจ้าของสินค้า</div>
	<div class="itemcontent">
		<table>
			<tr><td><img src ="{$url}images/user/thumb/{$product['seller_avatar']}" /></td></tr>
			<tr><td>Username: <a href="{$url}user/publicprofile/{$product['sellerID']}">{$product['seller']}</a></td></tr>
			<tr><td>{$seller_score}</td></tr>
			<tr><td>ดูสินค้าอื่นๆของ <a href="{$url}product/search/1?seller={$product['seller']}">{$product['seller']}</a></td></tr>
		</table>
	</div>
</div>
{if $product['type'] eq 1}
<div class="description-block block">
	<div class="itemheader"><img src="{$url}images/personICON.jpg"/>ข้อมูลสินค้าทีจะเเลกด้วย</div>
	<div class="itemcontent">
		<table width="100%">
			<tr align="center">
				<td style="font-weight: bold; padding: 5px; font-size: 14px;">
				<a href="{$url}product/show/{$offer->ID}">{$offer->Name}</a>	<br/><span style="font-weight: normal; color: #bbb; font-size: 10px;">โดย {$offer->Username}</span>						
				</td>
			</tr>
			<tr align="center">
				<td>
				<img style="padding:10px;" src="{$offer->Image}"/>
				</td>
			</tr>
			<tr align="center">
				<td>
				สภาพสินค้า  <span style="font-weight: bold">{$offer->Condition}</span>
				</td>
			</tr>
			<tr align="center">
				<td>
				ที่อยู่สินค้า   <span style="font-weight: bold">{$offer->Province}</span>
				</td>
			</tr>
			<tr align="center">
				<td>
				ราคาประเมิน   <span style="font-weight: bold">฿{$offer->EstimatedPrice}</span>
				</td>
			</tr>
		</table>
	</div>
</div>
{/if}
{/block}
			
{block name=resultContent}		
			<div id="resultContent" class="block">
				<div class="box-header">
					<h1>{$product['name']}</h1>
				</div>
				<div class="other-box-content">
					<div id="buyandsocial">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td width="50%">
								<!-- AddThis Button BEGIN -->
								<div class="addthis_toolbox addthis_default_style ">
								<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
								<a class="addthis_button_tweet"></a>
								<a class="addthis_counter addthis_pill_style"></a>
								</div>
								<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4d51000f294fab05"></script>
								<!-- AddThis Button END -->
							</td>
							<td width="50%" align="right">{if $product['type'] eq 0 && $product['seller']!=$user}<a href="{$url}swap/index/{$product['id']}" class="button super yellow">แลกสินค้า!</a>{/if}</td>
						</tr>
					</table>
					</div>
					<div class="description-block">
						<div class="itemheader">ภาพสินค้า</div>
						<div id="productimgs" class="imageflow"> 
							{foreach $thumbnails as $thumbnail}
							<img class="thumbnail" longdesc="{$url}images/product/{$thumbnail}" src="{$url}images/product/thumb/{$thumbnail}" />
							{/foreach}											
						</div>
					</div>
					<div class="description-block">
						<div class="itemheader">รายละเอียดสินค้า</div>
						<div class="itemcontent">
							<table class="product" width="100%" cellpadding="3" cellspacing="10">
								<tr>
									<td width="25%" class="tbheader">
										สภาพสินค้า
									</td>
									<td width="25%" class="tbcontent">
										{$product['condition']}
									</td>
									<td width="25%" class="tbheader">
										ราคาประเมิน
									</td>
									<td width="25%" class="tbcontent">
										{$product['estimatedPrice']} บาท
									</td>							
								</tr>
								<tr>
									<td width="25%" class="tbheader">
										วันที่ลงประกาศ
									</td>
									<td width="25%" class="tbcontent">
										{$product['date']}
									</td>
									<td width="25%" class="tbheader">
										ที่อยู่สินค้า
									</td>
									<td width="25%" class="tbcontent">
										{$product['province']}
									</td>							
								</tr>							
							</table>	
							<div class="itemcontent">						
								{$product['description']}
							</div>
							<div id="thumbnail-view"></div>
						</div>
					</div>	
					{if $product['type'] eq 0}
					<div class="description-block">
						<div class="collapse"><a href="javascript:void;" onclick="toggleList()">&nbsp;</a></div>
						<div class="itemheader">ข้อมูลการแลกสินค้า</div>
						<div id="swapDiv"><a name="swapin">&nbsp;</a><table class="swapTable">
						{foreach $swaps as $swap}
							<tr><td class="swap_image"><img src="{$swap->Image}" /></td>
							<td class="swap_detail"><a href="{$url}product/show/{$swap->ID}">{$swap->Name}</a><br/>ขอแลกโดย: {$swap->Username}<br/>เมื่อวันที่: {$swap->OfferDate}</td>
							<td class="swap_status">{$swap->Status}</td>
							</tr>
						{/foreach}
						</table></div>
					</div>
					{/if}
				</div>
			</div>
{/block}