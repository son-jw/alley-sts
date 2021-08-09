package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.Comm_Criteria;
import kr.co.domain.Comm_ReplyVO;
import kr.co.domain.ReplyPageDTO;
import kr.co.mapper.Comm_BoardMapper;
import kr.co.mapper.Comm_ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Comm_ReplyServiceImp implements Comm_ReplyService {
	@Setter(onMethod_ =@Autowired)
	private Comm_ReplyMapper crm;
	
	@Setter(onMethod_=@Autowired)
	private Comm_BoardMapper cbm;
	
	@Transactional
	@Override
	public int register(Comm_ReplyVO vo) {
		log.info("register......" + vo);
		return crm.insert(vo);
	}

	@Override
	public Comm_ReplyVO get(Long rno) {
		log.info("get......" + rno);
		return crm.read(rno);
	}
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove......"+rno);
		return crm.delete(rno);
	}

	@Override
	public int modify(Comm_ReplyVO reply) {
		log.info("modify......" + reply);
		return crm.update(reply);
	}

	@Override
	public List<Comm_ReplyVO> getList(Comm_Criteria cri, Long bno) {
		log.info("get reply list......" + bno);
		return crm.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Comm_Criteria cri, Long bno) {
		return new ReplyPageDTO(crm.getCountByBno(bno),
				crm.getListWithPaging(cri,bno));
		// 각각의 매퍼를 이용하여 댓글의 갯수와 댓글의 목록 추출.
	}
	 
	
	
}
