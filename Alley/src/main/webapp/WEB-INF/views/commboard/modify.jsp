<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->


<%@ include file="../includes/header.jsp"%>

<!-- DataTables Example -->
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<div class="panel-heading">글 수정</div>
			<div class="panel-body">
				<form role="form" action="/commboard/modify" method="post">

					<input type="hidden" name="bno" value="${cb.bno }" />


					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'
							value='<c:out value="${cb.title }"/>'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'>
						<c:out value="${cb.content }" /> </textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${cb.writer }"/>' readonly="readonly">
					</div>

					<button type="submit" data-oper="modify" class="btn btn-success">수정</button>

					<button type="submit" data-oper="delete" class="btn btn-danger">삭제</button>

					<button type="submit" data-oper="list" class="btn btn-info">목록</button>
				</form>

			</div>
		</div>
	</div>


</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
	$(document).ready(function() {
		/*문서가 준비 됐다면, 아래 함수를 실행함*/
		var formObj = $("form");
		$('button').on("click" , function(e) {
			/* 버튼이 클릭된다면 아램함수들을 실행하도록, e라는 이베튼 개체를 전달*/
			e.preventDefault();/* 기본 이벤트(submit) 동작 막기.*/
			var operation = $(this).data("oper");
			/* 버튼에서 oper 속성 읽어서 변수에 할당.*/
			console.log(operation);
			/*브라우저 로그로 oper값을 추력*/
			
			if (operation==='remove') {
				formObj.attr("action" , "/commboard/remove");
				/*form에 액션 속성을 modify 에서 remove로 변경*/
			} else if (operation==='list') {
				self.location = "/commboard/list"
				return;
			}
			formObj.submit();
			/*위 조건이 아니라면 수정처리*/
		});
	});
</script>



<%@ include file="../includes/footer.jsp"%>