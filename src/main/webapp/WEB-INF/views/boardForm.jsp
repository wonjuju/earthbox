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

	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">커뮤니티 글쓰기</h4>
		</div>
	</nav>

	<div class="panel-body add-body">

		<form action="boardInsert.do" id="insertboard" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<div class="col-sm-10">
					<!-- 상품 카테고리 리스트 출력 시작 -->
					<select class="my-select" name="article_category">
						<option>게시글의 주제를 선택해주세요</option>
							<option value="취미생활">취미생활</option>
							<option value="분실센터">분실센터</option>
							<option value="아파트질문">아파트질문</option>
							<option value="아파트소식">아파트소식</option>
							<option value="근처맛집">근처맛집</option>
					</select>
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-10">
					<textarea rows="10" placeholder="아파트 이웃에게 질문하거나 이야기를 해보세요"
						class="form-control" name="article_content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10">
					<div class="filebox">
						<label for="file">📷</label> <input type="file" name="img2"
							id="file" accept="image/*;capture=camera"> <input
							class="upload-name" readonly>
					</div>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button id="insert" type="submit"
						class="btn btn-default goods-commit">완료</button>
				</div>
			</div>
	</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			var fileTarget = $('#file');
			fileTarget.on('change', function() { // 값이 변경되면
				var cur = $(".filebox input[type='file']").val();
				$(".upload-name").val(cur);
			});
		});
	</script>




	</script>

</body>
</html>