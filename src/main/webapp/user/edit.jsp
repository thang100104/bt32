<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head><meta charset="UTF-8"><title>Sửa User</title></head>
<body style="font-family:Arial;background:#f8fafc">
<div style="width:440px;margin:50px auto;background:#fff;padding:28px;border-radius:8px">
<h2>Sửa thông tin User</h2>
<form action="${pageContext.request.contextPath}/users?action=edit" method="post">
<input type="hidden" name="id" value="${user.id}">
<p>Tên:</p><input style="width:100%;padding:9px" name="name" value="${user.name}" required>
<p>Email:</p><input style="width:100%;padding:9px" type="email" name="email" value="${user.email}" required>
<p>Quốc gia:</p><input style="width:100%;padding:9px" name="country" value="${user.country}" required>
<p><button type="submit">Cập nhật bằng Stored Procedure</button></p>
</form>
<a href="${pageContext.request.contextPath}/users">Quay lại danh sách</a>
</div>
</body>
</html>