package com.forus.domain;

import org.hibernate.internal.build.AllowSysOut;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class chatVO {
	
	private int chatting_seq;
	private String talker_id;
	private String talk_content;
	private String talk_time;
	private int cr_seq;

	

}
