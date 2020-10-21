<%@ page import="com.bee.www.vo.ArticleVo" %>
<%@ page import="com.bee.www.common.LoginManager" %>
<%@ page import="com.bee.www.vo.CommentVo" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArticleVo vo = (ArticleVo) request.getAttribute("vo");
    ArrayList<CommentVo> cList = (ArrayList<CommentVo>) request.getAttribute("comment");
    LoginManager lm = LoginManager.getInstance();
    String id = lm.getMemberId(session);
    String nowPage = request.getParameter("pn");
    String filter = request.getParameter("filter");
    String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/index_header.css">
    <link rel="stylesheet" href="css/detail.css">
    <!--jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
            crossorigin="anonymous"></script>
    <!-- Toastr -->
    <link rel="stylesheet" href="../toastr/toastr.css">
    <script src="../toastr/toastr.min.js"></script>
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
                <a href="/profile.do">
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
                <li><a href="/schBoard.do?pn=1&filter=&keyword=&" style="color: rgb(12, 167, 179);">학원정보</a></li>
                <li><a href="/reviews.do">투데이로그</a></li>
                <li><a href="/freeBoard.do?pn=1">자유게시판</a></li>
            </ul>
        </nav>
    </section>
</div>
<div class="detail-auto">
    <div class="detail-container">
        <hr>
        <div class="detail-title">
            <h2 class="title-h2"><%=vo.getTitle()%>
            </h2>
        </div>
        <hr>
        <div class="detail-userInfo">
            <p class="userName"><%=vo.getNickname()%>
            </p>
            <P><%=vo.getWriteDate()%>
            </P>
            <div class="pull-right">
                <div class="content-value">
                    <p><%=vo.getCate_name()%>
                    </p>
                </div>
                <div class="detail-content">
                    <div class="content-count">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 22 22">
                            <defs>
                                <clipPath>
                                    <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect width="32" height="32" x="8" y="8" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect width="32" height="32" x="392.57" y="507.8" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <path d="m0 706.47h1490.93v-706.47h-1490.93v706.47"/>
                                </clipPath>
                                <clipPath>
                                    <path d="m22.2 686.12h1447.73v-667.19h-1447.73v667.19"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="507.8" x="392.57" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                                <clipPath>
                                    <rect y="8" x="8" height="32" width="32" fill="none" rx="16"/>
                                </clipPath>
                            </defs>
                            <path d="m740.86 187.66c0-12.912 12.526-23.416 27.922-23.416 15.397 0 27.923 10.505 27.923 23.416 0 12.912-12.526 23.416-27.923 23.416-1.295 0-2.594-.075-3.871-.223-5.93 3.767-10.308 5.829-13.02 6.131-.094.001-.189.016-.282.016-.872 0-1.678-.434-2.159-1.163-.537-.815-.572-1.848-.094-2.692.022-.04 2.116-3.861 1.512-7.51-6.37-4.458-10.01-10.973-10.01-17.975"
                                  fill="#4d4d4d" transform="matrix(.30328 0 0 .30328-222.16-46.812)"/>
                        </svg>
                        <%=vo.getComment_count()%>
                    </div>
                    <div class="content-count">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512"
                             style="enable-background:new 0 0 512 512;" xml:space="preserve"><g
                                transform="translate(1 1)">
                            <g>
                                <path style="fill:#E2E3E5;"
                                      d="M262.253,511c-5.12,0-8.533-3.413-8.533-8.533v-85.333c0-5.12,3.413-8.533,8.533-8.533		s8.533,3.413,8.533,8.533v85.333C270.787,507.587,267.373,511,262.253,511z"/>
                                <path style="fill:#E2E3E5;"
                                      d="M228.12,459.8c-2.56,0-4.267-0.853-5.973-2.56c-3.413-3.413-3.413-8.533,0-11.947l34.133-34.133		c3.413-3.413,8.533-3.413,11.947,0c3.413,3.413,3.413,8.533,0,11.947l-34.133,34.133C232.387,458.947,230.68,459.8,228.12,459.8z"/>
                                <path style="fill:#E2E3E5;"
                                      d="M296.387,459.8c-2.56,0-4.267-0.853-5.973-2.56l-34.133-34.133c-3.413-3.413-3.413-8.533,0-11.947		c3.413-3.413,8.533-3.413,11.947,0l34.133,34.133c3.413,3.413,3.413,8.533,0,11.947C300.653,458.947,298.947,459.8,296.387,459.8z		"/>
                                <path style="fill:#E2E3E5;"
                                      d="M262.253,101.4c-5.12,0-8.533-3.413-8.533-8.533V7.533c0-5.12,3.413-8.533,8.533-8.533		s8.533,3.413,8.533,8.533v85.333C270.787,97.987,267.373,101.4,262.253,101.4z"/>
                                <path style="fill:#E2E3E5;"
                                      d="M262.253,101.4c-2.56,0-4.267-0.853-5.973-2.56c-3.413-3.413-3.413-8.533,0-11.947l34.133-34.133		c3.413-3.413,8.533-3.413,11.947,0c3.413,3.413,3.413,8.533,0,11.947L268.227,98.84C266.52,100.547,264.813,101.4,262.253,101.4z"/>
                                <path style="fill:#E2E3E5;"
                                      d="M262.253,101.4c-2.56,0-4.267-0.853-5.973-2.56l-34.133-34.133c-3.413-3.413-3.413-8.533,0-11.947		c3.413-3.413,8.533-3.413,11.947,0l34.133,34.133c3.413,3.413,3.413,8.533,0,11.947C266.52,100.547,264.813,101.4,262.253,101.4z"/>
                            </g>
                            <path style="fill:#FFFFFF;"
                                  d="M252.867,387.267c-64.853,0-128.853-24.747-178.347-73.387l-59.733-59.733l61.44-61.44	c49.493-49.493,113.493-74.24,177.493-75.093L252.867,387.267z"/>
                            <path style="fill:#CCCCCC;"
                                  d="M254.573,118.467c64.853,0,128.853,24.747,178.347,73.387l59.733,59.733l-61.44,61.44	c-49.493,49.493-113.493,74.24-177.493,74.24L254.573,118.467z"/>
                            <path style="fill:#E2E3E5;"
                                  d="M458.52,251.587l-61.44,61.44c-98.133,98.133-192,98.133-290.133,0l-59.733-59.733l61.44-61.44	c98.133-98.133,192-98.133,290.133,0L458.52,251.587z"/>
                            <path style="fill:#E0E0E0;"
                                  d="M352.707,253.293c0,55.467-45.227,100.693-100.693,100.693S151.32,308.76,151.32,253.293	S196.547,152.6,252.013,152.6S352.707,197.827,352.707,253.293"/>
                            <path style="fill:#F0F0F0;"
                                  d="M234.947,155.16c-1.707,1.707-3.413,2.56-6.827,2.56c-0.853,0-1.707,0-2.56-0.853	c-1.707,1.707-3.413,2.56-5.973,2.56c-0.853,0-2.56,0-3.413-0.853c-0.853,1.707-2.56,3.413-5.12,4.267	C159,180.76,146.2,225.987,154.733,275.48c2.56,13.653,4.267,24.747,8.533,33.28c3.413,5.12,7.68,9.387,11.947,14.507	c5.12,5.12,10.24,5.973,16.213,8.533c2.56,1.707,4.267,3.413,4.267,5.973c9.387,4.267,19.627,6.827,29.013,12.8	c0.853,0.853,0.853,0.853,1.707,1.707c0,0,0,0,0.853,0c2.56,0,5.12,0.853,6.827,2.56c49.493-6.827,87.893-48.64,87.893-99.84	S284.44,161.987,234.947,155.16"/>
                            <g>
                                <path style="fill:#B6B6B6;"
                                      d="M252.013,362.52c-60.587,0-109.227-48.64-109.227-109.227s48.64-109.227,109.227-109.227		s109.227,48.64,109.227,109.227S312.6,362.52,252.013,362.52z M252.013,161.133c-51.2,0-92.16,41.813-92.16,92.16		s41.813,92.16,92.16,92.16s92.16-41.813,92.16-92.16S303.213,161.133,252.013,161.133z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M253.72,101.4c-5.12,0-8.533-3.413-8.533-8.533V7.533c0-5.12,3.413-8.533,8.533-8.533	c5.12,0,8.533,3.413,8.533,8.533v85.333C262.253,97.987,258.84,101.4,253.72,101.4z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M253.72,101.4c-2.56,0-4.267-0.853-5.973-2.56c-3.413-3.413-3.413-8.533,0-11.947L281.88,52.76	c3.413-3.413,8.533-3.413,11.947,0c3.413,3.413,3.413,8.533,0,11.947L259.693,98.84C257.987,100.547,256.28,101.4,253.72,101.4z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M253.72,101.4c-2.56,0-4.267-0.853-5.973-2.56l-34.133-34.133c-3.413-3.413-3.413-8.533,0-11.947	c3.413-3.413,8.533-3.413,11.947,0l34.133,34.133c3.413,3.413,3.413,8.533,0,11.947C257.987,100.547,256.28,101.4,253.72,101.4z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M253.72,511c-5.12,0-8.533-3.413-8.533-8.533v-85.333c0-5.12,3.413-8.533,8.533-8.533	c5.12,0,8.533,3.413,8.533,8.533v85.333C262.253,507.587,258.84,511,253.72,511z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M219.587,459.8c-2.56,0-4.267-0.853-5.973-2.56c-3.413-3.413-3.413-8.533,0-11.947l34.133-34.133	c3.413-3.413,8.533-3.413,11.947,0c3.413,3.413,3.413,8.533,0,11.947L225.56,457.24C223.853,458.947,222.147,459.8,219.587,459.8z	"/>
                                <path style="fill:#B6B6B6;"
                                      d="M287.853,459.8c-2.56,0-4.267-0.853-5.973-2.56l-34.133-34.133c-3.413-3.413-3.413-8.533,0-11.947	c3.413-3.413,8.533-3.413,11.947,0l34.133,34.133c3.413,3.413,3.413,8.533,0,11.947C292.12,458.947,290.413,459.8,287.853,459.8z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M255.427,400.067c-67.413,0-133.12-26.453-183.467-76.8L8.813,260.12	c-1.707-1.707-2.56-4.267-2.56-5.973c0-1.707,0.853-4.267,2.56-5.973l61.44-61.44c8.533-8.533,17.92-16.213,27.307-23.893	c3.413-2.56,9.387-1.707,11.947,1.707c2.56,3.413,1.707,9.387-1.707,11.947C99.267,183.32,89.88,191,82.2,198.68l-55.467,55.467	l57.173,57.173C155.587,383,261.4,402.627,353.56,361.667c4.267-1.707,9.387,0,11.093,4.267c1.707,4.267,0,9.387-4.267,11.093			C327.107,392.387,291.267,400.067,255.427,400.067z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M408.173,348.013c-2.56,0-5.12-0.853-6.827-3.413c-2.56-3.413-1.707-9.387,1.707-11.947			c8.533-6.827,17.067-13.653,24.747-21.333l55.467-55.467l-57.173-57.173c-69.12-69.12-171.52-89.6-261.973-53.76			c-2.56,0.853-5.12,2.56-8.533,3.413c-4.267,1.707-9.387,0-11.093-4.267c-1.707-4.267,0-9.387,4.267-11.093			c2.56-1.707,5.973-2.56,8.533-3.413c96.427-38.4,206.507-16.213,280.747,58.027l63.147,63.147c3.413,3.413,3.413,8.533,0,11.947			l-61.44,60.587c-8.533,8.533-17.067,16.213-26.453,23.04C411.587,348.013,409.88,348.013,408.173,348.013z"/>
                                <path style="fill:#B6B6B6;"
                                      d="M135.96,151.747c0,5.12-3.413,8.533-8.533,8.533c-5.12,0-8.533-3.413-8.533-8.533			c0-5.12,3.413-8.533,8.533-8.533C132.547,143.213,135.96,147.48,135.96,151.747"/>
                                <path style="fill:#B6B6B6;"
                                      d="M391.96,356.547c0,5.12-3.413,8.533-8.533,8.533s-8.533-3.413-8.533-8.533s3.413-8.533,8.533-8.533			C387.693,348.013,391.96,352.28,391.96,356.547"/>
                            </g>
                        </g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            <g></g>
                            </svg>
                        <%=vo.getHit()%>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="detail-dec">
            <p><%=vo.getContent()%>
            </p>
        </div>
    </div>
</div>
<div class="detail-button">
    <%
        if (id != null) {   //id있을때
            if (id.equals(vo.getId())) {     //글 작성자랑 로그인id랑 같을때
    %>
    <div class="left-button">
        <button onclick="location.href='/schUpdate.do?pn=<%=nowPage%>&num=<%=vo.getB_sq()%>'">수정</button>
        <button onclick="articleDelete()">삭제</button>
    </div>
    <div class="right-button">
        <button onclick="location.href='/schBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록</button>
    </div>
    <%--id 있는데 게시글 번호랑 다를때--%>
    <% } else { %>
    <div class="right-button">
        <button onclick="location.href='/schBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록</button>
    </div>
    <%--id==null일 때--%>
    <% }
    } else { %>
    <div class="right-button">
        <button onclick="location.href='/schBoard.do?pn=<%=nowPage%>&filter=' + '<%=filter%>' + '&keyword=' + '<%=keyword%>'">목록</button>
    </div>
    <% } %>
</div>
<div class="comment-container">
    <div class="comment-count">
        <h4>Comments <%=vo.getComment_count()%>
        </h4>
    </div>
    <table>
        <%
            for (int i = 0; i < cList.size(); i++) {
        %>
        <tbody>
        <tr class="left-section">
            <td class="left-info-nick"><%=cList.get(i).getNickname()%>
            </td>
            <td class="left-info-date"><%=cList.get(i).getWriteDate().substring(0, 16)%>
            </td>
        </tr>
        <tr class="right-section">
            <td class="right-info"><a href="#">답변</a></td>
            <td class="right-info"><a href="#">수정</a></td>
            <td class="right-info">
                <a onclick="commentDelete(<%=cList.get(i).getCm_sq()%>,'<%=cList.get(i).getId()%>')">삭제</a></td>
        </tr>
        </tbody>
        <tr>
            <td class="comment-content"><%=cList.get(i).getContent()%></td>
        </tr>
        <% } %>
    </table>
    <% if (id != null) { //로그인 세션있을때만 %>
    <form action="/schCommentAdd.do?num=<%=vo.getB_sq()%>" method="post" onsubmit="return commentSubmit()">
        <div>
            <div class="comment-txt">
                <textarea id="content" name="content"
                          placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
            </div>
            <div class="comment-button">
                <button id="go-bottom" name="go-bottom">댓글달기</button>
            </div>
        </div>
    </form>
    <% } %>
</div>
<script>
    toastr.options = {
        "closeButton": true,
        "positionClass": "toast-top-center",
        "timeOut": 1000
    }
    function articleDelete() {
        if (confirm('삭제하시겠습니까?') == true) {
            location.href = '/schDelete.do?pn=<%=nowPage%>&num=<%=vo.getB_sq()%>';
        } else {
            return;
        }
    }

    function commentSubmit() {
        var content = $('#content').val();
        if (!content) {
            toastr.error("댓글을 입력하세요");
            $('#content').focus();
            return false;
        }
    }
    function commentDelete(num,commentId) {
        //로그인 id,댓글 id비교해야 함.
        var id='<%=id%>';   //로그인 되어있는 id
        console.log('login id: <%=id%>'+' | comment id: '+commentId);

        if(confirm('삭제하시겠습니까?')==true) {    //확인눌렀을 때

            if(id==commentId){
                $.ajax({
                    url: "/commentDel.ajax"
                    , type: "post"
                    , data: {commentNum: num}
                    , dataType: "json"
                    , error: function (xhr,request, status) {
                        console.log("서버 통신 실패");
                        console.log(status);
                    }
                    , success: function (data) {
                        console.log("서버 통신 성공");

                        if (data.count >0) {      //0이상이면 지워짐
                            console.log(data+"success 삭제 성공"+data.count);
                            location.reload();  //페이지 리로드
                        } else {
                            console.log(data+"success else result = " + data.count);
                        }
                    }
                });
            }else{  //작성자와 접속자다르거나 로그아웃일 때
                toastr.error("권한이 없습니다.");
                return false;
            }
        }else{      //confirm에서 취소눌렀을 때
            return false;
        }
    }
</script>
</body>
</html>