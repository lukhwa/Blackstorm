{extends file="layout.tpl"}

{block name=cssjavascript}
<script type="text/javascript" language="javascript">
	function enableSubmit(cbox) {
		if($(cbox).attr('checked')){
			$("#submitproductb").attr("disabled","");
		} else {
			$("#submitproductb").attr('disabled','disabled');
		}
		cbox = null;
	}	
</script>
<script type="text/javascript" src="{$url}js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" charset="utf-8">
	 $(function() {
		CKEDITOR.replace('desc_area', {
			height : '300',
			width : '620',
			filebrowserBrowseUrl : '{$url}js/ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '{$url}js/ckfinder/ckfinder.html?Type=Images',
			filebrowserFlashBrowseUrl : '{$url}js/ckfinder/ckfinder.html?Type=Flash',
			filebrowserUploadUrl : '{$url}js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '{$url}js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '{$url}js/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash',
			toolbar : 
			[
				['Source','-','Cut','Copy','Paste','PasteText','PasteFromWord'],
				['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
				['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField','-','Link','Unlink','Anchor','-',
				'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
				'/',
				['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
				['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
				['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
				['BidiLtr', 'BidiRtl' ],				
				'/',
				['Styles','Format','Font','FontSize'],
				['TextColor','BGColor'],
				['Maximize']
			]
		});
		
		$('input:submit', 'other-box-content').button();
	});
</script>
{/block}

{block name=title}แลกสินค้ากับ {$product->Name}{/block}

{block name=sellerDescription}
<div class="description-block block">
	<div class="itemheader"><img src="{$url}images/personICON.jpg"/>ข้อมูลสินค้าทีอยากเเลก</div>
	<div class="itemcontent">
		<table width="100%">
			<tr align="center">
				<td style="font-weight: bold; padding: 5px; font-size: 14px;">
				<a href="{$url}product/show/{$product->ID}">{$product->Name}</a>	<br/><span style="font-weight: normal; color: #bbb; font-size: 10px;">โดย {$product->Username}</span>						
				</td>
			</tr>
			<tr align="center">
				<td>
				<img style="padding:10px;" src="{$product->Image}"/>
				</td>
			</tr>
			<tr align="center">
				<td>
				สภาพสินค้า  <span style="font-weight: bold">{$product->Condition}</span>
				</td>
			</tr>
			<tr align="center">
				<td>
				ที่อยู่สินค้า   <span style="font-weight: bold">{$product->Province}</span>
				</td>
			</tr>
			<tr align="center">
				<td>
				ราคาประเมิน   <span style="font-weight: bold">฿{$product->EstimatedPrice}</span>
				</td>
			</tr>
		</table>
	</div>
</div>
{/block}
			
{block name=resultContent}		
<div id="resultContent" class="block">
	<div class="other-box-content">
		<h1>แลกสินค้ากับ {$product->Name}</h1>
		<div style="color: #aaa; margin-bottom: 20px;"><img style="width: 10px; height: 10px; padding-right: 5px;" src="/black-storm/images/arrow_icon.gif" />กรุณากรอกสินค้าที่ต้องการเเลก
		</div>
		<div id="instructions">
			<h2>คำแนะนำการใช้แบบฟอร์มการป้อนข้อมูลสินค้า</h2>
			กรอกข้อมูลลงในกล่องข้อความ กล่องข้อความที่มีเครื่องหมาย * ไม่สามารถละได้
		</div>		
		<form id="addProduct" action="{$url}product/db_create_swap" method="post" enctype="multipart/form-data">
					<fieldset>		
						<label>ชื่อสินค้า: </label>
						<input type="text" name="Name" id="" size="" class="textInput">
					</fieldset>
					<fieldset>
						<label>รายละเอียดสินค้า: </label>
						<textarea name="Description" id="desc_area"></textarea>
					</fieldset>
					<table cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td width="50%" valign="top">
								<fieldset>
									<label>จังหวัด:</label>
									<select name="ProvinceID">
										{foreach $provinces as $result}
										  <option value="{$result->id}">{$result->name}</option>
										{/foreach}
									</select>
								</fieldset>
								<fieldset>
									<label>สภาพสินค้า:</label>
									<select name="Condition">
										  <option value="สินค้ามือหนึ่ง">สินค้ามือหนึ่ง</option>
										  <option value="สินค้ามือสอง">สินค้ามือสอง</option>
									</select>						
								</fieldset>
								<fieldset>
									<label>ราคาประเมิน:</label>
									<input type="text" name="EstimatedPrice" id="" size=""> บาท
								</fieldset>
							</td>
							<td width="50%" valign="top">				
								<fieldset>
									<label>รูปภาพสินค้า 1:</label>
									<input name="image1" type="file"/>
									<br/>
									<label>รูปภาพสินค้า 2:</label>
									<input name="image2" type="file"/>
									<br/>
									<label>รูปภาพสินค้า 3:</label>
									<input name="image3" type="file"/>
									<br/>
									<label>รูปภาพสินค้า 4:</label>
									<input name="image4" type="file"/>
									<br/>
									<label>รูปภาพสินค้า 5:</label>
									<input name="image5" type="file"/>
								</fieldset>
							</td>
						</tr>
					</table>
					
					<fieldset>
						<div id="termsConditions">
							<h2>ข้อตกลงและเงื่อนไขการใช้บริการ</h2>
							<ol>
								<li>ข้อที่ หนึ่ง</li>
								<li>ข้อที่ สอง</li>
							</ol>
							<div id="accept"><input type="checkbox" onClick="enableSubmit(this)"/> <strong>ข้าพเจ้ายอมรับข้อตกลงและเงื่อนไขดังกล่าวข้างต้น</strong></div>
						</div>
					</fieldset>
					<fieldset>
						<input name="OfferID" type="hidden" value="{$product->ID}" />					
						<center><input name="submit" type="submit" value="เเลก!" id="submitproductb" disabled="disabled"/></center>
					</fieldset>		
				</form>	
	</div>
{/block}