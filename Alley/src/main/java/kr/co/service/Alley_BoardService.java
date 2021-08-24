package kr.co.service;

import java.util.List;

import kr.co.domain.Alley_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Alley_BoardService {
	
	public List<Alley_BoardVO> best1();
	
	public List<Alley_BoardVO> best2();
	
	public List<Alley_BoardVO> best3();
	
	public List<Alley_BoardVO> getList(Comm_Criteria cri);
	public int getTotal(Comm_Criteria cri);
	
	public List<Alley_BoardVO> searchList(Comm_Criteria cri);

	public Alley_BoardVO view(Long ano);
	
}