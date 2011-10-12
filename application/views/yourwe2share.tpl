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
								
								var swaps = eval('('+data+')');
								for(var i=0; i<swaps.length; i++){
									$('#' + swaps[i] + 'control .exchange').show();
								}
							  }
							});
							$( this ).dialog( "close" );
						},
						"ยกเลิก": function() {
							$( this ).dialog( "close" );
						}
					}
				});
	}
	
	function accept(item) {
		$.ajax({
		  url: '{$url}swap/accept/' + item,
		  success: function(data) {
			$('#' + item + 'control').html('<a href="javascript:void(0)" class="button medium orange" onclick="shipped(' + item + ')">ส่งแล้ว</a> <a href="{$url}talk/messages/'+ item + '" class="button medium blue">เปิดหน้าสนทนา</a> <a href="javascript:void(0)" class="button medium red" onclick="reject(' + item +')">ปฏิเสธ</a>');

			var swaps = eval('('+data+')');
			for(var i=0; i<swaps.length; i++){
				$('#' + swaps[i] + 'control .exchange').hide();
			}
		  }
		});
	}

	function shipped(item) {
		$( ".message" ).html('คุณต้องการยืนยันการส่งของหรือไม่');
		$( "#dialog-confirm" ).dialog({
					resizable: false,
					height:140,
					modal: true,
					buttons: {
						"ยืนยัน": function() {
							$.ajax({
							  url: '{$url}swap/shipped/' + item,
							  success: function(data) {
								$('#' + data + 'children').remove();
								
								var prodRow = $('#' + data + 'maincontainer');
								$('#historytable').append(prodRow);
								prodRow.attr('id', data + 'historycontainer');
							  }
							});
							$( this ).dialog( "close" );
						},
						"ยกเลิก": function() {
							$( this ).dialog( "close" );
						}
					}
				});
	}

-->
</script>
{/block}

{block name=resultContent}
		<div id="dialog-confirm" title="ยืนยันการกระทำ" style="display:none;">
			<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span><span class="message">ต้องการปฏิเสธสินค้าชิ้นนี้?</span></p>
		</div>
		<div id="resultContent" class="block">
			<div class="box-header">
				<h1>บัญชีของฉัน</h1>
			</div>
			<div class="other-box-content">
				<div class="description-block">
					<div class="itemheader">ข้อมูลทั่วไป</div>
					<div id="itemcontent"> 
						<table cellpadding="5" cellspacing="0" width="100%" class="productline">
							<tr>
								<td width="130"><div style="border:1px solid #DDD;width:120px;height:120px;text-align: center;padding: 5px;"><img src="{$url}images/user/thumb/{$userInfo['Avatar']}" /></div></td>
								<td>
									<div class="userItem">ชื่อ: {$userInfo['FName']} {$userInfo['LName']} ({$userInfo['Username']})</div>
									
								</td>
							</tr>
						</table>															
					</div>
				</div>
				<div class="description-block">
					<div class="itemheader">อันดับความนิยมสมาชิก</div>
					<div class="itemcontent">
						<table cellpadding="20" cellspacing="0" width="100%">
						{foreach $getReceivedFeedback as $fb}
						<tr>
							<td valign="top" width="150" style="border-bottom: 1px dashed #ccc;">
							<img style="border-radius: 4px;-moz-border-radius: 10px; border-top: 1px solid #ddd; padding: 15px; border-left: 1px solid #ddd; border-bottom: 1px solid #777; border-right: 1px solid #777;" width="150" src ="{$url}images/product/{$fb->thumb}" />
							</td>
							<td valign="top" style="border-bottom: 1px dashed #ccc;">
								<div style="margin-bottom: 20px;">
								<form>
									<div style="margin-bottom: 10px; color: #666; font-weight: bold;">ความนิยม: <span id="{$fb->RaterName}-{$fb->ID}-rating"></span></div>
									<div id="{$fb->RaterName}-{$fb->ID}">
										<input type="radio" value="1" title="แย่มาก" {if $fb->Score == 1}checked="checked"{/if}/>
										<input type="radio" value="2" title="แย่" {if $fb->Score == 2}checked="checked"{/if}/>
										<input type="radio" value="3" title="พอใช้" {if $fb->Score == 3}checked="checked"{/if}/>
										<input type="radio" value="4" title="ดี" {if $fb->Score == 4}checked="checked"{/if}/>
										<input type="radio" value="5" title="ดีมาก" {if $fb->Score == 5}checked="checked"{/if}/>
									</div>
								</form>
								<script language="javascript">
									$("#{$fb->RaterName}-{$fb->ID}").stars({	
										disabled: true,
										captionEl: $("#{$fb->RaterName}-{$fb->ID}-rating")
									});
								</script>
								</div>
								<div class="blockquote" style="margin-top: 40px; padding: 0px 40px 10px 30px; text-align: justify; color: #444; font-size: 11px;">{$fb->Comment}
									<div style="margin-top: 10px; color: #aaa;">โดย: {$fb->RaterName}</div>
								</div>
								
							</td>
						</tr>
						{/foreach}
						</table>
						<p align="right"><a href="{$url}user/ratingHistory/{$userInfo['ID']}">ดูทั้งหมด</a></p>
					</div>
				</div>
				<div class="description-block">
					<div class="itemheader">รายการสินค้าที่ลงประกาศ</div>
					<div class="itemcontent">
						<table cellpadding="5" cellspacing="0" width="100%" class="productline">
							{foreach $offerProducts as $item}
							<tr id="{$item->ID}maincontainer">
								<td width="150"><img src="{$url}images/product/thumb/{substr($item->Image, 0, strpos($item->Image, ';'))}"/></td>
								<td><a href="{$url}product/show/{$item->ID}">{$item->Name}</a></td>
							</tr>
							{/foreach}
						</table>
					</div>
				</div>			
			</div>
		</div>
{/block}