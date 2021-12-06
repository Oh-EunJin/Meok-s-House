<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Framework Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="img/favicon.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
header {
	background-image: url("../resources/main_house.jpg");
	background-position: 30% 30%;
}
</style>
</head>
<body>
	<div class="container">

		<div class="header-container">
			<div class="header-top dark">
				<div class="container">
					<div class="row">
						<div class="col-3 col-sm-6 col-lg-9">
							<!-- header-top-first start -->
							<!-- ================ -->
							<div class="header-top-first clearfix"></div>
							<!-- header-top-first end -->
						</div>
						<div class="col-9 col-sm-6 col-lg-3">
							<!-- header-top-second start -->
							<!-- ================ -->
							<div id="header-top-second" class="clearfix">
								<!-- header top dropdowns start -->
								<!-- ================ -->
								<div id="header_nav_confirm_on"
									class="header-top-dropdown text-right">

									<%-- 로그인 정보 : <div> ${sessionScope.loginid } </div> --%>

									<div class="btn-group">
										<a href="/" class="btn btn-primary btn-sm"><i
											class="fa fa-user pr-2 "></i> HOME </a>
									</div>

									<c:choose>
										<c:when test="${empty loginid }">
											<div class="btn-group">
												<a href="${root }/member/regpage"
													class="btn btn-info btn-sm"><i class="fa fa-user pr-2 "></i>
													Sign Up</a>
											</div>

											<div class="btn-group">
												<a href="${root }/member/login" class="btn btn-info btn-sm"><i
													class="fa fa-user pr-2 "></i> Login </a>
											</div>


										</c:when>
										<c:when test="${!empty loginid }">

											<div class="btn-group">
												<a href="${root }/member/logout"
													class="btn btn-warning btn-sm"><i
													class="fa fa-user pr-2 "></i> Logout</a>
											</div>

											<div class="btn-group">
												<a href="${root }/member/view"
													class="btn btn-warning btn-sm"><i
													class="fa fa-user pr-2 "></i> 회원정보</a>
											</div>


										</c:when>
									</c:choose>

									<!--  header top dropdowns end -->
								</div>
								<!-- header-top-second end -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<header id="index_header" class="jumbotron text-center mb-1">
				<div class="container">
					<div class="text-center my-5">
						<h1 class="fw-bolder">HAPPY HOUSE</h1>
						<p class="lead mb-0">행복한 우리 집</p>
					</div>
				</div>
			</header>
			<br>