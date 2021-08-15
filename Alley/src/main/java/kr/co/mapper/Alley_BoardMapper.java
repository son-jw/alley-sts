package kr.co.mapper;

import java.util.List;

import kr.co.domain.Alley_BoardVO;

public interface Alley_BoardMapper {
   
   public List<Alley_BoardVO> best1();
   
   public List<Alley_BoardVO> best2();

   public List<Alley_BoardVO> best3();
   
   public List<Alley_BoardVO> best4();
   
   public Alley_BoardVO view(Long ano);
   
   //식당 게시판(전체 뿌리기)
   public List<Alley_BoardVO> getAList();
}