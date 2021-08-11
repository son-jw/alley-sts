package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.Comm_BoardAttachVO;
import kr.co.domain.Comm_BoardVO;
import kr.co.domain.Comm_Criteria;
import kr.co.mapper.Comm_BoardAttachMapper;
import kr.co.mapper.Comm_BoardMapper;
import kr.co.mapper.Comm_ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j // 롬복 로그 이용
@Service // 이 클래스가 서비스의 계증을 맡는다고 알림.
//@AllArgsConstructor // 모든 개배변수에 대한 생성자 생성. (생성자 여러개 아님)
public class Comm_BoardServiceImp implements Comm_BoardService {

	@Setter(onMethod_ = @Autowired)
	private Comm_BoardMapper cbm;
	
	@Setter(onMethod_ = @Autowired)
	private Comm_BoardAttachMapper cbam;
	
	@Setter(onMethod_ = @Autowired)
	private Comm_ReplyMapper crm;
	
	@Transactional
	@Override
	public void register(Comm_BoardVO cb) {
		log.info("register......" + cb);
		cbm.insertSelectKey(cb);
		// mapper 는 인터페이스 객체.
		// mapper 를 통해서 메소드 호출.
		// 호출을 하면 매핑되어 있는 쿼리문이 동작.
		
		if(cb.getAttachList() == null || cb.getAttachList().size() <= 0) {
			return;
		}
		
		cb.getAttachList().forEach(attach -> {
			attach.setBno(cb.getBno());
			cbam.insert(attach);
		});
		
	}

	@Override
	public Comm_BoardVO get(Long bno) {
		log.info("get......" + bno);
		return cbm.read(bno);
	}

	@Transactional
	@Override	
	public boolean modify(Comm_BoardVO cb) {
		log.info("modify....." + cb);
//		return cbm.update(cb) == 1;
		cbam.deleteAll(cb.getBno());
		
		boolean modifyResult = false;//게시물 수정 성공 여부
		modifyResult = cbm.update(cb) == 1;
		
		int attachList = 0;
		if(cb.getAttachList() != null) {
			attachList = cb.getAttachList().size();
		}
		
		if (modifyResult && attachList > 0) {
			cb.getAttachList().forEach(attach -> {
				attach.setBno(cb.getBno());
				cbam.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove....." + bno);
		cbam.deleteAll(bno);
		crm.deleteAll(bno);
		
		return cbm.delete(bno) == 1;
	}

	@Override
	public List<Comm_BoardVO> getList(Comm_Criteria cri) {
		log.info("getList......");
		//
		return cbm.getListWithPaging(cri);
	}
	@Override
	public int getTotal(Comm_Criteria cri) {
		log.info("get total count");
		return cbm.getTotalCount(cri);	
		
	}

	@Override
	public List<Comm_BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno: " + bno);
		return cbam.findByBno(bno);
	}
	
}
