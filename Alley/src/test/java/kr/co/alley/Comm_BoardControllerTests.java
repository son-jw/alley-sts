package kr.co.alley;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
@WebAppConfiguration
public class Comm_BoardControllerTests {
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	

	@Before
	public void Setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
	}
	
//	@Test
//	public void testList() throws Exception {
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders
//						.get("/commboard/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//				// 글 목록
//		
//	}
//	@Test
//	public void testRegister() throws Exception {
//		String result = mockMvc
//				.perform(MockMvcRequestBuilders.post("/commboard/register")
//					.param("title", "test new title 7.31")
//					.param("content", "test new content 7.31")
//					.param("writer", "user731"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(result);// 글등록
//	}
//	//글 읽기
//	@Test
//	public void testGet() throws Exception {
//		log.info(
//				mockMvc.perform(
//						MockMvcRequestBuilders.get("/commboard/get").param("bno", "1"))
//					.andReturn()
//					.getModelAndView()
//					.getModelMap());
//	}
//	//글 수정
//	@Test
//	public void testModify() throws Exception {
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/commboard/modify")
//				.param("bno", "1")
//				.param("title", "수정된 테스트 새글 제목")
//				.param("content", "수정된 테스트 새글 내용")
//				.param("writer", "user"))
//			.andReturn().getModelAndView().getViewName();
//				
//		
//		log.info(result);
//			
//	}
	//글 삭제
	@Test
	public void testRemove() throws Exception {
		String result = mockMvc.perform(MockMvcRequestBuilders.post("/commboard/remove")
				.param("bno", "2"))
			.andReturn().getModelAndView().getViewName();
		
		log.info(result);
	}

}
