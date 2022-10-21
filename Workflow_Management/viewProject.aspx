<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewProject.aspx.cs" Inherits="Workflow_Management.viewProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
                <li class="nav-item">
                    <a class="nav-link" href="AddProject.aspx">Create Project</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AddTask.aspx">Add Task</a>
                </li>
                <li class="nav-item active">
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
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="pId" DataSourceID="SqlDataSource1" Width="696px">
                <ItemTemplate>
                    <asp:HiddenField ID="pid" runat="server" value='<%# Eval("pId") %>' />
                    <b>Project Name:</b>&nbsp;&nbsp;
                    <asp:Label ID="Project_NameLabel" runat="server" Text='<%# Eval("Project_Name") %>' />
                    &nbsp;&nbsp;&nbsp;
                    <b>Project Description:</b>&nbsp;&nbsp;
                    <asp:Label ID="Project_DescLabel" runat="server" Text='<%# Eval("Project_Desc") %>' />&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="btn1" runat="server" Onclick="btnView" Text="View All Members"/>
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select Project.pId,Project_Desc,Project_Name from Project Inner Join Task on Task.pId=Project.pId and Task.eId=@id">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="1" Name="id" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
