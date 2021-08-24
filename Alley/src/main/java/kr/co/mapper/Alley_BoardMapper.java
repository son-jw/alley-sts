package kr.co.mapper;

import java.util.List;

import kr.co.domain.Alley_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Alley_BoardMapper {
	
	public List<Alley_BoardVO> best1();
	
	public List<Alley_BoardVO> best2();

	public List<Alley_BoardVO> best3();
	
	public List<Alley_BoardVO> getList();
	public int getTotal(Comm_Criteria cri);
	
	public List<Alley_BoardVO> getListWithPaging(Comm_Criteria cri);
	
	public List<Alley_BoardVO> searchList(Comm_Criteria cri);
	
	public Alley_BoardVO view(Long ano);
	
	
}