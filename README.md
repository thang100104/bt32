# BT32 - Thực thi SQL có sử dụng Transaction

Bài thực hành JDBC Transaction nhằm kiểm chứng nguyên lý **All-or-Nothing**.

## Nội dung
Phương thức `insertUpdateUseTransaction()`:
1. Tạo lại bảng Employee
2. Tắt auto-commit bằng `setAutoCommit(false)`
3. Insert Quynh
4. Insert Ngan
5. Chạy Update
6. Nếu thành công thì `commit()`
7. Nếu lỗi thì `rollback()`

## Test lỗi
Mã hiện tại cố tình gán sai tham số:

```java
psUpdate.setBigDecimal(2, new BigDecimal("999.99"));
```

Khi chạy, Update lỗi và Transaction rollback nên bảng Employee không có dữ liệu Insert.

## Test thành công
Đổi thành:

```java
psUpdate.setBigDecimal(1, new BigDecimal("999.99"));
```

Build lại và chạy. Khi đó 2 nhân viên được thêm và lương của Quynh được cập nhật thành 999.99.

## Cấu hình MySQL
Sửa tài khoản trong:

`src/main/java/com/codegym/dao/UserDAO.java`

## Build
```bash
mvn clean package
```

Deploy:
`target/user-management.war`

Truy cập:
`http://localhost:8080/user-management/users?action=test-use-tran`

Kiểm tra:
```sql
SELECT * FROM Employee;
```
