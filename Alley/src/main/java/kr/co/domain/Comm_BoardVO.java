package kr.co.domain;


import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Comm_BoardVO {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int replyCnt;
	private List<Comm_BoardAttachVO> attachList;
	
}
