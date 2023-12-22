
<%@page import="com.diary.entities.*"%>
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
        <title>Profile</title>
        <%@include file="headLink.jsp" %>
        <link href="css/profileCss.css" rel="stylesheet" type="text/css"/>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
            body{
                background:url(img/img.jpg) ;
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <%@include file="normal_navBar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div id="content" class="content content-full-width">
                        <!-- begin profile -->
                        <div class="profile">
                            <div class="profile-header">
                                <!-- BEGIN profile-header-cover -->
                                <div class="profile-header-cover"></div>
                                <!-- END profile-header-cover -->
                                <!-- BEGIN profile-header-content -->
                                <div class="profile-header-content">
                                    <!-- BEGIN profile-header-img -->
                                    <div class="profile-header-img">
                                        <img src="pics/<%=user.getProfile()%>" alt="">
                                    </div>
                                    <!-- END profile-header-img -->
                                    <!-- BEGIN profile-header-info -->
                                    <div class="profile-header-info">
                                        <h4 class="m-t-10 m-b-5"><%=user.getName()%></h4>
                                        <p class="m-b-10"><%=user.getAbout()%></p>
                                        <button type="button" href="#!" data-toggle="modal" data-target="#profile-model" class="btn btn-sm btn-info mb-2 nav-link">Edit Profile</button>
                                    </div>
                                    <!-- END profile-header-info -->
                                </div>
                                <!-- END profile-header-content -->
                                <!-- BEGIN profile-header-tab -->
                                <ul class="profile-header-tab nav nav-tabs">
                                    <li class="nav-item"><a href="#" target="__blank" class="nav-link_">POSTS</a></li>
                                    <li class="nav-item"><a href="#" target="__blank" class="nav-link_">ABOUT</a></li>
                                    <li class="nav-item"><a href="#" target="__blank" class="nav-link_">PHOTOS</a></li>
                                    <li class="nav-item"><a href="#" target="__blank" class="nav-link_">VIDEOS</a></li>
                                    <li class="nav-item"><a href="#" target="__blank" class="nav-link_ active show">FRIENDS</a></li>
                                </ul>
                                <!-- END profile-header-tab -->
                            </div>
                        </div>
                        <!-- end profile -->
                        <!-- begin profile-content -->
                        <div class="profile-content">
                            <!-- begin tab-content -->
                            <div class="tab-content p-0">
                                <!-- begin #profile-post tab -->
                                <div class="tab-pane fade active show" id="profile-post">
                                    <!-- begin timeline -->
                                    <ul class="timeline">
                                        <li>
                                            <!-- begin timeline-time -->
                                            <div class="timeline-time">
                                                <span class="date">today</span>
                                                <span class="time">04:20</span>
                                            </div>
                                            <!-- end timeline-time -->
                                            <!-- begin timeline-icon -->
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <!-- end timeline-icon -->
                                            <!-- begin timeline-body -->
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img src="pics/<%=user.getProfile()%>" alt=""></span>
                                                    <span class="username"><a href="javascript:;"><%=user.getName()%></a> <small></small></span>
                                                    <span class="stats-text pull-right timeline-likes">Category</span>
                                                </div>
                                                <span class="pull-left text-muted">Title</span>
                                                <div class="timeline-content">

                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc faucibus turpis quis tincidunt luctus.
                                                        Nam sagittis dui in nunc consequat, in imperdiet nunc sagittis.
                                                    </p>
                                                </div>
                                                <div class="timeline-likes">
                                                    <div class="stats-right">
                                                        <span class="stats-text">post id</span>

                                                    </div>
                                                    <div class="stats">
                                                        <span class="fa-stack fa-fw stats-icon">
                                                            <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                                            <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                                        </span>
                                                        <!--                                    <span class="fa-stack fa-fw stats-icon">
                                                                                            <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                                                            <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                                                                            </span>-->
                                                        <span class="stats-total">words count</span>
                                                    </div><!--
                                                 </div>-->
                                                    <!--                              <div class="timeline-footer">
                                                                                     <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                                                                     <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
                                                                                     <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                                                  </div>
                                                                                  <div class="timeline-comment-box">
                                                                                     <div class="user"><img src="https://bootdey.com/img/Content/avatar/avatar3.png"></div>
                                                                                     <div class="input">
                                                                                        <form action="">
                                                                                           <div class="input-group">
                                                                                              <input type="text" class="form-control rounded-corner" placeholder="Write a comment...">
                                                                                              <span class="input-group-btn p-l-10">
                                                                                              <button class="btn btn-primary f-s-12 rounded-corner" type="button">Comment</button>
                                                                                              </span>
                                                                                           </div>
                                                                                        </form>
                                                                                     </div>
                                                                                  </div>-->
                                                </div>
                                                <!-- end timeline-body -->
                                        </li>
                                        <li>
                                            <!-- begin timeline-time -->
                                            <div class="timeline-time">
                                                <span class="date">yesterday</span>
                                                <span class="time">20:17</span>
                                            </div>
                                            <!-- end timeline-time -->
                                            <!-- begin timeline-icon -->
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <!-- end timeline-icon -->
                                            <!-- begin timeline-body -->
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
                                                    <span class="username">Sean Ngu</span>
                                                    <span class="pull-right text-muted">82 Views</span>
                                                </div>
                                                <div class="timeline-content">
                                                    <p>Location: United States</p>
                                                </div>
                                                <div class="timeline-footer">
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                </div>
                                            </div>
                                            <!-- end timeline-body -->
                                        </li>
                                        <li>
                                            <!-- begin timeline-time -->
                                            <div class="timeline-time">
                                                <span class="date">24 February 2014</span>
                                                <span class="time">08:17</span>
                                            </div>
                                            <!-- end timeline-time -->
                                            <!-- begin timeline-icon -->
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <!-- end timeline-icon -->
                                            <!-- begin timeline-body -->
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
                                                    <span class="username">Sean Ngu</span>
                                                    <span class="pull-right text-muted">1,282 Views</span>
                                                </div>
                                                <div class="timeline-content">
                                                    <p class="lead">
                                                        <i class="fa fa-quote-left fa-fw pull-left"></i>
                                                        Quisque sed varius nisl. Nulla facilisi. Phasellus consequat sapien sit amet nibh molestie placerat. Donec nulla quam, ullamcorper ut velit vitae, lobortis condimentum magna. Suspendisse mollis in sem vel mollis.
                                                        <i class="fa fa-quote-right fa-fw pull-right"></i>
                                                    </p>
                                                </div>
                                                <div class="timeline-footer">
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                </div>
                                            </div>
                                            <!-- end timeline-body -->
                                        </li>
                                        <li>
                                            <!-- begin timeline-time -->
                                            <div class="timeline-time">
                                                <span class="date">10 January 2014</span>
                                                <span class="time">20:43</span>
                                            </div>
                                            <!-- end timeline-time -->
                                            <!-- begin timeline-icon -->
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <!-- end timeline-icon -->
                                            <!-- begin timeline-body -->
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
                                                    <span class="username">Sean Ngu</span>
                                                    <span class="pull-right text-muted">1,021,282 Views</span>
                                                </div>
                                                <div class="timeline-content">
                                                    <h4 class="template-title">
                                                        <i class="fa fa-map-marker text-danger fa-fw"></i>
                                                        795 Folsom Ave, Suite 600 San Francisco, CA 94107
                                                    </h4>
                                                    <p>In hac habitasse platea dictumst. Pellentesque bibendum id sem nec faucibus. Maecenas molestie, augue vel accumsan rutrum, massa mi rutrum odio, id luctus mauris nibh ut leo.</p>
                                                    <p class="m-t-20">
                                                        <img src="../assets/img/gallery/gallery-5.jpg" alt="">
                                                    </p>
                                                </div>
                                                <div class="timeline-footer">
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a> 
                                                    <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                </div>
                                            </div>
                                            <!-- end timeline-body -->
                                        </li>
                                        <li>
                                            <!-- begin timeline-icon -->
                                            <div class="timeline-icon">
                                                <a href="javascript:;">&nbsp;</a>
                                            </div>
                                            <!-- end timeline-icon -->
                                            <!-- begin timeline-body -->
                                            <div class="timeline-body">
                                                Loading...
                                            </div>
                                            <!-- begin timeline-body -->
                                        </li>
                                    </ul>
                                    <!-- end timeline -->
                                </div>
                                <!-- end #profile-post tab -->
                            </div>
                            <!-- end tab-content -->
                        </div>
                        <!-- end profile-content -->
                    </div>
                </div>
            </div>
        </div>
        <%@include file="bodyLink.jsp" %>


    </body>
</html>
