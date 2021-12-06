<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

	<script type="text/javascript">
        function restart() {
    		location.href = "/";
    	}
        
        $(document).ready(function () {
        	$("#password").keydown(function(key) {
                if (key.keyCode == 13) {
                    login();
                }
            });

            $("#btn_login").click(function () {
                login();
            });
        });
        
        function login() {
        	if (!$("#login_id").val()) {
                alert("아이디 입력!!!");
                return;
            } else if (!$("#password").val()) {
                alert("비밀번호 입력!!!");
                return;
            } else {
                $("#rform").attr("action", "${root}/member/login").submit();
            }
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
						<div class="form-block p-40 light-gray-bg border-clear">
							<h2 class="title">로그인</h2> <br>
							
							<form method="post" id="rform" action="">
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
									<label for="inputPwd"
										class="col-md-4 control-label text-md-right col-form-label">비밀번호
										<span class="text-danger small">*</span>
									</label>
									<div class="col-md-8">
										<input type="password" class="form-control" id="password" required name="password">
									</div>
								</div>
								 <div class="text-danger mb-2">${msg}</div>
								<div class="form-group row">
									<a href="${root }/member/passwordSearchForm" class="btn btn-default btn-md-center ml-md-auto" >비밀번호 찾기</a>
								</div>
								<div class="form-group row">
									<div class="ml-md-auto col-md-9">
										<button type="button" id="btn_login" class="btn btn-group btn-warning btn-md">로그인</button>
										<input type="button" class="btn btn-group btn-danger btn-md" value="취소" onclick="restart()" />
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