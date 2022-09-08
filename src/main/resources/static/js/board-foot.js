$(document).on('click', '.c-cate', function() {

	console.log("함수실행")
	$(".c-cate").css("background-color", "white")
	$(this).css("background-color", "#599555")

})

$(document).on("click", ".reaction", function(article_seq) {

	var img = $(this).children("img").attr("src")
	var cnt = parseInt($(this).children("#cnt").html())
	var status = "";
	var article_seq = $(this).children("#article_seq").val();
	console.log("자식 : " + article_seq)

	if (img == "/img/icon/gonggam.png") {

		$(this).children("img").attr("src", "/img/icon/love-gr.png");
		cnt = cnt + 1
		console.log($(this).children("#cnt").html(cnt))

		$.ajax({

			url: "reaction.do",
			type: "post",
			data: {
				"status": 1,
				"article_seq": article_seq,
			},
			success: function() {

				console.log("성공")

			},

			error: function() {
				console.log("실패")
			}

		})

	} else {

		$(this).children("img").attr("src", "/img/icon/gonggam.png");
		cnt = cnt - 1
		console.log($(this).children("#cnt").html(cnt))

		$.ajax({

			url: "reaction.do",
			type: "post",
			data: {
				"status": 0,
				"article_seq": article_seq,
			},
			success: function() {

				console.log("성공")

			},

			error: function() {
				console.log("실패")
			}


		})

	}

})


function choiceCategory(c_category_seq) {



	console.log("시퀀스번호" + c_category_seq)

	$.ajax({

		url: "gcList.do",
		type: "post",
		data: {
			"c_category_seq": c_category_seq
		},
		success: function(data) {
			console.log(data)
		},
		error: function() {
			console.log("카테고리 실패")
		}


	})


}
$(document).ready(loadFooter)

function loadFooter() {

	$(".foot-bar").html("");

	list = `		<div class="foot-div" onclick="location.href='index.do'">
			<div>
				<img alt="" src="/img/icon/home-gr.png">
			</div>
		</div>

		<div class="foot-div" onclick="location.href='postList.do'">
			<div>
				<img alt="" src="/img/icon/community-full.png">
			</div>
		</div>

		<div class="foot-div" onclick="location.href='challengeList.do'">
			<img class=" main-btn" alt="" src="/img/icon/unearth.png">
		</div>

		<div class="foot-div" onclick="location.href='room'">
			<img alt="" src="/img/icon/message-gr.png">
		</div>
		<div class="foot-div" onclick="location.href='viewMypage.do'">
			<img alt="" src="/img/icon/me-gr2.png">
		</div>`

	$(".foot-bar").html(list);

}

