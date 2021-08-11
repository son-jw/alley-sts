<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="includes/header.jsp"%>

<script>
	self.location = "alleyboard/main";
</script>
<!-- 로그아웃을 하게 되면,
스프링 시큐리티 설정에 의해서 / 경로로 이동하고 home.jsp 로 호출,
다시 /board/list 로 이동 -->


<%@ include file="includes/footer.jsp"%>