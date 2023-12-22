<%@page import="com.diary.entities.*"%>
<%@page import="com.diary.dao.*" %>
<%@page import="com.diary.servlets.*" %>
<%@page import="com.diary.helper.*" %>
<%@page import="java.util.*" %>

<%
 User user=(User)session.getAttribute("currentUser");
if(user==null){
response.sendRedirect("login.jsp");
    }
%>


<div class="row">
    <%
                                    Thread.sleep(500);
                                    NotesDao nDao=new NotesDao(ConnectionProvider.getConn());
                                    int cid=Integer.parseInt(request.getParameter("cid"));
                                    List<Notes> list1=null;
                                    if(cid==0){
                                    list1=nDao.getAllNotes();
        }
        else{
        list1=nDao.getNotesByCatId(cid);
        }
        
        if(list1.size()==0){
        out.println("<h3 class='display-3 text-center'>No Notes in this category..</h3>");
        return;
        }
        
        for(Notes n:list1){
                                
    %>

    <div class="col-md-6 mt-2">
        <div class="card" style="border: 1px solid #e2e2e2;">
            <img class="card-img-top" src="notesPics/<%=n.getpPic() %>" alt="Card image cap">
            <div class="card-body">
                <b><%= n.getpTitle() %></b>
                <p><%= n.getpContent() %></p>

            </div>
                <div class="card-footer text-center " style="background-color: #ff9100">
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                    <a href="show_notes.jsp?note_id=<%=n.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                    
                </div>
        </div>
    </div>

    <%
    }
    %>
</div>
