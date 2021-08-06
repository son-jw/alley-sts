package kr.co.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	private int replyTotalCnt;// 댓글의 총 개수
	private List<Comm_ReplyVO> list; //댓글 목록
}
