# <JSP 프로젝트>
이 저장소는 JSP와 공공데이터를 사용한 전문지정병원 프로젝트를 저장한 곳입니다.
- JSP는 Eclipse에서 사용한 환경에서 진행하였습니다.
- Python은 PyCharm을 사용한 환경에서 진행하였습니다.
- DataBase는 MySQL를 사용한 환경에서 진행하였습니다.   

## 제작기간
2021/05/13 ~ 2021/06/13

## 소개
- JSP
    - 기본 홈페이지 구현
    - 회원가입시 Chaptcha 이용하여 자동가입방지 구현
    - 로그인 전 네비바 숨김 / 로그인 후 네비바 표시
    - DB에 저장한 데이터 사용
    - D3.js를 사용한 그래프 구현
    - 게시판(글쓰기, 글 삭제, 글 수정) 및 댓글 구현
    - 전문지정병원 리스트 및 검색기능을 통한 리스트 필터링 구현
    - 전문지정 기수에 따른 기수별 리스트 구현
- Python
    - 공공데이터 api를 이용해 데이터 크롤링
    - 크롤링한 데이터 분석
    - 분석한 데이터 DB에 저장
- Database : MySQL
    - MySQL Workbench를 활용하여 DB 관리

## # 주요기능

* 메인화면
![img](JSP_홈화면.JPG)
  - 사이트는 로그인 한 회원만 접속 가능하며 네비바와 항목들에 접근 할 수 있습니다.
  - Board에는 게시판이 표시됩니다.
  - Designed Hospital에는 어떤 병원이 있는지 표시됩니다.
  - 건강보험심사평가원 전문병원 지정 현황에는 그래프로 현황들을 나타냅니다.

  ```
  	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp">JSP TeamProject</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto"> 
				<%
					// 로그인 하지 않았을 때 보여지는 화면
					if (userID == null) {
				%>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sign</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="member/signup.jsp">Join</a>
							<a class="dropdown-item" href="member/login.jsp">Login</a>
						</div>
					</li>
				<%
					// 로그인이 되어 있는 상태에서 보여주는 화면
					} else {
				%>
					<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
					<li class="nav-item"><a class="nav-link" href="bbs/bbs.jsp">board</a></li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Designated Hospital</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="broad/broad_1st.jsp">1st Designated Hospital</a> <a class="dropdown-item" href="broad/broad_2nd.jsp">2nd Designated Hospital</a>
								<a class="dropdown-item" href="broad/broad_3rd.jsp">3rd Designated Hospital</a>
								<a class="dropdown-item" href="broad/broad_4th.jsp">4th Designated Hospital</a>
						</div>
					</li>

					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">반갑습니다.<%=userID%>님</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="member/logout.jsp">logout</a>
							<a class="dropdown-item" href="member/withdrawl.jsp">Withdrawal</a>
						</div>
					</li>
				<%
					}
				%>
				</ul>
			</div>
		</div>
	</nav>
  ```
* 회원가입 및 로그인
![img](JSP_회원가입.JPG)
  - 기본 로그인 회원가입 형식을 사용했으며, 캡챠로 보안성을 높였습니다.

  ```
  /// joinA.jsp
  <%
		String userID = null;
		if (session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}
		if (user.getId() == null || user.getPw() == null || user.getName() == null || user.getGender() == null
				|| user.getPhone() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CustomerDBM cdb = new CustomerDBM();
			int result = cdb.join(user);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				session.setAttribute("id", user.getId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='../index.jsp'");
				script.println("</script>");
			}
		}
	%>
  ```

  ```
  ///signup.jsp
  <script type="text/javascript">
	var rand;
	//캡차 이미지 요청 (캐쉬문제로 인해 이미지가 변경되지 않을수있으므로 요청시마다 랜덤숫자를 생성하여 요청)
	function changeCaptcha() {
		rand = Math.random();
		$('#catpcha').html('<img src="CaptChaImg.jsp?rand=' + rand + '"/>');
	}
	$(document).ready(function() {
		changeCaptcha(); //캡차 이미지 요청
		$('#reLoad').click(function() {
			changeCaptcha();
		}); //새로고침버튼에 클릭이벤트 등록
		//확인 버튼 클릭시
		$('#frmSubmit').click(function(){
            if ( !$('#answer').val() ) {
                   alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
            } else {
                   $.ajax({
                          url: 'captchaSubmit.jsp',
                          type: 'POST',
                          dataType: 'text',
                          data: 'answer=' + $('#answer').val(),
                          async: false,      
                          success: function(resp) {
                                alert(resp);
                                $('#OK').removeAttr( 'disabled' );
                                $('#reLoad').attr('disabled',true);
                                $('#frmSubmit').attr('disabled',true);
                          },
                          error: function(){
                              alert("실패?");
                          }
                   });
            }
      });
	});
  </script>
```


* 병원 현황 리스트
![img](JSP_list.JPG)
  - DB에 저장된 병원 정보를 읽어와 화면에 보여줍니다.
  - DB에 저장된 병원의 위치를 읽어 검색에 활용합니다. 지역을 검색하면 지역에 해당하는 병원 리스트가 보여집니다.
  
 ```
    ///broad_1st.jsp
     <div class="jumbotron">
            <div class="container">
                <h1>1st Designated Hospital</h1>
                <p>병원리스트</p>
                <div class="form-inline mb-4">
                    <input type="text" class="form-control col-md-10 mb-2 my-4 mr-4" placeholder="주소를 입력하세요" id="hosp_addr" value="<%=addr%>" />
                    <input type="button" value="검색" id="search" class="btn btn-primary" />
                </div>
                <table class="table table-dark table-hover text-center">
                    <thead>
                        <tr>
                            <th>기수</th>
                            <th>분류</th>
                            <th>이름</th>
                            <th>주소</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (BroadDB bdb : list) {
                                if (bdb.getUnit().equals("1기")) {
                        %>
                        <tr>
                            <td><%=bdb.getUnit()%></td>
                            <td><%=bdb.getGrp()%></td>
                            <td><%=bdb.getName()%></td>
                            <td><%=bdb.getAddr()%></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
  ```

* 병원 현황 그래프
![img](JSP_D3.JPG)
  - 병원의 지역별 현황을 막대그래프 형태로 표시해줌.

 ```
 /// addr.jsp
 <%
		int count = 0;
		int sum = 0;
		String color[] = { "blue", "red", "green", "yellow" };//데이터 별 색깔을 다르게 지정하기 위한 소스
		ArrayList<String> color1 = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			color1.add(i, color[count]);//리스트에 color 추가
			count++;
			if (count > 3) {//데이터는 많지만 4가지 색깔을 돌아가면서 넣게 하기 위한 처리
				count = 0;
			}
		}
	%>
	<div class="jumbotron">
		<p>전국 시,도 지역별 지정 병원 현황</p>
		<div class="grdiv container text-center">
			<%
				for (int i = 0; i < 10; i++) {//전국 시,도 지역별 지정 병원 수 상위 10개 데이터 출력
					GraphDB ct = list.get(i);
			%>
			<span class="<%out.println(color1.get(i));%>"><%=ct.getCityName()%><br />
				<%=ct.getCityNum()%> </span>
			<%
				}
			%>
			<p><전국 시,도 지역별 지정 병원 수 상위 10개 그래프></p>
		</div>
		<p></p>
		<div class="container">
			<table class="table table-hover table-dark table-striped"> <!-- 표 출력을 위한 소스-->
				<thead>
					<tr>
						<th>지역이름</th>
						<th>지정병원 수</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getCityName()%></td>
						<td><%=list.get(i).getCityNum()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<p>총 지정병원 수 : 420개</p>
		</div>
 ```

* 게시판
![img](JSP_Broad.JPG)
  - 회원들이 작성한 게시글을 읽을 수 있습니다.
  - 로그인을 하지 않은 사용자의 경우 글쓰기를 누르면 로그인창으로 갑니다.
  ```
  /// write.jsp
    <div class="container">
            <div class="col-lg-12 mt-4" style="border-radius: 30px;">
                <form method="post" action="writeAction.jsp">
                    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                        <thead>
                            <tr>
                                <th colspan="2" style="background-color: #eeeeee; text-align: center">게시판 글쓰기 양식</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                <input type="text" class="form-control"
                                    placeholder="글 제목" name="bbsTitle" maxlength="50">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <form action="file_uploadAction.jsp" method="post" enctype="multipart/form-data">
                                    파일 : <input type="file" name="file">
                                </form>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 글쓰기 버튼 -->
                    <input type="submit" class="btn btn-primary pull-right mb-3" value="글쓰기">
                </form>
            </div>
        </div>
  ```
  
  - 로그인을 한 사용자의 경우 본인이 작성한 게시물을 수정 삭제할 수 있습니다.

  ```
  ///view.jsp
  <!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary mb-3 ml-2">수정</a>
					<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary mb-3 ml-2">삭제</a>
			<%
				}
			%>
  ```
