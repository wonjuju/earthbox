<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">어스박스 상품등록</h4>
		</div>
	</nav>
	

	<!--  <div class="panel-heading">게시판 만들기</div> -->
	<div class="panel-body add-body">

		<form class="form-horizontal" action="goodsInsert.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<div class="col-sm-10">
					<input type="text" class="form-control"
						placeholder="상품 이름" name="g_name">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<!-- 상품 카테고리 리스트 출력 시작 -->
					<select class="my-select" name="gc_name">
						<option>카테고리를 선택 해 주세요</option>
					<c:forEach items="${categoryList}" var="vo" step="1">
						<option><c:out value = "${vo.gc_name}" /></option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-10">
					<input type="number" class="form-control"
						placeholder="가격" name="g_price">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="filebox">
						<label for="file">📷</label> <input type="file" name="g_imgg"
							id="file" accept="image/*;capture=camera" > <input
							class="upload-name" value="" readonly>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-10">
					<textarea rows="10" class="form-control"
						name="g_info"></textarea>
				</div>
			</div>

				<input type="hidden" value="${user_id}" name = "seller_id">
				<input type="hidden" value="${user_addr}" name = "user_addr">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit"  class="btn btn-default goods-commit">작성완료</button>
				</div>
			</div>
		</form>

	</div>
	<!-- =========================
     SCRIPTS 
============================== -->


	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/script.js"></script>
	<!-- 쇼핑몰 js <script src="js/shopmain.js"></script> -->


	<script type="text/javascript">
	$(document).ready(function(){ 
		  var fileTarget = $('#file'); 
		  fileTarget.on('change', function(){ // 값이 변경되면
		      var cur=$(".filebox input[type='file']").val();
		    $(".upload-name").val(cur);
		  }); 
		}); 		
		
	</script>

</body>

</html>