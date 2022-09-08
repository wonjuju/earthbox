package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class uChallengeVO {
	private String chal_content;
	private String uc_content;
	private String uc_date;
	private String uc_img;
	private int uc_seq;
	private String uc_success;
	private String user_id;
}
