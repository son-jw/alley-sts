package kr.co.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mapper.General_MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Setter(onMethod_ = { @Autowired })
	private General_MemberMapper gm;
	
//	@Test
//	public void testInsertMember() {
//		String sql="insert into "
//				+ "general_member(userid,userpw,username, "
//				+ "userphone,useremail,useraddr1,useraddr2,useraddr3 ) "
//				+ "values (?,?,?,?,?,?,?,?)";
//		
//		// 100명의 사용자 계정 생성.
//		for(int i=0;i<100;i++) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			
//			try {
//	               con = ds.getConnection();
//	               pstmt = con.prepareStatement(sql);
//	               pstmt.setString(2, pwencoder.encode("pw"+i));// pw0~pw99, 비밀번호의 암호화.
//	               
//	               if(i<80) {// 일반사용자 계정 80개 생성.
//	                  pstmt.setString(1, "user"+i);// user0~user79
//	                  pstmt.setString(3, "일반사용자"+i);
//	                  pstmt.setString(4, "010"+i);
//	                  pstmt.setString(5, i+"abc@.com");
//	                  pstmt.setString(6, "경기도");
//	                  pstmt.setString(7, "부천시");
//	                  pstmt.setString(8, "꿈동산"+i);
//	               }else if(i<90) {// 매니저 계정 10개 생성.
//	                  pstmt.setString(1, "manager"+i);// manager80~manager89
//	                  pstmt.setString(3, "운영자"+i);
//	                  pstmt.setString(4, "010"+i);
//	                  pstmt.setString(5, i+"abc@.com");
//	                  pstmt.setString(6, "경기도");
//	                  pstmt.setString(7, "부천시"+i);
//	                  pstmt.setString(8, "사랑마을"+i);
//	               }else {// 관리자 계정 10개 생성.
//	                  pstmt.setString(1, "admin"+i);// admin90~admin99
//	                  pstmt.setString(3, "관리자"+i);
//	                  pstmt.setString(4, "010"+i);
//	                  pstmt.setString(5, i+"abc@.com");
//	                  pstmt.setString(6, "인천광역시");
//	                  pstmt.setString(7, "서구");
//	                  pstmt.setString(8, "우림필유"+i);
//	               }
//	               
//	               pstmt.executeUpdate();
//	               
//	            }catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				if(pstmt != null) {
//					try {
//						pstmt.close();
//					}catch(Exception e) {}
//				}
//				if(con != null) {
//					try {
//						con.close();
//					}catch(Exception e) {}
//				}
//			}
//		}// end_for
//	}// end_testInsertMember()
	
	@Test
	public void testInsertAuth() {
		//위에서 생성된 100개의 계정에 권한 부여.
		String sql = "insert into general_member_auth (userid,auth) values (?,?)";
		
		for (int i=0; i<100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i<80) {
					pstmt.setString(1, "user" +i);
					pstmt.setString(2, "ROLE_USER");
				} else if(i<90) {
					pstmt.setString(1, "manager" +i);
					pstmt.setString(2, "ROLE_MEMBER");
				} else {
					pstmt.setString(1, "admin" +i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
					}
				}
			}
		}
	}//end_test_testInsertAuth()
}