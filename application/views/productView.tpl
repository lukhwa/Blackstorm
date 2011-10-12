{extends file="layout.tpl"}

{block name=resultContent}
<div id="resultContent" class="block">
	<div class="box-header">
	<table width="100%">
	<tr>
		<td><h1>{$pageTitle}</h1></td>
		<td>
		<div style="float: right">
		<form method="get" action="{$url}product/search">
			<label>เรียงตาม : </label>
			<select class="input-select-form" name="orderby">
					<option value="Name">ชื่อ</option>
					<option value="ProvinceID">จังหวัด</option>
					<option value="CreatedDate">วันที่ประกาศ</option>
			</select>
			<input type="submit" id="form-button" value="เรียง"/>
		</form>
		</div>
		</td>
	</tr>
	</table>
	</div>
	<div class="other-box-content">
	<div id="browseheader">
		<table cellpadding="5" cellspacing="0" width="100%">
					<tr>
						<td width="180px" valign="top">สินค้า</td>
						<td width="220px" valign="top">รายการ</td>
						<td width="130px" valign="top">จังหวัด</td>
						<td valign="top">วันที่งลงประกาศ</td>
					</tr>
		</table>
	</div>			 
	  {foreach $products as $product}
		<div class="eachitem">
			<table border="1" bordercolor="#ddd" cellpadding="5" cellspacing="0" width="100%">
				<tr>
					<td width="180px" valign="top"><img src="{$url}{$product['thumbnail']}"/></td>
					<td width="220px" valign="top"><span class="product-name"><a href="{$url}product/show/{$product['id']}">{$product['name']}</a></span><span style="display:block;padding-top:10px;"><img src="{$url}images/personICON.jpg"/> {$product['seller']}</span></td>
					<td width="130px" valign="top"><span class="province">{$product['province']}</span></td>
					<td valign="top"><span class="created-date">{$product['date']}</span></td>
				</tr>
			</table>
		</div>
	  {/foreach}
	  <div class="pagination">{$links}</div>
	</div>
</div>
{/block}