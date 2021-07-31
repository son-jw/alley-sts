<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@include file="../includes/header.jsp"%>
  <!-- DataTales Example -->
<div >
   <div >
      <div >
         <table >
            <thead>
               <tr>
                  <th>#번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>수정일</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="commboard" items="${list }">
                  <tr>
                     <td><c:out value="${commboard.bno }" /></td>
                     <td><c:out value="${commboard.title }" /></td>
                     <td><c:out value="${commboard.writer }" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${commboard.regdate }" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd" value="${commboard.updatedate }" /></td>
                     
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
   </div>
</div>  