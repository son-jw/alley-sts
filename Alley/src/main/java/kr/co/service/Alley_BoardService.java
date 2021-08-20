package kr.co.service;

import java.util.List;

import kr.co.domain.Alley_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Alley_BoardService {	

	public List<Alley_BoardVO> best1();// 메인표시 1,2,3 의 추천 (베스트 코드)

	public List<Alley_BoardVO> best2();

	public List<Alley_BoardVO> best3();

	public Alley_BoardVO view(Long ano);

	// 전체 리스트
	public List<Alley_BoardVO> getList(Comm_Criteria cri);// 목록
	
	public int getTotal(Comm_Criteria cri);

	public List<Alley_BoardVO> searchList(Comm_Criteria cri); // 검색 목록 표시

}