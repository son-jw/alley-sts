package kr.co.mapper;

import java.util.List;

import kr.co.domain.Comm_BoardVO;

public interface Comm_BoardMapper {
	public List<Comm_BoardVO> getList();
	
	public void insert(Comm_BoardVO board); // 쓰기
	
	public void insertSelectKey(Comm_BoardVO board);// 글쓰고 글번호 받기
	
	public Comm_BoardVO read(Long bno);//읽기
	
	public int delete(Long bno); //삭제
	
	public int update(Comm_BoardVO board); //수정
}
