<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Workflow_Management.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand active" href="#">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
        <%
            if (Session["id"] != null)
            {
                if ((int)Session["category"] == 0)
                {
        %>
                <li class="nav-item">
                    <a class="nav-link" href="AddProject.aspx">Create Project</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AddTask.aspx">Add Task</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ProjectDetails.aspx">View Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.aspx">Logout</a>
                </li>
        <% 
            }
            else
            {
        %>
                <li class="nav-item">
                    <a class="nav-link" href="viewProject.aspx">View All Projects</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.aspx">Logout</a>
                </li>
        <%
                }
            }
        %>
    </ul>
  </div>
</nav>
        <div>

        </div>
    </form>
    <br /><br />

    <h1 align="center">Welcome to WorkFlow Management System </h1>
</body>
</html>
