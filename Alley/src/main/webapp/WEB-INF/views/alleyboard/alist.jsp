<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<!doctype html>

<%@ include file="../includes/header.jsp"%>

<section>
	<div class="container px-4 px-lg-5 mt-5">
		<div>
			<p class="a">전체 식당</p>
		</div>
		
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="ab" items="${list }">
				<div class="col mb-5">
					<div class="card h-100">
						<div type="hidden" value="${ab.ano }" />
						<!-- 음식 사진 -->
						<img class="card-img-top
						" src="${ab.mainimage }"
							style="height: 200px;" />
					</div>
				</div>
			</c:forEach>
		</div>
		
	</div> 
	
	<%-- <ul>
	<c:forEach var="ab" items="${getAList }">
		<li class="top_list_item"><a href="#">
				
					<div class="thumb">
						<div class="inner">
							<img class="center-crop portrait lazy" src="${ab.mainimage }">
						</div>
					</div>
					<div type="hidden" value="${ab.ano }" />
					<!-- 식당 정보 -->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- 식당 이름 -->
							<h5 class="fw-bolder">
								<c:out value="${ab.storename }" />
							</h5>
							<!-- 식당 주소 -->
							<c:out value="${ab.address }" />
						</div>
					</div>
				
		</a></li>
	</c:forEach>
</ul> --%>
</section>




<%@ include file="../includes/footer.jsp"%>




<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	
</script>