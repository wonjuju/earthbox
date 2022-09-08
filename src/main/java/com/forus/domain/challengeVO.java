package com.forus.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class challengeVO {

	private int chal_seq;
	private String chal_content;
	private int chal_point;

}
