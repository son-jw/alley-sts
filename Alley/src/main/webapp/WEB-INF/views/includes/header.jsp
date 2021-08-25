<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- bootsrap js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<!-- jquery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>

<title>먹거리 - 먹보들의 거리 리뷰</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon2.ico" />

<style>
.a {
	font-family: Geogia;
	font-style: normal;
	font-weight: 800;
	font-size: x-large;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 130px;
}
</style>

</head>
<body>
	<!-- navbar -->
	<!-- icon -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/"> <img
				src="/resources/assets/favicon2.ico" alt="" width="100" height="70"
				class="d-inline-block align-text-top">
			</a>
			<div>
				<a class="navbar-brand"
					style="font-family: Geogia; font-style: oblique;" href="/">먹보들의<br>거리<br>리뷰
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav" style="padding-left: 53%;">
					<li class="nav-item"><a class="nav-link"
						href="/commboard/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">최근 본 식당</a></li>
				</ul>
			</div>

			<!-- searchbar -->
			<nav class="navbar navbar-light bg-light" style="padding-right: 3%;">
				<div class="container-fluid">
					<form class="d-flex" id="search-Form" action="/alleyboard/search"
						method="get">

						<select type="hidden" name="type" style="display: none">
							<option type="hidden" name="type" value="SAT"
								${pageMaker.cri.type eq "SAT"?"selected":"" }></option>
						</select> <input class="form-control me-2" type="text" name="keyword"
							value="${pageMaker.cri.keyword }"
							placeholder="지역 또는 식당을 검색해주세요.." aria-label="Search"
							style="width: 400px; height: 50px; font-size: 20px;" /> <input
							type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
						<input type="hidden" name="amount"
							value="${pageMaker.cri.amount }" />
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</nav>

			<!-- nav menu -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav" style="padding-right: 40%;">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" var="userName" />
						<li>안녕하세요!&nbsp; ${userName } 님</li>
						<li>/</li>
						<li><a class="nav-link" href="/member/customLogout"> 로그아웃</a></li>
						<li>마이페이지</li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link"
							href="/member/customLogin">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/member/signup">회원가입</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

	<script>
		$(document).ready(function() {

			var alley_searchForm = $("#search-Form");

			$("#search-Form button").on("click", function(e) {

				if (!alley_searchForm.find("input[name='keyword']").val()) {
					alert("검색어를 입력해주세요");

					return false;
				}

				alley_searchForm.find("input[name='pageNum']").val(1);
				alley_searchForm.find("input[name='amount']").val(16);
				e.preventDefault();
				alley_searchForm.submit();
			});
		});
	</script>