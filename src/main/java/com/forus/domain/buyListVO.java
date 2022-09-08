package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class buyListVO {
	//상품 구매 버튼 누르면 가격, 이미지, title  + 회원 포인트 값 뿌려주기
	private int g_seq;
	private int g_price;
	private String g_img;
	private String g_name;

}
