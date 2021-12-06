<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

	<script type="text/javascript">
		function del() {
			alert("탈퇴하시겠습니까?");
			document.getElementById("rform").action = "${root }/member/delete";
			document.getElementById("rform").submit();
		}
		function update() {
			document.getElementById("rform").action = "${root }/member/update";
			document.getElementById("rform").submit();
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
							<h2 class="title">회원 정보</h2> <br>
							
							<form action="${root }/member/update" method="post" id="rform">
								<div class="form-group has-feedback row">
									<label for="inputId"
										class="col-md-4 control-label text-md-right col-form-label">아이디
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="login_id"
											required name="login_id" value="${loginid }" readonly="readonly"> 
										<i class="fa fa-pencil form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputPwd"
										class="col-md-4 control-label text-md-right col-form-label">비밀번호
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="password" class="form-control" id="password"
											 value="${password }" required name="password">
										<i class="fa fa-pencil form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputUserName"
										class="col-md-4 control-label text-md-right col-form-label">이름
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="name"
											value="${name }" required name="name"> <i
											class="fa fa-user form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputAddress"
										class="col-md-4 control-label text-md-right col-form-label">주소
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="address"
											value="${addr }" required name="address"> <i
											class="fa fa-envelope form-control-feedback pr-4"></i>
									</div>
								</div>
								<div class="form-group has-feedback row">
									<label for="inputPhone"
										class="col-md-4 control-label text-md-right col-form-label">전화번호
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="text" class="form-control" id="phone_number"
											value="${phone }" required name="phone_number"> <i
											class="fa fa-lock form-control-feedback pr-4"></i>
									</div>
								</div>
								
								<div class="form-group row">
									<div class="ml-md-auto col-md-9">
										<input type="button" class="btn btn-group btn-warning btn-md" value="수정" onclick="update()">
										<input type="button" class="btn btn-group btn-danger btn-md" value="탈퇴" onclick="del()">
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