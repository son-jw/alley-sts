<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<!doctype html>
<%@ include file="../includes/header.jsp"%>

<!-- table -->
<table class="table">
	<thead>
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">작성일</th>
			<th scope="col">수정일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="cb" items="${list }">

			<tr>
				<td><c:out value="${cb.bno }" /></td>
				
				<td><a href="${cb.bno }" class="move">
				 	<c:out value="${cb.title }" />
				 	<!-- ne : != 같지 않다 -->
				 	<c:if test="${cb.replyCnt ne 0 }">
				 		<span style="color:red;">[
				 		<c:out value="${cb.replyCnt }"/>]</span>
				 	</c:if></a></td>
				
				<td><c:out value="${cb.writer }" /></td>
				
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${cb.regdate }" /></td>
				
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cb.updatedate }" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- 검색 상자 시작 -->
	<div>
		<div class="col-lg-12">
			<form id="searchForm" action="/commboard/list" method="get">			
				&nbsp;&nbsp;&nbsp; 
				<select name="type">
					<option value="" ${pageMaker.cri.type==null?"selected":"" }>
					--</option>	
					<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
					제목</option>
					<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
					내용</option>
					<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>
					작성자</option>
					<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>
					제목+내용</option>
					<option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>
					제목+작성자</option>
					<option value="WC" ${pageMaker.cri.type eq "WC"?"selected":"" }>
					내용+작성자</option>
					<option value="TWC" ${pageMaker.cri.type eq "TWC"?"selected":"" }>
					제목+내용+작성자</option>
				</select>
				<input type="text" name="keyword" value="${pageMaker.cri.keyword }" />
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
				
				<button class="btn btn-warning">검색</button>
			</form>
		</div>
	</div>
<!-- 검색 상자 끝 -->
		
<div class="card-header py-3" align="right">

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1 }"
					aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
					<a class="page-link" href="${num }" class="page-link">${num }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item next"><a class="page-link" href="${pageMaker.endPage+1 }"
					aria-label="Next"> <span aria-hidden="ture">&raquo;</span></a>
				</li>
			</c:if>
		</ul>
	</nav>
	
	<form id="actionForm" action="/commboard/list" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
	</form>
	<button id="regBtn" style="color: green;">글 쓰기</button>
</div>

<div class="modal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">알립니다!</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>

<script>
	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			self.location = "/commboard/register";
			/* 아이디 regBtn 을 클릭한다면
			현재창의 url 를 쓰기로 변경 */
		});
		var result = '<c:out value="${result}"/>';//result2
		// 자바스크립트는 형추론 이용.
		console.log("result:" + result);
		checkModal(result);
		// 게시물 번호를 매개변수로 전달하면서 checkModal 펑션 호출.
		function checkModal(result) {
			if (result === '') {
				// == 는 값만 비교, === 은 값과 형식도 비교.
				return;
			}
			if (parseInt(result) > 0) {// 전달된 문자값을 숫자화, 자바의 Integer.parseInt 비슷함.
				$(".modal-body").html("게시글" + parseInt(result) + "번이 등록");
				// 표시할 내용 만들기	
			} else if (result === "success") {
				$(".modal-body").html(result);
			}
			$("#myModal").modal("show");// 모달창 표시.
		}
		var actionForm = $("#actionForm");
			// class page-item에 a 링크가 클릭될떄
			$(".page-item a").on("click", function(e) {
				e.preventDefault();
				
				console.log("click");
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
		$(".move").on("click", function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='bno' "
					+"value='"+$(this).attr("href")+"'>");
			//액션 폼 요소에 bno 추가하여 클릭한 제목의 bno 전달
			actionForm.attr("action","/commboard/get");
			//기존 목록 이동 대신에 글읽기 페이지로 액션을 변경하고
			//(get으로 변경하여 get 의 script중 bno,page 부분 전달)
			actionForm.submit();
			//전송
		});
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
		
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
			
					
				alert("키워드를 입력하세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val(1);
			
			e.preventDefault();
			searchForm.submit();
		});
		
	});
</script>