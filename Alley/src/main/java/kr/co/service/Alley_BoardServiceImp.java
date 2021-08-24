package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.Alley_BoardVO;
import kr.co.domain.Comm_Criteria;
import kr.co.mapper.Alley_BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class Alley_BoardServiceImp implements Alley_BoardService {
	
	@Setter(onMethod_= @Autowired)
	private Alley_BoardMapper abm;


	@Override
	public List<Alley_BoardVO> best1() {
		
		return abm.best1();
	}

	@Override
	public List<Alley_BoardVO> best2() {
		
		return abm.best2();
	}

	@Override
	public List<Alley_BoardVO> best3() {
		
		return abm.best3();
	}
	
	//식당 상세보기
	@Override
	public Alley_BoardVO view(Long ano) {
		
		return abm.view(ano);
	}
	
	//식당 전체보기
		@Override
		public List<Alley_BoardVO> getList(Comm_Criteria cri) {
			log.info("getList..");
			return abm.getListWithPaging(cri);
		}
	
	
	//식당 총 갯수
	@Override
	public int getTotal(Comm_Criteria cri) {
		
		return abm.getTotal(cri);
	}
	
	//식당 검색보기
	@Override
	public List<Alley_BoardVO> searchList(Comm_Criteria cri) {
		
		return abm.searchList(cri);
	}

}