<%@ page import="model.Items" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DBConnector" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<%@include file="header.jsp"%>
<h1 class="text-lg-center fw-bolder">Welcome to BITLAB SHOP</h1>
<br>
<p class="text-sm-center fw-normal">Electronic devices with high quality and service</p>
<br>
<div class="container-sm d-flex flex-row align-items-center flex-wrap flex-sm-wrap ps-5" style="width: 50%;height: 600px; ">
    <%
        ArrayList<Items> items = DBConnector.getAllItem();
        for (Items it: items) {
    %>

    <div class="card text-center mb-3 me-2 m-3" style="width: 200px;">
        <div class="card-body">
            <input type="hidden" name="id" value="<%=it.getId()%>">
            <h5 class="card-title fw-bold"><%=it.getName()%></h5>
            <br>
            <p class="card-text text-success fs-3">$<%=it.getPrice()%></p>
            <p class="card-text text-lg-center"><%=it.getDescription()%></p>
            <a href="/" class="btn btn-success w-75 ">Buy now</a>
        </div>
    </div>
<%}%>
</div>

</body>
</html>
