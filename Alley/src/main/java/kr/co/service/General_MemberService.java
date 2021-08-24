package kr.co.service;

import kr.co.domain.AuthVO;
import kr.co.domain.General_MemberVO;

public interface General_MemberService {
	
	public General_MemberVO login (String userid);
	
	public void signup(General_MemberVO vo, AuthVO avo);
	public int CheckId(General_MemberVO vo);//아이디 중복 확인
	public int CheckEmail(General_MemberVO vo);//이메일 중복확인
	public int CheckPhone(General_MemberVO vo);//phone 중복 확인
	

}
