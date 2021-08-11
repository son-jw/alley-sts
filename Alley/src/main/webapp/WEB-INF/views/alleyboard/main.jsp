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

<!-- Section-->
<section class="py-5">
   <div class="container px-4 px-lg-5 mt-5">
      <div><p class="a">+ 튀김요리 Best +</p></div>
      <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTAzMjVfMjY5%2FMDAxNjE2NjY0NDkxNjUz.53nb4eZ2wfu6FkgD1Ds2bMUOeAkC5PrVJQpRbVuKwggg
                  .aNqWbv_bh8Z732NzVB-tO76IKT6AneltSkrO6BUxh2Eg.JPEG.dear-mybride%2FIMG_3347.JPG" 
                  style="height: 200px;" alt="첫번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">연돈</h5>
                     <!-- 식당 주소 -->
                     제주특별자치<br>서귀포시 일주서로 968-10
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA1MTBfMjYz%2FMDAxNjIwNjU1OTM4ODUz.nT2X9b6GLBzPGVFFDizt7Cw-hx9OdnTDqcdzmCSVaKAg
                  .7IUql2OSuY1cAmWK0kj-noGPxSiTA4lz4swEURlRf2wg.JPEG.ljy9794%2FP20210506_210931000_2770070B-D8A2-42D7-A832-F68F93471B4E.JPG" 
                  style="height: 200px;" alt="두번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">스마일 닭강정</h5>
                     <!-- 식당 주소 -->
                     서울 도봉구<br>도봉로110아길 7 1층
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA0MTNfNDYg%2FMDAxNjE4MzAxODgyODU5.ccvkyMI8ewHjYzvnH_-CnPGhk3sw8mMzRHfgsu3wVREg
                  .7_3zjNHBC47rlLTPcWSwju2blxdX7nAhYxjK_0gZwfIg.JPEG.t22n82%2F%25BF%25C2%25BC%25BE%25C5%25D9%25B5%25BF15.jpg" 
                  style="height: 200px;" alt="세번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">온센텐동(본점)</h5>
                     <!-- 식당 주소 -->
                     인천 중구<br>신포로35번길 22
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMDA4MjhfMTQ4%2FMDAxNTk4NTg3MDQxODg3.hXO1gKxynV0JY8t_DxI4ZQL0HKLyBOVt3t7oEQlWiqAg
                  .QVWVbE08hV0Eeoxu_S4atA_x208SI1nkIFNsqfzQd0Ig.JPEG.cynthiaislovely%2FIMG_5770.JPG" 
                  style="height: 200px;" alt="네번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">유진치킨</h5>
                     <!-- 식당 주소 -->
                     서울 서대문구<br>세무서7길 13
                  </div>
               </div>
            </div>
         </div>
      </div>
      
         <div><p class="a">+ 매콤&얼큰 Best +</p></div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf
                  .pstatic.net%2F20210604_194%2F1622778485594n0LcO_JPEG%2Fupload_2e3af891325bff4d58aed021c9aab1e9.jpg" 
                  style="height: 200px;" alt="첫번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">윤식당</h5>
                     <!-- 식당 주소 -->
                     경기 성남시 중원구<br>제일로35번길 30
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf
                  .pstatic.net%2F20210228_15%2F1614522383843FHgjG_JPEG%2Fupload_eadc3fcc4106b41f7e52d81ec8e8e146.jpg" 
                  style="height: 200px;" alt="두번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">어흥떡볶이</h5>
                     <!-- 식당 주소 -->
                     경기 군포시<br>군포로538번길 7-3
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fpost.phinf.naver
                  .net%2FMjAyMTAzMTBfMjYg%2FMDAxNjE1MzY5OTc5NzQ2.8DrHL9V-OUUtm1xlsCY3ejO5LcAf8iy6jgo9suRlZe8g
                  .Of6Tt8DOsArSB2Wpbbi4zlcgxdYfmjVjl2VDWXfZkbIg.JPEG%2FIV-xSxN4Hm-Ketjky3MaoCFV6ZBc.jpg" 
                  style="height: 200px;" alt="세번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">강희자얼큰손만두국</h5>
                     <!-- 식당 주소 -->
                     서울 광진구<br>능동로49길 16
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA0MDhfMjYy%2FMDAxNjE3ODM4NDU2Mzkx._Fq8DSm2D-GJ4VhfeFuEsyfCOnk3Z1WHZS7_cpwQ7Log
                  .760INJBKpnt4kbdf0TNYYpnHHcRGUiH49yH5VF0UOFAg.JPEG.grapevine1%2FIMG_4199.jpg" 
                  style="height: 200px;" alt="네번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">마포나룻가</h5>
                     <!-- 식당 주소 -->
                     서울 마포구<br>마포대로12길 35
                  </div>
               </div>
            </div>
         </div>
      </div>
         
         <div><p class="a">+ 버거&파스타 Best +</p></div>
         <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">      
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA1MjdfMTc0%2FMDAxNjIyMTIzNzg2NjAw.55y-mDV8C_5vY8rguKcmYy6nUI4eHe42M4EVOOUsZ3Mg
                  .ONfokBirdjo0EZ9D4JOsK9o5SbbtrYjW_IvL6o6n59gg.JPEG.gpfus129%2FIMG_0629.jpg" 
                  style="height: 200px;" alt="첫번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">킹콩파스타</h5>
                     <!-- 식당 주소 -->
                     서울 강동구<br>진황도로47길 67 1층
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA1MjFfMjc4%2FMDAxNjIxNTkwNjMyNjQ5.BchOa2AdQ8MU78FanskPlqZn8KFQ54h19tKw-ko1KFgg
                  .9G1-PTCh6O3hO2WOgnTIiypVu19VLVVkUibf1qSS9uMg.JPEG.hana4894%2FIMG_3263.jpg" 
                  style="height: 200px;" alt="두번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">버거스타일</h5>
                     <!-- 식당 주소 -->
                     경기 부천시<br>조마루로97번길 25-12
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA0MTNfMTgx%2FMDAxNjE4Mjk3OTg1ODA4.yGrbDk-kZ9qEW5pTDhRaAchpTdQ_zZhYzXakkyGM3bMg
                  .2prSVvk3Lo1-1ADr9NN3tEiqH7BXtBLPNPxOxLJ0e1Yg.JPEG.seorineee%2FIMG_1942.jpg" 
                  style="height: 200px;" alt="세번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">헬로</h5>
                     <!-- 식당 주소 -->
                     서울 도봉구<br>도봉로110아길 19
                  </div>
               </div>
            </div>
         </div>
         
         <div class="col mb-5">
            <div class="card h-100">
               <!-- 음식 사진 -->
               <img class="card-img-top"
                  src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver
                  .net%2FMjAyMTA1MjhfNDcg%2FMDAxNjIyMjA4MzcxOTE5.qHcc7iLkC74exYj7L2e9EpQTlEZYvsjG0kHakzSoEqEg
                  .gGd2gJ3mJGlr1VlzATpUGd7qEwoWYIUetJYpuGN5Qpkg.JPEG.yuth9461%2F20210528%25A3%25DF173924.jpg" 
                  style="height: 200px;" alt="네번째 식당" />
               <!-- 식당 정보 -->
               <div class="card-body p-4">
                  <div class="text-center">
                     <!-- 식당 이름 -->
                     <h5 class="fw-bolder">버거인</h5>
                     <!-- 식당 주소 -->
                     서울 용산구<br>청파로43길 12
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>


<%@ include file="../includes/footer.jsp"%>