<#if listGoodses?has_content>
	<ul class="fav-content js-fav-hover clearfix">
		<#list listGoodses as goods>
			<li>
				<input value="${goods.goodsId}" type="hidden">
                <a href="/fruit/goodsDetail.do?goodsId=${goods.goodsId}" target="_blank" class="fav-content-img">
                    <i class="fav-content-icon fav-line">${goods.goodsCategoryName}</i>
                    <i class="conmon_icon icon-checkbox"></i>
                    <span class="fav-dele commonFilter">
                        <i class="conmon_icon"></i>
                    </span>
                    <img src="/fruit/webpage/goods_imgs/${goods.goodsImageUrl}" width="242" height="152">
                </a>
                <div class="fav-cotent-box">
                    <p class="fav-cotent-txt">
                    	<a href="/fruit/goodsDetail.do?goodsId=${goods.goodsId}" target="_blank" title="">${goods.goodsName}</a>
                    </p>
                        <p class="fav-tag-box">
                        	<i class="fav-icon-bg tag" tip-content=" ">又11特价</i>
                        	<i class="fav-icon-bg tag" tip-content=" ">免邮费</i>
                        </p>
					<p class="fav-cotent-date ellipsis"></p>
                    <div class="fav-price-box">
                        <p class="fav-price"><em>¥</em>${goods.sellPriceYuan}<span>起</span></p>
                    </div>
                </div>
			</li>
		</#list>
	</ul>
</#if>