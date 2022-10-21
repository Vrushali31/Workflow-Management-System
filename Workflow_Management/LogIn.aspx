<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Workflow_Management.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <%--<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/home.aspx">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="LogIn.aspx">Login </a>
      </li>
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
        <% 
            }
            else
            {
        %>
                <li class="nav-item">
                    <a class="nav-link" href="viewProject.aspx">View All Projects</a>
                </li>
        <%
                }
            }
        %>
    </ul>
  </div>
</nav>--%>
        <div>
            <center><h1>Login Form</h1>
            </center>
            <br />
            <br />
            <asp:Label ID="uname" runat="server" Text="User name: "></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="name" runat="server" AutoPostBack="True"></asp:TextBox>
&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Name is required." ForeColor="Red">Name is required.</asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="passwd" runat="server" Text="Password: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password" ErrorMessage="Password is required." ForeColor="Red">Password is required.</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
            &nbsp;
            <br />
            <br />
            <asp:Button ID="btn" runat="server" OnClick="btnSubmit" Text="Submit" />
            <br />
            <br />
            Don&#39;t have an account? <asp:HyperLink ID="register" runat="server" NavigateUrl="~/Registeration.aspx">Sign Up</asp:HyperLink>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC00CC" />
            <br />
        </div>
    </form>
    
</body>
</html>
