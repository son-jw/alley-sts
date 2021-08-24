package kr.co.alley;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.Comm_Criteria;
import kr.co.domain.PageDTO;
import kr.co.service.Alley_BoardService;
import kr.co.service.Alley_ReplyService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/alleyboard/*")
@AllArgsConstructor
public class Alley_BoardController {

	@Setter(onMethod_ = @Autowired)
	private Alley_BoardService abs;

	@Setter(onMethod_ = @Autowired)
	private Alley_ReplyService ars;

	// 메인페이지
	@GetMapping("/main")
	public void mainPageGET(Model model) {
		log.info("메인페이지");
		model.addAttribute("best1", abs.best1());
		model.addAttribute("best2", abs.best2());
		model.addAttribute("best3", abs.best3());

	}

	// 식당 전체보기
	@GetMapping("/alist")
	public void alleyList(Model model, Comm_Criteria cri) {
		log.info("식당리스트 :" + cri);
		model.addAttribute("alist", abs.getList(cri));

		int total = abs.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	// 식당 검색보기
	@GetMapping("/search")
	public void alleySearch(Model model, Comm_Criteria cri) {
		log.info("검색결과");
		int total = abs.getTotal(cri);

		model.addAttribute("alist", abs.searchList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	// 식당 상세보기
	@GetMapping("/view")
	public void alleyView(@RequestParam("ano") Long ano, Model model) {
		log.info("상세페이지");
		model.addAttribute("alist", abs.view(ano));

	}

}