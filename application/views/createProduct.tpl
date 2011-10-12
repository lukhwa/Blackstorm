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
{block name=resultContent}
	<div id="content">
		<div class="box-header">
			<h1>{$pageTitle}</h1>
		</div>
		<div class="other-box-content">
			<div id="instructions">
				<h2>คำแนะนำการใช้แบบฟอร์มการป้อนข้อมูลสินค้า</h2>
				กรอกข้อมูลลงในกล่องข้อความ กล่องข้อความที่มีเครื่องหมาย * ไม่สามารถละได้
			</div>
				<form id="addProduct" action="db_create" method="post" enctype="multipart/form-data">
					<fieldset>		
						<label>ชื่อสินค้า: </label>
						<input type="text" name="Name" id="" size="" class="textInput" maxlength="55"><span style="font-style: italic; color: #aaa;">ไม่เกิน 55 ตัวอักษร</span>
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
										{foreach $results as $result}
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
								<span style="font-style: italic; color: #aaa;">***ไม่เกิน 300k สำหรับเเต่ละไฟล์</span>
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
						<input name="Status" type="hidden" value="1" />
						<input name="Type" type="hidden" value="0" />					
						<center><input name="submit" type="submit" value="ส่งสินค้าเข้าสู่ระบบ!" id="submitproductb" disabled="disabled"/></center>
					</fieldset>		
				</form>	
			</div>	
		</div>
{/block}