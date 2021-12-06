<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<link rel="stylesheet" href="css/apt.css">
<body>
		<!-- nav start -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="/">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${root }/notice/listNotice?pg=1&key=&word=">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${root }/member/keyword">Keyword</a>
				</li>
			</ul>
		</nav>		
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
					시도 : 
					<select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : 
					<select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : 
					<select id="dong">
						<option value="0">선택</option>
					</select>
					<button type="button" id="aptSearchBtn">검색</button>
					<table class="table mt-2">
						<colgroup>
							<col width="100">
							<col width="180">
							<col width="*">
							<col width="120">
							<col width="120">
						</colgroup>	
						<thead>
							<tr>
								<th>번호</th>
								<th>아파트이름</th>
								<th class="text-center">주소</th>
								<th>건축연도</th>
								<th>최근거래금액</th>
							</tr>
						</thead>
						<tbody id="searchResult"></tbody>
					</table>
				<div id="map" style="width:100%;height:500px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eae654bdb2d443688750665e20ffa8af&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){					
					$.get(root + "/map/sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get(root + "/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get(root + "/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("#searchResult").empty();
								$.each(data, function(index, vo) {
									var aptname = vo.aptName;
									/* $.get(root + "/map/convenient"
											,{apt: aptname}
											);
									
									$("#searchResult").append("<tr><td>"+vo.aptCode+"</td><td id='aptN'><a href='${root}/map/convenient?aptName="+vo.aptName+"'>"+vo.aptName+"</a></td><td>"
											+vo.sidoName+" "+vo.gugunName+" "+vo.dongName+" "+vo.jibun+"</td><td>"
											+vo.buildYear+"</td><td>"+vo.recentPrice+"</td></tr>"); */

									$("#searchResult").append("<tr><td>"+vo.aptCode+"</td><td>"+vo.aptName+"</td><td>"
											+vo.sidoName+" "+vo.gugunName+" "+vo.dongName+" "+vo.jibun+"</td><td>"
											+vo.buildYear+"</td><td>"+vo.recentPrice+"</td></tr>");
									
								});
								displayMarkers(data);
								alert(vo.aptName);
							}
							, "json"
					);
				});
				
				$(document).on("click", "#aptSearchBtn", function() {
					var param = {
							serviceKey:'+coblBbwkqeolaOr6pj7IH2DaxwRXZDrDiPsu8VsRbAlfBriwJakrds+VGSykRmfVTp7gfP7YO8YRLNFNETslg==',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('10'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
								console.log(data);
								var items = $(data).find('item');
								var jsonArray = new Array();
								$("#searchResult").empty();
								items.each(function() {
									var sigundong = $(this).find('법정동시군구코드').text()+$(this).find('법정동읍면동코드').text();
									
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
									
									$.get(root + "/map/sigundong"
											, {sgd: sigundong}
											, function(data, status){
												$("#dong").empty();
												$("#dong").append('<option value="0">선택</option>');
												$.each(data, function(index, vo) {
													var dong = vo.dongName;
													var gugun = vo.gugunName;
													var sido = vo.sidoName;
													
													jsonObj.sidoName = sido;
													jsonObj.gugunName = gugun;
													jsonObj.dongName = dong;
													
													/* $("#searchResult").append("<tr><td>"+jsonObj.aptCode+"</td><td><a href='${root}/map/convenient?aptName="+jsonObj.aptName+"'>"+jsonObj.aptName+"</a></td><td>"
															+jsonObj.sidoName+" "+jsonObj.gugunName+" "+jsonObj.dongName+" "+jsonObj.jibun+"</td><td>"
															+jsonObj.buildYear+"</td><td>"+jsonObj.recentPirce+"</td></tr>"); */

													$("#searchResult").append("<tr><td>"+jsonObj.aptCode+"</td><td>"+jsonObj.aptName+"</td><td>"
															+jsonObj.sidoName+" "+jsonObj.gugunName+" "+jsonObj.dongName+" "+jsonObj.jibun+"</td><td>"
															+jsonObj.buildYear+"</td><td>"+jsonObj.recentPirce+"</td></tr>");
													
													$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
													
													jsonObj = JSON.stringify(jsonObj);
													jsonArray.push(JSON.parse(jsonObj));
												});
												displayMarkers2(jsonArray);
											}
											, "json"
									);
									
									//String 형태로 파싱한 객체를 다시 json으로 변환
									
									
									
									/* var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.sidoName = sido;
									//jsonObj.gugunName = gugun;
									jsonObj.dongName = dong;
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj)); */
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
					/* var xhr = new XMLHttpRequest();
					var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent(' API KEY ');
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
					queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
					queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
					    	console.log(this.responseXML);
					        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					    }
					};

					xhr.send(''); */
				});
				</script>
				</div>
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
<%@include file="include/footer.jsp" %>