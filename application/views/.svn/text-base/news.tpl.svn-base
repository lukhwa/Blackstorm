{extends file="layout.tpl"}
{block name=cssjavascript}
<link href="{$url}css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="{$url}css/demo_table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{$url}js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf-8">
	 $(function() {
		 var oTable = $('#news-table').dataTable({
			 "bJQueryUI": true,
			 "sPaginationType": "full_numbers"
		 });
		 
		 $('a', '.button-bar').button();
	});
</script>
{/block}

{block name=resultContent}		
			<div id="resultContent" class="block" style="float:left">
				<div class="box-header">
					<h1>ข่าวสารถึงเพื่อนๆ</h1>
				</div>
				<div class="other-box-content">
					<table id="news-table" name="news-table" class="display">
						<thead><tr><th>วันที่</th><th>รายละเอียด</th><th>จัดการข่าวสาร</th></tr></thead>
						<tbody>
						{foreach $results as $result}
						<tr>
						<td>
						{if $result->Promoted eq 1}
						<img src="{$url}images/star.png" />
						{/if}
						{$result->ModifiedDate}
						</td>
						<td>
						{$result->News}
						</td>
						
						<td><a href="{$url}news/edit/{$result->ID}">Edit</a>&nbsp;<a href="{$url}news/delete/{$result->ID}" onclick="return confirm('Are you sure you wish to delete this entry?')">Delete</a>
						&nbsp;<a href="news/promote/{$result->ID}">โปรโมท</a></td>
						</tr>
						{/foreach}</tbody>
					</table>
					<div align="right" class="button-bar"><a href="{$url}news/create">เพิ่มข่าว</a></div>
				</div>
			</div>
{/block}