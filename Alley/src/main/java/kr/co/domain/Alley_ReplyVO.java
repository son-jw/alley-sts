package kr.co.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Alley_ReplyVO {
	
	private Long arno;
	private Long ano;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;

}
