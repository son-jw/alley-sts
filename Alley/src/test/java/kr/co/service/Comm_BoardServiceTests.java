package kr.co.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.Comm_BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Comm_BoardServiceTests {
	// 어노테이션 전달값이 여러개의 배열 형태하면 {} ㅇ이용
	@Setter(onMethod_ = { @Autowired })
	private Comm_BoardService cbs;

	@Test
	public void testRegister() {
		Comm_BoardVO cb = new Comm_BoardVO();
		cb.setTitle("new title jw");
		cb.setContent("new con jw");
		cb.setWriter("new wri jw");

		cbs.register(cb);
		log.info("created title bno : " + cb.getBno());
	}

}
