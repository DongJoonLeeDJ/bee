<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bee.www.common.Pagenation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    ArrayList<ArticleVo> list = (ArrayList<ArticleVo>) request.getAttribute("list");
    Pagenation pagenation = (Pagenation) request.getAttribute("pagenation");
    String nowPage = request.getParameter("pn");
%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/schoolInfo.css">
</head>
<body>
<header>
    <div class="header-area">
        <div class="header-main">
            <div class="header-filter">
                <svg width="17" height="17" viewBox="0 0 17 17">
                    <path fill-rule="evenodd"
                          d="M13.66 7.36a6.3 6.3 0 1 1-12.598 0 6.3 6.3 0 0 1 12.598 0zm-1.73 5.772a7.36 7.36 0 1 1 1.201-1.201l3.636 3.635c.31.31.31.815 0 1.126l-.075.075a.796.796 0 0 1-1.126 0l-3.636-3.635z"
                          clip-rule="evenodd"></path>
                </svg>
                <input type="text" placeholder="검색할 내용.."/>
            </div>
            <div class="header-login">
                <%
                    //로그인 상태
                    if (id == null) {
                %>
                <a href="/join.do">
                    <h3 class="join">회원가입</h3>
                </a>
                <a href="/login.do">
                    <h3>로그인</h3></a>
                <% } //로그아웃 상태
                else { %>
                <a href="/profile.do?id=<%=id%>">
                    <h3 class="join">회원정보</h3>
                </a>
                <a href="/logout.do">
                    <h3>로그아웃</h3>
                </a>
                <% } %>
            </div>

        </div>
    </div>
</header>

<section class="title-section">
    <div class="title-logo">
        <a href="/">
            <img src="../images/GoodBee.png">
        </a>
    </div>
</section>

<div class="main-margin">
    <section class="nav-section">
        <nav>
            <ul>
                <li><a href="/schBoard.do?pn=1" style="color: rgb(12, 167, 179);">학원정보</a></li>
                <li><a href="/reviews.do">학원후기</a></li>
                <li><a href="/freeBoard.do">자유게시판</a></li>
            </ul>
        </nav>
    </section>
</div>


<div class="board-container">
    <div class="content-left">
        <div class="head">
            <main class="site-main">
                <article class="post-page">
                    <div class="entry-content">
                        <div class="content-list">
                            <div class="list-header">
                                <div class="board-sort">
                                    <div class="mobile-block">
                                        <%
                                            String[] name = {"서울/수도권", "부산/대구/경상도", "광주/전라도", "충청도", "강원도", "제주도"};
                                            for (int i = 0; i < (name.length / 2); i++) {
                                        %>
                                        <div class="checks etrans">
                                            <input type="checkbox" id="cate-<%=i%>">
                                            <label for="cate-<%=i%>"><%=name[i]%>
                                            </label>
                                        </div>
                                        <% } %>
                                    </div>
                                    <div class="mobile-block">
                                        <%
                                            for (int i = 3; i < name.length; i++) {
                                        %>
                                        <div class="checks etrans">
                                            <input type="checkbox" id="cate-<%=i%>">
                                            <label for="cate-<%=i%>"><%=name[i]%>
                                            </label>
                                        </div>
                                        <% } %>
                                    </div>
                                    <div class="control">
                                        <a href="/schBoardWrite.do" class="searchADNcontrol">글쓰기</a>
                                    </div>
                                </div>
                            </div>
                            <div class="board-list">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="num">번호</th>
                                        <th class="location">지역</th>
                                        <th class="title" style="min-width: 120px;">제목</th>
                                        <th class="user">작성자</th>
                                        <th class="date">작성일</th>
                                        <th class="view">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for (int i = 0; i < list.size(); i++) {
                                    %>
                                    <tr>
                                        <td class="num"><%=list.get(i).getB_sq()%>
                                        </td>
                                        <td class="location"><%=list.get(i).getCate_name()%>
                                        </td>
                                        <td onclick="goDetail(<%=list.get(i).getB_sq()%>)"
                                            class="title"><%=list.get(i).getTitle()%>
                                        </td>
                                        <td class="user"><%=list.get(i).getNickname()%>
                                        </td>
                                        <td class="date"><%=list.get(i).getWriteDate().substring(0, 11)%>
                                        </td>
                                        <td class="view"><%=list.get(i).getHit()%>
                                        </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <%
                                    System.out.println("첫번째 페이지 넘버: "+pagenation.getStartPage());
                                    System.out.println("현재 페이지 : "+nowPage);
                                %>
                                <a href="/schBoard.do?pn=<%=pagenation.getStartPage()-1%>">이전</a>
                                <ul>
                                    <% for(int i=pagenation.getStartPage(); i<=pagenation.getEndPage();i++) { %>
                                    <li><a href="/schBoard.do?pn=<%=i%>">
                                        <%=i%></a>
                                    </li>
                                  <%--  <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>--%>
                                    <% } %>
                                </ul>
                                <a href="/schBoard.do?pn=<%=pagenation.getEndPage()+1%>">다음</a>
                            </div>
                            <div class="search">
                                <form>
                                    <select>
                                        <option>전체</option>
                                        <option value="title">제목</option>
                                        <option value="username">작성자</option>
                                    </select>
                                    <input type="text"/>
                                    <button type="submit" class="searchADNcontrol">검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </article>
            </main>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"
        type="text/javascript" charset="utf-8"></script>
<script>
    function goDetail(num) {
        location.href =
            "/schDetail.do?pn=" + <%=nowPage%> +"&num=" + num;
    }

    $(function () {
        var sBtn = $(".pagination ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
        sBtn.find("a").click(function () {   // sBtn에 속해 있는  a 찾아 클릭 하면.
            sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
            $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
        })
    })
</script>
<!-- 1.  sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
2.  $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다. -->
</body>
</html>