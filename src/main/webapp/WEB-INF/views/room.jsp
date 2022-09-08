<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Room</title>
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
<link href="css/room.css" rel="stylesheet">

</head>

<script type="text/javascript">
	var ws;
	window.onload = function() {
		getRoom();
		createRoom();
	}

	function getRoom() {
		commonAjax('/getRoom', "", 'post', function(result) {
			createChatingRoom(result);
		});
	}

	function createRoom() {
		$("#createRoom").click(function() {
			//var msg = {	roomName : $('#roomName').val()	};
			//var msg = {g_seq : $('#g_seq').val()};
			var msg = {
				g_seq : 73
			};
			commonAjax('/createRoom', msg, 'post', function(result) {

				createChatingRoom(result);
			});

			$("#roomName").val("");
		});
	}

	function goRoom(number, name) {
		location.href = "/moveChating?roomName=" + name + "&" + "roomNumber="
				+ number;
	}

	function createChatingRoom(res) {
		if (res != null) {
			var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
			console.log(res);
			res
					.forEach(function(d, idx) {
						var rn = d.roomName.trim();
						var roomNumber = d.roomNumber;
						tag += "<tr>"
								+ "<td class='num'>"
								+ (idx + 1)
								+ "</td>"
								+ "<td class='room'>"
								+ rn
								+ "</td>"
								+ "<td class='go'><button type='button' onclick='goRoom(\""
								+ roomNumber + "\", \"" + rn
								+ "\")'>참여</button></td>" + "</tr>";
					});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak, contentType) {
		$.ajax({
			url : url,
			data : parameter,
			type : type,
			contentType : contentType != null ? contentType
					: 'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(res) {
				calbak(res);
			},
			error : function(err) {
				console.log('error');
				calbak(err);
			}
		});
	}
</script>

<body>
	<nav class="navbar">
		<div class="navbar__logo add-header">
			<h4 style="display: inline-block;">${user_id}님의 채팅</h4>
		</div>
	</nav>
	<div id="roomContainer" class="roomContainer">
		<c:forEach items="${chatRoomList}" var="vo">
			<div class="chat-room-div" onclick="viewChat(${vo.cr_seq}, '${vo.cr_title}')">
				<div style="width: 83%;
				    display: inline-block;}">
				<c:choose>
					<c:when test="${vo.cr_title == user_id }">
						<p class="chat-user">${vo.user_id}</p>
					</c:when>
					<c:otherwise>
						<p class="chat-user">${vo.cr_title}님</p>
					</c:otherwise>
				</c:choose>
				<!-- 기본값 분단위 -->
				<fmt:parseNumber var="a" value="${vo.cr_opendate/60}"
					integerOnly="true" />
				<c:choose>
					<c:when test="${a == 0}">
						<c:choose>
							<c:when test="${vo.cr_opendate == 0}">
								<p class="chat-time">방금전</p>
							</c:when>
							<c:otherwise>
								<p class="chat-time">${vo.cr_opendate}분전</p>
							</c:otherwise>

						</c:choose>
					</c:when>

					<c:otherwise>
						<c:choose>
							<c:when test="${a < 24}">
								<p class="chat-time">${a}시간전</p>
							</c:when>

							<c:otherwise>
								<fmt:parseNumber var="b" value="${a / 24}" integerOnly="true" />
								<p class=chat-time>${b}일전</p>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
				</div>
			<img src="/file/${vo.g_img}">
			</div>
	
		</c:forEach>




	</div>
	<div></div>

	<!--  footer start -->
	<div class="foot-bar"></div>
	<!--  footer end -->
	
	<script src="js/message-foot.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/script.js"></script>
	<script src="js/message-foot.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		function viewChat(cr_seq , cr_title) {
			
			var name = cr_title
			console.log("roomName=" + name)
			var number = cr_seq
			console.log("roomNumber=" + number)			

			
			location.href="/moveChating?roomName=" + name + "&" + "roomNumber="
			+ number;
			
		}
	
	
	
	</script>
</body>
</html>