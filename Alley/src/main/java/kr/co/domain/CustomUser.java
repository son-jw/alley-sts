package kr.co.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	private General_MemberVO gmember;
	
	public CustomUser(String username , String password, 
			Collection <? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// 상속을 받으면서 의무적으로 구현한 생성자
		// <? 익스텐즈 클래스명> : 제네릭 타입의 상위 제한
		// <? super 클래스명> : 제너릭 타입의 하위제한.
		// <?> : 제너릭 타입 제한 없음.
	}
	
	public CustomUser(General_MemberVO vo) {
		super(vo.getUserid(), vo.getUserpw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		this.gmember = vo;
		// 사용자 아이디, 패스워드 , 권한 목록 으로 초기화
	}
	// 사용자가 로그인 창에서 아이디와 패스워드를 입력하면,
	// 해당아이디를 가지고 일치하는 회원 정보를 찾기.(서비스 처리)
}
