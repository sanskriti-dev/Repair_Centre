
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
	<link rel="icon"  href="https://cdn3.iconfinder.com/data/icons/user-icon-3-1/100/user_3_Artboard_1-512.png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<title>User Login</title>

	<style type="text/css">
		.container{
			width: 40%;
			margin: 8% auto;
			background-color: #8C8E9A;
			border-radius: 10px;
			color: white;
			padding: 20px;
		}

		body{
			background-color: #6A6C7A;
		}
		i{
			padding-right: 8px;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"> <i class="fas fa-mobile-alt"></i>Mobile Repairing Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
  </div>
</nav>

	<div class="container animated fadeIn">
		<h1 class="text-center animated pulse ">User details</h1>
                <form action="customer.jsp" method="get">

		<div class="form-group">
		    <label for="formGroupExampleInput2">Name</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Name" name="customername">
	  	</div>

		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
		  </div>


  <div class="form-group">
    <label for="formGroupExampleInput">Phone number</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Phone number" name="phno">
  </div>
  

  	<div class="radio">
  		<label><input type="radio" name="Gender" value="Male" checked >Male</label>
	</div>
	<div class="radio">
	  	<label><input type="radio" name="Gender" value="Female">Female</label>
	</div>



                    <button type="submit" class="btn btn-secondary" name="submit" value="submit">Submit</button>
</form>

	</div>
    <h1> hello</h1>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3309/d1"
                       user="root" password="123456"/>
    <sql:update dataSource="${db}" var="result">
        INSERT INTO customer VALUES(10001,'abhi','abhi@gmail.com','987654321','male');
    </sql:update>
        <sql:query dataSource="${db}" var="result">
            SELECT * from customer;
            </sql:query>
            <table border = "1" width = "100%">
<tr>
<th>Emp</th>
<th>First Name</th>
<th>Last Name</th>
<th>Age</th>
</tr>
<c:forEach var = "row" items = "${result.rows}">
<tr>
<td><c:out value = "${row.CustomerName}"/></td>
<td><c:out value = "${row.Email}"/></td>
<td><c:out value = "${row.Mobile}"/></td>
<td><c:out value = "${row.Gender}"/></td>
</tr>
</c:forEach>
</table>
<h1> hello</h1>
</body>
</html>
