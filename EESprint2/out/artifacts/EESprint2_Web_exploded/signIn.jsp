<%@ page import="java.util.ArrayList" %>
<%@ page import="servlets.UserServlet" %>
<%@ page import="model.Users" %>
<%@ page import="db.DBConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="header.jsp"%>
<%
    ArrayList<Users> users = DBConnector.getAllUser();
%>
<div class="d-flex justify-content-center">
    <div class="card w-50 ">
        <div class="card-header">
            <h3>Login Page</h3>
        </div>
        <form action="/profile" method="get">
            <div class="card-body">
                <label class="form-label"> LOGIN      </label>
                <input type="email" class="form-control" name="email_user"><br>
                <label class="form-label">PASSWORD     </label>
                <input class="form-control" type="password" name="password_user"><br><br>

                <button type="submit" class="btn btn-sm btn-success">Login</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
