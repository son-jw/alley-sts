package kr.co.mapper;

import java.util.List;

import kr.co.domain.Comm_BoardAttachVO;

public interface Comm_BoardAttachMapper {
	public void insert(Comm_BoardAttachVO vo);

	public void delete(String uuid);

	public List<Comm_BoardAttachVO> findByBno(Long bno);

	public void deleteAll(Long bno);// 모든 첨부파일 삭제

	public List<Comm_BoardAttachVO> getOldFiles();
}
