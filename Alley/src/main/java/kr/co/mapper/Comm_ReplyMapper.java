package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.Comm_Criteria;
import kr.co.domain.Comm_ReplyVO;

public interface Comm_ReplyMapper {
	public int insert(Comm_ReplyVO vo);
	public Comm_ReplyVO read(Long rno);
	public int delete(Long rno);
	public int update(Comm_ReplyVO reply);
	public List<Comm_ReplyVO> getListWithPaging(
			@Param("cri") Comm_Criteria cri,
			@Param("bno") Long bno);
	public int getCountByBno(Long bno);//게시물별 댓글 총갯수
}
