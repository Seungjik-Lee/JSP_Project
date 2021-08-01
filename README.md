# <JSP 프로젝트>
이 저장소는 JSP와 공공데이터를 사용한 전문지정병원 프로젝트를 저장한 곳입니다.
- JSP는 Eclipse에서 사용한 환경에서 진행하였습니다.
- Python은 PyCharm을 사용한 환경에서 진행하였습니다.
- DataBase는 MySQL를 사용한 환경에서 진행하였습니다.   

## 제작기간
2021/05/13 ~ 2021/06/13

![img](JSP_홈화면.JPG)
![img](JSP_회원가입.JPG)
![img](JSP_list.JPG)
![img](JSP_D3.JPG)
![img](JSP_Broad.JPG)

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


# # JSP_Festival
팀프로젝트 공유 페이지<br>
공공데이터포털에서 대구 축제 csv파일을 받아서 
https://www.data.go.kr/index.do

 -기존 저장소 위치:https://github.com/dhw1009/JspTeamproject
## # JSP_Festival page

| 화면 | 사진 |
|:---:|---|
|메인 화면|<img src="img/main.png" width="300" height="400">|
|달력 날짜 선택<br>(팝업창)|<img src="img/cal_popup.png" width="300" height="200">|
|축제 상세 페이지|<img src="img/fest_info.png" width="300" height="300">|
|게시판|<img src="img/board.png" width="300" height="300">|

## # 개요

  - JSP 프로젝트 후 프로젝트를 소개하는 역할을 합니다.

## # 주요기능

* 메인화면
  - 사이트는 모든 사용자가 접속 가능하며 달력 화면을 먼저 접합니다. 
  - 달력에는 언제 축제가 있는지 표시됩니다.
  - 달력을 클릭하면 팝업창으로 어떤 축제가 있는지 표시됩니다.

  ```
  //index.jsp -> SelectedDay.jsp로 년월일 정보를 넘겨주고 팝업
  <script type="text/javascript">
  $('document').ready(function(){
      $("#myTable td").click(function(){
          var value = $(this).text();
          if(value>0){
              //년 월 일 넘겨줌
              popup=window.open("SelectedDay.jsp?day="+value+"&month="+<%=month%>+"&year="+<%=year%>, "ppu", "width=300, height=500, left=500, top=50");		    
          }
      });
  })
  </script>
  ```
* 회원가입 및 로그인
  - 기본 로그인 회원가입 형식을 사용했습니다.
  
* 축제 상세
  - 축제 포스터나 간랸한 소개 사진이 있습니다.
  - DB에 저장된 축제 정보를 읽어와 화면에 보여줍니다.
  - DB에 저장된 위도 경로를 읽어와 카카오api를 활용한 지도를 보여줍니다.
  
  
* 게시판
  - 회원들이 작성한 게시글을 읽을 수 있습니다.
  - 로그인을 하지 않은 사용자의 경우 글쓰기를 누르면 로그인창으로 갑니다.
  ```
  /// bbs.jsp -> write.jsp
  <%
      if (userID != null) {
  %>
      <a style="color:white;"><%=userID%>님, 환영합니다!</a>
      <a class="nav-link" href="../login/logoutAction.jsp">Log Out</a>
  <%}else{ %>
      <a href="../login/signin.jsp">Sign Up</a>
      <a href="../login/login.jsp">Log In</a>
  <%} %>
  ```
  - 로그인을 한 사용자의 경우 본인이 작성한 게시물을 수정 삭제할 수 있습니다.

  ```
  ///view.jsp
  <%
      if(userID != null && userID.equals(bbs.getUserID())){
  %>
          <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
          <a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
  <%
      }
  %>
  ```
