<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<script type="text/javascript">
	$(document).ready(function () {
    	var isId = false;
    	// 아이디 중복검사
    	$("#login_id").keyup(function () {
    		var ckid = $("#login_id").val();
    		if(ckid.length < 5 || ckid.length > 16) {
    			$("#idresult").text("아이디는 5자이상 16자이하입니다.").removeClass('text-primary').removeClass('text-danger').addClass('text-dark');
    			isId = false;
    		} else {
                $.ajax({
                	url: '${root}/member/idcheck',
                	data: {'ckid': ckid},
                	type: 'GET',
                  	dataType: 'json',
                  	success: function (response) {
                  		console.log(response);
                  		var cnt = response.idcount;
                    	if(cnt == 0) {
                    		$("#idresult").text(ckid + "는 사용가능합니다.").removeClass('text-dark').removeClass('text-danger').addClass('text-primary');
                    		isId = true;
                    	} else {
                    		$("#idresult").text(ckid + "는 사용할 수 없습니다.").removeClass('text-dark').removeClass('text-primary').addClass('text-danger');
                    		isId = false;
                    	}
                  	}, 
                  	error: function(request, status, error) {
                  		console.log("status : " + request.status + "\tmsg : " + error);
                  	}
				});
    		}
		});
        
        $("#password").keyup(function () {
    		var ckpw = $("#password").val().length;
    		$("#checkpw").text(ckpw);
    		if(ckpw < 6) {
    			$("#checkpw").text("비밀번호는 6자이상 이여야 합니다.").removeClass('text-dark').removeClass('text-primary').addClass('text-danger');
    		} else {
    			$("#checkpw").text("사용가능한 비밀번호 입니다.").removeClass('text-dark').removeClass('text-danger').addClass('text-primary');
    		}
    	});
        
        $("#makepw").click(function () {
        	var make = '';
        	var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        	var charactersLength = characters.length;
        	
        	function rand(min, max) {
        		  return Math.floor(Math.random() * (max - min + 1)) + min;
        	}
        	
        	var length = rand(6, 11);
        	
        	for ( var i = 0; i < length; i++ ) {
        	   make += characters.charAt(Math.floor(Math.random() * charactersLength));
        	}
        	$("#password").val(make);
        	$("#checkpw").text(make + " 는 사용가능한 비밀번호 입니다.").removeClass('text-dark').removeClass('text-danger').addClass('text-primary');
        	
        });
        
        $("#restart").click(function () {
        	location.href = "/";
        });
        
	});
	</script>

<div class="main-container dark-translucent-bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-auto">
				<!-- main start -->
				<!-- ================ -->
				<div class="main hc-element-visible"
					data-animation-effect="fadeInUpSmall" data-effect-delay="100">
					<div class="form-block p-30 light-gray-bg border-clear">
						<h2 class="title">회원 가입</h2>
						<br>

						<form action="${root }/member/regmember" method="post" id="rform">
							<div class="form-group has-feedback row">
								<label for="inputId"
									class="col-md-4 control-label text-md-right col-form-label">아이디
									<span class="text-danger small">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="login_id" required
										name="login_id">
									<div id="idresult" class="mt-1"></div>
								</div>
							</div>
							<div class="form-group has-feedback row">
								<label for="inputPwd"
									class="col-md-4 control-label text-md-right col-form-label">비밀번호
									<span class="text-danger small">*</span>
								</label>
								<div class="col-md-8">
									<input type="password" class="form-control" id="password"
										placeholder="6자리 이상" required name="password">
									<div id="checkpw" class="mt-1"></div>
									<input type="button" class="btn btn-dark btn-sm" id="makepw"
										value="비밀번호 생성" />
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
								<label for="inputAddress"
									class="col-md-4 control-label text-md-right col-form-label">주소
									<span class="text-danger small">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" class="form-control" id="address"
										placeholder="address" required name="address"> <i
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
										placeholder="010-xxx-xxxx" required name="phone_number">
									<i class="fa fa-lock form-control-feedback pr-4"></i>
								</div>
							</div>

							<div class="form-group row">
								<div class="ml-md-auto col-md-9">
									<input type="submit" class="btn btn-group btn-warning btn-md"
										value="등록"> <input type="button" id="restart"
										class="btn btn-group btn-danger btn-md" value="취소"">
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
	<%@include file="../include/footer.jsp"%>