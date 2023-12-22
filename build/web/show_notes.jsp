<%-- 
    Document   : show_notes
    Created on : 21-Dec-2023, 3:37:47 am
    Author     : vpate
--%>

<%@page import="com.diary.entities.*"%>
<%@page import="com.diary.dao.*" %>
<%@page import="com.diary.servlets.*" %>
<%@page import="com.diary.helper.*" %>
<%@page import="java.util.*" %>
<%@page errorPage="jspError.jsp"  %>


<%
 User user=(User)session.getAttribute("currentUser");
if(user==null){
response.sendRedirect("login.jsp");
    }
%>


<%
    int noteId=Integer.parseInt(request.getParameter("note_id"));
    NotesDao nDao=new NotesDao(ConnectionProvider.getConn());
    Notes nn=  nDao.getNotesByNoteId(noteId);  

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= nn.getpTitle() %></title>
        <%@include file="headLink.jsp" %>
        
        <style>
            
            .note-title{
                font-weight: 100;
                font-size: 30px;
            }
            
            .note-content{
                font-weight: 100;
                font-size: 25px;
            }
            
            .note-date{
                font-style: italic;
                font-weight: bold;
            }
            
            .user-info{
                font-size: 20px;
                font-weight: 300;
            }
            
            .row-user{
               border: 1px solid #e2e2e2; 
               padding-top: 15px;
            }
            
            body{
                background:url(img/img2.jpg) ;
                background-size: cover;
                background-attachment: fixed;
            }
            
            
        </style>
        
    </head>
    <body>
        <%@include file="normal_navBar.jsp" %>

        <!--main content of body-->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header" style="background-color: #ff9100">
                            <h4 class="note-title"><%= nn.getpTitle() %></h4>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top my-2" src="notesPics/<%=nn.getpPic() %>" alt="Card image cap">
                           
                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                    
                                    <%
                                        UserDao ud=new UserDao(ConnectionProvider.getConn());
                                        %>
                                    
                                        <p class="user-info"><a href="profile.jsp"><%= ud.getUserByNoteId(nn.getUserId()).getName() %> </a>Has Posted</p>
                                </div>
                                
                                <div class="col-md-4">
                                    <p class="note-date"><%= nn.getpDate().toLocaleString() %></p>
                                </div>
                            </div>
                            
                                    <p class="note-content"> <%= nn.getpContent() %></p>
                            <br>
                            <br>
                        </div>

                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>

                            <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                        </div>


                    </div>
                </div>
            </div>
        </div>


        <%@include file="bodyLink.jsp" %>
    </body>
</html>
