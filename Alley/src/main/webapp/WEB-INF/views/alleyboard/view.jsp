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
							<button id="addReplyBtn" type="button" class="btn btn-warning btn-sm">
							댓글등록</button>
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

<!-- 댓글 수정/삭제 모달 시작 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<input type="hidden" value="${arno}" name="arno" id="arno">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">리뷰 수정</h4></div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글</label>
					<input class="form-control" name="reply" value="reply">
				</div>
				<div class="form-group">
					<label>댓글 작성일</label>
					<input class="form-control" name="replyDate" value="replyDate">
				</div>
			</div>
			
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-primary">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-primary">삭제</button>
				<button id="modalCloseBtn" type="button" class="btn btn-primary">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 댓글 수정/삭제 모달 끝 -->


<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/alley_reply.js"></script>
<script>
$(document).ready(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	
	// 댓글등록
	var addReplyBtn = $("#addReplyBtn");
	var Reply = $("textarea[name='reply']");
	var Replyer = $("input[name='userid']");
	var anoValue = '<c:out value = "${alist.ano}" />';
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
	
	// 댓글목록 띄우기
	var replyUL = $(".chat");
    function showList(page){
  	  Alley_ReplyService
  	  			.getList({
  	  				ano : anoValue,
  	  				page : page || 1
  	  			},
  	  		function(replyCnt, list){
  	  			console.log("replyCnt : " + replyCnt);
  	  				if(page == -1){
  	  					pageNum = Math.ceil(replyCnt/10.0);
  	  					console.log("page: " + pageNum);
  	  					showList(pageNum);
  	  					
  	  					return;
  	  				}
  	  				var str = "";
  	  				if(list == null || list.length == 0){
  	  					replyUL.html("");
  	  					
  	  					return;
  	  				}
	  	  			for(var i = 0, len = list.length || 0; i < len; i++){
		  	  			str += "<li class='left ";
		  				str += "clearfix' data-arno='";
		  				str += list[i].arno+"'>";
		  				str += "<div><div class='header' ";
		  				str += "><strong class='reviewid' ";
		  				str += "primary-font'>";
		  				str += list[i].replyer+ "</strong>";
		  				str += "<small class='float-sm-right '>";
		  				str += Alley_ReplyService.displayTime(list[i].replyDate) + "</small></div>";
		  				str += "<p>"+ list[i].reply + "</p><br>";
		  				str += "<button class='btn btn-outline-danger btn-sm' type='button' id='modifyBtn' data-arno='" + list[i].arno + "' data-id='" + list[i].replyer + "'>수정/삭제</button>";
		  				str += "</div></li>";
	  	  			}
	  	  			
	  	  			replyUL.html(str);
	  	  			showReplyPage(replyCnt);
	  	  	});
    }
  	showList(1);
  	
  	// 리뷰 댓글 페이징
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
  	
  	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;
		showList(pageNum);
	});
  	
  	// 수정/삭제 모달창 띄우기
  	var modal = $("#myModal");
  	var modalInputReply = modal.find("input[name='reply']");
  	var modalInputReplyDate = modal.find("input[name='replyDate']");
  	var modalModBtn = $("#modalModBtn");
  	var modalRemoveBtn = $("#modalRemoveBtn");
  	var modalCloseBtn = $("#modalCloseBtn");
  	
  	
  	$(".chat").on("click","button", function(e) {
  		
  		var arno = $(this).data("arno");
  		var reviewid = $(this).data("id");
		var userid = $("#userid").val();
  		
		console.log(arno);
		
		if(!userid){
			alert("로그인 후 수정 가능합니다.");
			return;
		}
		
		if(reviewid != userid){
			alert("자신이 쓴 댓글만 수정 가능합니다.");
			return;
		}
		
		Alley_ReplyService.get(arno,function(reply){
			  	
	  		modalInputReply.val(reply.reply);
	  		modalInputReplyDate.val(Alley_ReplyService.displayTime(reply.replyDate))
	  			.attr("readonly","readonly");
	  			
	  		modal.data("arno",reply.arno);
	  		modalCloseBtn.show();
	  		modalModBtn.show();// 등록 버튼은 보여라.
	  		modalRemoveBtn.show();
	  		$("#myModal").modal("show");// 모달 표시.
		});		
	});
  	
  	$("#modalCloseBtn").on("click",function(e) {
  	  modal.modal("hide");
    });
  	
  	// 리뷰 댓글수정
  	modalModBtn.on("click",function(e){
  		
  		var reply = {
  				
  				arno : modal.data("arno"),
  				reply : modalInputReply.val(),
  				
  		};
  		
  		Alley_ReplyService.update(reply, function(result){
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);	
  		});
  	});
  	
  	//  리뷰 댓글삭제
  	modalRemoveBtn.on("click",function(e){
  		
  		var arno = modal.data("arno");
  		
  		console.log(arno);
  		
  		Alley_ReplyService.remove(arno, function(result){
  			alert(result);
  			modal.modal("hide");
  			showList(pageNum);
  		});	
  	});
});
	
</script>
