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
				<td><a href="/commboard/get?bno=${cb.bno }">
					<c:out value="${cb.title }" /></a></td>
				<td><c:out value="${cb.writer }" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cb.regdate }" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${cb.updatedate }" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="card-header py-3" align="right">
	<button id="regBtn" style="color: green;">글 쓰기</button>
</div>



<!-- pagination -->
<nav aria-label="Page navigation example">
	<ul class="pagination">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
		</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
</nav>



<div class="modal" tabindex="-1" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				
			</div>
			
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>

			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
	$(document).ready(function() {
		$("#regBtn").on("click", function() {
			self.location ="/commboard/register";
			/* 아이디 regBtn 을 클릭한다면
			현재창의 url 를 쓰기로 변경 */
		});

		var result = '<c:out value="${result}"/>';//result2
		// 자바스크립트는 형추론 이용.
		console.log("result:"+result);
		checkModal(result);
		// 게시물 번호를 매개변수로 전달하면서 checkModal 펑션 호출.
		
		function checkModal(result){
			if(result === ''){
				// == 는 값만 비교, === 은 값과 형식도 비교.
				return;
			}
			if (parseInt(result) > 0){// 전달된 문자값을 숫자화, 자바의 Integer.parseInt 비슷함.
				$(".modal-body").html("게시글" + parseInt(result) + "번이 등록");
				// 표시할 내용 만들기	
			}else if (result==="success") {
				$(".modal-body").html(result);
			}
			$("#myModal").modal("show");// 모달창 표시.
		}
		
	});
</script>


<%@ include file="../includes/footer.jsp"%>