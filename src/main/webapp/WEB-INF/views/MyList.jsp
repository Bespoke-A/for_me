<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
<meta charset="UTF-8">
<title>for味</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="resources/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="resources/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">


<style>
#position {
	margin: 0 auto;
}

.box {
	border: 2px solid black;
}
</style>


</head>

<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
	<!-- Spinner End -->

	<!-- 탑바, 네비바 인클루드 -->
	<jsp:include page="include_h.jsp" />





	<!-- 메뉴 뿌리기 시작 -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="section-title text-center">
				<h1 class="display-5 mb-5">나의 상품결제내역</h1>
			</div>


			<div id="position"
				class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp"
				data-wow-delay="0.3s">
				<div class="rounded overflow-hidden">
					<div class="position-relative overflow-hidden"></div>
					<div class="border border-5 border-light border-top-0 p-4">
						<h5 class="lh-base mb-0">
							<ul>
								<c:if test="${empty mymeList }">
									<h5>결제 내역이 없습니다</h5>
								</c:if>

								<c:forEach var="vList" items="${mymeList }" varStatus="turn">
									<div class="box">
										<c:if test="${vList.turn eq turn.index}">
											<c:forEach var="mList" items="${mymeList }">
												<li>${mList.menuId }/${mList.deliAddress}/${fn:substring(mList.deliDate,0,10) }/
													${mList.subPrice }/${fn:substring(mList.startDate,0,10) }/${fn:substring(mList.endDate,0,10) }
													/${mList.deliok }/${mList.turn }</li>
											</c:forEach>
										</c:if>
									</div>
								</c:forEach>


							</ul>
					</div>
				</div>
			</div>
			<div></div>
		</div>
	</div>
	</div>
	<!-- 메뉴 뿌리기 끝 -->




	<!-- Footer 인클루드 -->
	<jsp:include page="include_f.jsp" />

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i
		class="bi bi-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
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