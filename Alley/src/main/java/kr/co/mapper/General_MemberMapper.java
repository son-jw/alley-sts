package kr.co.mapper;

import kr.co.domain.General_MemberVO;

public interface General_MemberMapper {
	public General_MemberVO read(String userid);
	
	public int CheckId(General_MemberVO vo); // 아이디 중복 체크

}
