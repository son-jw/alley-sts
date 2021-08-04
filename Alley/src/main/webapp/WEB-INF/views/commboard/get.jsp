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
			<div class="panel-heading">글 읽기</div>
			<div class="panel-body">
				
					<div class="form-group">
						게시물 번호<input class="form-control" name="bno"
							value='<c:out value="${cb.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>글 제목</label> <input class="form-control" name='title'
							value='<c:out value="${cb.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out
								value="${cb.content }"/> </textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${cb.writer }"/>'
							readonly="readonly">
					</div>

					<button data-oper="modify" class="btn btn-warning">수정</button>
					
					<button data-oper="list" class="btn btn-info">목록</button>
					
				<form id='operForm' action="/commboard/modify" method="get">
					<input type='hidden' id='bno' name='bno' value="${cb.bno }" />
					<input type='hidden' name="pageNum" value="${cri.pageNum }" />
					<input type='hidden' name="amount" value="${cri.amount }" />
					
					<input type="hidden" name="type" value="${cri.type }" />
					<input type="hidden" name="keyword" value="${cri.keyword }" />
					
				</form>
				
			</div>
		</div>
	</div>


</div>


<%@ include file="../includes/footer.jsp"%>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
	$(document).ready(function(){
		 var operForm = $("#operForm");/* 문서중 form 요소를 찾앙서 변수에 할당. */
	      $('button[data-oper="modify"]').on("click",function(e){
	         /* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를 전달하면서 */
	         operForm.attr("action", "/commboard/modify").submit();
	      });
	      
	      $('button[data-oper="list"]').on("click",function(e){
	         /* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를 전달하면서 */
	         operForm.find("#bno").remove();
	         operForm.attr("action", "/commboard/list").submit();
	      });
	   });
</script>

