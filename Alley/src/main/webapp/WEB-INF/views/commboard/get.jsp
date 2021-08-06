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
						readonly="readonly"><c:out value="${cb.content }" /> </textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer"
						value='<c:out value="${cb.writer }"/>' readonly="readonly">
				</div>

				<button data-oper="modify" class="btn btn-warning">수정</button>

				<button data-oper="list" class="btn btn-info">목록</button>

				<form id='operForm' action="/commboard/modify" method="get">
					<input type='hidden' id='bno' name='bno' value="${cb.bno }" /> <input
						type='hidden' name="pageNum" value="${cri.pageNum }" /> <input
						type='hidden' name="amount" value="${cri.amount }" /> <input
						type="hidden" name="type" value="${cri.type }" /> <input
						type="hidden" name="keyword" value="${cri.keyword }" />

				</form>

			</div>
		</div>
	</div>


</div>

<!-- 댓글 목록 -->
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply
				<button id="addReplyBtn" class="btn btn-primary bts-xs float-right">
					새로운 댓글 작성하기</button>
			</div>
			<br />
			<div class="panel-body">
				<ul class="chat">
					<li>좋아영</li>

				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>





<!-- 댓글 입력 모달창  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">댓글 창</h4>
			</div>

			<div class="modal-body">

				<div class="form-group">
					<label>댓글</label> <input class="form-control" name="reply"
						value="새 댓글">
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="replyer"
						value="replyer">
				</div>

				<div class="form-group">
					<label>댓글 작성일</label> <input class="form-control" name="replydate"
						value="">
				</div>

			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btnwarning">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btndanger">삭제</button>
				<button id="modalRegisterBtn" type="button" class="btn btnprimary">등록</button>
				<button id="modalCloseBtn" type="button" class="btn btndefault">닫기</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
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
	      
	      var bnoValue = '<c:out value = "${cb.bno}" />';	      
	     
	      var modal = $("#myModal");
	      //댓글용 모달
	      var modalInputReplyDate = modal.find("input[name='replydate']");
	      //댓글 작성일 항목.
	      var modalRegisterBtn = $("#modalRegisterBtn");
	      var modalModBtn = $('#modalModBtn');
	      var modalRemoveBtn = $('#modalRemoveBtn');
	      var modalInputReply = modal.find("input[name='reply']");
	      var modalInputReplyer = modal.find("input[name='replyer']");
	      
	      $("#addReplyBtn").on("click",function(e) {
	    	  //댓글쓰기 버튼 클릭시
	    	  modal.find("input").val("");
	    	  //모달창의 모든 입력창 초기화
	    	  modalInputReplyDate.closest("div").hide();
	    	  //closest : 선택요소와 가장 가까운 요소를 지정
	    	  modal.find("button[id != 'modalCloseBtn']").hide();
	    	  //닫기버튼 제외하고 숨김
	    	  modalRegisterBtn.show();
	    	  $("#myModal").modal("show");
	      });
	      
	      $("#modalCloseBtn").on("click",function(e) {
	    	  modal.modal("hide");
	      });
	      
	      modalRegisterBtn.on("click",function(e) {
	    	  //덧글 등록버튼을 눌렀을때
	    	  var reply = {
	    			  reply : modalInputReply.val(),
	    			  replyer : modalInputReplyer.val(),
	    			  bno : bnoValue
	    	  }; //ajax로 전달한 reply 객체 선언 과 할당
	    	  Comm_ReplyService.add(reply, function(result) {
	    		  alert(result);
	    		  modal.find("input").val("");//초기화
	    		  modal.modal("hide");//숨기기
	    		  showList(-1);
	    	  });
	      });
	      
	      modalModBtn.on("click",function(e) {
	    	  var reply = {
	    			  rno : modal.data("rno"),
	    			  reply : modalInputReply.val()
	    	  };
	    	  Comm_ReplyService.update(reply, function(result) {
	    		  alert(result);
	    		  modal.modal("hide");
	    		  showList(-1);
	    	  });	    	  
	      });
	      
	      modalRemoveBtn.on("click", function(e) {
	    	  var rno = modal.data("rno");
	    	  Comm_ReplyService.remove(rno, function(result) {
	    		  alert(result);
	    		  modal.modal("hide");
	    		  showList(-1);
	    	  });	    	  
	      });
	      
	      var replyUL = $(".chat");
	      
	      function showList(page) {
	    	  Comm_ReplyService.getList({
	    		  bno : bnoValue,
	    		  page: page || 1
	    	  },
		 	function(list) {
	    		var str = "";
	    		if (list == null || list.length ==0) {
	    		  replyUL.html("");
	    		  return;
	    		}
	    		for (var i=0, len = list.length || 0; i< len; i++) {
	    			str += "<li class='left ";
	    			str +="clearfix' data-rno='";
	    			str +=list[i].rno+"'>";
	    			str += "<div><div class='header' ";
	    			str +="><strong class='";
	    			str +="primary-font'>";
	    			str += list[i].replyer+ "</strong>";
	    			str += "<small class='float-sm-right '>";
	    			str += Comm_ReplyService.displayTime(list[i].replydate) + "</small></div>";
	    			str += "<p>" + list[i].reply;
	    			str += "</p></div></li>";
	    		}
				replyUL.html(str);
			});
		}
	    $(".chat").on("click","li",function(e) {
	    	//클래스 caht을 클릭하는데 , 하위요소가 li라면은
	    	var rno = $(this).data("rno");
	    	//댓글에 포함된 값등 중에서 rno 를 추출하여 변수를 할당.
	    	console.log(rno);
	    	
	    	Comm_ReplyService.get(rno,function(reply) {
	    		modalInputReply.val(reply.reply)
	    		modalInputReplyer.val(reply.replyer)
	    		modalInputReplyDate.val(Comm_ReplyService.displayTime(reply.replydate))
	    			.attr("readonly","readonly");
	    		//댓글 목록의 값들을 모달창에 할당해줌
	    		modal.data("rno",reply.rno);
	    		modal.find("button[id != 'modalCloseBtn']").hide();
	    		modalModBtn.show();
	    		modalRemoveBtn.show();
	    		//버튼 보여주기
	    		$("#myModal").modal("show");	    		
	    	});
	    });
	      
	      
	showList(1);
});// end document ready
</script>

<%@ include file="../includes/footer.jsp"%>


