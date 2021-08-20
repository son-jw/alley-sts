package kr.co.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.domain.Alley_ReplyVO;
import kr.co.domain.Comm_Criteria;


public interface Alley_ReplyMapper {
	public int insert(Alley_ReplyVO vo);
	public Alley_ReplyVO read(Long arno);
	public int delete(Long arno);
	public int update(Alley_ReplyVO reply);
	public List<Alley_ReplyVO> getListWithPaging(
			@Param("cri") Comm_Criteria cri,
			@Param("ano") Long ano);
	public int getCountByBno(Long ano);//게시물별 댓글 총갯수
	
	public int deleteAll(Long ano);

}
