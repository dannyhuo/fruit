<!DOCTYPE html>
<html>
	<head>
		<title>小水果－商品上架</title>
	</head>
	<body>
		<form action="/fruit/goodsManagement/doGoodsup.do" method="post" enctype="multipart/form-data">
			<table>
			<tr>
				<td>商品名称：</td>
				<td><input type="text" name="goodsName"/></td>
			<tr/>
			<tr>
				<td>商品产地：</td>
				<td><input type="text" name="producingArea"/></td>
			<tr/>
			<tr>
				<td>市场价格：</td>
				<td><input type="text" name="marketPriceYuan"/></td>
			<tr/>
			<tr>
				<td>销售价格：</td>
				<td><input type="text" name="sellPriceYuan"/></td>
			<tr/>
			<tr>
				<td>商品描述：</td>
				<td><input type="text" name="description"/></td>
			<tr/>
			<tr>
				<td>商品图片：</td>
				<td><input type="file" name="file"/></td>
			<tr/>
			<tr>
				<td>商品标签：</td>
				<td><input type="text" name="tag"/></td>
			<tr/>
			<tr>
				<td>商品属性：</td>
				<td>			
					<#if goodsType?has_content>
						<select name="goodsTypeId">
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
					<select name="goodsCategory">
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
					<select name="goodsStatus">
						<option value="0">预上架</option>
						<option value="1">已上架</option>
						<option value="2">已下架</option>
					</select>
				</td>
			<tr/>
			<tr>
				<td>商品备注：</td>
				<td><input type="text" name="remark"/></td>
			<tr/>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="提交"/>
				</td>
			</tr>
			</table>
		</form>
	</body>
</html>