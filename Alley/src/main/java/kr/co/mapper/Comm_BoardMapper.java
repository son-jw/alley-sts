package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.Comm_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Comm_BoardMapper {
	public List<Comm_BoardVO> getList();

	public void insert(Comm_BoardVO cb); // 쓰기

	public void insertSelectKey(Comm_BoardVO cb);// 글쓰고 글번호 받기

	public Comm_BoardVO read(Long bno);// 읽기

	public int delete(Long bno); // 삭제

	public int update(Comm_BoardVO cb); // 수정
	
	public List<Comm_BoardVO> getListWithPaging(Comm_Criteria cri);
	
	public int getTotalCount(Comm_Criteria cri);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
	
}
