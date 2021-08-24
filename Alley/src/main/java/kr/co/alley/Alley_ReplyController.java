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

import kr.co.domain.Alley_ReplyVO;
import kr.co.domain.Comm_Criteria;
import kr.co.service.Alley_ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/alleyreplies/")
@RestController
@Log4j
@AllArgsConstructor
public class Alley_ReplyController {
	private Alley_ReplyService ars;

	// 리뷰 댓글작성
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody Alley_ReplyVO vo) {
		// @RequestBody 는 json 형태로 받은 값을 객체로 변환.
		log.info("Alley_ReplyVO: " + vo);
		int insertCount = ars.register(vo);
		log.info("Reply insert count: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		// ResponseEntity : 웹페이지 생성(상태 코드, 헤더 ,응답, 데이터)
		// 3항 연산자 이용.
		// HttpStatus 페이지 상태를 전달.
		// 리턴에 코드는 길지만, 풀이하면,
		// 정상 처리되면 정상 처리의 status 전달하고, 아니면 오류 statuse 전달.

	}

	// 리뷰 댓글목록
	@GetMapping(value = "/pages/{ano}/{page}", // 덧글에 대한 페이징
			produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<Alley_ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("ano") Long ano) {
		// @PathVariable : url 로 넘겨받은 값 이용.
		log.info("getList..");
		Comm_Criteria cri = new Comm_Criteria(page, 10);
		log.info(cri);

		return new ResponseEntity<>(ars.getList(cri, ano), HttpStatus.OK);
		// T<List<ReplyVO>> t = new T<>();
		// 댓글 목록을 출력하고, 정상 처리 상태를 리턴.
	}

	// 리뷰 댓글 1개 읽기.
	@GetMapping(value = "/{arno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Alley_ReplyVO> get(@PathVariable("arno") Long arno) {
		log.info("get: " + arno);
		return new ResponseEntity<>(ars.get(arno), HttpStatus.OK);

	}

	// 댓글 삭제.
	@DeleteMapping(value = "/{arno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("arno") Long arno) {
		log.info("remove: " + arno);

		return ars.remove(arno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{arno}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody Alley_ReplyVO vo, @PathVariable("arno") Long arno) {
		// put, patch 둘다 수정 처리 가르킴.
		// 생성되는 정보의 형태는 json 에 일반적인 문자열 이용.
		// @RequestBody : json 으로 생성된 정보를 개체화.
		vo.setArno(arno);
		log.info("arno: " + arno);
		log.info("modify: " + vo);

		return ars.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}