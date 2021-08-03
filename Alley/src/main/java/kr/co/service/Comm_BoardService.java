package kr.co.service;

import java.util.List;

import kr.co.domain.Comm_BoardVO;
import kr.co.domain.Comm_Criteria;

public interface Comm_BoardService {
	public void register(Comm_BoardVO cb);// register

	public Comm_BoardVO get(Long bno); // read

	public boolean modify(Comm_BoardVO cb); // modify,update

	public boolean remove(Long bno);// delete

	public List<Comm_BoardVO> getList(Comm_Criteria cri);// 목록
}
