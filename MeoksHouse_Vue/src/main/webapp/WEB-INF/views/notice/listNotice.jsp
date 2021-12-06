<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<c:if test="${!empty msg}">
	<script>
		alert("${msg}");
	</script>
</c:if>
<script type="text/javascript">
	$(document).ready(
			function() {
				if ("${key}")
					$("#skey").val("${key}").prop("selected", true);

				$("#mvRegisterBtn").click(function() {
					if("${loginid}" == null || "${loginid}" == ""){
						alert("로그인이 필요합니다.");
						location.href = "${root}/member/login";
						return;
					}
					location.href = "${root}/notice/register";
				});

				$("#searchBtn").click(
						function() {
							var word = $("#sword").val();
							if (word == "") {
								alert("모든 목록을 조회합니다.");
							}
							$("#searchform").attr("action","${root}/notice/listNotice").submit();
						});
				$(".page-item").click(
						function() {
							$("#pg").val(($(this).attr("data-pg")));
							$("#pageform").attr("action",
									"${root}/notice/listNotice").submit();
					});
			});
</script>

<div class="main-container dark-translucent-bg">
	<div class="container">
		<form name="pageform" id="pageform" method="GET" action="">
			<input type="hidden" name="pg" id="pg" value=""> 
			<input type="hidden" name="key" id="key" value="${key}"> 
			<input type="hidden" name="word" id="word" value="${word}">
		</form>
		<div class="container text-center mt-3">
			<div class="col-lg-8 mx-auto">
				
				<h2 class="p-3 mb-3 shadow bg-light">
					<mark class="sky">글목록</mark>
				</h2>
				<div class="m-3 text-right">
					<button type="button" id="mvRegisterBtn" class="btn btn-link">
					글작성
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
  						<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
					</svg>
					</button>
				</div>
				<div class="m-3 row justify-content-end">
					<form id="searchform" class="form-inline" method="get">
						<input type="hidden" name="pg" value="1"> 
						<select id="skey" name="key" class="form-control">
							<option value="login_id">아이디</option>
							<option value="articleno">글번호</option>
							<option value="subject">제목</option>
						</select> 
						<input type="text" class="ml-1 form-control" id="sword" name="word" value="${word}">
						<button type="button" id="searchBtn" class="ml-1 btn btn-outline-primary">검색</button>
					</form>
				</div>
				<c:if test="${!empty articles}">
					<c:forEach var="article" items="${articles}">
						<table class="table text-left">
							<tbody>
								<tr class="table-dark text-light">
									<td>작성자 : ${article.login_id}</td>
									<td class="text-right"><a href="${root }/notice/hit?articleno=${article.articleNo}">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  										<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
									</svg>
									</a>추천  ${article.hits} </td>
								</tr>
								<tr>
									<td colspan="2"><strong>${article.articleNo}.
											${article.subject}</strong></td>
								</tr>
								<tr>
									<td class="p-4" colspan="2" class="table-light">${article.content}</td>
								</tr>
								<tr>
									<td class="text-right" colspan="2">작성일 : ${article.regTime}</td>
								</tr>
								<c:if test="${loginid eq article.login_id}">
									<tr>
										<td colspan="2" class="text-right"><a
											href="${root}/notice/modifyNotice?articleno=${article.articleNo}">수정</a>
											<a
											href="${root}/notice/deleteNotice?articleno=${article.articleNo}">삭제</a>
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</c:forEach>
					<div class="m-3 row justify-content-center">${navigation.navigator}</div>
				</c:if>
				<c:if test="${empty articles}">
					<table class="table table-active text-center">
						<tr class="table-dark">
							<td>작성한 글이 없습니다.</td>
						</tr>
					</table>
				</c:if>
			</div>
		</div>
	</div>
</div>
		<!-- Footer-->
		<%@include file="../include/footer.jsp"%>