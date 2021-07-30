package kr.co.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.domain.Comm_BoardVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/Web-INF/spring/root-context.xml")
@Log4j 
public class CommunityBoardTests {
	@Setter(onMethod_ = @Autowired)
	private Comm_BoardMapper cbm;
	
//	@Test
//	public void testGetList() {
//		cbm.getList().forEach(board -> log.info(board));//board는 그냥 써도 될듯
//	}
	
//	@Test
//	public void testInsert() {
//		Comm_BoardVO cb = new Comm_BoardVO();
//		cb.setTitle("0730새글");
//		cb.setContent("newCon");
//		cb.setWriter("newwriter");
//		
//		cbm.insert(cb);
//		log.info(cb);
//	}
	
//	@Test
//	public void testInsertSelectKey() {
//		Comm_BoardVO board = new Comm_BoardVO();
//		board.setTitle("새로 작성하는 글SelectKey");
//		board.setContent("새로 작성하는 내용SelectKey");
//		board.setWriter("새로운 작성자SelectKey");
//
//		cbm.insertSelectKey(board);
//		log.info(board);
//	}
	
//	@Test
//	public void testRead() {
//		Comm_BoardVO board = cbm.read(7L);
//		// L 은 bno 가 long 타입이라는 것을 알림.
//		
//		log.info(board);
//	}
	
	@Test
	public void testDelete() {
		log.info("delete cnt: " + cbm.delete(3L));
	}
	
//	@Test
//	public void testUpdate() {
//		Comm_BoardVO cb = new Comm_BoardVO();
//		cb.setBno(4L);
//		cb.setTitle("수정된 제목");
//		cb.setContent("수정된 내용");
//		cb.setWriter("수정한 id");
//
//		int count = cbm.update(cb);
//		log.info("update cnt :" + count);
//	}
	
	

}
