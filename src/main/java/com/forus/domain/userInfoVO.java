package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class userInfoVO {
	@NonNull
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_email;
	private String user_addr;
	private int user_point;
	
	
}
