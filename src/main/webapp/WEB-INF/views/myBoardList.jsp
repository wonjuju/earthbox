<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<link href="css/dropdown.css" rel="stylesheet">

</head>


<body>

	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">내가 쓴 커뮤니티 목록</h4>
		</div>
	</nav>




	<!-- ================ trending product section start ================= -->
	<section class="section-margin calc-60px">
		<div class=" container-pd community-sec">
				<!--리스트 출력 시작 시작 -->
				
				<c:forEach items="${boardList}" var="vo" step="1">
					<c:if test="${vo.user_id eq user_id }">
						<!-- 반목분 시작 -->
						<div class="dropdown zzzmenu">
									<button class="dropbtn ">⁝</button>
									<div class="dropdown-content">
										<a >수정하기</a> 
										<a onclick="deletboard(${vo.article_seq})">삭제하기</a> 
									</div>
								</div>
						<div class="board-sec"
						onclick="location.href='viewBoardInfo.do?article_seq=${vo.article_seq}'">
						<span class="cate">${vo.article_category}</span> <br>
						<div class="board-text">${vo.article_content}</div>

						<c:choose>
							<c:when test="${vo.article_file == null}">
							</c:when>

							<c:otherwise>
								<img class="board-img" src="/file/${vo.article_file}">
							</c:otherwise>

						</c:choose>

						<div class="board-foot">
							<p class="board-nick">${vo.user_id}</p>
							<!--  ff -->
							<!-- 기본값 분단위 -->
							<fmt:parseNumber var="a" value="${vo.article_date/60}"
								integerOnly="true" />
							<c:choose>
								<c:when test="${a == 0}">
									<c:choose>
										<c:when test="${vo.article_date == 0}">
											<p class="datecnt">방금전</p>
										</c:when>
										<c:otherwise>
											<p class="datecnt">${vo.article_date}분전</p>
										</c:otherwise>

									</c:choose>
								</c:when>

								<c:otherwise>
									<c:choose>
										<c:when test="${a < 24}">
											<p class="datecnt">${a}시간전</p>
										</c:when>

										<c:otherwise>
											<fmt:parseNumber var="b" value="${a / 24}" integerOnly="true" />
											<p class="datecnt">${b}일전</p>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="section-line"></div>
					<div class="like">
						<div class="reac-div reaction">
							<img class="reac" src="/img/icon/gonggam.png"> <span>공감하기</span>
							<input type="hidden" value="${vo.article_seq}" id="article_seq">
							<span id="cnt">${vo.c_like}</span>
						</div>

						<div class="reac-div" onclick="location.href='boardInfo.do'">
							<img class="reac" src="/img/icon/datggle.png"> <span>댓글달기</span>
						</div>
					</div>

					<div class="seper-line"></div>
						<!-- 반목분 종료 -->
					</c:if>
				</c:forEach>

			</div>
		</div>
	</section>
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
	<script src="js/board-foot.js"></script>
<script type="text/javascript">

function deletboard(article_seq) {

	$.ajax({

		url: "deleteCommunity.do",
		type: "post",
		data: {
			"article_seq": article_seq
		},
		success: function () {
			window.location.reload();
		},

		error: function() {
			alert("실패")
		}
	})

}

</script>


</body>

</html>