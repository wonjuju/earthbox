<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Map<Integer, String> urlMap = new HashMap();
	urlMap.put(1, "https://morestore.co.kr/");
	urlMap.put(2, "https://www.jigushop.co.kr/");
	urlMap.put(3, "https://www.thanksto.co.kr/");
	urlMap.put(4, "https://socialecho.kr/");
	urlMap.put(5, "https://morestore.co.kr/");
	urlMap.put(6, "https://morestore.co.kr/");
	urlMap.put(7, "https://www.revation.co.kr/");
	urlMap.put(8, "https://www.orenlife.com/");	
%>

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
<link href="css/category.css" rel="stylesheet">

</head>


<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<nav class="navbar">
		<div class="navbar__logo">
			<a class="side_bar" onclick="sidebar()">☰</a>
			<div class="dropdown">
				<a class="menu_drop" href="">${apt_name} ▼</a>
				<div class="dropdown-content">
					<a style="color: black !important;" href="">아파트 설정하기</a>
				</div>
			</div>
		</div>
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

	<nav id="navbar" style="color: black !important">

		<div class="cate-title">

			<div class="side-close">
				<a onclick="closeside()"><img src="/img/icon/x.png"></a>
			</div>

			<div>
				<h4>카테고리</h4>
			</div>

		</div>
		<div class="navbar-items flexbox-col">

			<!-- list출력 -->
			<c:forEach items="${categoryList}" var="c" step="1">
				<div class="navbar-item flexbox-left" id="goodsCateList"
					onclick="good('${c.gc_name}')">
					<a class="navbar-item-inner bob"> <img
						src="/img/cate-icon/${c.gc_name}.png"><br> <input
						type="hidden" value="${c.gc_name}" class="gc_name"> <span
						class="list-cate"><c:out value="${c.gc_name}" /></span>
					</a>
				</div>
			</c:forEach>

		</div>
	</nav>

	<!-- ================ trending product section start ================= -->
	<section class="section-margin calc-60px">
		<div class=" container-pd">
			<div class="row list_layout">
				<!--리스트 출력 시작 시작 -->
				<c:forEach items="${GoodsList}" var="vo" step="1" varStatus="status">
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
									<fmt:formatNumber value="${vo.g_price }" pattern="#,###" />
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



					<c:if test="${status.count%3 == 0}">
						<%	int adIndex = (int)java.lang.Math.floor(java.lang.Math.random()*8+1); %>
						<a href="<%=urlMap.get(adIndex)%>" target="_blank""> <img
							class="banner" src="/img/banner/banner<%=adIndex%>.png"
							style="width: 100%;">
						</a>
					</c:if>

				</c:forEach>
				<!-- 끝 -->
			</div>
		</div>
	</section>
	<p class="write-goods-form" onclick="location.href='viewGoodsForm.do'">+</p>
	<!-- ================ trending product section end ================= -->



	<!--  footer start -->
	<div class="foot-bar"></div>
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
	<script src="js/main-foot.js"></script>
	<script type="text/javascript">
	
	
	
	function good(gc_name) {
		
		$.ajax({		
			url : "gcList.do",
			type : "post",
			data : {
				"gc_name" : gc_name
			},
			success : clist,
			error : function () {
				console.log("슬패,,")
			}
			
		})
		
	}
	
	
	function clist(data) {
		$("#navbar").css("width","0%")
		$(".write-goods-form").css("display","block");
		
		console.log(data)
		$(".list_layout").html("");

		var list = "";

		if (data.length == 0) {
			
			$(".empty-list").html("")
			
			list = ` <div class="empty-list">
						<p>판매중인 제품이 없어요.</p>
					</div>`
			
			$(".navbar").after(list);
			$("body").css("background-color", "#4c4c4c1c")

		} else {

			$("body").css("background-color", "white")
			$(".empty-list").html("")
			
			for (let i = 0; i < data.length; i++) {
				var vo = data[i]
				console.log(vo.g_name)
				list = `<div id="product-list">
								<div class="card-product__img"
									onclick="viewGoodsContent(${vo.g_seq})">
									<img class="card-img" src="file/\${vo.g_img}">
									<div class="card-body">
										<h4>
											\${vo.g_name}
										</h4>
										<br>
										<p>${apt_name}</p>
										<div class="pr-zzim">
											<p class="price">
												\${vo.g_price}
											</p>
											<div class="zzim-div" onclick="">
												<img class="zzim" src="/img/icon/star-empty.png">
												<p class="zzim-cnt">\${vo.wish_cnt}</p>
											</div>
										</div>
								</div>
							</div>
								<div class="goods-line"></div>`;
				$(".list_layout").append(list);

			}
		}

	}
	</script>







</body>

</html>