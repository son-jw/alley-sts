<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<!doctype html>

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
					<label>제목</label><input class="form-control" name="title" 
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

				<sec:authentication property="principal" var="pinfo" />
				<!-- 프린서펄 정보를 pinfo 라는 이름으로 jsp 에서 이용. -->
				<sec:authorize access="isAuthenticated()">
					<!-- 인증된 사용자만 허가 -->
					<c:if test="${pinfo.username eq cb.writer }">
						<!-- 인증되었으면서 작성자가 본인 일때 수정 버튼 표시 -->
						<button data-oper="modify" class="btn btn-warning">수정</button>
					</c:if>
				</sec:authorize>


				<button data-oper="list" class="btn btn-info">목록</button>

				<form id='operForm' action="/commboard/modify" method="get">
					<input type='hidden' id='bno' name='bno' value="${cb.bno }" /> <input
						type="hidden" name="pageNum" value="${cri.pageNum }" /> <input
						type="hidden" name="amount" value="${cri.amount }" /> <input
						type="hidden" name="type" value="${cri.type }" /> <input
						type="hidden" name="keyword" value="${cri.keyword }" />
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 첨부파일 시작 -->
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부파일</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 첨부파일 끝 -->


<!-- 댓글 목록 시작 -->
<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>댓글 목록
				<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn btn-primary btn-xs float-right">
						댓글 쓰기</button>
				</sec:authorize>
			</div>
			<br />
			<div class="panel-body">
				<ul class="chat">
					<li>굿굿</li>

				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>
<!-- 댓글 목록 끝 -->


<!-- 댓글 입력 모달 시작  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
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
						value="replydate">
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
<!-- 댓글 입력 모달 끝 -->

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
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
	      
	      var replyer=null;
	      <sec:authorize access="isAuthenticated()">
	      	replyer='${pinfo.username}';
	      </sec:authorize>
	      
	      var modal = $("#myModal");
	      //댓글용 모달
	      var modalInputReplyDate = modal.find("input[name='replydate']");
	      //댓글 작성일 항목.
	      var modalRegisterBtn = $("#modalRegisterBtn");
	      var modalInputReply = modal.find("input[name='reply']");
	      var modalInputReplyer = modal.find("input[name='replyer']");
	      var modalModBtn = $("#modalModBtn");
	      var modalRemoveBtn = $("#modalRemoveBtn");
	      
	      
	      $("#addReplyBtn").on("click",function(e) {
	    	  //댓글쓰기 버튼 클릭시
	    	  modal.find("input").val("");
	    	  
	    	  modal.find("input[name='replyer']").val(replyer);
	          modal.find("input[name='replyer']").attr("readonly","readonly");
	    	  
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
	    			  bno : bnoValue}; //ajax로 전달한 reply 객체 선언 과 할당
	    	  Comm_ReplyService.add(reply, function(result) {
	    		  alert(result);
	    		  modal.find("input").val("");//초기화
	    		  modal.modal("hide");//숨기기
	    		  showList(-1);
	    	  });
	      });
	      
	      modalModBtn.on("click",function(e){
	    	  var ogReplyer = modalInputReplyer.val();
	    	  
	    	  var reply = {
	    			  rno : modal.data("rno"),
	    			  reply : modalInputReply.val(),
	    			  replyer : ogReplyer
	    	  };
	    	  
	    	  if(!replyer) {
	    		  alert("로그인 후 수정해 주세요.");
	    		  modal.modal("hide");
	    		  return;
	    	  }
	    	  
	    	  if(replyer != ogReplyer) {
	    		  alert("자신이 쓴 댓글만 수정 가능합니다.");
	    		  modal.modal("hide");
	    		  return;
	    	  }
	    	  
	    	  Comm_ReplyService.update(reply, function(result){
	    		  alert(result);
	    		  modal.modal("hide");
	    		  showList(-1);
	    	  });
	      });
	      
	      modalRemoveBtn.on("click",function(e){
	    	  var ogReplyer = modalInputReplyer.val();
	    	  
	    	  var rno = modal.data("rno");
	    	  
	    	  if(!replyer) {
	    		  alert("로그인 후 삭제해 주세요.");
	    		  modal.modal("hide");
	    		  return;
	    	  }
	    	  
	    	  if(replyer != ogReplyer) {
	    		  alert("자신이 쓴 댓글만 삭제 가능합니다.");
	    		  modal.modal("hide");
	    		  return;
	    	  }
	    	  Comm_ReplyService.remove(rno, ogReplyer, function(result){
	    		  alert(result);
	    		  modal.modal("hide");
	    		  showList(-1);
	    	  });
	      });
	      
	      $(".chat").on("click","li", function(e){
	    	  var rno = $(this).data("rno");
	    	  console.log(rno);
	    	  Comm_ReplyService.get(rno, function(reply){
	    		  modalInputReply.val(reply.reply);
	    		  modalInputReplyer.val(reply.replyer)
	    		  .attr("readonly","readonly");
	    		  modalInputReplyDate.val(Comm_ReplyService.displayTime(reply.replydate))
	    		  			.attr("readonly","readonly");
	    		  modal.data("rno",reply.rno);
	    		  modal.find("button[id !='modalCloseBtn']").hide();
	    		  modalModBtn.show();
	    		  modalRemoveBtn.show();
	    		  
	    		  $("#myModal").modal("show");
	    	 });
	      });
	
	      var replyUL = $(".chat");
	      
	      function showList(page) {
	    	  Comm_ReplyService.getList({
	    		  bno : bnoValue,
	    		  page: page || 1
	    	  },
		 	function(replyCnt,list) {
	    		  console.log("replyCnt : " + replyCnt);
	    		  if(page == -1){
	    			  pageNum = Math.ceil(replyCnt/10.0);
	    			  console.log("page: " + pageNum);
	    			  showList(pageNum);
	    			  
	    			  return;
	    		  }
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
				showReplyPage(replyCnt);
			});
		}
	showList(1);
	
	/* 댓글 페이징 시작 */
		var pageNum = 1;
		var replyPageFooter = $(".panel-footer");
		
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= replyCnt){
				endNum = Math.ceil(replyCnt / 10.0);
			}
			if(endNum * 10 < replyCnt){
				next = true;
			}
			var str = "<ul class='pagination";
			str += " justify-content-center'>";
			if(prev){
				str += "<li class='page-item'><a ";
				str += "class='page-link' href='";
				str += (startNum - 1);
				str += "'>이전</a></li>";
			}
			for(var i = startNum; i <= endNum; i++){
				var active = pageNum == i? "active" : "";
				str += "<li class='page-item" + active
				+"'><a class='page-link' ";
				str += "href='"+i+"'>"
				+ i + "</a></li>";
			}
			if(next){
				str += "<li class='page-item'>";
				str += "<a class='page-link' href='";
				str += (endNum + 1) + "'>다음</a></li>";
			}
			str += "</ul>";
			console.log(str);
			replyPageFooter.html(str);
		}
		
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		//첨부파일 목록 표시. 즉시 실행 함수로 사용함
		
		// 첨부파일 목록 표시. 즉시 실행 함수.
		(function(){
			var bno='<c:out value="${cb.bno}"/>';
			// 화면상에 공유된 bno 값 가져와 사용 준비.
			$.getJSON("/commboard/getAttachList",{bno:bno}, function(arr){
						console.log(arr);										
						var str="";
						
						$(arr).each(function(i,attach){
							str+="<li data-path='";
							str+=attach.uploadPath+"' data-uuid='";
							str+=attach.uuid+"' data-filename='";
							str+=attach.fileName+"' data-type='";
							str+=attach.fileType+"'><div>";
							str+="<img src='/resources/img/attach.png' width='20'>";
							str+="<span>&nbsp;"+attach.fileName+"</span><br/> ";											
							str+="</div></li>";
						});
						$(".uploadResult ul").html(str);
					});
		})();
		//첨부파일 클릭시 다운로드 처리 스크립트.
		$(".uploadResult").on("click","li",function(e) {
			console.log("download file");
			var liobj = $(this);
			var path = encodeURIComponent(liobj.data("path")
					+"/"+liobj.data("uuid")+"_"
					+liobj.data("filename"));
			// C:\uplo
			self.location="/download?fileName="+path;
			
		});
}); // end document ready
</script>
