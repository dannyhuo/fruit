<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－新增仓库</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<form action="/fruit/back/storeController/addRepostory.do" method="post">
					<p>
					仓库名：<input type="text" name="repostoryName"/>
					</p>
					<p>
					仓库所属区域：
					<select class="common_input" name="repostoryArea">
						<option value="0">华东大区</option>
						<option value="1">华北大区</option>
						<option value="2">华中大区</option>
						<option value="3">华南大区</option>
						<option value="4">西南大区</option>
					</select>
					</p>
					<p>
					所在省：<input type="text" name="repostoryProvince"/>
					</p>
					<p>
					所在市：<input type="text" name="repostoryCity"/>
					</p>
					<p>
					所在区/县：<input type="text" name="repostoryCounty"/>
					</p>
					<p>
					详细地址：<input type="text" name="repostoryAddress"/>
					</p>
					<p>
					仓库面积：<input type="text" name="repostoryAcreage"/>
					</p>
					<p>
					仓管员：
					<select class="common_input" name="employeeId">
						<option value="">请指定仓管员</option>
						<#if repostoryAdmins?has_content>
							<#list repostoryAdmins as admin>
								<option value="${admin.employeeId}">${admin.realName}[${admin.employeeId}]</option>
							</#list>
						</#if>
					</select>
					</p>
					<p>
					备注：<textarea rows="5" cols="30" name="remark"></textarea>
					</p>
					<p>
					<input class="common_btn" type="submit" value="新增仓库"/>
					</p>
				</form>
			</div>
		</div>
	</body>
</html>