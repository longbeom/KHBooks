<%@ page language='java' contentType='text/html; charset=UTF-8'
import='java.util.*,
java.sql.*,
java.text.*,
com.kh.book.model.vo.Book, 
com.kh.review.model.vo.Review,
com.kh.member.model.vo.Member,
com.kh.author.model.vo.Author'
	pageEncoding='UTF-8'%>
	
<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'>
<%
	Book b=(Book)request.getAttribute("book");
	List<Review> list=(List<Review>)request.getAttribute("reviewList");
	String pageBar=(String)request.getAttribute("pageBar");
	int cnt=(int)request.getAttribute("cnt");
	int avg=(int)request.getAttribute("avg");
	int reviewsize=(int)request.getAttribute("reviewsize");
	int reviewCnt=(int)request.getAttribute("reviewCnt");
%>
<%@ include file='/views/common/header.jsp'%>
<style>
html, body
{
	width:100%; height:100%;
}

.container {
	height:auto;
	background-color: white;
}

.booktitle {
	font-size: 20px;
	font-family: '돋움체 보통';
	font-weight: bold;
	color: black;
	position: relative;
	margin-top: 30px;
}

.booktitle small {
	font-family: 'Courier New', Courier, monospace;
	font-weight: bold;
	color: rgb(59, 56, 56);
}

.writer {
	font-size: 12px;
}

.cover {
	margin-top: 35px;
}

.bookcover {
	size: 100px;
	width: 175px;
	height: 250px;
}

div.bookcover>img{
	border:1px solid lightgrey;
	width: 175px;
	height: 250px;
}

.sell_price strong {
	font-size: 25px;
	color: red;
}

.nom_point strong {
	font-size: 18px;
	color: red;
}

li {
	list-style: none;
}

.priceinfor {
	font-size: 12px;
}

.listprice {
	padding: 0;
}

.bookpicture {
	width: 175px;
	height: 250px;
}

.all {
	margin-left: 40px;
}

.pluslate {
	position: relative;
	top: 10px;
	width: 175px;
}

.pluslate .plus {
	margin-left: 25px;
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
	text-align: center;
}

.pluslate .late {
	font-family: 'Courier New', Courier, monospace;
	color: black;
	background-color: white;
	border-color: white;
	text-shadow: 0;
	border: 0;
	font-size: 11px;
}

.choiceTab {
	position: relative;
	left: 215px;
	color: white;
	text-shadow: 0;
	font-size: 20px;
}

.jangba {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}
.buy {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 95pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}
.jjim {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	width: 30pt;
	height: 30pt;
	padding: 0px;
	background-color: black;
}

.date {
	position: relative;
	top: 5px;
}

.lating {
	position: relative;
	top: 10px;
}

.lating .starlating {
	color: red;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewCount {
	color: black;
	border: 0;
	padding: 0;
	background-color: white;
}

.reviewWrite {
	color: black;
	border: 0;
	padding: 0;
	float:right;
	background-color: white;
}

.priceinfor {
	position: relative;
	top: -8px;
}

.wrline {
	display: inline-block;
	white-space: inherit;
}

.wrline1 {
	display: inline-block;
	white-space: inherit;
}

.biline {
	display: inline-block;
	white-space: inherit;
}

.bsline {
	display: inline-block;
	white-space: inherit;
}

.snline {
	display: inline-block;
	white-space: pre-line;
	text-align: center;
}

.reviewpre {
	display: inline-block;
	width: 1030px;
	border: 1px solid gray;
	white-space: inherit;
}


.allreview {
	border-left-color: black;
	border-right-color: black;
	border-top-color: black;
	border-bottom-color: black;
	font-size: 5px;
}

.reviewWrite {
	-moz-box-shadow:inset 0px 0px 10px 1px #dcecfb;
	-webkit-box-shadow:inset 0px 0px 10px 1px #dcecfb;
	box-shadow:inset 0px 0px 10px 1px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #458dd6), color-stop(1, #3b84cc) );
	background:-moz-linear-gradient( center top, #458dd6 5%, #3b84cc 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#458dd6', endColorstr='#3b84cc');
	background-color:#458dd6;
	-webkit-border-top-left-radius:42px;
	-moz-border-radius-topleft:42px;
	border-top-left-radius:42px;
	-webkit-border-top-right-radius:42px;
	-moz-border-radius-topright:42px;
	border-top-right-radius:42px;
	-webkit-border-bottom-right-radius:42px;
	-moz-border-radius-bottomright:42px;
	border-bottom-right-radius:42px;
	-webkit-border-bottom-left-radius:42px;
	-moz-border-radius-bottomleft:42px;
	border-bottom-left-radius:42px;
	text-indent:0px;
	border:1px solid #ffffff;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:11px;
	font-weight:bold;
	font-style:normal;
	height:25px;
	line-height:25px;
	width:60px;
	text-decoration:none;
	text-align:center;
	text-shadow:0px 0px 0px #528ecc;
}
.reviewWrite:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3b84cc), color-stop(1, #458dd6) );
	background:-moz-linear-gradient( center top, #3b84cc 5%, #458dd6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3b84cc', endColorstr='#458dd6');
	background-color:#3b84cc;
}.reviewWrite:active {
	position:relative;
	top:1px;

.reviewtable {
	margin-bottom: 35px;
}
.sections {
	position: relative;
	margin-left: 10px;
}
#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
}
</style>

<script>
/* 장바구니, 바로구매 버튼 호버 */
function change1(obj) {
	obj.style.background = '#0066ff';
	obj.style.border = 'black';
	obj.style.color = 'white';
}
function change2(obj) {
	obj.style.background = 'black';
	obj.style.border = 'blue';
	obj.style.color = 'white';
}
/* 이미지 크게보기 버튼 */
function showBigPic()
{
	window.open("<%=request.getContextPath()%>/images/book/<%=b.getBookImage()%>","이미지 크게보기","width=500,height=750,top=30,left=200");
}
/* 리뷰쓰기버튼 누르면 해당위치로 이동 */
function fnMove1(){
    var offset = $("#moving").offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}
function fnMove2(){
    var offset = $("#reviewview").offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}
</script>

<section>
	<div class='container'>
		<div class='row section'>
			<div class='sections'>
				<div class='bookpicture col-sm-4'>
					<!-- 대표이미지 -->
					<div class='cover'>
						<div class='bookcover'>
						<!-- 이미지보여주기 -->
							<img class="img-responsive" src='<%=request.getContextPath() %>/images/book/<%=b.getBookImage() %>' onerror="javascript:noImage(this,'L','KOR');' alt="도서 이미지'>
						</div>
						<div class='pluslate'>
							<button class='plus btn-link' onclick="showBigPic();">크게보기</button>
							<span>|</span>
							<button class='late btn-link' onclick='fnMove2()'>리뷰보기</button>
						</div>
					</div>
				</div>
				<div class='all col-sm-8'>
					<div class='alltitle'>
						<!--책제목,작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
						<h1 class='booktitle'>
							<!-- 책 제목 -->
							<strong><%=b.getBookName() %>
							</strong>
						</h1>
						<div class='writer'>
							<!-- 작가이름,관심작가등록,지음,옮김,출판사,출간일 -->
							<span class='name'> <!-- 작가이름, 관심작가등록 --> 
							<span class='popup_load'> <a href='<%=request.getContextPath()%>/author/authorInfo?author=<%=b.getAuthor().getauthorNum()%>'><%=b.getAuthor().getAuthorName() %></a></span>
							</span> 지음 <span class='line'>|</span>
							<!-- 라인 -->
							<!-- 에디터가 있을 때 보여주고 없을 때 옮긴이 없음 -->
							<%if(b.getEditor()!=null) {%>
							<span class='name'><%=b.getEditor() %></span>
							<!-- 옮긴이 -->
							옮김 <span class='line'>|</span>
							<%} else{%>
							옮긴이 없음<span class='line'> |</span>
							<%} %>
							<!-- 라인 -->
							<span class='name' title='출판사'> <!-- 출판사정보 --> <a href='#'><%=b.getPublisher() %></a>
							</span> <br> <span class='date' title='출간일'> <!-- 출간일 -->
								<%=b.getBookDate() %> <span>출간</span>
							</span> 
							<span class='lating'>
								<p>
									<%String rating="";%>
									<%switch(avg) {
									case 0 : rating="이 책은 평점이 없습니다."; break;
									case 1 : rating="★"; break;
									case 2 : rating="★★"; break;
									case 3 : rating="★★★"; break;
									case 4 : rating="★★★★"; break;
									case 5 : rating="★★★★★"; break;
									}%>
									<button class='starlating btn-link' onclick="fnMove2()">
										<%=rating%></button>
									<span class='line'>|</span>
									<button class='reviewCount btn-link'
										onclick="fnMove2();">
										리뷰 <span class='counting'><%=reviewCnt %></span>개
									</button>
									<span class='line'>|</span>
									<button class='reviewgogo btn-link'	onclick="fnMove1()">리뷰쓰러가기</button>
								</p>
							</span>
						</div> 
					</div>
					<!--  -->
					<hr>
					<!--  -->
					<div class='priceinfor'>
						<!-- 가격정보 -->
						<ul class='listprice'>
						<%double oriPrice=b.getPrice()+(b.getPrice()*0.2); 
						int jungga=(int)oriPrice;%>
							<li>정가 : <span class='org_price'><%=jungga %> 원 </span> 
							<br>
								판매가 : <span class='sell_price' title='판매가'> <strong><%=b.getPrice() %> </strong>원</span>
							</li>
							<li>
								<!-- 포인트 -->
								<%double point1 = b.getPrice()/10;
								int point = (int)point1;%>
								<div class='inkpoint'>
									<span class='all_inkpoint'>통합포인트 : </span>
									<span class='nom_point'> [포인트적립]<strong> <%=point %></strong>원 적립 <span style="font-weight:bold;">[10<span style="font-weight:0;">%적립]</span></span></span>
									<br>
									<a href='#' class='returnList' onclick='history.go(-1)'><img style='margin-top:8px' src='<%=request.getContextPath() %>/images/icons/back(-1).png'/></a>
									<!-- <a href='#' 'onclick='' style='top:8px' id="saveButton" alt="책 비교"/>책비교하기</a><br/> -->
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class='choiceTab'>
			<div class='jangbaTab' style='float:left;'>
			<%if(logined!=null) {%>
			<button type="button" class="jangba btn-lg" onmouseout='change2(this)' onmouseover='change1(this)' data-toggle="modal" data-target="#myModal" data-title="수량입력" style='font-weight:bold;'>장바구니담기</button>
			<form action='<%=request.getContextPath()%>/inforconpare_hwang/infoInsertWishEnd' id='jangbaFrm' method='post'>
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="닫기"><span aria-hidden="true">×</span></button>
			        <h4 class="modal-title" id="myModalLabel" style="color:black;">수량입력</h4>
			      </div>
			      <div class="modal-body">
					<input type='hidden' name='bookId' value="<%=b.getBookId()%>"/>
					<p style="font-size:10pt; color:black;"><strong style='font-size:13pt;'><%=b.getBookName() %></strong>의 총 재고는 <strong style="font-size:15pt"><%=b.getStock() %></strong>개 입니다.</p>
					<input type='number' name='bookCount' id='bookCount' max='<%=b.getStock()%>' placeholder='수량을 입력하세요.' onKeyUp="if(this.value><%=b.getStock()%>){this.value='<%=b.getStock()%>';}" style='color:black; width:50%;'/>
					<div class="selectedvalue"></div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="close btn-default pull-left" data-dismiss="modal"></button> <!-- 닫기버튼 -->
			        <input type='button' class="gogo" style='background-color:cornflowerblue;' onclick="fn_insertJangba();" value='장바구니담기'>
			      </div>
			    </div>
			  </div>
			</div>
			</form>
			<%} else{ %>
				<input type="button" class="jangba btn-lg" onmouseout='change2(this)' onmouseover='change1(this)' onclick='loginafter();' style='font-weight:bold;' value="장바구니담기"/>
			<% }%>
			</div>
			<script>
			//엔터키 입력 금지
			$('input[type="number"]').keydown(function(){
				if(event.keyCode===13){
					alert('장바구니 담기를 클릭해주세요!');
					event.preventDefault();
				}
			});
			
			//로그인권한
			function loginafter(){
				alert("로그인 후 이용이 가능합니다!");
				location.href="<%=request.getContextPath()%>/member/login";
			}
			// 장바구니탭에서 모달창 띄어주기
			$('#myModal').on('show.bs.modal', function (event) { // myModal 윈도우가 오픈할때 아래의 옵션을 적용
			  var button = $(event.relatedTarget) // 모달 윈도우를 오픈하는 버튼
			  var titleTxt = button.data('title') // 버튼에서 data-title 값을 titleTxt 변수에 저장
			  var modal = $(this)
			  modal.find('.modal-title').text('책 ' + titleTxt) // 모달위도우에서 .modal-title을 찾아 titleTxt 값을 치환
			})
			
			//장바구니
			function fn_insertJangba() 
			{
				var context=$('[name=bookCount]').val();
				if(context.trim().length==0||context==0)
				{
					alert("입력값이 0이거나 입력하지 않으셨습니다. 다시 입력하세요!");
					return false;
				}
				$('#jangbaFrm').submit();
				return true;
			}
			</script>
			
			
			<div class='buyTab' style='float:left; margin-left:5px;'>
			<%if(logined!=null) {%>
			<form action='<%=request.getContextPath() %>/member/directPay' method='get'>
			<input type="hidden" name="BookId" value="<%=b.getBookId()%>">			
			<input type='submit' class='buy btn-lg' onmouseout='change2(this)' onmouseover='change1(this)' value='구매하기' style='font-weight:bold;'>
			</form>
			<%} else{ %>
			<input type='submit' class='buy btn-lg' onclick='loginafter();' onmouseout='change2(this)' onmouseover='change1(this)' value='구매하기' style='font-weight:bold;'>
			<% }%>
			</div>
			
			
			<div class='jjimTab' style='float:left; margin-left:5px;'>
			<%if(logined!=null) {%>
				<form action='<%=request.getContextPath()%>/inforconpare_hwang/infoInsertJjimEnd' method='post'>
					<input type='hidden' name='bookId' value="<%=b.getBookId()%>"/>
					<input type='submit' class='jjim btn-lg' onmouseout='change2(this)' onmouseover='change1(this)' value='찜' style='font-weight:bold;'>
				</form>
			<%} else{ %>
				<input type="button" class="jjim btn-lg" onmouseout='change2(this)' onmouseover='change1(this)' onclick='loginafter();' style='font-weight:bold;' value="찜"/>
			<% }%>
			</div>
		</div>
		<br>
		<br>
		<br>
		<hr>
		<div class='col-sm-12'>
			<div class='inforstorywr'>
				<table>
					<thead class='writerinfor'>
						<strong>저자소개</strong>
					</thead>
					</br>
					</br>
					<ul>
					<pre class='wrline content' style='width:96%;'>
					<small>
                    <pre class='wrline1 content' style='border: 1px solid gray; width:100%'>
					<small><strong>저자 : <%=b.getAuthor().getAuthorName() %></strong></small>
					</pre><br>
						<%= (b.getAuthor().getAuthorInfo()==null) ? "저자 정보가 없습니다." : b.getAuthor().getAuthorInfo() %>
                	</small>
					</pre>
					</ul>
			<br>
			<br>
				</table>
			</div>

			<div class='inforstorybi'>
				<table>
					<thead class='bookinfor'>
						<strong>책소개</strong>
					</thead>
			<br>
			<br>
					<ul>
						<pre class='biline content' style='width:96%;'>
							<small>
								<%=b.getBookInfo() == null ? "책 소개가 없습니다" : b.getBookInfo() %>
                			</small>
						</pre>
					</ul>
			<br>
			<br>
				</table>
			</div>

			<%if(b.getBookContent()!=null && !b.getBookContent().equals("null")) {%>
				<div class='inforstorybs'>
				   <thead class='bookstroy'>
				      <strong>줄거리</strong>
				   </thead>
				<br>
				<br>
				   <ul>
				      <pre class='bsline content' style='width:96%;'>
				        <small>
			                  <%=b.getBookContent()==null?"줄거리가 없습니다." : b.getBookContent()%>
			             </small>
				      </pre>
				   </ul>
				<br>
				<br>
				</div>
				<%} %>
			
			<div class='inforstorysn'>
				<table>
					<thead class='storynum'>
					
					<!-- 리뷰쓰기버튼 이동 div -->
					<div id='moving'></div>
					
						<strong>목차</strong>
					</thead>
					<br>
					<br>
					<ul>
					<%String msg="이 책은 목차가 없습니다."; %>
						<pre class='snline content' style='width:96%;'>
							<small>
                    		<%if(b.getToc()!=null) {%>
								<%=b.getToc() %>
	                          <%} else{%>
								<%=msg %>
	                          <%} %>
                			</small>
						</pre>
					</ul>
					<br>
					<br>
				</table>
			</div>
			
			
			<style>
			.wrap11 {
			    width: 100%;
			    height: auto;
			    position: relative;
			    display: inline-block;
			    margin-bottom:20px;
			}
			.wrap11 textarea {
			    width: 100%;
			    resize: none;
			    min-height: 7.5em;
			    line-height:1.6em;
			    max-height: 50em;
			    word-break:break-all;
			}
			.wrap11 span {
			    position: absolute;
			    bottom: 5px;
			    right: 5px;
			}
			#counter {
			  background:rgba(255,0,0,0.5);
			  border-radius: 0.5em;
			  padding: 0 .5em 0 .5em;
			  font-size: 0.75em;
			}
			div.button
			{
			   margin: auto;
			   width: 50%;
			}
			</style>
			
			<!-- 리뷰쓰기 카운트 -->
			<script>
			$(function() {
			      $('#content').keyup(function (e){
			          var content = $(this).val();
			          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
			          $('#counter').html(content.length + '/100');
			      });
			$('#content').keyup();
			});
			</script>
			
			<div class='reviewtable'>
				<thead class='reviewth'>
					<strong>회원리뷰</strong>
				</thead>
				</script>
				<br>
				<br>
				<ul>
				<script>
				
				//리뷰작성스크립트
				function fn_insertReview() {
					var context=$('[name=reviewContext]').val();
					if(context.trim().length==0)
					{
						alert("내용을 입력하세요!");
						return false;
					}
					var grade = $('.on').length;
					$('#star_grade').val(grade);
					$('#insertReviewFrm').submit();
					return true;
				}
				</script>
				<style>
				.star_rating {font-size:0; letter-spacing:-4px;}
				.star_rating a {
				    font-size:22px;
				    letter-spacing:0;
				    display:inline-block;
				    margin-left:5px;
				    color:#ccc;
				    text-decoration:none;
				}
				.star_rating a:first-child {margin-left:0;}
				.star_rating a.on {color:red;}
				</style>		
				<pre class='reviewpre' style='width:96%'>
				<div id='reviewview'>
                <form action="<%=request.getContextPath()%>/inforconpare_hwang/infoInsertReviewEnd" id="insertReviewFrm" name="reviewText" method="post">
					<div class="wrappluswritereview" style='background-color:white; padding-top:6px;padding-left: 7px;padding-right:7px;padding-bottom:9px;border: 1px solid silver;'>
	                    <div class="wrap11">
	                    	<input type='hidden' id="bookId" name="bookId" value='<%=b.getBookId() %>'/>
	                    	<input type="hidden" id="star_grade" name="star_grade" value=""/>
	                    	<input type='hidden' id="checkOption" name="checkOption" value='1'/>
	                    	<textarea id="content" id="reviewContext" name="reviewContext" maxlength="100" style="width:100%;" placeholder='100글자 이내의 글만 입력이 가능합니다.'></textarea>
	                    	<span id="counter"></span>
	                    </div>
	                    <div class='writereview' style='margin-top:-15px;'>
	                    	<%if(logined!=null) {%>
	                    	<tr>
								<th><label></label></th>
								<td>
									<span class="star_rating">
									    <a href="#" class="on" style='font-size:15px; font-weight:bold;'>★ </a>
									    <a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
										<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
										<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
										<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
									</span>
								</td>
							</tr>
                    		<button type='button' class="reviewWrite" onclick="fn_insertReview()">리뷰쓰기</button>
							<%} else{ %>
								<tr>
									<th><label></label></th>
									<td>
										<span class="star_rating">
										    <a href="#" class="on" style='font-size:15px; font-weight:bold;'>★ </a>
										    <a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
											<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
											<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
											<a href="#" style='font-size:15px; font-weight:bold;'>★ </a>
										</span>
									</td>
								</tr>
								<input type="button" class="reviewWrite btn-lg" onmouseout='change2(this)' onmouseover='change1(this)' onclick='loginafter();' value="리뷰쓰기"/>
							<% }%>
                    	</div>
                    </div>
				</div>
				<script>
				$(".star_rating a").click(function() {
					$(this).parent().children("a").removeClass("on");
					$(this).addClass("on").prevAll("a").addClass("on");
					return false;
				});
				</script>
				</form>
					
					<hr style='border:0.5px solid lightgray;'>
                    <%for(Review r : list) {%>
	                    <style>
	                    input[type='checkbox'] {
							display: none;
						}
						
						#lala {
							color: royalblue;
							margin-top: 10px;
							cursor: pointer;
							display: inline-block;
						}
						
						#lala:after {
							content: '더보기';
						}
						
						input:checked ~ #lala:after {
							content: '닫기';
						}
						
	                    .inner<%=r.getReviewNum()%> {
							max-height: 26px;
							overflow: hidden;
							transition: all .1s ease;
						}
						
						input:checked+ .inner<%=r.getReviewNum()%> {
							max-height: 1000px;
						}
	                    </style>
	                    <div class='reviews'>
	                        <small>
	                        <span class='info'><strong style='color:#220706;'><%=r.getMember().getMemberId() %></strong></span>
	                        <span class='line'>|</span>
	                        <span class='reviewdate'><%=r.getWriteDate() %></span>
	                        <span class='line'>|</span>
	                        <%String str=""; %>
	                        <%switch(r.getGrade()){
	                        case 1 : str="/images/rating/1.png";break;
	                        case 2 : str="/images/rating/2.png";break;
	                        case 3 : str="/images/rating/3.png";break;
	                        case 4 : str="/images/rating/4.png";break;
	                        case 5 : str="/images/rating/5.png";break;
	                        }%>
	                        <img src="<%=request.getContextPath()%><%=str%>"/>
	                        </small>
	                    </div>
	                    <style>
	                    .alt<%=r.getReviewNum()%> {
							background: url('<%=request.getContextPath()%>/images/icons/modify.png') no-repeat;
							border: none;
							width: 16px;
							height: 16px;
							cursor: pointer;
						}
						.del<%=r.getReviewNum()%> {
							background: url('<%=request.getContextPath()%>/images/icons/deletes.png') no-repeat;
							border: none;
							width: 16px;
							height: 16px;
							cursor: pointer;
						}
						</style>
	                    <div class='content'>
	                        <small>
	                            <input type='checkbox' id='readmore<%=r.getReviewNum()%>' /> 
	                            <div class='inner<%=r.getReviewNum() %>' style='width:100%;'>
	                            <pre id="concontext" style='border:none; white-space:pre-wrap; word-break:break-all; margin-bottom:0px; padding-bottom:0px;'><small><%=r.getReviewContext() %></small></pre>
	                            </div>
	                            
	                            <%if(logined!=null&&(logined.getMemberNum()==r.getMemberNum()||logined.getIsAdmin()==1)) {%>
	                            <div type='hidden' class='delal'>
	                            
								<form action="<%=request.getContextPath()%>/inforconpare_hwang/infoDeleteReview" style='float:right;'>
								<input type="hidden" name="bookId" value="<%=b.getBookId()%>"/>
								<input type="hidden" name="reviewNum" value="<%=r.getReviewNum()%>"/>
								<input type="button" class="del<%=r.getReviewNum() %>" onclick="delete_review<%=r.getReviewNum()%>();"/>
								</form>
								
								<form id="updatefrm" action="<%=request.getContextPath()%>/inforconpare_hwang/infoUpdateReview" style='float:right;'>
								<input type="hidden" name="bookId" value="<%=b.getBookId()%>"/>
								<input type="hidden" name="reviewNum" value="<%=r.getReviewNum()%>"/>
								</form>
								<button type="button" class="alt<%=r.getReviewNum() %>" style='float:right;' onclick="update_review<%=r.getReviewNum()%>();"/>
								<script>
								function delete_review<%=r.getReviewNum()%>(){
									/* console.log($(event.target).parents('form')); */
									if(confirm("정말 삭제하시겠습니까?")==true){
										$(event.target).parents('form').submit();
									}
									else{
										return;
									}
								}
								
								function update_review<%=r.getReviewNum() %>(){
									//모달창띄워주자
									$('#updateModal').modal();						
									$('#renum').val(<%=r.getReviewNum()%>);		
									$('#bid').val(<%=r.getBookId()%>);
									$('#updateContext').val("<%=r.getReviewContext()%>");
									$('#star<%=r.getGrade()%>').parent().children("a").removeClass("on");
									$('#star<%=r.getGrade()%>').addClass("on").prevAll("a").addClass("on");
								}
								
								$(function(){ //저장버튼 클릭 
									$("#saveButton").click(function(){ 
										//입력값 
										var cookie_value = $("#save").val(); 
										//'cookie'라는 key값으로 입력값을 저장한다. 
										//1번째 parameter = 쿠키명
										// 2번째 parameter = 저장하고자 하는 쿠키값
										$.cookie('cookie', cookie_value);
									});
								});

								</script>
		                    	</div>
		                    	<%}%>
								<label id='lala' for='readmore<%=r.getReviewNum()%>'></label>
	                        </small>
	                    </div>
	                    <hr style='border-top: 1px dotted black'>
                    <%} %>
                    <style>
                    .cPage
                    {
                    	font-weight:bold;
                    }
                    </style>
                    <div id="pageer">
						<%=pageBar%>
					</div>
					</div>
					</div>
				</pre>
			</ul>
		</div>
		
		
		<!-- 리뷰 수정 모달창 -->
		<div class="modal" id="updateModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						리뷰 수정
					</div>
					<div class="modal-body">
						<table class="tbl-modal">
							<tr>
								<th><label>평점</label></th>
								<td>
									<p class="star_rating">
									    <a id="star1" href="#">★</a>
									    <a id="star2" href="#">★</a>
										<a id="star3" href="#">★</a>
										<a id="star4" href="#">★</a>
										<a id="star5" href="#">★</a>
									</p>								
								</td>
							</tr>
							<tr>
								<form action="<%=request.getContextPath()%>/review/updateReview2" method="POST" id="updateReviewFrm">
								<th><label for="updateContext">내용</label></th>
								<td>									
									<textarea cols="40" rows="5" name="updateContext" id="updateContext" class="form-control" value="" required></textarea>
									<input type="hidden" id="star_grade1" name="star_grade1" value="">
									<input type="hidden" id="renum" name="renum" value="">			
									<input type="hidden" id="bid" name="bid" value="">							
								</td>
								</form>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="updateRe();">수정</button>
						<button type="button" class="btn" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기 까지 리뷰 수정 모달 -->		

		<style>
			.tbl-modal{
				border-collapse: separate;
				border-spacing: 5px 10px;
				padding: 8px;			
			}

			.tbl-modal th{
				width: 50px;
			}

			.modal {
		        text-align: center;
			}
 
			@media screen and (min-width: 768px) { 
       			.modal:before {
	                display: inline-block;
	                vertical-align: middle;
	                content: " ";
	                height: 100%;
	    	    }
			}	
 
			.modal-dialog {
		        display: inline-block;
		        text-align: left;
		        vertical-align: middle;
			}
		
			div.modal-content{
				width: 400px;
			}
			textarea#updateContext{
				resize: none;
			}
		</style>	
			
		<script>
			// 별점 스크립트
			$(".star_rating a").click(function() {
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on");
				return false;
			});
			
			// 수정 버튼 메소드
			function updateRe() {
				var grade = $('.on').length;
				$('#star_grade1').val(grade);
				$('#updateReviewFrm').submit();
			}
			
				
		</script>		
		
</section>

<%@include file='/views/common/footer.jsp'%>