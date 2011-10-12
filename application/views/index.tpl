{extends file="layout.tpl"}

{block name=hotnew}
<div id="hotnew" class="block">
	<div class="box-header">
		<span class="head-hilight">ทักทายเพื่อนๆ ชาว Want2Share</span>
	</div>
	<div class="box-content">
	  <div class="news">{$news}</div>
	</div>
</div>
{/block}

{block name=slider}
<div id="slidercover">
	<div id="slider">
		<ul>				
			<li><a href="#"><img src="slider_images/04.jpg"/></a></li>
			<li><a href="#"><img src="slider_images/01.jpg"/></a></li>
			<li><a href="#"><img src="slider_images/02.jpg"/></a></li>
			<li><a href="#"><img src="slider_images/03.jpg"/></a></li>				
			<li><a href="#"><img src="slider_images/05.jpg" /></a></li>
			<li><a href="#"><img src="slider_images/06.jpg" /></a></li>					
		</ul>
	</div>
</div>
{/block}

{block name=productlist}			
<div id="productlist" class="block">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td valign="top" width="49%">
				<div id="newproduct">
					<div class="box-header">
						<span class="head-hilight">สินค้ามาใหม่ NEW!</span>
					</div>
					<div class="box-content">
						<table class="recent-products" cellpadding="5" cellspacing="0" width="100%">									
						{foreach $recentProducts as $result}
							<tr>
								<td width="110px" valign="top"><a href="{$url}product/show/{$result->ID}"><img src="{$url}{$recentProductsData[$result->ID]['thumb']}"/></a></td>
								<td valign="top"><div class="product-name"><a href="{$url}product/show/{$result->ID}">{$result->Name}</a></div>
								<div class="seller"><img src="{$url}images/personICON.jpg"/><a href="{$url}user/profile"> {$recentProductsData[$result->ID]['seller']}</a></div>
								<div class="date"><img src="{$url}images/date_icon.gif"/> {$recentProductsData[$result->ID]['date']}</div>
								</td>
							</tr>
						{/foreach}
						</table>
						<div class="see-all"><img src="{$url}images/arrow_icon.gif"/> <a href="{$url}product/page">ดูสินค้าทั้งหมด</a></div>
					</div>
				</div>
			</td>
			<td width="2%">&nbsp;</td>
			<td valign="top" width="49%">
				<div id="newproduct">
					<div class="box-header">
						<span class="head-hilight">สินค้ามาแรง HOT! </span>
					</div>
					<div class="box-content">
						<table class="hot-products" cellpadding="5" cellspacing="0" width="100%">
						{foreach $hotProducts as $result}
							<tr>
								<td width="110px" valign="top"><a href="{$url}product/show/{$result->ID}"><img src="{$url}{$hotProductsData[$result->ID]['thumb']}"/></a></td>
								<td valign="top"><div class="product-name"><a href="{$url}product/show/{$result->ID}">{$result->Name}</a></div>
								<div class="seller"><img src="{$url}images/personICON.jpg"/> {$hotProductsData[$result->ID]['seller']}</div>
								<div class="date"><img src="{$url}images/date_icon.gif"/> {$hotProductsData[$result->ID]['date']}</div>
								</td>
							</tr>
						{/foreach}
						</table>
						<div class="see-all"><img src="{$url}images/arrow_icon.gif"/> <a href="{$url}product/page">ดูสินค้าทั้งหมด</a></div>
					</div>	
				</div>				
			</td>
		</tr>
	</table>
</div>
{/block}
{block name=swaprule}
<div id="swaprules" class="block">
	<div class="rule-box-header">
		<span class="head-hilight">กฎ-กติกา มารยาท ในการแลกของ</span>
	</div>
	<div class="rule-box-content">
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	  <p>&nbsp;</p>
	</div>			
</div>
{/block}			
