package kr.co.alley;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.Comm_BoardVO;
import kr.co.domain.Comm_Criteria;
import kr.co.domain.PageDTO;
import kr.co.service.Comm_BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/commboard/*")
@AllArgsConstructor
public class Comm_BoardController {

	private Comm_BoardService cbs;

	@GetMapping("/list")
	public void list(Model model, Comm_Criteria cri) {
		log.info("list: " + cri);
		model.addAttribute("list", cbs.getList(cri));
		// 과거 jsp 에서는 request.setAttribute 로 ArrayList 를 전달했지만
		// 같은 역할을 model 이 대신.
		// 컨트롤러 >> 서비스 >> 매퍼 >> mybatis 순으로 호출하여 처리.
		
		int total = cbs.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/register")
	public String register(Comm_BoardVO cb, RedirectAttributes rttr) {
		log.info("register : " + cb);
		cbs.register(cb);
		rttr.addFlashAttribute("result", cb.getBno());
		// 리다이렉트 시키면서 1회용 값을 전달.

		return "redirect:/commboard/list";
	}
	
	@GetMapping("/register")
	public void register() {

	}

	// 제목 링크를 클릭하여 글 상세보기 - get 방식.
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, Model model, 
			@ModelAttribute("cri") Comm_Criteria cri) {
		log.info("/get");
		model.addAttribute("cb", cbs.get(bno));
	}

	// post 요청으로 /modify 가 온다면, 아래 메소드 수행.
	@PostMapping("/modify")
	public String modify(Comm_BoardVO cb, RedirectAttributes rttr, Comm_Criteria cri) {

		log.info("modify:" + cb);
		if (cbs.modify(cb)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/commboard/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,
			RedirectAttributes rttr, Comm_Criteria cri) {
		
		log.info("remove..." + bno);
		if(cbs.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/commboard/list";
	}

}