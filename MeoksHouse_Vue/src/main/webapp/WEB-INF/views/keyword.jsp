<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>

<link rel="stylesheet" href="../css/keyword.css">
</head>
<body>
	<!-- nav start -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> 동네 정보 </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">APT 매매</a> <a
						class="dropdown-item" href="#">APT 전월세</a> <a
						class="dropdown-item" href="#">주택 매매</a> <a class="dropdown-item"
						href="#">주택 전월세</a> <a class="dropdown-item" href="#">상권 정보</a> <a
						class="dropdown-item" href="#">환경 정보</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="${root }/notice/listNotice?pg=1&key=&word=">Notice</a></li>
			<li class="nav-item"><a class="nav-link" href="#">News</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${root }/member/keyword">Keyword</a></li>
		</ul>
	</nav>
	<section id="index_section">
		<div class="card col-sm-12 mt-1" style="min-height: 500px;">
			<!-- <div class="card-body">
				 출발지 : 
				<input type="text" id="start" name="start" placeholder="출발지를 입력하세요." />
				도착지 :
				<input type="text" id="end" name="end" readonly="readonly" /> 
			</div> -->
			
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="서울 공원" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eae654bdb2d443688750665e20ffa8af&libraries=services"></script>
			<script type="text/javascript" src="../js/keyword.js"></script>
		</div>
	</section>
	<div class="row">
		<div class="col-lg-4">
			<div class="mt-2 p-1">
				<h4>공지사항</h4>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>가용자금 확인 및 대출 계획 <span class="badge badge-danger">30</span></td>
						<td>500</td>
					</tr>
					<tr>
						<td>9</td>
						<td>집 종류 및 지역 선택 <span class="badge badge-info">25</span></td>
						<td>400</td>
					</tr>
					<tr>
						<td>8</td>
						<td>정보 수집 & 집구경 <span class="badge badge-dark">12</span></td>
						<td>300</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-lg-4">
			<div class="mt-2 mb-2">
				<h4>지혜롭게 내집 마련하기</h4>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>가용자금 확인 및 대출 계획 <span class="badge badge-danger">30</span></td>
						<td>500</td>
					</tr>
					<tr>
						<td>9</td>
						<td>집 종류 및 지역 선택 <span class="badge badge-info">25</span></td>
						<td>400</td>
					</tr>
					<tr>
						<td>8</td>
						<td>정보 수집 & 집구경 <span class="badge badge-dark">12</span></td>
						<td>300</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr />
		<div class="col-lg-4">
			<div class="mt-2 mb-2">
				<h4>오늘의 뉴스</h4>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>서울 입주 2년차 아파트 전셋값 1억 올라...</td>
						<td>500</td>
					</tr>
					<tr>
						<td>9</td>
						<td>재건축 대안 뜨는 수직중측 리모델링...</td>
						<td>400</td>
					</tr>
					<tr>
						<td>8</td>
						<td>싸피권 원룸 시세 폭등...</td>
						<td>300</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Footer-->
	<%@include file="include/footer.jsp"%>