<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>JDBC Transaction</title>
<style>
body{font-family:Arial;background:#f8fafc;margin:40px}
.box{max-width:650px;margin:auto;background:white;padding:30px;border-radius:10px;box-shadow:0 4px 12px rgba(0,0,0,.08)}
a{display:inline-block;padding:10px 16px;background:#1b2a7a;color:white;text-decoration:none;border-radius:5px}
</style>
</head>
<body>
<div class="box">
<h2>Thực thi SQL có sử dụng Transaction</h2>
<p>Nhấn nút dưới đây để chạy kịch bản Insert + Update trong một Transaction.</p>
<a href="${pageContext.request.contextPath}/users?action=test-use-tran">Chạy test Transaction</a>
</div>
</body>
</html>