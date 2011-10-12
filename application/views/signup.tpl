{extends file="layout.tpl"}

{block name=resultContent}
<div id="resultContent" class="block">
<div class="box-header">
	<h1>{$pageTitle}</h1>
</div>
<div class="other-box-content">
	<form action="db_signup" method="post" enctype="multipart/form-data">

	Username: <input type="text" name="Username" id="" size=""> (required)
	<br/>
	Password:<input type="password" name="Password" id="" size="">(required)
	<br/>
	Password Confirmation:<input type="password" name="Password_confirmation" id="" size="">(required)
	<br/>
	First name:<input type="text" name="FName" id="" size="">(required)
	<br/>
	Last Name:<input type="text" name="LName" id="" size="">
	<br/>
	Email:<input type="text" name="Email" id="" size="">(required)
	<br/>
	CitizenID:<input type="text" name="CitizenID" id="" size="">
	<br/>
	<input name="Status" type="hidden" value="1" />
	<br/>
	Your avatar: <input name="avatar" type="file"/>
	<br/>
	<input type="submit" name="submit" value="Signup!" />
	</form>
	</div>
</div>
{/block}