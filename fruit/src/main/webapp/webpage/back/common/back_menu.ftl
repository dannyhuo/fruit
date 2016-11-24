<div class="back_menu">
	<#if employeeMenus?has_content>
		<#list employeeMenus as menu>
			<p>
				<a href="${menu.menuUrl}" class="menu_item" onclick="changeStyle(this);">${menu.menuName}</a>
			</p>
		</#list>
	</#if>
</div>
		
		
