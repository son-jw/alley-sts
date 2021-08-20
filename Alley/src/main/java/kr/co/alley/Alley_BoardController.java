package kr.co.alley;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.Alley_ReplyVO;
import kr.co.domain.Comm_Criteria;
import kr.co.domain.PageDTO;
import kr.co.service.Alley_BoardService;
import kr.co.service.Alley_ReplyService;
import kr.co.service.Comm_BoardService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/alleyboard/*")
@AllArgsConstructor
public class Alley_BoardController {

	@Setter(onMethod_ = @Autowired)
	private Comm_BoardService cbs;

	@Setter(onMethod_ = @Autowired)
	private Alley_BoardService abs;

	@Setter(onMethod_ = @Autowired)
	private Alley_ReplyService ars;
	
	/*
	 * @Setter(onMethod_ = @Autowired) private Comm_Criteria cri;
	 */

	@GetMapping("/main")
	public void main(Model model) {
		log.info("메인 페이지");
		model.addAttribute("best1", abs.best1());
		model.addAttribute("best2", abs.best2());
		model.addAttribute("best3", abs.best3());

	}

	@GetMapping("/alist")
	public void alist(Model model, Comm_Criteria cri) {
		log.info("식당 리스트 페이지");

		int total = cbs.getTotal(cri);

		model.addAttribute("alist", abs.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	// 식당 검색보기
	@GetMapping("/search")
	public void alleySearch(Model model, Comm_Criteria cri) {

		int total = abs.getTotal(cri);

		model.addAttribute("alist", abs.searchList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

//		@GetMapping("/local")
//		public void alleyLocal(Model model, Comm_Criteria cri) {
//			
//			int total = abs.getTotal(cri);
//			
//			model.addAttribute("alist", abs.localList(cri));
//			model.addAttribute("pageMaker", new PageDTO(cri,total));
//			
//		}

	// 식당 상세보기
	@GetMapping("/view")
	public void alleyView(@RequestParam("ano") Long ano, Model model) {
		log.info("/view");
		model.addAttribute("alist", abs.view(ano));
	}

	// 가게 리뷰 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(Alley_ReplyVO avo, Principal principal) throws Exception {
		log.info("댓글 작성 확인");
		String userId = principal.getName();
		avo.setReplyer(userId);
		ars.register(avo);
	}
	
	//리뷰 목록 보기
	@ResponseBody
	@RequestMapping(value="/view/replyList", method=RequestMethod.GET)
	public List<Alley_ReplyVO> getReplyList(
			@RequestParam("ano") Long ano , Comm_Criteria cri , Principal principal) 
			throws Exception {
		log.info("리뷰 , 댓글 보기");
		List<Alley_ReplyVO> reply = ars.getList(cri, ano);
		
		return reply;
	}
	
	//리뷰 삭제하기
	@ResponseBody
	@RequestMapping(value="/view/deleteReply" , method=RequestMethod.POST)
	public ResponseEntity<String> deleteReply(Alley_ReplyVO avo, Principal principal) throws Exception {
		
		log.info("리뷰 댓글 삭제");
		
		int rst=0;
		log.info("리뷰 댓글 번호:" + avo.getArno());
		String userId = principal.getName();// 로그인중인 id
		String ID = ars.CheckId(avo.getArno());
		
		if(userId.equals(ID)) {
			//로그인중인 아이디가 작성한 아이디와 같을떄
			avo.setReplyer(userId);
			ars.deleteReply(avo);
			
			rst=1;
		}
		
		return new ResponseEntity<>("rst",HttpStatus.OK);
	}
	
	//리뷰 수정
	@ResponseBody
	@RequestMapping(value="/view/modifyReply", method=RequestMethod.POST)
	public int modifyReply(Alley_ReplyVO avo, Principal principal) throws Exception {
		log.info("리뷰 댓글 수정");
		
		int rst=0;
		
		String userId = principal.getName();
		
		String Id = ars.CheckId(avo.getArno());
		
		if(userId.equals(Id)) {
			avo.setReplyer(userId);
			ars.modifyReply(avo);
			rst = 1;
		}
		
		log.info("result 값 : " + rst);
		return rst;
	}

}
