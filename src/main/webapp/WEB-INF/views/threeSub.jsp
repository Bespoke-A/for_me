<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>3일구독</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


<!-- 탑바, 네비바 인클루드 -->
<jsp:include page="/WEB-INF/views/include_h.jsp"/>
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">3일 구독</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                	<!--뭐 넣을까-->
<!--                     <li class="breadcrumb-item"><a class="text-white" href="#">3일 구독</a></li> -->
                    <li class="breadcrumb-item" style = "font-size:30px;"><a class="text-white" href="fiveSub.do"  >5일 구독</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- 3일구독 -->
<div class="container-xxl py-5">
        <div class="container">
            <h1  style = "font-size:40px;">3일구독</h1>
             <div class="container-xxl py-5">
        <div class="container">
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">6000원 메뉴</h1>
            </div>
            <!--1 -->
            <div class="row g-4">
            <c:forEach var="menuThum"  items="${menuThumSix }">
                <div class="col-lg-3 col-md-6 wow fadeInUp" >
                    <div class="team-item">
                        <div class="overflow-hidden position-relative">
                            <a href ="viewDetail.do?menuId=${menuThum.menuId }"><img class="img-fluid" src="resources/forMeImg/작은/${ menuThum.thumbnail}" alt=""> </a>
                        </div>
                        <div class="text-center border border-5 border-light border-top-0 p-4">
                            <h5 class="mb-0">${menuThum.menuName }</h5>
                        </div>
                    </div>
                </div>
             </c:forEach>
            </div>
            <div>
            <p> </p> 
               <a href="" class="btn btn-primary py-3 px-5">6000원 메뉴 고르러 가기&nbsp;&nbsp;=͟͟͞͞Ꙭ̮</a>
            </div>
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">8000원 메뉴</h1>
            </div>
            <!--1 -->
            <div class="row g-4">
            <c:forEach var="menuThum"  items="${menuThumEight }">
                <div class="col-lg-3 col-md-6 wow fadeInUp" >
                    <div class="team-item">
                        <div class="overflow-hidden position-relative">
                            <img class="img-fluid" src="resources/forMeImg/작은/${ menuThum.thumbnail}" alt="">
                        </div>
                        <div class="text-center border border-5 border-light border-top-0 p-4">
                            <h5 class="mb-0">${menuThum.menuName }</h5>
                        </div>
                    </div>
                </div>
             </c:forEach>
            </div>
            <div>
            <p> </p> 
               <a href="" class="btn btn-primary py-3 px-5">8000원 메뉴 고르러 가기&nbsp;&nbsp;=͟͟͞͞Ꙭ̮</a>
            </div>
            <div class="section-title text-center">
                <h1 class="display-5 mb-5">10000원 메뉴</h1>
            </div>
            <!--1 -->
            <div class="row g-4">
            <c:forEach var="menuThum"  items="${menuThumTen}">
                <div class="col-lg-3 col-md-6 wow fadeInUp" >
                    <div class="team-item">
                        <div class="overflow-hidden position-relative">
                            <img class="img-fluid" src="resources/forMeImg/작은/${ menuThum.thumbnail}" alt="">
                        </div>
                        <div class="text-center border border-5 border-light border-top-0 p-4">
                            <h5 class="mb-0">${menuThum.menuName }</h5>
                        </div>
                    </div>
                </div>
             </c:forEach>
            </div>
            <div>
            <p> </p> 
               <a href="" class="btn btn-primary py-3 px-5">10000원 메뉴 고르러 가기&nbsp;&nbsp;=͟͟͞͞Ꙭ̮</a>
            </div>
        </div>
    </div>
  </div>
 </div>
    <!-- Service End -->


   

	<!-- Footer 인클루드 -->
	<jsp:include page="/WEB-INF/views/include_f.jsp"/>


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/lib/wow/wow.min.js"></script>
    <script src="resources/lib/easing/easing.min.js"></script>
    <script src="resources/lib/waypoints/waypoints.min.js"></script>
    <script src="resources/lib/counterup/counterup.min.js"></script>
    <script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="resources/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="resources/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>

</html>