package kr.co.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class General_MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	
	private String userPhone;
	private String userEmail;
	
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	
	private boolean enabled;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;

}
