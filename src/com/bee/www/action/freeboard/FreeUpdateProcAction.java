package com.bee.www.action.freeboard;

import com.bee.www.common.*;

import static com.bee.www.common.RegExp.*;

import com.bee.www.service.BoardService;
import com.bee.www.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class FreeUpdateProcAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());
        //로그인 안돼있을때
        if (id == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 필요한 서비스 입니다.');location.href='/login.do';</script>");
            out.close();
            return null;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        //글 번호 유효성검사,RegExp = 글 번호 유효성 검사
        if (title == null || content == null
                || title.equals("") || content.equals("")
                || !RegExp.checkString(ARTICLE_TITLE, title)
                || !RegExp.checkString(ARTICLE_CONTENT, content)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');history.back();</script>");
            out.close();
            return null;
        }

        String num = request.getParameter("num");
        if (num == null || num.equals("")
                || !RegExp.checkString(ARTICLE_NUM, num)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');location.href='/';</script>");
            out.close();
            return null;
        }

        int numInt = Integer.parseInt(num);  //유효성 검사 후 글 번호 숫자로 변환
        //글 번호 유효성검사(2)-형변환 후,글 번호 0보다 작으면 오류alert
        if(numInt<=0){
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.(2)');history.back();</script>");
            out.close();
            return null;
        }

        //글 작성Id와 다른지 검사
        BoardService service = new BoardService();
        String writerId = service.getWriterId(numInt);
        if (writerId == null || !id.equals(writerId)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('작성자가 다릅니다.');location.href='/';</script>");
            out.close();
            return null;
        }

        //vo에 수정한 컬럼들 내용넣기
        ArticleVo vo = new ArticleVo();
        vo.setB_sq(numInt);
        vo.setTitle(title);
        vo.setContent(content);
        vo.setC_sq(7);

        if(!service.updateArticle(vo)){ //글 저장 service 호출
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('글 수정에 실패했습니다.');history.back();</script>");
            out.close();
            return null;
        }

        ActionForward forward = new ActionForward();
        forward.setPath("/freeDetail.do?num="+numInt);
        forward.setRedirect(true);
        return forward;
    }


}
