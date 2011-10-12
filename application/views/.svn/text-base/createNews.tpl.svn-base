{extends file="layout.tpl"}

{block name=cssjavascript}
<script type="text/javascript" src="{$url}js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" charset="utf-8">
	 $(function() {
		$("input:submit", '.form_button').button();
	 
		CKEDITOR.replace('news_area', {
			height : '300',
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
		
	});
</script>
{/block}

{block name=resultContent}
<div id="resultContent" class="block">
	<div class="box-header">
		<h1>{$h1}</h1>
	</div>
	<div class="other-box-content">
		{$form}
	</div>
</div>
{/block}
