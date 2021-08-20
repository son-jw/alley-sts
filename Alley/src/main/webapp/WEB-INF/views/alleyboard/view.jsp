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
				<div class="card bg-light">
					<div class="card-body">
						<!-- Comment form-->
						<form class="mb-4">
							<textarea class="form-control" rows="3"
								placeholder="솔직한 후기를 남겨주세요..."></textarea>
						</form>
						<div class="" align="right">
							<button type="button" class="btn btn-warning btn-sm">
							댓글등록</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp"%>

<script>

</script>
