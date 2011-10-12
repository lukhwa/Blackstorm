{extends file="layout.tpl"}

{block name="resultContent"}
<div id="resultContent" class="block">
<div class="box-header">
	<h1>{$pageTitle}</h1>
</div>
<div class="other-box-content">
    <div id="userrating">
                    คะแนนรวม: {$totalScore} (จาก {$scoreCount} ครั้ง)
    </div>
    <div id="allratings">
		<h3 class="gradient_gray_bg">คะแนนที่ได้รับ</h3>
		<table cellpadding="20" cellspacing="0" width="100%">
        {foreach $ratings as $r}
		<tr>
			<td valign="top" width="150" style="border-bottom: 1px dashed #ccc;">
			<img style="border-radius: 4px;-moz-border-radius: 10px; border-top: 1px solid #ddd; padding: 15px; border-left: 1px solid #ddd; border-bottom: 1px solid #777; border-right: 1px solid #777;" width="150" src ="{$url}images/product/{$r->Thumb}" />
			</td>		
			<td valign="top" style="border-bottom: 1px dashed #ccc;">
				<div style="margin-bottom: 20px;">
					<form>
						<div style="margin-bottom: 10px; color: #666; font-weight: bold;">
							ความนิยม: <span id="{$r->ID}-rating"></span>
						</div>
						<div id="{$r->ID}-wrapper">
							<input type="radio" value="1" title="แย่มาก" {if {$r->Score} == 1}checked="checked"{/if}/>
							<input type="radio" value="2" title="แย่" {if {$r->Score} == 2}checked="checked"{/if}/>
							<input type="radio" value="3" title="พอใช้" {if {$r->Score} == 3}checked="checked"{/if}/>
							<input type="radio" value="4" title="ดี" {if {$r->Score} == 4}checked="checked"{/if}/>
							<input type="radio" value="5" title="ดีมาก" {if {$r->Score} == 5}checked="checked"{/if}/>
						</div>
					</form>
				<script language="javascript">
					$("#{$r->ID}-wrapper").stars({	
						disabled: true,
						captionEl: $("#{$r->ID}-rating")
					});
				</script>
				</div>
				<div class="blockquote" style="margin-top: 40px; padding: 0px 40px 10px 30px; text-align: justify; color: #444; font-size: 11px;">{$r->Comment}
					<div style="margin-top: 10px; color: #aaa;">โดย: {$usernameArr[$r->ID]} เมื่อ {$r->CreatedDate}</div>
				</div>
				
			</td>
		</tr>
		{/foreach}
		</table>
    </div>
</div>
</div>
{/block}

