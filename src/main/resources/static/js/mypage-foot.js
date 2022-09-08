$(document).ready(loadFooter)
$(document).ready(changeImg)

	function changeImg() {
			var rn = Math.ceil(Math.random()*4)
			console.log(rn)
			
			
			
			$(".mypage-img").attr("src","/img/profile/user"+rn+".jpg")
			
	}

function loadFooter() {

	$(".foot-bar").html("");

	list = `				<div class="foot-div"
			onclick="location.href='index.do'">
			<div>
				<img alt="" src="/img/icon/home-gr.png">
			</div>
		</div>

		<div class="foot-div" onclick="location.href='postList.do'">
			<div>
				<img alt="" src="/img/icon/community-gr.png">
			</div>
		</div>

		<div class="foot-div" onclick="location.href='challengeList.do'">
			<img class=" main-btn" alt="" src="/img/icon/unearth.png">
		</div>

		<div class="foot-div" onclick="location.href='room'">
			<img alt="" src="/img/icon/message-gr.png">
		</div>
		<div class="foot-div"
			onclick="location.href='viewMypage.do'">
			<img alt="" src="/img/icon/me-full.png">
		</div>
`

	$(".foot-bar").html(list);

}

