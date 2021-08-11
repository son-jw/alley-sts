package kr.co.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comm_Criteria {
	// 페이징
	private int pageNum;
	private int amount;
	// 검색 사용시
	private String type;
	private String keyword;

	public Comm_Criteria() {
		this(1, 10);
	}

	public Comm_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
		
	}
	
	public String getListLink() {
		UriComponentsBuilder builder
		= UriComponentsBuilder.fromPath("")
		.queryParam("pageNum", this.pageNum)
		.queryParam("amount",this.getAmount())
		.queryParam("type",this.getType())
		.queryParam("keyword",this.getKeyword());
		
		return builder.toUriString();
		
		//기존의 get방식으로 전달하던 page~~
		//즉, 현재 페이지 , 페이지당 게시물수 , 검색 타입, 검색어들을
		//주소창에 get방식으로 붙여서 보냈지만,
		//일일이 값을 호출해서 처리하는 것이 아니라,
		//getListLink 메소드로 한꺼번에 처리하도록 변경
		
	}

}
