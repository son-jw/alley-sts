package kr.co.mapper;

import java.util.List;

import kr.co.domain.Alley_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Alley_BoardMapper {

	public List<Alley_BoardVO> best1();

	public List<Alley_BoardVO> best2();

	public List<Alley_BoardVO> best3();

	// 식당 게시판(전체 뿌리기)
	public List<Alley_BoardVO> getList();

	public List<Alley_BoardVO> getAList(Comm_Criteria cri);

	public int getTotal(Comm_Criteria cri);// 검색 갯수

	public List<Alley_BoardVO> searchList(Comm_Criteria cri); // 검색 목록 표시

	// 가게 뷰
	public Alley_BoardVO view(Long ano);

}