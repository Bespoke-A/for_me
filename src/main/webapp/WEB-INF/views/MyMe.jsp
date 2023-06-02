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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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

.button {
	width: 70px;
	height: 70px;
	border: none;
	border-radius: 8px;
	margin: 12px;
	cursor: move;
	font-size: 30px;
	background: #eaeaea4f;
}

.container2 {
	margin: 10px;
	padding: 10px;
	background-color: #b5c1dc57;
	border-radius: 8px;
}

.draggable.dragging {
	opacity: 0.5;
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

			<div>
				<button onClick="prevCalendar()" value="이전 달"></button>
				<button onClick="nextCalendar()" value="다음 달"></button>
			</div>
			<div id="calendar"></div>
			<script>
			window.onload = function () { buildCalendar(); } 
			
			
			var date = new Date();
			
			// 달력 연도
			var calendarYear = date.getFullYear();
			// 달력 월
			var calendarMonth = date.getMonth() + 1;
			// 달력 일
			var calendarToday = date.getDate();
			
			 function buildCalendar() {
			
			var monthLastDate = new Date(calendarYear, calendarMonth, 0);
			
			// 달력 월의 마지막 일
			var calendarMonthLastDate = monthLastDate.getDate();
			
			var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
			
			
			
			// 달력 월의 시작 요일
			var calendarMonthStartDay = monthStartDay.getDay();
			
			
			
			// 주 카운트
			var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);
			
			var html = "";
			html += "<table>";
			html += "<caption style=\"font-size: larger; font-weight: bolder; color: red; text-align: left; padding: 5px 10px;\">" + calendarMonth + "월</caption>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			// 위치
			var calendarPos = 0;
			// 날짜
			var calendarDay = 0;
			for (var index1 = 0; index1 < calendarWeekCount; index1++) {
				html += "<tr>";
				for (var index2 = 0; index2 < 7; index2++) {
					
				
					
					html += "<td id='"+calendarYear+"-"+calendarMonth+"-"+(calendarDay+1)
					+ "'  class='container2' calss='button' style=\"padding: 10px 10px; text-align: center;\">";
					
					if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
						calendarDay++;
						html += "<span style=\"display: block; padding: 10px 10px;\">" + calendarDay + "</span>";
					}
					
					
					html += "<c:forEach var='mList' items='${mymeList }'>";
					if('${fn:substring(mList.deliDate,6,7)}' == calendarMonth && '${fn:substring(mList.deliDate,8,10)}' ==calendarDay)  {
						html += "<button id='target' class='draggable' draggable='true'"+
						"onClick='changeDeliDate(${mList.myNum})'>"
						+"${mList.menuId}</button>";
					}
					if(calendarDay == 31){
						calendarDay = 32;
					}
					html += "</c:forEach></td>";
					calendarPos++;
				}
				html += "</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			$("#calendar").html(html);
			
			const draggables = document.querySelectorAll(".draggable");
			const containers = document.querySelectorAll(".container2");

			draggables.forEach(draggable => {
			  draggable.addEventListener("dragstart", () => {
			    draggable.classList.add("dragging");
			  });

			  draggable.addEventListener("dragend", () => {
			    draggable.classList.remove("dragging");
			  });
			});

			containers.forEach(container => {
			  container.addEventListener("dragover", e => {
			    e.preventDefault();
			    const afterElement = getDragAfterElement(container, e.clientX);
			    const draggable = document.querySelector(".dragging");
			    if (afterElement === undefined) {
			      container.appendChild(draggable);
			    } else {
			      container.insertBefore(draggable, afterElement);
			    }
			  });
			});

			function getDragAfterElement(container, x) {
			  const draggableElements = [
			    ...container.querySelectorAll(".draggable:not(.dragging)"),
			  ];

			  return draggableElements.reduce(
			    (closest, child) => {
			      const box = child.getBoundingClientRect();
			      const offset = x - box.left - box.width / 2;
			      // console.log(offset);
			      if (offset < 0 && offset > closest.offset) {
			        return { offset: offset, element: child };
			      } else {
			        return closest;
			      }
			    },
			    { offset: Number.NEGATIVE_INFINITY },
			  ).element;
			}
			
			 }
			// 이전달 버튼 클릭
	        function prevCalendar() {
	        	date = new Date(date.getFullYear(), date.getMonth() - 1, date.getDate());
	        	calendarYear = date.getFullYear();
				// 달력 월
				 calendarMonth = date.getMonth() + 1;
				// 달력 일
				 calendarToday = date.getDate();
	        	
	        	buildCalendar();    // 달력 다시 생성
	        }
	        // 다음달 버튼 클릭
	        function nextCalendar() {
	        	date = new Date(date.getFullYear(), date.getMonth() , date.getDate());
				
	        	calendarYear = date.getFullYear();
				// 달력 월
				 calendarMonth = date.getMonth() + 1;
				// 달력 일
				 calendarToday = date.getDate();
	        	
	        	buildCalendar();     // 달력 다시 생성
	        }
	        
	        function changeDeliDate(myNum) {
				
	        	const contentSelector = document.querySelector("#target");
	        	

	        	const parentElement = contentSelector.parentNode;
	        	const parentId = parentElement.id;

	        	
				$.ajax({
					url:"changeDeliDate.do",
							type: "POST",
							dataType: "",
							data:{
								myNum: myNum,
								deliDate: parentId
								
							},
							success: function () {
								console.log("날짜 변경됨");
								alert("배달 날짜 변경 성공");
								 
							}
				})
				
			}
	        
		</script>




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