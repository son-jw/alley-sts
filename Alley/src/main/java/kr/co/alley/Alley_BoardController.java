package kr.co.alley;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.service.Alley_BoardService;
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
	
	@GetMapping("/main")
	public void main(Model model) {
		log.info("메인 페이지");
		model.addAttribute("best1", abs.best1());
		model.addAttribute("best2", abs.best2());
		model.addAttribute("best3", abs.best3());
		
		
	}
	
	@GetMapping("/alist")
	public void alist(Model model) {
		log.info("식당 페이지");
		model.addAttribute("list",abs.getAList());
		
	}
	
	
	
	

}
