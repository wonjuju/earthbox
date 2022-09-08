<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- nav bar -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nav bar</title>
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b17d4fa9e7.js"
	crossorigin="anonymous"></script>
<script src="main.js" defer></script>
<!-- nav bar end -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Home</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min2.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">



<title>Earthbox</title>
<!-- Google Font -->
<link
	href='http://fonts.googleapis.com/css?family=Dosis:300,400,500,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<!-- Preloader -->
<link rel="stylesheet" href="css/preloader.css" type="text/css"
	media="screen, print" />
<!-- Icon Font-->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.default.css">
<!-- Animate CSS-->
<link rel="stylesheet" href="css/animate.css">
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Style -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/shopstyle.css">
<!-- Responsive CSS -->
<link href="css/responsive.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!-- 사용자 정의 -->
<link href="css/other.css" rel="stylesheet">
<link href="css/list.css" rel="stylesheet">

<style type="text/css">
</style>
</head>


<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">찜목록</h4>
		</div>
	</nav>

		<!-- 
		<ul class="navbar__menu">
			<li><a href="login.do">로그인</a></li>
			<li><a href="">Gallery</a></li>
			<li><a href="">Wedding</a></li>
			<li><a href="">FAQ</a></li>
			<li><a href="">Booking</a></li>
		</ul>
 -->
	</nav>




	<!-- ================ trending product section start ================= -->
	<section class="section-margin calc-60px">
		<div class=" container-pd">
			<div class="row list_layout">
				<!--리스트 출력 시작 시작 -->
				<c:forEach items="${GoodsList}" var="vo" step="1">
					<div class="card-product__img"
						onclick="viewGoodsContent(${vo.g_seq})">
						<img class="card-img" src="file/${vo.g_img}">
						<div class="card-body">
							<h4>
								<c:out value="${vo.g_name}" />
							</h4>
							<br>
							<p>${apt_name}</p>

							<div class="pr-zzim">
								<p class="price" id="price${vo.g_seq}">
									<c:out value="${vo.g_price}" />
									<script type="text/javascript">
									
									</script>
								</p>
								<div class="zzim-div" onclick="">
									<img class="zzim" src="/img/icon/star-empty.png">
									<p class="zzim-cnt">${vo.wish_cnt}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="goods-line"></div>
				</c:forEach>
				<!-- 끝 -->
			</div>
		</div>
	</section>
	<!-- ================ trending product section end ================= -->

<!--  footer start -->
	<div class="foot-bar">
		
	</div>
	<!--  footer end -->

	<!-- =========================
     SCRIPTS 
============================== -->

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/script.js"></script>
	<script src="/js/mypage-foot.js"></script>
	<script type="text/javascript">
			
			$(document).ready(changemoney);
			
			function changemoney(g_seq) {
			
				console.log($("#price${vo.g_seq}").text());

				var price = $("#price${vo.g_seq}").text().toLocaleString('ko-KR');
				console.log(price)
				var cPrice = price.toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				console.log(cPrice)

				$("#price${vo.g_seq}").text(cPrice +"원" );
			}
			
			</script>




</body>

</html>