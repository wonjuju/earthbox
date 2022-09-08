$(document).ready(loadFooter)

function loadFooter() {

	$(".foot-bar").html("");

	list = `<div class="foot-div"
			onclick="location.href='index.do'">
			<div>
				<img alt="" src="/img/icon/home-full.png">
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
			onclick="location.href='viewMypage.do?'">
			<img alt="" src="/img/icon/me-gr2.png">
		</div>`

	$(".foot-bar").html(list);

}

function viewGoodsContent(g_seq,apt_name){
			
			console.log(g_seq)
			
            var f = document.createElement("form");
            var obj1 = document.createElement('input');
            obj1.setAttribute('type','hidden')
            obj1.setAttribute('name','g_seq')
            obj1.setAttribute('value', g_seq )
            f.appendChild(obj1);
            
            f.setAttribute('method','post');
            f.setAttribute('action','goodsInfo.do')
            document.body.appendChild(f);
		    f.submit();
			}
	

			function sidebar() {
				
				
					//$("#navbar").css("display","block")
					$("#navbar").css("width","100%")
					$(".write-goods-form").css("display","none");
					$(".navbar").css("z-index", "0");
					
			}
			
			function closeside() {
						
						//$("#navbar").css("display","none")
						$("#navbar").css("width","0%")
						$(".write-goods-form").css("display","block");
						$(".navbar").css("z-index", "10");
				
			}
			
			
	