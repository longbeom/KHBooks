package com.kh.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Member;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class UpdateNotice
 */
@WebServlet("/admin/adminnoticeupdate")
public class UpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member logined = (Member) request.getSession().getAttribute("logined");
		
		if (logined != null) {
			if(logined.getIsAdmin() == 1){	
				String title=request.getParameter("title");
				String content =request.getParameter("content");
				int no=Integer.parseInt(request.getParameter("no1"));
				Notice n=new Notice();
				n.setNoticeNo(no);
				n.setNoticeContent(content);
				n.setNoticeTitle(title);
				
				
				int result=new AdminService().updateNotice(n);
				
				
				String msg="";
				String view="/views/common/msg.jsp";
				String loc="";
				
				if(result>0) {
					msg="수정 성공";
					loc="/admin/adminnotice";
				}else {
					msg="수정실패";
					loc="/admin/adminnotice";
				}
				request.setAttribute("msg",msg);
				request.setAttribute("loc",loc);
				request.getRequestDispatcher(view).forward(request, response);
			}else {
				//관리자가 아닐 때
				request.setAttribute("msg", "접근할 수 없는 페이지입니다.");
				request.setAttribute("loc", "/main/mainview");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);;
			}
		}else {
			//로그인을 안했을 때
			response.sendRedirect(request.getContextPath()+"/member/login");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
