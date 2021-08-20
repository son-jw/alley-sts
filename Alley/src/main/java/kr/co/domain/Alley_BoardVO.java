package kr.co.domain;

import lombok.Data;

@Data
public class Alley_BoardVO {
   private Long ano; // 식당번호
   private String storename; // 식당이름
   private String subtitle; // 골목이름
   private String address; // 식당주소
   private String storetime; // 식당운영시간
   private String menu; // 식당메뉴
   private String booknumber; // 식당번호
   private String mainimage; // 음식사진
   private String outimage; // 식당외부사진
   
   private String best;
}