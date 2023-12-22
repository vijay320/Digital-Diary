

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.diary.helper.*"%>
<%@include file="home_navBar.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dairy-Home</title>
        <%@include file="headLink.jsp" %>
    </head>
    <body>

        <div class="container-fluid  p-0 m-0">

            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Diary !</h3>
                    <p>A diary is a written or audiovisual record with discrete entries arranged by date reporting on what has happened over the course of a day or other period. Diaries have traditionally been handwritten but are now also often digital.</p>
                    <p>A personal diary may include a person's experiences, thoughts, and/or feelings, excluding comments on current events outside the writer's direct experience. Someone who keeps a diary is known as a diarist.</p>
                    <a href="signup.jsp" class="btn btn-outline-light"><span class="fa fa-user-plus"></span> Try, it's Free</a>
                    <a href="login.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o  fa-spin"></span> Login</a>

                </div>
                 
            </div>

        </div>

      
        
        <%@include file="bodyLink.jsp" %>
    </body>
</html>
