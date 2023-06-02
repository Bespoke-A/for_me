<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	table{margin-left: 10%; text-align: center;  width: 80%; font-size: 1.5rem; } 
	th, td{ padding: 5px 5px;}
	th{background-color: #B68559;}
	textarea{border: none; resize: none;}
	#title{width: 70%; font-size: 2rem; background-color: #B68559; border: none;}
	.texts:focus{outline: none; resize: none;}
	.content{border: 1px solid #B68559; resize: none;}
	.button1, .button2{color: #B68559; border: none; height: 30px; background-color: white; font-weight: bold;}
	.button2{display:none;}
</style>
<script>
	window.onload=function() { //관리자여부 확인
		if ("${user.id}" != 'admin') { //관리자 아닐때
			$('#up').attr('style', "display:none;");
			$('#del').attr('style', "display:none;");
		}else {
			return;
		}
	}
	
	function updateCancel() { //수정 시작
		$('.texts').attr({"readonly": true, 'style': " border: none;"});
		$('.button1').attr('style', "display:block;");
		$('.button2').attr('style', "display:none;");
		alert("수정 취소되었습니다.");
		
	}
	function update() { //수정 시작
		$('.texts').attr({"readonly": false, 'style': " border: 1px dashed;"});
		$('.button1').attr('style', "display:none;");
		$('.button2').attr('style', "display:block;");
		alert("수정하세요.");
	}
	
	function updateOK(frm) { //수정완료
		alert("수정 완료되었습니다.");
		frm.action = "updateOK.do";
		frm.submit();
	}
	
	function deleteOK(frm) { //삭제 실행
		let result = confirm("삭제 하시겠습니까?");
		if(result == true){
			alert("삭제 되었습니다.");
			frm.action = "deleteOK.do";
			frm.submit();
		}else {
			return;
		}
	}
</script>
<body>
    <!-- Spinner Start -->
<!--     <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div> -->
    <!-- Spinner End -->

<!-- 탑바, 네비바 인클루드 -->
<jsp:include page="/WEB-INF/views/include_h.jsp"/>

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3">공지사항</h1>
            <nav aria-label="breadcrumb animated slideInDown">
            <!--     <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Project</li>
                </ol> -->
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div>
                <div>
                	<form>
                	<table>
                		<tr>
                			<th><input type="hidden" name="noticeNum" value="${noticeOne.noticeNum }"> ${noticeOne.noticeNum }<p></th>
                			<th class="title"><input type="text" name="noticeTitle" class="texts" id="title" readonly="readonly" value=" ${noticeOne.noticeTitle }"></th>
                			<th>${noticeOne.name }</th>
                			<th colspan="3">${fn:substring(noticeOne.notiDate,0,11)}</th>
                		</tr>
                		<tr>
                			<td class="content" colspan="6"><textarea rows="20" cols="70" id="content" class="texts" name="notiContent" readonly="readonly">${noticeOne.notiContent }</textarea></td>
                		</tr>
                		<tr>
                			<td colspan="3"></td>
							<td class="buttonGroup" id="buttonGroup1">
								<input class="button1" type="button" id="up" value="수정" onclick="update()">
							</td>
							<td class="buttonGroup" id="buttonGroup1">
								<input class="button1" type="button" id="del" value="삭제" onclick="deleteOK(this.form)">
								<input class="button2" type="button" id="upOK" value="수정" onclick="updateOK(this.form)">
							</td>
							<td class="buttonGroup" id="buttonGroup1">
								<input class="button2" type="button" id="upCancel" value="취소" onclick="updateCancel()">
								<input class="button1" type="button" id="list" value="목록" onclick="location.href='notice.do'">
							</td>
						</tr>
						<tr>
							<td colspan="4" class="buttonGroup" id="buttonGroup2">
							</td>
                		</tr>
                	</table>
                	</form>
                </div>
            </div>
            </div>
        </div>
    <!-- Projects End -->
        
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