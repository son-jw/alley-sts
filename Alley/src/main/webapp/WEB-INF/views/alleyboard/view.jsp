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
			
			<!-- 댓글 작성 -->
			<section class="mb-5">
			<sec:authorize access='isAuthenticated()'>
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<form class="form_input" id="reply-form" 
							role="form" method="post" autocomplete="off">
							<input type="hidden" value="${alist.ano} }" name="ano" id="ano">
							<input type="hidden" value="${alist.replyer }" name="replyer" id="replyer">
							
							<textarea class="form-control" rows="3"
								placeholder="솔직한 후기를 남겨주세요..."></textarea>						
						
							<div class="" align="right">
								<button type="button" id="review-submit" class="btn btn-warning btn-sm">
								댓글등록</button>
							</div>
						</form>
						<!-- 댓글 작성 종료  -->
					</div>
				</div>
				</sec:authorize>
			</section>
			
			<div class="col-sm-12 fix">
				<div class="description">
					<!-- Nav tabs -->
					<ul class="nav product-nav">
						<li class="active"><a data-toggle="tab" href="#description">리뷰</a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div id="description" class="tab-pane fade active in" role="tabpanel">
							<div>
								<section class="replyList">
									<ul>
										<!-- 리뷰 리스트 목록이 들어갈 위치 -->
									</ul>
								</section>
								<script>
									replyList(); <!--리스트 스크립트문 실행-->
								</script>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 수정 모달 -->
<div id="modal">
	<div class="modal_content">
    	<input type="hidden" id="modalarno" name="arno">
    	<input type="hidden" id="modalreplyer" name="replyer"> 
        <h2>리뷰 수정</h2>   
       	<br>
       	

		<br><br>					
        <p class="cont">    
			<label>댓글</label>
			<div class="form-group">
				<textarea class="modal_repCon" id="reply_modal" name="modal_repCon"></textarea>
			</div>
        </p>
        <br>
        
		<button type="button" class="modal_modify_btn">수정</button>
	    <button type='button' class='delete'>삭제</button>	         
		<button type="button" class="modal_close_btn" >취소</button>
        
    </div>
    <div class="modal_layer"></div>
</div>


<%@ include file="../includes/footer.jsp"%>

<script>
//리뷰 리스트
function replyList() {
	var ano=${alist.ano};
	
	$.getJSON("/alist/view/replyList" + "?ano=" + ano,function(data) {
		
		var str= "";
		
		$(data).each(function() {
			
			str += "<li class='replyList' data-arno='" +this.arno + "'>";
			str += "<div class='userInfo'>";
			
			str += "<div id='reply" + this.arno + "' class='replyContent'>" + this.reply + "</div><br />";
			str += "<input type='hidden' class='reviewId' value=" + this.replyer + ">";
			str += "<div class='review_bt'>";
			str += "<b class='review_modify' id='review_modify_" + this.arno + "' data-arno='";
			str += this.arno + "' data-id='" + this.replyer + "'>수정/삭제</b>";
			str += "</div>";
			str += "<div class='div_line'></div>";
			str += "</li>";
		});
		
		$("section.replyList ul").html(str);
	})
	
}
</script>

<script>
$(document).ready(function() {
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e,xhr,options) {
		xhr.setRequestHeader(csrdHeaderName, csrfTokenValue);
	});
	
	//리뷰 등록
	$("review_submit").on("click",function(e) {
		var reveiwId =$("reviewId");
		var replyer = $("#replyer").val();
		
		if(reviewId.val() == replyer) {
			e.preventDefault();
			alert("이미 리뷰를 등록 하셨습니다.");
			return;
		}
		
		e.preventDefault();
		
		var formObj = $("#review_form form=[role='form']");
		var ano = $("#ano").val();
		var reply = $("#reply").val();
		
		var data = {
				ano : ano,
				replyer : replyer,
				reply : reply
		}
		
		$.ajax({
			url : "/alleyboard/view/registReply",
			type : "post",
			data : data,
			success : function() {
				replyList();
				$('#reply').val("");
			}
		});
	});
})
</script>
