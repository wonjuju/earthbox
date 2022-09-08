package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class chatRoomVO {
	
	private int cr_seq;
	private String cr_title;  // 제품 판매자 user_id
	private String user_id;   // 채팅 건 사람 id (구매자)
	private int g_seq;
	private String cr_opendate;
	private String g_img;

}
