package kr.co.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Alley_ReplyVO {
	
	private Long arno; //식당 댓글 번호
	private Long ano; //식당 번호
	private String reply; // 댓글
	private String replyer; //댓글 작성자
	private Date replydate;
	private Date updatedate;

}
