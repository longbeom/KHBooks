package com.kh.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.book.model.vo.Book;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class AdminBookServlet
 */
@WebServlet("/admin/book")
public class AdminBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookServlet() {
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
				int cPage;
				
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
					
					
				}catch(NumberFormatException e) {
					cPage=1;
					
				}
				int numPerPage;
				try {
					numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
				}catch(NumberFormatException e) {
					numPerPage=6;
					
				}
				
				int totalBoard=new AdminService().selectBookCount(); // 디비 속성갯수
			
				int totalPage=(int)Math.ceil((double)totalBoard/numPerPage);// 필요한 총 페이지수
		
				
				List<Book> list =new AdminService().selectBook(cPage, numPerPage);
				
				String pageBar="";
				pageBar+="<ul class='pagination'>";
				int pageSize=5; //페이지 최대 수 5이면 12345<다음>
				int pageNo=((cPage-1)/pageSize)*pageSize+1;  //시작페이지
				int pageEnd=pageNo+pageSize-1; //끝페이지
				
				//보고있는페이지가 1이면 이전  
				if(pageNo ==1) {			
					pageBar+="<li><span aria-hidden='true'>&laquo;</span></li>";
				}else {
				
					//2이상이면 이전 클릭시 현재 페이지 -1페이지로 이동
					pageBar+="<li><a href='"+request.getContextPath()
					+"/admin/book?cPage="+(pageNo-1)
					+"&numPerPage="+numPerPage+"' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
				}
				//선택페이지 만들기
						while(!(pageNo>pageEnd||pageNo>totalPage))
						{
							if(cPage==pageNo)
							{
								pageBar+="<li><span class='cPage'>"+pageNo+"</span></li>";
							}
							else
							{
								pageBar+="<li><a href='"+request.getContextPath()
								+"/admin/book?cPage="+(pageNo)
								+"&numPerPage="+numPerPage+"'>"+pageNo+"</a></li>";
							}
							pageNo++;
						}
				//[다음]
				if(pageNo>totalPage) {
					pageBar+="<li><span aria-hidden='true'>&raquo;</span></li>";
					
				}else {
					pageBar+="<li><a href='"+request.getContextPath()+"/admin/book?cPage="+pageNo+"&numPerPage="+numPerPage+"'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
			
				request.setAttribute("cPage", cPage);
				request.setAttribute("pageBar", pageBar);
				
				
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("/views/admin/bookinfo.jsp").forward(request, response);
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
