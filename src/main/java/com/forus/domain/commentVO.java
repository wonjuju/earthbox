package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class commentVO {
	private int article_seq;
	private int c_like;
	private String cmt_content;
	private String cmt_date;
	private String user_id;
	private String cmt_seq;
}
