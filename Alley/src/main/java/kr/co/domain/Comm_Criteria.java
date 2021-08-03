package kr.co.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comm_Criteria {
	private int pageNum;
	private int amount;

	public Comm_Criteria() {
		this(1, 10);
	}

	public Comm_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
