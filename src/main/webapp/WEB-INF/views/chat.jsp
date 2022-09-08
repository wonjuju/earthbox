<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chating</title>
</script>
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
<link href="css/chat.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(chatName)

	
	var ws;

	function wsOpen() {
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"
				+ $("#roomNumber").val());
		wsEvt();
	}

	function wsEvt() {
		ws.onopen = function(data) {
			//소켓이 열리면 동작
		}

		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if (msg != null && msg.trim() != '') {
				var d = JSON.parse(msg);
				if (d.type == "getId") {
					var si = d.sessionId != null ? d.sessionId : "";
					if (si != '') {
						$("#sessionId").val(si);
					}
				} else if (d.type == "message") {
					if (d.sessionId == $("#sessionId").val()) {
						$(".chatting-sec").append(
								"<div class='from-me'>" + d.msg
										+ "</div> <div class='clear'></div>");
					    let chat = document.querySelector('#chating');
					    chat.scrollTop = chat.scrollHeight;
						
					} else {
						$(".chatting-sec").append(
								"<div class='from-them'>" + d.msg
										+ "</div> <div class='clear'></div>");
					    let chat = document.querySelector('#chating');
					    chat.scrollTop = chat.scrollHeight;
						
					}

				} else {
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e) {
			if (e.keyCode == 13) { //enter press
				send();
			}
		});
	}

	function chatName() {
		var userName = $("#userName").val();

		var talker_id = $("#talker_id").val()
		console.log(talker_id)
		
		$("#t").html(talker_id)
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}

	function send() {
		var option = {
			type : "message",
			roomNumber : $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		var roomNumber = $("#roomNumber").val(), chatting = $('#chatting')
				.val();
		$.ajax({
			url : "chatInsert.do",
			type : 'post',
			data : {
				'talk_content' : chatting,
				'cr_seq' : roomNumber
			},
			success : function() {
				console.log("성공");
			},
			error : function() {
				console.log("실패")
			}

		})
		chatting = $('#chatting').val("");

	}
	
	

</script>

<body>
	<nav class="navbar">
		<div class="navbar__logo add-header">
			<c:choose>
				<c:when test="${roomName == user_id}">
					<h4 id="t" style="display: inline-block;"></h4>
				</c:when>

				<c:otherwise>
					<h4 style="display: inline-block;">${roomName}</h4>
				</c:otherwise>
			</c:choose>

		</div>
	</nav>
	<input type="hidden" id="sessionId" value="">
	<input type="hidden" id="roomNumber" value="${roomNumber}">

	<div id="chating" class="chating">
		<section class="chatting-sec">
			<!-- ㅍ출력 -->
			<c:choose>
				<c:when test="${chat == null}">
				</c:when>
				<c:otherwise>
					<c:forEach items="${chat}" var="vo">
						<c:choose>
							<c:when test="${vo.talker_id == user_id }">
								<div class='from-me'>${vo.talk_content}</div>
								<div class='clear'></div>
							</c:when>

							<c:otherwise>
								<div class='from-them'>${vo.talk_content}</div>
								<input type="hidden" value="${vo.talker_id}" id="talker_id" />
								<div class='clear'></div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>




		</section>
	</div>
	
	<div id="yourName">
		<table class="inputTable">
			<tr>

				<th><input type="hidden" name="userName" id="userName"
					value="${user_id}"></th>

			</tr>
		</table>
	</div>
	<div id="yourMsg">
		<div class="inputTable">
			<input id="chatting" class="form-control chat-form"
				placeholder="보내실 메시지를 입력하세요.">
			</th>
			<button onclick="send()" id="sendBtn" class="btn">보내기</button>
			</table>
		</div>
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
</body>