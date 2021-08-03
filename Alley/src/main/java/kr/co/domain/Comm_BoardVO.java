package kr.co.domain;


import java.sql.Date;


import lombok.Data;

@Data
public class Comm_BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	
}
