
		function viewGoodsContent(g_seq, apt_name) {
			console.log(g_seq)
			console.log(apt_name)

			var f = document.createElement("form");
			var obj1 = document.createElement('input');
			obj1.setAttribute('type', 'hidden')
			obj1.setAttribute('name', 'g_seq')
			obj1.setAttribute('value', g_seq)

			f.appendChild(obj1)

			obj2 = document.createElement('input');
			obj2.setAttribute('type', 'hidden')
			obj2.setAttribute('name', 'apt_name')
			obj2.setAttribute('value', apt_name)
			f.appendChild(obj2);

			f.setAttribute('method', 'post');
			f.setAttribute('action', 'goodsInfo.do')
			document.body.appendChild(f);
			f.submit();
		}



		function saleList() {
			console.log("판매중 ㅇㅇ")
			var user_id = $('#user_id').val();
			console.log("유ㅜ저아이디" +user_id)
			$("#sale").css("background-color", "black");
			$("#finish").css("background-color", "unset");

			$.ajax({

				url: 'goodsSale.do',
				type: 'post',
				data: {

					'user_id': user_id

				},
				success: gglist,
				error: function() {
					console.log("판매중 실패")
				}


			})

		}

		function finishList() {
			console.log("판메ㅐ오나료")
			var user_id = $('#user_id').val();
			$("#sale").css("background-color", "unset");
			$("#finish").css("background-color", "black");


			$.ajax({

				url: "goodsFinishList.do",
				type: 'post',
				data: {
					'user_id': user_id
				},
				success: gglist,
				error: function() {
					console.log("판매완료 실패")
				}


			})

		}

		function gglist(data) {

			console.log(data)
			$("#printlist").html("");

			var list = "";

			if (data.length == 0) {

				list = ` <div class="empty-list">
							<p>판매 내역이 없어요.</p>
						</div>`
				
				$(".navbar").after(list);
				$("body").css("background-color", "#4c4c4c1c")

			} else {

				$(".empty-list").html("");
				$("body").css("background-color", "white")
				
				for (let i = 0; i < data.length; i++) {
					var vo = data[i]
					
					var price =  vo.g_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					console.log("가굑" + price)
					
					console.log(vo.g_name)
					list = `<div id="product-list">
							<div class="dropdown zzzmenu">
									<button class="dropbtn ">⁝</button>
									
									<div class="dropdown-content">
										<a id="finpw">비밀번호 확인</a> 
										<a onclick="updateGoods()">수정하기</a>
										<a onclick="deleteGoods(${vo.g_seq})">삭제하기</a>
									</div>
								</div>
									<div class="card-product__img"
										onclick="viewGoodsContent(${vo.g_seq})">
										<input type="hidden" value="${vo.g_seq}" id="g_seq">
										<img class="card-img" src="file/${vo.g_img}">
										<div class="card-body">
											<h4>
												${vo.g_name}
											</h4>
											<br>
											<div class="pr-zzim">
												<p class="price">${price}</p>
												<div class="zzim-div" onclick="">
													<img class="zzim" src="/img/icon/star-empty.png">
													<p class="zzim-cnt">${vo.wish_cnt}</p>
												</div>
											</div>
									</div>
								</div>

								<div class="goods-line"></div>
							`
					$("#printlist").append(list);

				}
			}

		}

		function deleteGoods(g_seq) {

			$.ajax({

				url: "goodsDelete.do",
				type: "post",
				data: {
					"g_seq": g_seq
				},
				success: function() {
					window.location.reload();
				},

				error: function() {
					alert("실패")
				}
			})

		}
		
		// 페이지 비었는지 확인
		
		$(document).ready(checkNull)	
		
		function checkNull() {
		
		let lgth = $("#lgth").val();
			console.log(lgth.length)
		
			if(lgth.length == '2') {
				
				$(".empty-list").html("");
				
				list = `<div class="empty-list">
				<p>판매 내역이 없어요.</p>
			</div>`

			$(".navbar").after(list);
			$("body").css("background-color", "#4c4c4c1c")
				
			} 
			}

		
		$(document).on("click", "#finpw" , function () {
			
			var g_seq = $("#g_seq").val()
			
			console.log("함수실행" + g_seq )
			
			$.ajax({
				
			url : "pwinfo.do",
			type : "post",
			data : {
				"g_seq" : g_seq
			},
			success : function (data) {
				
				var pw = data.v_machine_pw;
				alert("비밀번호는 " + pw + "입니다")
				
			},
			
			error : function () {
				console.log("실패")
			}
			
			})
			
		})
		