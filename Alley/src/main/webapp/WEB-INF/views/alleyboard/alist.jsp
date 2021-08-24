<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../includes/header.jsp"%>

<div class="py-5 bg-warning">
	<div class="container">
		<h2 class="m-0 text-center">'백종원의 골목식당'<br>전체 목록</h2>
	</div>
</div>

<!-- Section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach var="alist" items="${alist }">
				<div class="col mb-5">
				<!-- 골목이름 -->
				<p class="a">
					<c:out value="${alist.subtitle }" />
				</p>
					<div class="card h-100">
						<!-- 음식 사진 -->
						<a href="/alleyboard/view?ano=${alist.ano }">
						<img class="card-img-top" src="${alist.mainimage }"
							style="height: 200px;" />
						</a>
						<!-- 식당 정보 -->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- 식당 이름 -->
								<h5 class="fw-bolder">
									<c:out value="${alist.storename }" />
								</h5>
								<!-- 식당 주소 -->
								<c:out value="${alist.address }" />
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev }">
			<li class="page-item"><a class="page-link"
				href="${pageMaker.startPage-1 }" aria-label="Previous"><span
					aria-hidden="true">&laquo;</span></a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }">
			<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
				<a class="page-link" href="${num }" class="page-link">${num }</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next }">
			<li class="page-item next"><a class="page-link"
				href="${pageMaker.endPage+1 }" aria-label="Next"> <span
					aria-hidden="ture">&raquo;</span></a></li>
		</c:if>
	</ul>
</nav>

<form id="actionForm" action="/alleyboard/alist" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>


<script>
	$(document).ready(function() {

		//페이징 이동시 넘기는 값
		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			//액션폼 input[name=pageNum] 값을 찾아서 href로 받은 값으로 대체

			actionForm.submit();
		});
		
		/* $(".move").on("click", function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='ano' "
					+"value='"+$(this).attr("href")+"'>");
			//액션 폼 요소에 ano 추가하여 클릭한 제목의 ano 전달
			actionForm.attr("action","/alleyboard/view");
			//기존 목록 이동 대신에 글읽기 페이지로 액션을 변경하고
			//(view으로 변경하여 view 의 script중 ano,page 부분 전달)
			actionForm.submit();
			//전송
		}); */ 
		

	});//end_document ready
	
	
</script>




<%@ include file="../includes/footer.jsp"%>