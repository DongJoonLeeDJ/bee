package com.bee.www.action.Member;

import com.bee.www.common.Action;
import com.bee.www.common.ActionForward;
import com.bee.www.common.LoginManager;
import com.bee.www.common.RegExp;
import com.bee.www.service.MemberService;
import com.bee.www.vo.MemberVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.bee.www.common.RegExp.MEMBER_ID;

public class ProfileAction implements Action {
    @Override
    public ActionForward execute
            (HttpServletRequest request, HttpServletResponse response) throws IOException {
        LoginManager lm = LoginManager.getInstance();
        String id = lm.getMemberId(request.getSession());

        //값 비어있는지,형식(정규식) 검사
        if (id == null || id.equals("") || !RegExp.checkString(MEMBER_ID, id)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다');location.href='/';</script>");
            out.close();
            return null;
        }

        MemberService service = new MemberService();
        MemberVo vo = service.getMember(id);
        if(vo.getNewFileName()==null){
            vo.setNewFileName("basic.jpg");
        }
        if (vo == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('잘못된 접근입니다.');location.href='/';</script>");
            out.close();
            return null;
        }
        ActionForward forward = new ActionForward();
        request.setAttribute("vo",vo);
        forward.setPath("/views/profile-info.jsp");
        return forward;
    }
}
