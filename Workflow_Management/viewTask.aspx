<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewTask.aspx.cs" Inherits="Workflow_Management.WebForm1" %>

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
        <br />
        <br />
        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="tId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="tId" HeaderText="tId" InsertVisible="False" ReadOnly="True" SortExpression="tId" />
                <asp:BoundField DataField="eId" HeaderText="eId" SortExpression="eId" />
                <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Deadline" HeaderText="Deadline" SortExpression="Deadline" />
                <asp:BoundField DataField="pId" HeaderText="pId" SortExpression="pId" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Task] WHERE ([pId] = @pId)" DeleteCommand="DELETE FROM [Task] WHERE [tId] = @tId" InsertCommand="INSERT INTO [Task] ([eId], [Task], [Status], [Deadline], [pId]) VALUES (@eId, @Task, @Status, @Deadline, @pId)" UpdateCommand="UPDATE [Task] SET [eId] = @eId, [Task] = @Task, [Status] = @Status, [Deadline] = @Deadline, [pId] = @pId WHERE [tId] = @tId">
            <DeleteParameters>
                <asp:Parameter Name="tId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="eId" Type="Int32" />
                <asp:Parameter Name="Task" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Deadline" />
                <asp:Parameter Name="pId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="pId" QueryStringField="pId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="eId" Type="Int32" />
                <asp:Parameter Name="Task" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter DbType="Date" Name="Deadline" />
                <asp:Parameter Name="pId" Type="Int32" />
                <asp:Parameter Name="tId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

</body>
</html>
