package kr.co.alley;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.Comm_Criteria;
import kr.co.domain.Comm_ReplyVO;
import kr.co.service.Comm_ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class Comm_ReplyController {
	
	private Comm_ReplyService crs;
	
	
	//요청이 /replies/new로 오면 정보를 조회-> 리턴 ,정보는 json형태, 결과는 평범한 문자열
	@PostMapping(value = "/new" , consumes = "application/json"
					, produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody Comm_ReplyVO vo) {
		//@RequestBody는 json 형태로 받은 값을 객체로 표현,변환.
		log.info("Comm_ReplyVO: " + vo);
		int insertCount = crs.register(vo);
		log.info("Reply insert count: " + insertCount);
		
		return insertCount == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		// ResponseEntity : 웹 페이지 생성(상태 코드 , 헤더 , 응답, 데이터)
		// 3항 연산자 이용.
		// HttpStaus 페이지 상태를 전달.
		// 리턴에 코드는 길지만, 풀이하면,
		// 정상처리 정상 처리의 status 전달하고, - 아니면 오류 스태이터스 전달.
	}
	
	@GetMapping(value="/pages/{bno}/{page}", 
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<Comm_ReplyVO>> getList
			(@PathVariable("page") int page, 
			@PathVariable("bno") Long bno) {
		//@PathVariable : url로 넘겨 받은 값 이용
		log.info("getList......");
		Comm_Criteria cri = new Comm_Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<>(crs.getList(cri, bno),HttpStatus.OK);
		//T<List<ReplyVO>> t = new t<>(); : 댓글목록을 출력하고, 정상 처리 상태를 리턴
	}
	
	//1개의 댓글 읽기
	@GetMapping(value = "/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Comm_ReplyVO> get(
			@PathVariable("rno") Long rno) {
		log.info("get: " + rno);
		return new ResponseEntity<>(crs.get(rno),HttpStatus.OK);
				
	}
	
	// 삭제
	@DeleteMapping(value = "/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		log.info("remove: " + rno);
		
		return crs.remove(rno) == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value="/{rno}" , 
			consumes = "application/json" , 
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody Comm_ReplyVO vo,
				@PathVariable("rno") Long rno) {
		//put,path 모두 수정처리를 가르킴
		// 생성되는 정보의 형태는 json의 일반적인 문자열 이용.
		// @RequestBody : json 으로 생성된 정보를 개체와.
		vo.setRno(rno);
		log.info("rno : " + rno);
		log.info("modify : " + vo);
		
		return crs.modify(vo) == 1? 
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
