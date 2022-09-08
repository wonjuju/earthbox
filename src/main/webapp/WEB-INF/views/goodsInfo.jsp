<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html lang="en">

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



<title>BRANDY</title>
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
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/lte-ie7.js"></script>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<!-- 사용자 정의 -->
<link href="css/other.css" rel="stylesheet">


</head>
<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<!--  <nav class="navbar">
		<div class="navbar__logo">
			<a class="menu_bar">☰</a>
			<div class="dropdown">
				<a class="menu_drop" href="">${apt_name} ▼</a>
				<div class="dropdown-content">
					<a style="color: black !important;" href="">아파트 설정하기</a>
				</div>
			</div>
		</div>
	</nav> -->

	<div class="col-sm-10 detail-img-div">
		<img class="goback" src="/img/icon/goback.png"
			onclick="location.href='index.do'"/ > <img class="detail-img"
			src="file/${goodsInfo.g_img}" />
	</div>


	<div class="seller-info-sec">
		<img class="seller-img" src="/img/profile/user1.jpg">
		<div class="seller-info">
			<p class="seller-nick">${goodsInfo.seller_nick}</p>
			<p class="seller-apt">한국 아델리움</p>
		</div>

		<div></div>

		<c:choose>
			<c:when test="${user_id eq goodsInfo.seller_id}">
			</c:when>

			<c:otherwise>
				<div class="zzim-sec">
					<button class="btn btn-sm goods-chat"
						onclick="location.href='createRoom?g_seq=${goodsInfo.g_seq}'">채팅하기</button>
				</div>
			</c:otherwise>

		</c:choose>


	</div>
	<div class="goods-line"></div>
	<div class="panel-body info-body">
		<div class="form-group">
			<div class="col-sm-10">
				<h4 class="info-g-name">${goodsInfo.g_name}</h4>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<div>${fn:replace(goodsInfo.g_info, newLine, "<br/>")}</div>

			</div>
		</div>



	</div>



		<div class="buy-div">
		<div class="goodsinfo-foot">
			<input type="hidden" value="${wish}" id="wishyn">
			<c:choose>
				<c:when test="${wish == 0}">
					<img class="item-zzim" id="zzim" src="/img/icon/star-empty.png" onclick="addZzim(${goodsInfo.g_seq})">
				</c:when>

				<c:otherwise>
					<img class="item-zzim" id="zzim" src="/img/icon/star-full.png" onclick="addZzim(${goodsInfo.g_seq})">
				</c:otherwise>
			</c:choose>
			<p id="g_price">${goodsInfo.g_price}</p>
		<c:choose>
			<c:when test="${user_id eq goodsInfo.seller_id}">
			</c:when>

			<c:otherwise>
				<button class="buy-product btn btn-sm"
					onclick="buypage(${goodsInfo.g_seq})">구매하기</button>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
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
	<script src="js/goodinfo-foot.js"></script>


	<script type="text/javascript">
	
	function buypage(g_seq) {
		
			
            var f = document.createElement("form");
            var obj1 = document.createElement('input');
            obj1.setAttribute('type','hidden')
            obj1.setAttribute('name','g_seq')
            obj1.setAttribute('value', g_seq )
            f.appendChild(obj1);
            
            f.setAttribute('method','post');
            f.setAttribute('action','viewBuyPage.do')
            document.body.appendChild(f);
		    f.submit();
		
	}
	
	$(document).ready(changeImg)
	$(document).ready(changemoney)
		
	function changeImg() {
			var rn = Math.ceil(Math.random()*4)
			console.log(rn)
			
			$(".seller-img").attr("src","/img/profile/user"+rn+".jpg")
			
	}

		function changemoney() {

			console.log("위시와이앤 : "+$("#wishyn").val())
			console.log($("#g_price").text())
			var price = $("#g_price").text().toLocaleString('ko-KR');

			console.log(price)

			var cPrice = price.toString().replace(
					/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			console.log(cPrice)

			$("#g_price").text(cPrice + "원");
		}

		// 찜목록 클릭 

		function addZzim(g_seq) {
			
			console.log(g_seq)
			console.log("찜 css : " + $("#zzim").attr("src"))
			imgSrc = $("#zzim").attr("src");
			
			if (imgSrc == '/img/icon/star-full.png') {
		         
				$("#zzim").attr("src","/img/icon/star-empty.png")

	            console.log("찜취소")
	               
	            $.ajax({
	               url : "updateWish.do",
	               type: "post",
	               data : {
	                  "g_seq" : g_seq,
	                  "status" : 0
	               },
	               success : function () {
	                  console.log("찜 취소 성공")
	               },
	               error : function () {
	                  console.log("실패")
	               }
	               
	            });
	         }
	         
	         else if (imgSrc == '/img/icon/star-empty.png') {
	            
        		$("#zzim").attr("src","/img/icon/star-full.png")

	            console.log("찜성공")
	               
	            
	            $.ajax({
	               url : "updateWish.do",
	               type: "post",
	               data : {
	                  "g_seq" : g_seq,
	                  "status" : 1
	               },
	               success : function () {
	                  console.log("찜 취소 성공")
	               },
	               error : function () {
	                  console.log("실패")
	               }
	               
	            });
	            
	            
	         }
			
		}

	</script>

</body>

</html>