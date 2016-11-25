<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－供应商管理</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<#--最新员工列表-->
				<table cellspacing="0" cellpadding="0" border="0" class="out_store_order_list">
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>登录名</th>
						<th>姓别</th>
						<th>角色</th>
						<th>状态</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					<#if employees?has_content>
						<#list employees as employee>
							<tr class="out_Store_order">
								<td>${employee.employeeId}</td>
								<td>${employee.realName}</td>
								<td>${employee.loginName}</td>
								<td>${employee.gender}</td>
								<td>${employee.roleName}</td>
								<td>${employee.employeeStatusName}</td>
								<td>${employee.remark}</td>
								<td>
									<#if employee.employeeStatus == 0>
										<a href="/fruit/back/employee/probation.do?employeeId=${employee.employeeId}">入职</a>
									<#elseif employee.employeeStatus == 1 || employee.employeeStatus == 2>
										<a href="/fruit/back/employee/official.do?employeeId=${employee.employeeId}">转正</a>
										<a href="/fruit/back/employee/dimission.do?employeeId=${employee.employeeId}">离职</a>
										<a href="/fruit/back/employee/fire.do?employeeId=${employee.employeeId}">解雇</a>
									<#elseif employee.employeeStatus == 3>
										<a href="/fruit/back/employee/dimission.do?employeeId=${employee.employeeId}">离职</a>
										<a href="/fruit/back/employee/fire.do?employeeId=${employee.employeeId}">解雇</a>
									</#if>
								</td>
							</tr>
						</#list>
					</#if>
				</table>
				
				<form action="/fruit/back/employee/register.do" method="post">
					<p>
					登&nbsp;录&nbsp;名：<input type="text" class="common_input" name="loginName"/>
					</p>
					
					<p>
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" class="common_input" name="password"/>
					</p>
					
					<p>
					确认密码：<input type="password" class="common_input" name="confirmPassword"/>
					</p>
					
					<p>
					姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="common_input" name="realName"/>
					</p>
					
					<p>
					部&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;门：
					<select name="dept" class="common_input">
						<option value="0">管理部</option>
						<option value="1">国产水果运营部</option>
						<option value="2">进口水果运营部</option>
						<option value="3">订单处理部</option>
						<option value="4">仓管部</option>
						<option value="5">采购部</option>
					</select>
					</p>
					
					<p>
					角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色：
					<select name="role" class="common_input">
						<option value="0">管理员</option>
						<option value="1">运营专员</option>
						<option value="2">接单员</option>
						<option value="3">仓管员</option>
						<option value="4">采购员</option>
					</select>
					</p>
					<input class="common_btn" type="submit" value="立即注册"/>
					</p>
				</form>
			</div>
		</div>
	</body>
</html>