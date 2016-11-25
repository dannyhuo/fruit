<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>小水果后台信息管理系统－商品上架</title>
		<#include "/webpage/back/common/back_meta.ftl"/>
	</head>
	<body>
		<#include "/webpage/back/common/back_header.ftl"/>
		
		<div class="my_back">
			<#include "/webpage/back/common/back_menu.ftl"/>
			
			<div class="my_back_content">
				<form action="/fruit/back/goodsManagement/doGoodsup.do" method="post" enctype="multipart/form-data">
					<table>
					<tr>
						<td>商品名称：</td>
						<td><input type="text" name="goodsName" class="common_input"/></td>
					<tr/>
					<tr>
						<td>商品产地：</td>
						<td><input type="text" name="producingArea" class="common_input"/></td>
					<tr/>
					<tr>
						<td>市场价格：</td>
						<td><input type="text" name="marketPriceYuan" class="common_input"/></td>
					<tr/>
					<tr>
						<td>销售价格：</td>
						<td><input type="text" name="sellPriceYuan" class="common_input"/></td>
					<tr/>
					<tr>
						<td>商品描述：</td>
						<td><input type="text" name="description" class="common_input"/></td>
					<tr/>
					<tr>
						<td>商品图片：</td>
						<td><input type="file" name="file" class="common_input"/></td>
					<tr/>
					<tr>
						<td>商品标签：</td>
						<td><input type="text" name="tag" class="common_input"/></td>
					<tr/>
					<tr>
						<td>商品属性：</td>
						<td>			
							<#if goodsType?has_content>
								<select name="goodsTypeId" class="common_input">
									<#list goodsType as gType>
										<option value="${gType.goodsTypeId}">${gType.goodsTypeName}</option>
									</#list>
								</select>
							</#if>
						</td>
					<tr/>
					<tr>
						<td>商品品类：</td>
						<td>
							<select name="goodsCategory" class="common_input">
								<option value="1">进口类</option>
								<option value="2">国产类</option>
								<option value="3">浆果类</option>
								<option value="4">瓜果类</option>
								<option value="5">橘果类</option>
								<option value="6">核果类</option>
								<option value="7">仁果类</option>
								<option value="8">其它类</option>
							</select>
						</td>
					<tr/>
					<tr>
						<td>商品状态：</td>
						<td>
							<select name="goodsStatus" class="common_input">
								<option value="0">预上架</option>
								<option value="1">已上架</option>
								<option value="2">已下架</option>
							</select>
						</td>
					<tr/>
					<tr>
						<td>商品备注：</td>
						<td><textarea rows="5" cols="27" name="remark"></textarea></td>
					<tr/>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" class="common_btn" value="上架商品"/>
						</td>
					</tr>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>
