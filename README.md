# BT32 - JDBC Transaction + MySQL Stored Procedures

Repo gồm hai nội dung thực hành:

## 1. JDBC Transaction
- `setAutoCommit(false)`
- `commit()`
- `rollback()`
- kiểm chứng nguyên lý All-or-Nothing

## 2. Gọi MySQL Stored Procedures từ JDBC
Ứng dụng quản lý User sử dụng `CallableStatement` cho:
- Hiển thị danh sách User
- Cập nhật thông tin User
- Xóa User

Stored Procedures được khai báo trong `database.sql`:
- `get_all_users()`
- `update_user(...)`
- `delete_user(...)`

## Cấu hình MySQL
Mở:

`src/main/java/com/codegym/dao/UserDAO.java`

và sửa:

```java
private final String jdbcUsername = "root";
private final String jdbcPassword = "password";
```

## Chuẩn bị database
Chạy file:

`database.sql`

## Build
```bash
mvn clean package
```

Deploy:

`target/user-management.war`

## Chạy quản lý User
`http://localhost:8080/user-management/users`

## Chạy bài Transaction
`http://localhost:8080/user-management/users?action=test-use-tran`
