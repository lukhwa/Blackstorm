{extends file="layout.tpl"}
{block name=cssjavascript}
<script language="javascript" type="text/javascript">
<!--
	function reject(item) {
		$( ".message" ).html('คุณแน่ใจหรือว่าต้องการปฏิเสธของชิ้นนี้');
		$( "#dialog-confirm" ).dialog({
					resizable: false,
					height:140,
					modal: true,
					buttons: {
						"ปฏิเสธ": function() {
							$.ajax({
							  url: '{$url}swap/reject/' + item,
							  success: function(data) {
								$('#' + item + 'container').remove();
							  }
							});
							$( this ).dialog( "close" );
							window.location="{$url}user/profile";
						},
						"ยกเลิก": function() {
							$( this ).dialog( "close" );
						}
					}
				});
	}
</script>
{/block}
{block name=resultContent}
<div id="dialog-confirm" title="ยืนยันการกระทำ" style="display:none;">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><span class="message">ต้องการปฏิเสธสินค้าชิ้นนี้?</span></p>
</div>
<div id="resultContent" class="block">
<div class="box-header">
	<h1>หน้าจอสนทนา</h1>
</div>
<div id="messages">
	<form action="{$url}talk/create" method="post" class="message_form">
	<table class="messages" width="100%" border="0" cellpadding="0" cellspacing="0">
		{foreach $results as $result}
		<tr>
			<td width="60" valign="top"><img src="{$url}images/user/thumb/{$result->avatar}" width="40px"/></td><td valign="top"><strong>{$result->uname} พูดว่า:</strong><div class="talkmsg">{$result->msg}</div><span class="smtext">{$result->senttime}</span></td>
		</tr>
		{/foreach}
		<tr>
			<td width="60" valign="top"><img src="{$url}images/user/thumb/{$curr_user_avatar}" width="40px"/></td>
			<td valign="top">
				<fieldset>
					<textarea name="message" cols="30" rows="3" id="message" ></textarea>
				</fieldset>
				<input type="hidden" name="swapID" value="{$swapID}" />
				<fieldset>
					<div align="right"><input type="submit" name="submit" value="ส่งข้อความ" class="button small yellow fbutton"/></div>
				</fieldset>
			</td>
		</tr>
	</table>
	</form>
	<p align="center">
	{if $isOfferUser}
	<span class="button large red" onclick="reject({$swapID})">ปฏิเสธสินค้าชิ้นนี้</span>
	&nbsp;&nbsp;&nbsp;{/if}
	<a href="{$url}user/profile"><span class="button large green">กลับไปหน้าบัญชีของฉัน</span></a></p>

</div>
</div>
{/block}