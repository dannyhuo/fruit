<#--状态栏， height 35px-->
<div class="my_login_status">
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td width="30px"></td>
			<td width="90px" align="center"><span>欢迎光临小水果</span></td>
			<td width="50px"></td>
			<td width="50px"><span >配送至：</span><a href="">上海</a></td>
			<td width="10%"></td>
			<td width="100px">
				<table cellspacing="0" cellpadding="0">
					
						<#if Session['customer']?has_content>
							<td>
								<span>${Session['customer'].loginName}</span>
							</td>
							<td width="30px"></td>
							<td><span><a href="/fruit/customerController/exit.do">安全退出</a></span></td>
						<#else>
							<td>
								<span>【<a href="/fruit/customerController/tologin.do">登录</a>】</span>
							</td>
							<td width="30px"></td>
							<td><span>【<a href="/fruit/customerController/register.do">快速注册</a>】</span></td>						
						</#if>
					
				</table>
			</td>
			<td width="10%"></td>
			<td width="70px" align="right">
				<table cellspacing="0" cellpadding="0">
					<td><img src="/fruit/webpage/imgs/my_fruit_icon.png"/></td>
					<td width="10px"></td>
					<td><a href="">我的小水果</a></td>
					<td width="10px"></td>
					<td><!--img src="/fruit/webpage/imgs/"/--></td>
				</table>
			</td>
			<td width="40px"></td>
			<td width="70px">
				<table cellspacing="0" cellpadding="0">
					<td><img src="/fruit/webpage/imgs/phone_fruit_icon.png"/></td>
					<td width="10px"></td>
					<td><a href="">手机小水果</a></td>
					<td width="10px"></td>
					<td><!--img src="/fruit/webpage/imgs/"/--></td>
				</table>
			</td>
			<td width="30px"></td>
		</tr>
	</table>
</div>
