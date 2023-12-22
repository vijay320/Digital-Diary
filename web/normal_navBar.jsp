<%@page import="com.diary.entities.*" %>
<%@page import="com.diary.dao.*" %>
<%@page import="com.diary.servlets.*" %>
<%@page import="com.diary.helper.*" %>
<%@page import="java.util.*" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
        </script>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Diary</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp"><span class="fas fa-home"></span>Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-vcard-o"></span> Contact</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="#!" tabindex="-1" aria-disabled="true">Logout</a>
            </li>
            <li class="nav-item">
                <a class="nav-link " href="#!" data-toggle="modal" data-target="#add-note-modal" >Add Note</a>
            </li>
        </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp" > <span class="fa fa-user-circle"></span> <%=user.getName()%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span> Logout</a>
            </li>
        </ul>
    </div>
</nav>

<!--end of nav bar-->
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


<!--add a note modal-->

<div class="modal fade" id="add-note-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <form id="add-note-form" action="AddNoteServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <select name="cid" class="form-control">
                            <option selected disabled>---Select Category---</option>

                            <% 
                                NotesDao postd=new NotesDao(ConnectionProvider.getConn());
                                ArrayList<Category> list=postd.getAllCategories();
                                for(Category c:list)
                                {
                            %>

                            <option value="<%= c.getCid() %>"> <%= c.getName() %></option>

                            <%
                                }
                            %>


                        </select>

                    </div>
                    <div class="form-group">
                        <input type="text" name="pTitle" placeholder="Enter note title" class="form-control"> 
                    </div>

                    <div class="form-group">
                        <textarea id="note" name="pContent" rows="5" cols="10" class="form-control" placeholder="Enter your note..."></textarea>
                    </div>

                    <div class="form-group">
                        <input type="file" name="pPic" class="form-control"> 
                    </div>

                    <div class="container text-center">
                        <button type="submit" class="btn btn-outline-primary">Save</button>
                    </div>       

                </form>

            </div>

        </div>
    </div>
</div>

<!--end Add a note model-->



<!-- profile model start-->

<div class="modal fade" id="profile-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel">Dairy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">

                    <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 90px;" alt="alt"/>

                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>

                    <!--details-->
                    <div id="profile-detail">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row"> ID :</th>
                                    <td><%= user.getId() %></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail() %></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender() %></td>

                                </tr>
                                <tr>
                                    <th scope="row">About :</th>
                                    <td><%= user.getAbout() %></td>

                                </tr>
                                <tr>
                                    <th scope="row">Registered on :</th>
                                    <td><%= user.getDateTime().toString() %></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!--profile edit-->

                    <div id="profile-edit" style="display: none">
                        <h3 class="mt-3">Please edit carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <th>ID :</th>
                                    <th><%= user.getId() %></th>
                                </tr>
                                <tr>
                                    <td>Name :</td>
                                    <td><input type="text"  class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email :</td>
                                    <td><input type="email"  class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Password :</td>
                                    <td><input type="text"  class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><%= user.getGender() %></td>
                                </tr>
                                <tr>
                                    <td>About :</td>
                                    <td>
                                        <textarea row="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Change pic :</td>
                                    <td><input type="file" class="form-control" name="image" value="<%= user.getProfile() %>"></td>
                                </tr>

                            </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>



<%@include file="bodyLink.jsp" %>

<script>

    $(document).ready(function () {

        let editStatus = false;

        $('#edit-profile-button').click(function () {
            if (editStatus == false) {
                $("#profile-detail").hide()
                $("#profile-edit").show();
                editStatus = true;
                $(this).text("Back")
            } else
            {
                $("#profile-detail").show()
                $("#profile-edit").hide();
                editStatus = false;
                $(this).text("Edit")
            }
        })
    });


</script>
<!--now add notes js-->
<script>

    $(document).ready(function (e) {
        $("#add-note-form").on("submit", function (event) {
            //this code gets called when form is submitted
            event.preventDefault();
            console.log("Document Loaded...");
            let form = new FormData(this);

            //now requesting to server
            $.ajax({
                url: "AddNoteServlet",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    //success
                    console.log(data);
                    
                    if (data.trim() === 'done') {
                                swal("Good Job..!"," Saved Successfully","success")
                                        .then((value) => {
                                            window.location = "home.jsp"
                                        });
                                    }
                                    else{
                                        swal("Oopps!","Something went wrong..! try again","warning")
                                    }
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    //error
                    
                    if (data.trim() === 'done') {
                                swal("Error..!"," Something went wrong..","success")
                                        .then((value) => {
                                            window.location = "home.jsp"
                                        });
                                    }
                                    else{
                                        swal("Oopps!","Something went wrong..! try again","warning")
                                    }
                    
                },
                processData: false,
                contentType: false
            })
        })
    })

</script>




