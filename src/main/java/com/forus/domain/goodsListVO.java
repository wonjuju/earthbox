package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class goodsListVO {
	private int g_seq;
	private String g_name;
	private String g_img;
	private int g_price;
	private int wish_cnt;
	private String g_status;
}
