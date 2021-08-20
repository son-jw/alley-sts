package kr.co.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.Alley_ReplyVO;
import kr.co.domain.Comm_Criteria;

public interface Alley_ReplyService {
	public int register(Alley_ReplyVO vo);
	public Alley_ReplyVO get(Long arno);
	public int remove(Long arno);
	public int modify(Alley_ReplyVO vo);
	public List<Alley_ReplyVO> getList(
			@Param("cri") Comm_Criteria cri, @Param("ano") Long ano);

}
