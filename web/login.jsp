

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="home_navBar.jsp" %>
<%@page import="com.diary.entities.*" %>

<%
 User user=(User)session.getAttribute("currentUser");
if(user!=null){
response.sendRedirect("home.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="headLink.jsp" %>
    </head>
    <body>

        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-white text-center" style="background-color: #ff9100;">
                                <span class="fa fa-user fa fa-3x"></span>
                                <br>
                                <p>Login Here</p>
                            </div>

                            <%
                            Message m=(Message)session.getAttribute("msg");
                            if(m!=null){
                            
                            %>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent() %>
                            </div>
                            <%
                                session.removeAttribute("msg");
                            }
                            %>

                            <div class="card-body">

                                <form action="LoginServlet">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" required class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="bodyLink.jsp" %>
    </body>
</html>
