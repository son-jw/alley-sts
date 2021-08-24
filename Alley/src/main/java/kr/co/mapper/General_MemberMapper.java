package kr.co.mapper;

import kr.co.domain.AuthVO;
import kr.co.domain.General_MemberVO;

public interface General_MemberMapper {
	public General_MemberVO read(String userid);//log in
	
	public void signup(General_MemberVO vo);// signup
	public void insertAuth(AuthVO avo);//권한 부여
	
	public int CheckId(General_MemberVO vo); // 아이디 중복 체크
	public int CheckEmail(General_MemberVO vo); //이메일 중복
	public int CheckPhone(General_MemberVO vo);//핸드폰 체크
}
