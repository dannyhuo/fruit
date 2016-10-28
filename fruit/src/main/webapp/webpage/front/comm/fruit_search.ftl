<#--logo及搜索， height 85px-->
<div class="logo_and_search">
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td width="200px" align="center" valign="middle">
				<a href="/fruit/index.do">
					<img src="/fruit/webpage/imgs/fruit_logo.png"/>
				</a>
			</td>
			<td width="60px"></td>
			<td>
				<form id="search_form" action="/fruit/goodsSearch.do" method="post">
					<table cellspacing="0" cellpadding="0">
						<tr>
							<td><input type="text" name="keyWords" value="${keyWords}" class="search_input"/></td>
							<td class="search_btn" onclick="document.getElementById('search_form').submit();">搜索</td>
						</tr>
					</table>
				</form>
			</td>
			<td width="200px" valign="middle">
				<table class="my_shopping_cart_table" cellspacing="0" cellpadding="0">
					<tr>
						<td class="my_shopping_cart_icon">3</td>
						<td class="my_shopping_cart_money">336.89</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
