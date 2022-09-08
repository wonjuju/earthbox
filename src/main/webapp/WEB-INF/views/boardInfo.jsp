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

	<nav class="navbar" style="height: 57.8px">
		<div class="navbar__logo">
			<img class="goback" src="/img/icon/backk.png"
				onclick="location.href='index.do'"/ > <img class="gohomee"
				src="/img/icon/homee.png" onclick="location.href='challengeList.do'"/	>
		</div>
	</nav>
	commentVO


	<!-- ================ trending product section start ================= -->
	<section class="section-margin calc-60px">
		<div class=" container-pd community-sec">
			<div class=" list_layout">

				<div class="board-sec">
					<span class="cate">${community.article_category}</span> <br>

					<div class="board-foot">
						<p class="board-nick" style="margin: 3% 0%;">${community.user_id}</p>
					</div>

					<div class="board-text">${community.article_content}</div>


					<c:choose>
						<c:when test='${community.article_file == null}'>
						</c:when>

						<c:otherwise>
							<img class="board-img" src="/file/${community.article_file}">
						</c:otherwise>

					</c:choose>

					<div class="section-line"></div>
					<div class="like">
						<div class="reac-div reaction">
							<img class="reac" src="/img/icon/gonggam.png"> <span>공감하기</span>
							<span id="cnt">${community.c_like}</span>
						</div>

						<div class="reac-div">
							<img class="reac" src="/img/icon/datggle.png"><span>댓글
								</span>
						</div>
					</div>
					<div class="section-line"></div>
				</div>


				<div class="comment-sec">
					<c:choose>
						<c:when test='${list eq ""}'>
						</c:when>

						<c:otherwise>
							<c:forEach items="${list}" var="vo">


								<div class="comment">
									<p class="board-nick">${vo.user_id}</p>
									<div>${vo.cmt_content}</div>
								</div>

							</c:forEach>
						</c:otherwise>

					</c:choose>

					<!-- 반목분 시작 댓글작성자 닉/ 내용 -->


				</div>


			</div>
		</div>
	</section>
	<!-- ================ trending product section end ================= -->
	<div class="insert-comment col-sm-10 col-sm-10">
		<input class="form-control comment-form" placeholder="댓글을 입력해주세요."
			type="text" id="comment">
		<button class="ok" onclick="insertComment(${community.article_seq})">√</button>
	</div>
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
	<script src="js/board-foot.js"></script>

	<script type="text/javascript">
	
	function insertComment(article_seq) {
		
		console.log(article_seq)
		
		comment = $("#comment").val()
		
		$.ajax({
			
			url : "insertComment.do",
			type: "post",
			data : {
				"cmt_content" : comment,
				"article_seq" : article_seq,
			}, 
			success: function () {
				location.reload();
			},
			error : function () {
				console.log("실패")
			}
			
		})
		
	}

	
	</script>



</body>

</html>