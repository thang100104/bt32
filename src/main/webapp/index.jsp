<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>BT32 JDBC</title>
<style>
body{font-family:Arial;background:#f8fafc;margin:40px}
.box{max-width:700px;margin:auto;background:white;padding:30px;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,.08)}
a{display:inline-block;padding:10px 16px;background:#1b2a7a;color:white;text-decoration:none;border-radius:5px;margin-right:10px}
</style>
</head>
<body>
<div class="box">
<h2>BT32 - JDBC Transaction & Stored Procedures</h2>
<p>Repo này gồm bài Transaction và bài gọi MySQL Stored Procedures từ JDBC.</p>
<a href="${pageContext.request.contextPath}/users">Quản lý User bằng Stored Procedures</a>
<a href="${pageContext.request.contextPath}/users?action=test-use-tran">Chạy test Transaction</a>
</div>
</body>
</html>