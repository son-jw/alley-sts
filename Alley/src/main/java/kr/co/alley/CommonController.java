package kr.co.alley;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.AuthVO;
import kr.co.domain.General_MemberVO;
import kr.co.service.General_MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/*")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Inject
	BCryptPasswordEncoder pwEncoder;

	private General_MemberService gms;

	@GetMapping("/signup")
	public void generalSignUp() {
		log.info("회원가입 페이지로 이동합니다.");
	}

	@PostMapping("/signup")
	public String signup(General_MemberVO vo, AuthVO avo) throws Exception {
		String inputpw = vo.getUserpw();
		String pw = pwEncoder.encode(inputpw);

		vo.setUserpw(pw);
		gms.signup(vo, avo);

		return "member/customLogin";
	}

	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		log.info("login page");
		if (error != null) {
			model.addAttribute("error", "계정을 확인해 주세요.");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!");
		}
		
		return "/member/customLogin";
	}

	@GetMapping("/customLogout")
	public String logoutGet(HttpSession session) {
		session.invalidate();
		log.info("custom logout");
		
		return "redirect:/";
	}

	// 아이디중복체크
	@ResponseBody
	@PostMapping("/CheckId")
	public int CheckId(General_MemberVO vo) throws Exception {
		int result = gms.CheckId(vo);
		return result;
	}

	// 이메일중복체크
	@ResponseBody
	@PostMapping("/CheckEmail")
	public int CheckEmail(General_MemberVO vo) throws Exception {
		int result = gms.CheckEmail(vo);
		return result;
	}

	// 핸드폰 중복 체크
	@ResponseBody
	@PostMapping("/CheckPhone")
	public int CheckPhone(General_MemberVO vo) throws Exception {
		int result = gms.CheckPhone(vo);
		return result;
	}
	
	//https://offbyone.tistory.com/167
	@Autowired
	private JavaMailSender mailSender;
	
	@ResponseBody
	@PostMapping("/emailAuth")
	public Map<String, Object> SendMail(String mail, HttpSession session, General_MemberVO vo) {
		
		Map<String, Object> map = new HashMap<>();
		String email = vo.getUserEmail(); // 인증 받을 이메일
		String authNum = RandomStringUtils.randomAlphanumeric(10); //랜덤 인증 번호 생성
		
		//authNum의 10자리 번호를 메일로 보내기
		String setfrom="sjuspring5364@gmail.com";
		String tomail=email;
		String title = "먹거리 회원가입을 위한 인증번호 입니다.";
		String content = "먹거리 회원가입 인증번호 입니다. 인증번호는 [" + authNum + "] 입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);//보내는 이(생략할시에 작동 불가)
			messageHelper.setTo(tomail);  //받는이 (인증 확인 받을 메일 주소)
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			map.put("key", authNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
