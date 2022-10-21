<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="Workflow_Management.AddProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 51%;
            height: 223px;
        }
        .auto-style2 {
            height: 29px;
            width: 227px;
        }
        .auto-style3 {
            height: 29px;
            width: 591px;
        }
        .auto-style4 {
            width: 591px;
        }
        .auto-style7 {
            height: 29px;
            width: 136px;
        }
        .auto-style8 {
            width: 136px;
        }
        .auto-style9 {
            width: 227px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/home.aspx">Home</a>
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
                <li class="nav-item active">
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
        <%
                }
            }
        %>
    </ul>
  </div>
</nav>
        <div>
            <table class="auto-style1">
                <!--<tr>
                    <td class="auto-style2">
                        <asp:Label ID="projectId" runat="server" Text="Project Id"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="pId" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorId" runat="server" ControlToValidate="pId" EnableClientScript="False" ErrorMessage="Project Id is required" ForeColor="Red">Project Id is required</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>-->
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="projectName" runat="server" Text="Project Name"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="pName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="pName" EnableClientScript="False" ErrorMessage="Project Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="projectDesc" runat="server" Text="Project Description"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="pDesc" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style4">
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="deadline" runat="server" Text="Deadline"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="pDeadline" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Button ID="add" runat="server" OnClick="addProject" Text="Add" />
                    </td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
