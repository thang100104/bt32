<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách User</title>
<style>
body{font-family:Arial;background:#f8fafc;margin:30px}
h2{text-align:center;color:#1b2a7a}
table{width:85%;margin:20px auto;border-collapse:collapse;background:#fff}
th,td{border:1px solid #ddd;padding:12px}
th{background:#1b2a7a;color:#fff}
.btn{padding:8px 12px;text-decoration:none;color:white;border-radius:4px}
.edit{background:#2980b9}.delete{background:#c0392b}
</style>
</head>
<body>
<h2>Danh sách User - Stored Procedures</h2>
<table>
<tr><th>ID</th><th>Tên</th><th>Email</th><th>Quốc gia</th><th>Hành động</th></tr>
<c:forEach var="user" items="${listUser}">
<tr>
<td>${user.id}</td>
<td>${user.name}</td>
<td>${user.email}</td>
<td>${user.country}</td>
<td>
<a class="btn edit" href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Sửa</a>
<a class="btn delete" href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Xóa</a>
</td>
</tr>
</c:forEach>
</table>
<p style="width:85%;margin:auto"><a href="${pageContext.request.contextPath}/">← Trang chủ</a></p>
</body>
</html>