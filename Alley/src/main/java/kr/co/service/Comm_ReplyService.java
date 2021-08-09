package kr.co.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.Comm_Criteria;
import kr.co.domain.Comm_ReplyVO;
import kr.co.domain.ReplyPageDTO;

public interface Comm_ReplyService {
	public int register(Comm_ReplyVO vo);
	
	public Comm_ReplyVO get(Long rno);
	
	public int remove(Long rno);
	
	public int modify(Comm_ReplyVO vo);
	
	public List<Comm_ReplyVO> getList(
			@Param("cri") Comm_Criteria cri, 
			@Param("bno") Long bno);
	
	public ReplyPageDTO getListPage(Comm_Criteria cri, Long bno);
	
}
