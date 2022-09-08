<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="css/main.css" rel="stylesheet">


</head>
<body style="overflow: visible;">
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">${buyVO.g_name} 구매하기</h4>
		</div>
	</nav>


	<div class=" buypage-sec">
		<img class="buy-img" src="/file/${buyVO.g_img}"> <br>

		<div class="buy-info">
			<div class="buy_goods_info">
				<p class="buy_name">${buyVO.g_name}</p>
				<div class="buy-price-sec">
					<p class="b-price-t">결제금액</p>
					<p class="b-price-info">
						<span style="font-weight: bold;"><fmt:formatNumber
								value="${buyVO.g_price }" pattern="#,###" /></span>&nbsp원
					</p>
				</div>
			</div>

			<div class="point-info">
				<p class="b-point-t">보유포인트</p>
				<p class="b-point-info" id="canPoint">${user_point}&nbspp</p>

				<input class="form-group form-control use-point" id="use-point"
					placeholder="0p" type="number">
				<button class="btn u-p"
					onclick="usingPoint(${buyVO.g_price},${user_point})">사용하기</button>
			</div>

			<div class="final-info">
				<p class="b-price-t">최종결제금액</p>
				<p class="b-price-info">
					<span id="final-price" style="font-weight: bold;"><fmt:formatNumber
							value="${buyVO.g_price}" pattern="#,###" /></span>&nbsp원
				</p>
			</div>
		</div>
		<button class="btn btn-sm gobuy" onclick="goodsPurchase(${buyVO.g_seq},'${user_id }')">결제하기</button>




	</div>



	<!--  footer start -->
	<div class="foot-bar">
		<div class="foot-div" onclick="location.href='index.do'">
			<div>
				<img alt="" src="/img/icon/home-gr.png">
			</div>
		</div>

		<div class="foot-div">
			<img alt="" src="/img/icon/message-gr.png">
		</div>

		<div class="foot-div" onclick="location.href='viewChallenge.do'">
			<img class=" main-btn" alt="" src="/img/icon/unearth.png">
		</div>

		<div class="foot-div">
			<img alt="" src="/img/icon/map-gr.png">
		</div>
		<div class="foot-div" onclick="location.href='viewMypage.do'">
			<img alt="" src="/img/icon/me-gr2.png">
		</div>
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
	<script type="text/javascript">
		
	
	//사용자의 input박스 작성을 인식하여 사용하려는 포인트가 현재 보유포인트보다 클 시 현재 보유포인트로 변하게 함
	$('#use-point').on('propertychange change keyup paste input', function() {
		var CanPoint = parseInt($("#canPoint").html())
	    var point =  parseInt($("#use-point").val());
		
		console.log("사용할포인뚜 : "+point)
		console.log("사용가눙한 : "+CanPoint)
		console.log("함수싫행")
	    
		if(point > CanPoint) {
			
			$("#use-point").val(CanPoint)
			
		}
		
	    });
	
	
	// 이거는 최종 결제금액 대체
	function usingPoint(g_price,user_point) {
		
		var price = parseInt(g_price)
		var point = parseInt($("#use-point").val())
		console.log()
		
		console.log("가격 : "+price)
		console.log("포인투 : "+point)
		
		
		var fPrice = price-point
		console.log(fPrice)
		
		 fPrice = fPrice.toString().replace(
					/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		$("#final-price").html(fPrice)
		
	}
	
	// 값 전송하기
	function goodsPurchase(g_seq,user_id) {
		
		var user_point = parseInt($("#use-point").val())
		
		// nan값 처리
		if (isNaN(user_point)) {
			user_point = 0;
		}
		console.log("뽀인뚜" +user_point)
		console.log(g_seq)
		
		var f = document.createElement("form");
            var obj1 = document.createElement('input');
            obj1.setAttribute('type','hidden')
            obj1.setAttribute('name','g_seq')
            obj1.setAttribute('value', g_seq )
            f.appendChild(obj1);
            
            var obj2 = document.createElement('input');
            obj2.setAttribute('type','hidden')
            obj2.setAttribute('name','user_point')
            obj2.setAttribute('value', user_point )
            f.appendChild(obj2);
            
            var obj3 = document.createElement('input');
            obj3.setAttribute('type','hidden')
            obj3.setAttribute('name','user_id')
            obj3.setAttribute('value', user_id )
            f.appendChild(obj3);
            
            f.setAttribute('method','post');
            f.setAttribute('action','goodsPurchase.do')
            document.body.appendChild(f);
		    f.submit();
		
	}

	
	</script>



</body>

</html>