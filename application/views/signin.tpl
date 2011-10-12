{extends file="layout.tpl"}

{block name="resultContent"}
<div id="resultContent" class="block">
<div class="box-header">
	<h1>{$pageTitle}</h1>
</div>
<div class="other-box-content">

	<form action="db_signin" method="post" id="signin">
		<center>
		<fieldset>
			<label>ชื่อสมาขิก (Username):</label> <input type="text" name="Username">
		</fieldset>
		<fieldset>
			<label>รหัสสมาชิก (Password):</label> <input type="password" name="Password">
		</fieldset>
		<fieldset>	
			<input type="submit" name="submit" value="Sign In!" />
		</fieldset>
		</center>
	</form>
</div>
</div>
{/block}
