package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.Alley_ReplyVO;
import kr.co.domain.Comm_Criteria;
import kr.co.mapper.Alley_ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class Alley_ReplyServiceImp implements Alley_ReplyService {
	
	@Setter(onMethod_= @Autowired)
	private Alley_ReplyMapper arm;

	@Override
	public int register(Alley_ReplyVO vo) {
		log.info("register----" + vo);
		return arm.insert(vo);
	}

	@Override
	public Alley_ReplyVO get(Long arno) {
		log.info("get----" + arno);

		return arm.read(arno);
	}

	@Override
	public int remove(Long arno) {
		log.info("remove......." + arno);
		return arm.delete(arno);
	}

	@Override
	public int modify(Alley_ReplyVO reply) {
		log.info("modify......." + reply);
		return arm.update(reply);
	}

	@Override
	public List<Alley_ReplyVO> getList(Comm_Criteria cri, Long ano) {
		log.info("get reply list" + ano);
		return arm.getListWithPaging(cri, ano);
	}

}
