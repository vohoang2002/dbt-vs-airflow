model này có tác dụng tiền xử lý dữ liệu raw

thường model này sẽ tương tác trực tiếp với dữ liệu raw nên thường có file sources để mô tả nguồn dữ liệu

model này có ít nhất 1 file sql sử dụng {{ source('database', 'table') }} để transform dữ liệu raw ở mức tiền xử lý trước khi đưa vào các model khác

Ví dụ trong bài này, tiền xử lý sẽ là lọc các trường không cần thiết như: RowID, Country

Ngoài ra có thể chia rõ hơn như dữ liệu nào là tài chính, dữ liệu nào phục vụ doanh thu