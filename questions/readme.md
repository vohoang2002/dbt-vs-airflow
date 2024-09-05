# Một số câu hỏi thường gặp với dbt
1. Question 1: Tại sao dbt lại phổ biến 
Nguồn: https://www.reddit.com/r/dataengineering/comments/r8pa3i/why_is_data_build_tool_dbt_is_so_popular_what_are/
- Do sự dụng sql để tạo data model nên nó có khả năng sử dụng rộng rãi hơn đặc biệt là đối với data analysis vì đa phần họ chỉ biết sql
- Xây dựng data model dựa trên mã nguồn nên:
    - Git workflow: do tập trung vào việc viết mã nguồn nên hoàn toàn có thể tích hợp với các version of control như github, gitlab (dễ dàng quản lý phiên bản, cộng tác nhóm, ..)
    - Giao diện người dùng nhẹ (dbt cloud mới có): do dbt tập trung vào 1 việc duy nhất là tạo data model và các tính năng liên quan đến nó nên giao diện nhẹ
    - Dockerization: dbt hỗ trợ Dockerization, giúp đảm bảo môi trường phát triển và triển khai nhất quán.
    - Aspect Oriented Programming: Sử dụng nguyên lý lập trình hướng khía cạnh, có thể tăng cường tính module và khả năng tái sử dụng.
    - Data Lineage: Cung cấp khả năng theo dõi nguồn gốc dữ liệu mạnh mẽ, quan trọng để hiểu các biến đổi và phụ thuộc dữ liệu. (file source.yml và schema.yml)
    - Testing: Hỗ trợ các framework kiểm thử, đảm bảo chất lượng và độ tin cậy của dữ liệu. (thư mục test)
2. Question 2: Làm thế nào để chạy song song ?
Chỉ định số lượng thread trong quá trình chạy lệnh dbt run
- Cách 1: Chỉnh trong file ~/.dbt/profiles.yml
- Cách 2: Thêm tham số threads trong lệnh dbt run (cách này có độ ưu tiên cao hơn cách 1 nếu 2 threads khác nhau). Ví dụ: dbt run --threads 4
Lưu ý: Giá trị thread dựa trên nên khả năng xử lý của server và số lượng các models có thể chạy đồng thời

**DBT sẽ tự động thực hiện việc chạy song song dựa trên số luồng và đảm bảo sự lệ thuộc giữa các model**

Cấu hình các model lệ thuộc với nhau (model A chạy sau model B)
- Để tạo các model lệ thuộc với nhau qua từ khóa ref. Các model chứa lệnh này sẽ đợi model trong từ khóa ref thực hiện xong và lấy dữ liệu từ nó
- Ngoài ra để chắc chắn hơn, có thể thêm từ khóa -- ở mỗi model để chắc chắn việc tạo model sẽ thực hiện sau model trong -- (xem file order_details.sql)
- Tên file không ảnh hưởng đến thứ tự thực hiện do đó bạn có thể
3. Question 3: dữ liệu mà dbt dùng để transform được lấy từ đâu?
Để dbt có thể transform dữ liệu, cần phải đưa dữ liệu về sink mà dbt project kết nối đến
- Trong project này, dữ liệu được lấy từ minio tải về thư mục /tmp của airflow server (thư mục này được mount với /tmp của máy chạy docker)
- Sau cùng dữ liệu được đẩy về postgres DB
4. Question 4: Sử dụng tag trong dbt
- Trong file schema.yml, có thể cấu hình tag cho các model, điều này giúp tổ chức và quản lý các tài nguyên trong dự án dbt
- Thực hiện việc chạy dựa trên tags
    - Chạy với 1 tags cụ thể: dbt run --models tag:staging
    - Loại bỏ các models có trong các tags: dbt run --exclude tag:order
- Có thể sử dụng tags
5. Question 5: dbt có thể tương tác với nhiều hệ quản trị cơ sở dữ liệu cùng 1 lúc không
Không, 1 project dbt chỉ có thể tương tác với 1 hệ quản trị dữ liệu - 1 database - 1 schema tại 1 lần thực thi dbt run (xem file ~/.dbt/profiles.yml)
Tuy nhiên bạn có thể cấu hình nhiều source/profile trong file này và chỉ định chúng trong câu lệnh dbt run. Ví dụ: dbt run --target <profile-1>
Trường target trong file ~/.dbt/profiles.yml là chỉ định profile mặc định mà câu lệnh dbt run sẽ thực hiện.
6. Question 6: Sử dụng dbt để tạo view hay table
Mặc định dbt sẽ tạo view thay vì table trong destination trong database
Để chỉnh việc tạo view bằng table, xem file src/transform_data/dbt_project