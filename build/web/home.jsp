
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="headLink.jsp" %>
        
        <style>
            body{
                background:url(img/img2.jpg) ;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
        
        
    </head>
    <body>
        <%@include file="normal_navBar.jsp" %>


        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getNotes(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Notes
                            </a>

                            <%
                                NotesDao nDao=new NotesDao(ConnectionProvider.getConn());
                                ArrayList<Category> list1=nDao.getAllCategories();
                                for(Category c:list1){
                                
                            %>
                            <a href="#" onclick="getNotes(<%= c.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= c.getName() %></a>

                            <%
                            }
                            %>

                        </div>


                    </div>
                    <!--second col-->
                    <div class="col-md-8" >
                        <!--notes-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="postContainer">

                        </div>

                    </div>
                </div>
            </div>
        </main>


        <script>

            function getNotes(catId,temp) {
                $("#loader").show();
                $('#postContainer').hide()
                
                $(".c-link").removeClass('active')
                
                
                $.ajax({
                    url: "loadNotes.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $('#postContainer').show();
                        $('#postContainer').html(data)
                        $(temp).addClass('active')
                    }
                })
            }

            $(document).ready(function (e) {
                let allNotesRef=$('.c-link')[0]
                getNotes(0,allNotesRef)
            })
        </script>

        <%@include file="bodyLink.jsp" %>
    </body>
</html>
