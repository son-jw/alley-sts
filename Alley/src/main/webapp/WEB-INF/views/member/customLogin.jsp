<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-panel-default" style="text-align: center;">
				<h1>로그인</h1>
				<h2>${error }</h2>
				<h2>${logout }</h2>

				<form method="post" action="member/customLogin">
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
					<div class="form-group" style="padding-left: 35%;">
						<input type="text" name="userid" placeholder="userid"
							class="form-control" style="width: 400px;">
					</div>
					<div class="form-group" style="padding-left: 35%;">
						<input type="password" name="userpw" placeholder="userpw"
							class="form-control" style="width: 400px;">
					</div>
					<div class="form-group">
						<input type="checkbox" name="remember-me">자동 로그인
					</div>
					<div class="form-group">
						<input type="submit" value="login">
					</div>
					
				</form>

			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>