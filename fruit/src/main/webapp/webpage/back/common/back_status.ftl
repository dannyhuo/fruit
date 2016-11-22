<#--状态栏， height 35px-->
<div class="my_login_status">
	<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td width="30px"></td>
			<td width="90px" align="center"><span>小水果后台管理系统</span></td>
			<td width="50px"></td>
			<td width="50px"><span ></td>
			<td width="10%"></td>
			<td width="130px">
				<table cellspacing="0" cellpadding="0">
						<#if Session['employee']?has_content>
							<td>
								<span>${Session['employee'].loginName}</span>[${Session['employee'].roleName}]
							</td>
							<td width="30px"></td>
							<td><span><a href="/fruit/customerController/exit.do">安全退出</a></span></td>
						</#if>
				</table>
			</td>
			<td width="10%"></td>
			<td width="70px" align="right">
			</td>
			<td width="40px"></td>
			<td width="70px">
			</td>
			<td width="30px"></td>
		</tr>
	</table>
</div>
