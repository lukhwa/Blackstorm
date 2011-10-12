<h1>Home</h1>

<h2>Search</h2>
<!--form action to {product/search} for search-->

<form action="product/search" method="post">
Search:  <input type="text" name="searchterms" />
<input type="submit" value="Search" />
</form>

<h2>Recent Product</h2>
{foreach $recentProducts as $result}
<div style="border: 1px solid black; margin: 10px; width: 200px;">
<p>Name: {$result->Name}</p>
<p>Description: {$result->Description}</p>
<p>Image: {$result->Image}</p>
<p>Condition: {$result->Condition}</p>
<p>Type: {$result->Type}</p>
<p>Estimated Price: {$result->EstimatedPrice}</p>
<p>Remark: {$result->Remark}</p>
<p>Status: {$result->Status}</p>
</div>
{/foreach}

<h2>Popular Product</h2>
{foreach $hotProducts as $result}
<div style="border: 1px solid black; margin: 10px; width: 200px;">
<p>Name: {$result->Name}</p>
<p>Description: {$result->Description}</p>
<p>Image: {$result->Image}</p>
<p>Condition: {$result->Condition}</p>
<p>Type: {$result->Type}</p>
<p>Estimated Price: {$result->EstimatedPrice}</p>
<p>Remark: {$result->Remark}</p>
<p>Status: {$result->Status}</p>
</div>
{/foreach}

<h2>Recommended Product</h2>
{foreach $featuredProducts as $result}
<div style="border: 1px solid black; margin: 10px; width: 200px;">
<p>Name: {$result->Name}</p>
<p>Description: {$result->Description}</p>
<p>Image: {$result->Image}</p>
<p>Condition: {$result->Condition}</p>
<p>Type: {$result->Type}</p>
<p>Estimated Price: {$result->EstimatedPrice}</p>
<p>Remark: {$result->Remark}</p>
<p>Status: {$result->Status}</p>
</div>
{/foreach}