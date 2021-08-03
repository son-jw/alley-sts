package kr.co.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.Comm_Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Comm_BoardServiceTests {
	// 어노테이션 전달값이 여러개의 배열 형태하면 {} ㅇ이용
	@Setter(onMethod_ = { @Autowired })
	private Comm_BoardService cbs;

//	@Test
//	public void testRegister() {
//		Comm_BoardVO cb = new Comm_BoardVO();
//		cb.setTitle("new title jw");
//		cb.setContent("new con jw");
//		cb.setWriter("new wri jw");
//
//		cbs.register(cb);
//		log.info("created title bno : " + cb.getBno());
//	}
	@Test
	public void testGetList2() {
		cbs.getList(new Comm_Criteria(2,10)).forEach(cb -> log.info(cb));
		// 매개변수로 전달할 cri 를 코드에서 직접 생성하여 전달하고,
		// getList 처리결과, boardVO 의 List 객체 리턴(일종의 객체배열)
		// 요소 하나씩을 board 변수에 대입하고 로그로 출력.
	}

}
