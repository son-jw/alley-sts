<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../includes/header.jsp"%>

<!-- carousel -->
<div id="carouselExampleIndicators" class="carousel slide bg-dark"
   data-bs-ride="carousel">
   <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="0" class="active" aria-current="true"
         aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators"
         data-bs-slide-to="2" aria-label="Slide 3"></button>
   </div>
   <div class="carousel-inner">
      <div class="carousel-item active">
         <img
            src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMTJfMTU5%2FMDAxNjE1NTUxODU5MDA4.pPVB-tpdb5bngYQovO8FG_DMlwF94yJLG8AAC044Wy4g.7jjHozgGtOzX_dZhP9WKuv8Q0b78ApP5VVAMu3YUMysg.JPEG.ndzang%2F20210310%25A3%25DF152005.jpg"
            class="d-block w-50" style="height: 500px; margin-left: 430px;"
            alt="첫번째 슬라이드">
      </div>
      <div class="carousel-item">
         <img
            src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDRfMjEz%2FMDAxNjIwMTMzNzQ4MTQ0.6E4wn2B3t7U7q3dKPl_qgXKeP9oJvPT6Rclnwr0-KoIg.jV_7e6moMaHWFqFuhZ5q1m-2tQ-KjIE1rm1Vvaf3ADcg.JPEG.jaemyi%2FKakaoTalk_20210429_175019389_09.jpg"
            class="d-block w-50" style="height: 500px; margin-left: 430px;"
            alt="두번째 슬라이드">
      </div>
      <div class="carousel-item">
         <img
            src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDAyMTNfMTg1%2FMDAxNTgxNjAxNzMyMTMz.33A2xPlAdsQ8qjb52ov3YAzl9MGJmdi61L4UVu7NbHwg.7_kqSVoBwMZTFniFRorT_o5hy8scS07FCX59mT5VWZkg.JPEG%2FexternalFile.jpg&type=sc960_832"
            class="d-block w-50" style="height: 500px; margin-left: 430px;"
            alt="세번째 슬라이드">
      </div>
   </div>
   <button class="carousel-control-prev" type="button"
      data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
         class="visually-hidden">Previous</span>
   </button>
   <button class="carousel-control-next" type="button"
      data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span> <span
         class="visually-hidden">Next</span>
   </button>
</div>

<br />
<ul class="nav nav-tabs" id="myTab" role="tablist" style="padding-left: 20%;">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="area1-tab" data-bs-toggle="tab" data-bs-target="#area1" type="button" role="tab" aria-controls="area1" aria-selected="true">서울특별시</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area2-tab" data-bs-toggle="tab" data-bs-target="#area2" type="button" role="tab" aria-controls="area2" aria-selected="false">인천광역시</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area3-tab" data-bs-toggle="tab" data-bs-target="#area3" type="button" role="tab" aria-controls="area3" aria-selected="false">경기도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area4-tab" data-bs-toggle="tab" data-bs-target="#area4" type="button" role="tab" aria-controls="area4" aria-selected="false">강원도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area5-tab" data-bs-toggle="tab" data-bs-target="#area5" type="button" role="tab" aria-controls="area5" aria-selected="false">충청남도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area6-tab" data-bs-toggle="tab" data-bs-target="#area6" type="button" role="tab" aria-controls="area6" aria-selected="false">대전광역시</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area7-tab" data-bs-toggle="tab" data-bs-target="#area7" type="button" role="tab" aria-controls="area7" aria-selected="false">전라남도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area8-tab" data-bs-toggle="tab" data-bs-target="#area8" type="button" role="tab" aria-controls="area8" aria-selected="false">경상남도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area9-tab" data-bs-toggle="tab" data-bs-target="#area9" type="button" role="tab" aria-controls="area9" aria-selected="false">경상북도</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="area10-tab" data-bs-toggle="tab" data-bs-target="#area10" type="button" role="tab" aria-controls="area10" aria-selected="false">제주도</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="area1" role="tabpanel" aria-labelledby="area1-tab" style="text-align: center;">
     <button type="button" class="btn btn-primary">강동구</button>
   <button type="button" class="btn btn-secondary">강서구</button>
   <button type="button" class="btn btn-success">광진구</button>
   <button type="button" class="btn btn-danger">구로구</button>
   <button type="button" class="btn btn-warning">노원구</button>
   <button type="button" class="btn btn-info">도봉구</button>
   <button type="button" class="btn btn-info">동대문구</button>
   <button type="button" class="btn btn-light">동작구</button>
   <button type="button" class="btn btn-dark">마포구</button>
   <button type="button" class="btn btn-dark">서대문구</button>
   <button type="button" class="btn btn-dark">성동구</button>
   <button type="button" class="btn btn-dark">성북구</button>
   <button type="button" class="btn btn-dark">용산구</button>
   <button type="button" class="btn btn-dark">중구</button>
   <button type="button" class="btn btn-dark">중랑구</button>
  </div>
  <div class="tab-pane fade" id="area2" role="tabpanel" aria-labelledby="area2-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">서구</button>
     <button type="button" class="btn btn-dark">중구</button>
  </div>
  <div class="tab-pane fade" id="area3" role="tabpanel" aria-labelledby="area3-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">군포시</button>
     <button type="button" class="btn btn-dark">부천시</button>
     <button type="button" class="btn btn-dark">성남시</button>
     <button type="button" class="btn btn-dark">수원시</button>
     <button type="button" class="btn btn-dark">평택시</button>
  </div>
  <div class="tab-pane fade" id="area4" role="tabpanel" aria-labelledby="area4-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">원주시</button>
  </div>
  <div class="tab-pane fade" id="area5" role="tabpanel" aria-labelledby="area5-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">서산시</button>
  </div>
  <div class="tab-pane fade" id="area6" role="tabpanel" aria-labelledby="area6-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">동구</button>
  </div>
  <div class="tab-pane fade" id="area7" role="tabpanel" aria-labelledby="area7-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">여수시</button>
  </div>
  <div class="tab-pane fade" id="area8" role="tabpanel" aria-labelledby="area8-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">거제시</button>
  </div>
  <div class="tab-pane fade" id="area9" role="tabpanel" aria-labelledby="area9-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">포항시</button>
  </div>
  <div class="tab-pane fade" id="area10" role="tabpanel" aria-labelledby="area10-tab" style="text-align: center;">
     <button type="button" class="btn btn-dark">서귀포시</button>
  </div>
</div>

<!-- Section-->
<section class="py-5">
   <div class="container px-4 px-lg-5 mt-5">
      
      <div><p class="a">+ 튀김요리 Best +</p></div>
      <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         <c:forEach var="ab" items="${best1 }">
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="${ab.mainimage }" 
                  style="height: 200px;" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">
                     <c:out value="${ab.storename }" />
                     </h5>
                     <!-- 식당 주소 -->
                     <c:out value="${ab.address }" />
                  </div>
               </div>
            </div>
         </div>
         </c:forEach>
      </div>
      
         <div><p class="a">+ 매콤&얼큰 Best +</p></div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         <c:forEach var="ab" items="${best2 }">
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="${ab.mainimage }" 
                  style="height: 200px;" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">
                     <c:out value="${ab.storename }" />
                     </h5>
                     <!-- 식당 주소 -->
                     <c:out value="${ab.address }" />
                  </div>
               </div>
            </div>
         </div>
         </c:forEach>
      </div>
         
         <div><p class="a">+ 버거&파스타 Best +</p></div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">      
         <c:forEach var="ab" items="${best3 }">
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="${ab.mainimage }" 
                  style="height: 200px;" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">
                     <c:out value="${ab.storename }" />
                     </h5>
                     <!-- 식당 주소 -->
                     <c:out value="${ab.address }" />
                  </div>
               </div>
            </div>
         </div>
         </c:forEach>
      </div>
   </div>
</section>


<%@ include file="../includes/footer.jsp"%>