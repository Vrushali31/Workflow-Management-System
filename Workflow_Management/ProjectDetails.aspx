<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="Workflow_Management.ProjectDetails" %>

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
        <%
                }
            }
        %>
    </ul>
  </div>
</nav>
        <div>
            <asp:GridView ID="GridViewPro" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="pId" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="pId" HeaderText="Project Id" InsertVisible="False" ReadOnly="True" SortExpression="pId" />
                    <asp:BoundField DataField="Project_Name" HeaderText="Project Name" SortExpression="Project_Name" />
                    <asp:BoundField DataField="Project_Desc" HeaderText="Project Desc" SortExpression="Project_Desc" />
                    <asp:BoundField DataField="mId" HeaderText="Manager Id" SortExpression="mId" />
                    <asp:BoundField DataField="Deadline" HeaderText="Deadline" SortExpression="Deadline" />

                    <asp:HyperLinkField DataTextField="pId" DataTextFormatString="View All Employee" HeaderText="Action" NavigateUrl='~/viewTask.aspx' DataNavigateUrlFields="pId" DataNavigateUrlFormatString="viewTask.aspx?pId={0}" />

                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <EmptyDataTemplate>
                    &nbsp;
                </EmptyDataTemplate>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Project] WHERE [pId] = @pId" InsertCommand="INSERT INTO [Project] ([Project_Name], [Project_Desc], [mId], [Deadline]) VALUES (@Project_Name, @Project_Desc, @mId, @Deadline)" SelectCommand="SELECT * FROM [Project] WHERE ([mId] = @mId)" UpdateCommand="UPDATE [Project] SET [Project_Name] = @Project_Name, [Project_Desc] = @Project_Desc, [mId] = @mId, [Deadline] = @Deadline WHERE [pId] = @pId">
                <DeleteParameters>
                    <asp:Parameter Name="pId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Project_Name" Type="String" />
                    <asp:Parameter Name="Project_Desc" Type="String" />
                    <asp:Parameter Name="mId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Deadline" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="mId" SessionField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Project_Name" Type="String" />
                    <asp:Parameter Name="Project_Desc" Type="String" />
                    <asp:Parameter Name="mId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="Deadline" />
                    <asp:Parameter Name="pId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
