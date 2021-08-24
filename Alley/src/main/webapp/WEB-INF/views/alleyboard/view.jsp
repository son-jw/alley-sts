<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../includes/header.jsp"%>


<!-- Page content-->
<div class="container mt-5">
	<div class="row">
		<div class="col-lg-8">
			<!-- Post content-->
			<article>
				<!-- 식당 이름 -->
				<header class="mb-4">
					<!-- Post title-->
					<h1 class="fw-bolder mb-1">
						<c:out value="${alist.storename }" />
					</h1>

					<!-- 골목 이름 -->
					<div class="text-muted fst-italic mb-2">
						<c:out value="${alist.subtitle }" />
					</div>

					<!-- #태그 -->
					<a class="badge bg-secondary text-decoration-none link-light">
						#백종원</a> <a class="badge bg-secondary text-decoration-none link-light">
						#골목식당</a>
				</header>

				<!-- 이미지 슬라이드 -->
				<div id="carouselExampleIndicators" class="carousel slide bg-dark"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${alist.outimage }" class="d-block w-50"
								style="height: 400px; margin-left: 215px;" alt="첫번째 슬라이드">
						</div>
						<div class="carousel-item">
							<img src="${alist.mainimage }" class="d-block w-50"
								style="height: 400px; margin-left: 215px;" alt="두번째 슬라이드">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				
				<br />
				<!-- 식당 정보 -->
				<section class="mb-5">
					<p class="fs-5 mb-4">주소 :<br></p>
					<p><c:out value="${alist.address }" /></p>
					<p class="fs-5 mb-4">전화번호 :<br></p>
					<p><c:out value="${alist.booknumber }" /></p>
					<p class="fs-5 mb-4">영업시간 :<br></p>
					<p><c:out value="${alist.storetime }" /></p>
					<p class="fs-5 mb-4">메뉴 :<br></p>
					<p><c:out value="${alist.menu }" /></p>
				</section>
			</article>
			
			<!-- 리뷰 댓글작성 -->
			<section class="mb-5">
				<div class="card bg-light">
					<div class="card-body">
					<div class="panel-heading">
					<h4>* 리뷰 *</h4>
						<!-- 리뷰 댓글작성 폼 -->
						<form class="mb-4">
							
							
							<textarea class="form-control" rows="3" name="reply" id="reply"
								placeholder="솔직한 후기를 남겨주세요..."></textarea>
												
						</form>
					</div>
					
					<sec:authorize access='isAuthenticated()'>
						<input type="hidden" value="${alist.ano}" name="ano" id="ano">
						<input type="hidden" value="${userid}" name="userid" id="userid">
						<input type="hidden" value="${replyDate }" name="replyDate" id="replyDate">
						<div class="" align="right">
							<div class="modal-footer">
							<!-- <button id="modalModBtn" type="button" class="btn btnwarning">수정</button>
							<button id="modalRemoveBtn" type="button" class="btn btndanger">삭제</button>
							<button id="modalCloseBtn" type="button" class="btn btndefault">닫기</button> -->
							<button id="addReplyBtn" type="button" class="btn btn-warning btn-sm">
							댓글등록</button>
						</div>
						</div>
					</sec:authorize>
					
						<!-- 리뷰 댓글목록 -->
                    	<div class="d-flex">
                        	<div class="ms-3">
                        		<div class="panel-body">
                            		<ul class="chat">
                                		<li>굿굿</li>
                                	</ul>
                                </div>
                                <div class="panel-footer"></div>
                            </div>
                    	</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/alley_reply.js"></script>
<script>
$(document).ready(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	var addReplyBtn = $("#addReplyBtn");
	var Reply = $("textarea[name='reply']");
	var Replyer = $("input[name='userid']");
	var anoValue = '<c:out value = "${alist.ano}" />';
	
	var replyer=null;
    <sec:authorize access="isAuthenticated()">
    	replyer='${pinfo.username}';
    </sec:authorize>
	
	var ReplyDate = $("input[name='replyDate']");
	
	addReplyBtn.on("click", function(e){	
			
		var reply = {
				
			reply : Reply.val(),
			replyer : Replyer.val(),
			ano : anoValue
			
		};
		
		Alley_ReplyService.add(reply, function(result){
			alert(result);
			showList(-1);
		});
		
	});
	
	var replyUL = $(".chat");
    // reply Unorderd List
    
    function showList(page){
  	  Alley_ReplyService
  	  			.getList(
  	  					{
  	  						ano : anoValue,
  	  						page : page || 1
  	  					},
  	  					function(list){
  	  						var str = "";
  	  						if(list == null
  	  								|| list.length == 0){
  	  							replyUL.html("");
  	  							return;
  	  						}
  	  						for(var i = 0, len = list.length || 0; i < len; i++){
	  	  						str += "<li class='left ";
	  							str+="clearfix' data-arno='";
	  							str+=list[i].arno+"'>";
	  							str += "<div><div class='header' ";
	  							str+="><strong class='";
	  							str+="primary-font'>";
	  							str += list[i].replyer+ "</strong>";
	  							str += "<small class='float-sm-right '>";
	  							str += Alley_ReplyService.displayTime(list[i].replydate)
								+ "</small></div>";
	  							str += "<p>"+ list[i].reply;
	  							str += "</p></div></li>";
  	  						}
  	  						replyUL.html(str);
  	  					});
  	  
  	  $(".chat").on("click" , "li", function(e) {
  		  var arno = $(this).data("arno");
  		  console.log(arno);
  		  
  		  Alley_ReplyService.get(arno,function(reply){
  			modalInputReply.val(reply.reply);
  			modalInputReplyer.val(reply.replyer);
  			modalInputReplyDate.val(Alley_ReplyService.displayTime(reply.replyDate)).attr("readonly","readonly");
      	 	// 댓글 목록의 값들을 모달창에 할당.
      	 	modal.data("arno", reply.arno);
      		 // 표시되는 모달창에 rno 라는 이름으로 data-rno 를 저장.
      	 	modal.find("button[id !='modalCloseBtn']").hide();
      	 	modalModBtn.show();
      	 	modalRemoveBtn.show();
      	 	// 버튼 보이기 설정.
      	 	$("#myModal").modal("show");
        });
  		  
  		
  	  });
  	  
    }
  	showList(1);
});
	
</script>
