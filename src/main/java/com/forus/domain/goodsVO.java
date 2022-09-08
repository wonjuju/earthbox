package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class goodsVO {
	private int g_seq;
	private String gc_name;
	private int loc_seq;
	private String g_name;
	private String g_info;
	private String g_img;
	private int g_price;
	private String seller_id;
	private String user_addr;
	private String seller_nick;

}
