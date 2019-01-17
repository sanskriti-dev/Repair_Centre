<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <style>
        th{
            padding:3%;
            font-size:30px;
        }
        td{
            padding: 3%;
            font-size:30px;
        }
        body{
            background-color:SILVER;
            color:white;
        }
       table{
           margin: 5% auto;
           padding: 5px;
            border: 0px solid black;
            border-radius: 5px;
            background-color:SLATEGREY;
            
        }
    </style>
</head>
<body>
<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
url = "jdbc:mysql://localhost:3309/d1"
user = "root" password = "123456"/>
<sql:query dataSource = "${snapshot}" var = "result">
SELECT * FROM Customer
</sql:query>
<sql:query dataSource = "${snapshot}" var = "result1">
SELECT  *  FROM Service
</sql:query>
<sql:query dataSource = "${snapshot}" var = "result2">
SELECT count( * )  as t FROM SERVICE  WHERE ReceivingDate Is NULL
</sql:query>
<sql:query dataSource = "${snapshot}" var = "result3">
SELECT count( * ) as t FROM SERVICE  WHERE ReceivingDate Is Not NULL  
</sql:query>
<sql:query dataSource = "${snapshot}" var = "result4">
SELECT Sum(Charges)as t FROM SERVICE  WHERE ReceivingDate is not NULL  
</sql:query>
<sql:query dataSource = "${snapshot}" var = "result5">
SELECT Sum(Charges)as t FROM SERVICE  WHERE ReceivingDate  is NULL 
</sql:query>

<table class="animated bounceInRight" width = "100%" position="center">
    <tr style="color: white">
<th>Total customers</th>
<table border = "1" width = "100%">
<tr>
<th>Customer ID</th>
<th>Customer Name</th>
<th>Email</th>
<th>Mobile</th>
<th>Gender</th>
</tr>
<c:forEach var = "row" items = "${result.rows}">
<tr>
<td><c:out value = "${row.CustomerID}"/></td>
<td><c:out value = "${row.CustomerName}"/></td>
<td><c:out value = "${row.Email}"/></td>
<td><c:out value = "${row.Mobile}"/></td>
<td><c:out value = "${row.Gender}"/></td>
</tr>
</c:forEach>
</table>
    <br><br>
<th>Total mobile for repair</th>
<th>Total mobiles pending for repair</th>
<th>Total mobiles repaired and given to customer</th>
<th>Total amount collected till now</th>
<th>Total amount to be collected from pending customers</th>
</tr>

<tr style="color: white">
<td><c:forEach var = "row" items = "${result.rows}">
    <c:out value =" ${row.t}"/>
    </c:forEach>
</td>
<td><c:forEach var = "row" items = "${result1.rows}">
    <c:out value = "${row.t}"/>
    </c:forEach>
</td>
<td>
    <c:forEach var = "row" items = "${result2.rows}">
    <c:out value = "${row.t}"/>
    </c:forEach>
</td>
<td>
    <c:forEach var = "row" items = "${result3.rows}">
    <c:out value = "${row.t}"/>
    </c:forEach>
</td>
<td><c:forEach var = "row" items = "${result4.rows}">
    <c:out value = "${row.t}"/>
    </c:forEach>
</td>
<td><c:forEach var = "row" items = "${result5.rows}">
    <c:out value = "${row.t}"/>
    </c:forEach>
</td>
</tr>
</table>
</body>