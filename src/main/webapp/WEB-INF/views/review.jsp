<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Woody - Carpenter Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="resources/img/favicon.ico" rel="icon">

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

<style>
	table{margin-left: 10%;  width: 70%; border-collapse: collapse; font-size: 1.3rem;}
	#sub {width: 60%;}
	.center{width: 10%;}
	.butt{background-color: #B68559; border: none; color: white;}
	.butCon{color: #B68559; border: none; background-color: white; font-weight: bold; font-size: 1rem;}
</style>

<script>
	function myRevClick() {
		location.href='reviewMe.do?id='+'${user.id}';
	}
	
	function delRev(revNum) {
		let result = confirm("삭제하시겠습니까?");
		if (result == true) {
			alert("삭제되었습니다.");
		location.href='delRev.do?reviewNum=' + revNum;
		}else {
			return;
		}
	}
</script>

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
            <h1 class="display-3 text-white mb-3 animated slideInDown">味 담</h1>
         	<ol class="breadcrumb">
          		<li class="breadcrumb-item"><p class="text-white">리뷰 게시판</p></li>
            </ol>
            <nav aria-label="breadcrumb animated slideInDown">
                <!-- <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">review</li>
                </ol> -->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
 	<div class="text-center">
    	<br>
    </div>	
		<table>
			<thead>
				<tr>
					<th colspan="3"></th>
					<th>
						<input type="button" class="butt" id="myButt" value="내 리뷰 보기" onclick="myRevClick()">
					</th>
					<th>
						<input type="button" class="butt" id="allButt" value="전체 리뷰 보기" onclick="location.href='review.do'">
					</th>
				</tr>
				<tr>
					<th colspan="5"><hr></th>
				</tr>
				<tr>
					<th class="center">번호</th>
					<th class="center" id="sub">내용</th>
					<th class="center">작성자</th>
					<th class="center">별점</th>
					<th class="center">작성일</th>
				</tr>
				<tr>
					<th colspan="5"><hr></th>
				</tr>
			</thead>
		<c:forEach var="review" items="${reviewsList}">
			<tbody>
				<tr>
					<td class="center" rowspan="2">${review.reviewNum }</td>
					<td>${review.menuname }</td>
					<td class="center" rowspan="2">${review.name }</td>
					<td class="center" rowspan="2">
						<c:forEach begin="1" end="${review.points }" step="1">★</c:forEach>
					</td>
					<td class="center">${fn:substring(review.writeDate,0,11)}</td>
				</tr>	
				<tr>
					<td>${review.comments} </td>
					<c:set var="id" value="${review.id}" />
						<c:if test="${user.id eq review.id || user.id eq 'admin'}" >
							<td><input type="button" class="butCon" value="삭제" onclick="delRev(${review.reviewNum})"></td>
						</c:if>
				</tr>
				<tr>
					<th colspan="5"><hr></th>
				</tr>	
			</tbody>
	</c:forEach>
		</table>
		<br>

        

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