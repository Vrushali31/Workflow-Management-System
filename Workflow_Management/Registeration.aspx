<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="Workflow_Management.Registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 86%;
        }
        .auto-style2 {
            width: 210px;
        }
        .auto-style3 {
            width: 167px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
            <h1>Registeration Form</h1>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">
            <asp:Label ID="uname" runat="server" Text="User name: "></asp:Label>
                        </td>
                        <td class="auto-style2">
            <asp:TextBox ID="name" runat="server" AutoPostBack="True" OnTextChanged="Name_Changed"></asp:TextBox>
                        </td>
                        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Name is required." ForeColor="Red">Name is required.</asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="name" ErrorMessage="This user name is already taken." ForeColor="Red" OnServerValidate="checkUserAvailability">This user name is already taken.</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
            <asp:Label ID="passwd" runat="server" Text="Password: "></asp:Label>
                        </td>
                        <td class="auto-style2">
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="password" ErrorMessage="Password is required." ForeColor="Red">Password is required.</asp:RequiredFieldValidator>
&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="password" ErrorMessage="Password must be atleast of length 6." ForeColor="Red" ValidationExpression="[0-9|a-z|A-Z]{6}">Password must be of atleast length 6.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
            <asp:Label ID="conpassword" runat="server" Text="Confirm Password: "></asp:Label>
                        </td>
                        <td class="auto-style2"><asp:TextBox ID="cpassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cpassword" ErrorMessage="Confirm Password is required." ForeColor="Red">Confirm Password is required.</asp:RequiredFieldValidator>
&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="cpassword" ErrorMessage="Confirm Password must be atleast of length 6." ForeColor="Red" ValidationExpression="[0-9|a-z|A-Z]{6}">Confirm Password must be of atleast length 6.</asp:RegularExpressionValidator>
                        &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
            <asp:Label ID="uemail" runat="server" Text="Email: "></asp:Label>
                        </td>
                        <td class="auto-style2">
            <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
                        </td>
                        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ForeColor="Red">Email is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
            <asp:Label ID="label" runat="server" Text="Category: "></asp:Label>
                        </td>
                        <td class="auto-style2">
            <asp:DropDownList ID="category" runat="server">
                <asp:ListItem Value="1">Manager</asp:ListItem>
                <asp:ListItem Selected="True" Value="2">Employee</asp:ListItem>
            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            
            <br />
            <br />
            <asp:Button ID="btn" runat="server" OnClick="btnSubmit" Text="Submit" />
            <br />
            <br />
            Alredy have an account?<asp:HyperLink ID="logIn" runat="server" NavigateUrl="~/LogIn.aspx">LogIn</asp:HyperLink>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC00CC" />
            <br />
        </div>
    </form>
</body>
</html>
