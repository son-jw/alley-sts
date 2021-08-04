package kr.co.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Comm_ReplyVO {
	
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;

}
