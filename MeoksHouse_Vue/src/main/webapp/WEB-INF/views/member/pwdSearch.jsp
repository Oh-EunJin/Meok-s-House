<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

	<script type="text/javascript">
		function restart() {
			location.href = "/";
		}
	</script>

		<div class="main-container dark-translucent-bg" >
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-auto">
					<!-- main start -->
					<!-- ================ -->
					<div class="main hc-element-visible"
						data-animation-effect="fadeInUpSmall" data-effect-delay="100">
						<div class="form-block p-30 light-gray-bg border-clear">
							<h2 class="title">비밀번호 찾기</h2> <br>
							
							<form action="${root }/member/passwordSearchForm" method="post" id="rform">
								<div class="form-group has-feedback row">
									<label for="inputId"
										class="col-md-4 control-label text-md-right col-form-label">아이디
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="login_id"
											placeholder="" required name="login_id"> <i
											class="fa fa-pencil form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputUserName"
										class="col-md-4 control-label text-md-right col-form-label">이름
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="name"
											placeholder="User Name" required name="name"> <i
											class="fa fa-user form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputPhone"
										class="col-md-4 control-label text-md-right col-form-label">전화번호
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="phone_number"
											placeholder="010-xxx-xxxx" required name="phone_number"> <i
											class="fa fa-lock form-control-feedback pr-4"></i>
									</div>
								</div>
								
								<c:if test="${!empty password}">
								<div class="form-group has-feedback row">
									<label for="password"
										class="col-md-12 control-label text-md-center text-danger col-form-label">
										비밀번호 : ${password } <br>
										로그인 후 비밀번호를 변경해주세요.
									</label>
								</div>
								</c:if>
								
								<div class="form-group row">
									<div class="ml-md-auto col-md-9">
										<input type="submit" class="btn btn-group btn-warning btn-md" value="확인">
										<input type="button" class="btn btn-group btn-danger btn-md" value="취소" onclick="restart()">
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- main end -->
				</div>
			</div>
		</div>

<!-- Footer-->
<%@include file="../include/footer.jsp" %>