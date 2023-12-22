

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="home_navBar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <%@include file="headLink.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
        </script>

    </head>
    <body>

        <main class="primary-background banner-background" style="padding-bottom: 150px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center text-white" style="background-color: #ff9100">
                            <span class="fa fa-user-plus fa fa-3x"></span>
                            <br>
                            <p>Register Here</p>

                        </div>
                        <div class="card-body">
                            <form id="regform" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input type="text" class="form-control" name="user_name" id="user_name" aria-describedby="username">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" name="user_email" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" name="user_password" id="exampleInputPassword1">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select gender</label>&nbsp; &nbsp;&nbsp; 
                                    <input type="radio" name="gender" id="gender" value="male"> Male&nbsp;
                                    <input type="radio" name="gender" id="gender" value="female"> Female
                                </div>

                                <div>
                                    <textarea name="about" class="form-control" id="about" rows="3" placeholder="Enter somthing about yourself!"></textarea>
                                </div>
                                <br>
                                <div class="form-group form-check">
                                    <input type="checkbox" name="checkBox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions !</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span> 
                                    <h4>Please Wait!</h4>
                                </div>

                                <button type="submit" class="btn btn-primary" id="submitbtn">Submit</button>
                            </form>
                        </div>

                    </div>

                </div>  

            </div>
        </main>


        <%@include file="bodyLink.jsp" %>


        <script>

            $(document).ready(function () {
                console.log("page is ready...")

                $("#regform").on('submit', function (event) {
                    event.preventDefault();
                    //to send form only text 
                    //var f = $(this).serialize();

                    //to send form with file and text
                    let f = new FormData(this);
                    $("#submitbtn").hide();
                    $("#loader").show();

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: f,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submitbtn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {
                                swal("Registered successfully..!"," We are going to login page.","success")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                                    }
                                    else{
                                        swal("Oopps!","Something went wrong..! try again","warning")
                                    }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submitbtn").show();
                            $("#loader").hide();
                            swal("Error!","Something went wrong..! try again","error")
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>

    </body>
</html>
