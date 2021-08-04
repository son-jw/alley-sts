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
		
		int total = cbs.getTotalCount(cri);
		log.info("total :" + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));

	}

	@PostMapping("/register")
	public String register(Comm_BoardVO cb, RedirectAttributes rttr) {
		log.info("register :" + cb);
		cbs.register(cb);
		rttr.addFlashAttribute("result", cb.getBno());
		log.info("cb.getBno() :" + cb.getBno());

		return "redirect:/commboard/list";
	}
	@GetMapping("/register")
	public void register() {

	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Comm_Criteria cri, Model model ) {
		// @RequestParam : 요청 전달값으로 글번호를 이용
		log.info("/get :" + bno);
		model.addAttribute("cb", cbs.get(bno));
	}

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
	public String remove(@RequestParam("bno") Long bno, Comm_Criteria cri, RedirectAttributes rttr) {
		log.info("remove...." + bno);
		if (cbs.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/commboard/list";
	}

		
}
