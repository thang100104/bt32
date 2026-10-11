# BT32 - JDBC Transaction + MySQL Stored Procedures

Repo chứa các bài thực hành JDBC trên ứng dụng quản lý User.

## 1. JDBC Transaction
- `setAutoCommit(false)`
- `commit()`
- `rollback()`
- kiểm chứng nguyên lý All-or-Nothing

## 2. Gọi MySQL Stored Procedures từ JDBC
Sử dụng `CallableStatement` cho:
- Hiển thị danh sách User
- Cập nhật User
- Xóa User

## 3. Bài tập Luyện tập MySQL JDBC Transaction

Đã bổ sung phương thức:

```java
addUserTransaction(User user, int[] permissionIds)
```

Luồng xử lý:
1. Tắt auto-commit.
2. Insert User và lấy ID vừa sinh.
3. Gán các permission vào `user_permission`.
4. Nếu tất cả thành công thì `commit()`.
5. Nếu một câu SQL lỗi thì `rollback()`.

Route kiểm thử:

`http://localhost:8080/user-management/users?action=test-add-user-tran`

Bài test cố tình truyền permission ID `999` không tồn tại, khiến foreign key báo lỗi. Kết quả mong đợi là User thử nghiệm cũng bị rollback, không còn dữ liệu rác.

Kiểm tra:

```sql
SELECT * FROM users
WHERE email = 'transaction-test@codegym.vn';
```

Kết quả đúng khi rollback: **0 dòng**.

## Chuẩn bị database

Chạy:

`database.sql`

File này tạo thêm:
- `permission`
- `user_permission`
- dữ liệu quyền mẫu 1–4

## Cấu hình MySQL

Mở:
`src/main/java/com/codegym/dao/UserDAO.java`

Sửa:

```java
private final String jdbcUsername = "root";
private final String jdbcPassword = "password";
```

cho đúng tài khoản MySQL trên máy.

## Build

```bash
mvn clean package
```

Deploy:

`target/user-management.war`

Repo: https://github.com/thang100104/bt32
