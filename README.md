# Bài 2: Đóng gói ứng dụng Web Backend bằng Single-stage Dockerfile

## 1. Giới thiệu
Ứng dụng Web Backend đơn giản viết bằng Node.js / Express được đóng gói vào Docker Image sử dụng Single-stage Dockerfile chuẩn hóa.

## 2. Cấu trúc thư mục
```text
bai2/
├── .dockerignore
├── Dockerfile
├── package.json
├── README.md
└── server.js
```

## 3. Các chỉ thị trong Dockerfile
- `FROM node:18-alpine`: Base image nhẹ dựa trên Alpine Linux.
- `WORKDIR /app`: Thư mục làm việc trong container.
- `COPY package*.json ./`: Copy file quản lý dependencies để tận dụng Docker layer caching.
- `RUN npm install --omit=dev`: Cài đặt các thư viện cần thiết.
- `COPY . .`: Copy toàn bộ mã nguồn vào container.
- `ENV PORT=3000`: Khai báo biến môi trường PORT mặc định là 3000.
- `EXPOSE 3000`: Khai báo port lắng nghe của container.
- `CMD ["node", "server.js"]`: Lệnh khởi chạy ứng dụng dạng exec form.

## 4. Hướng dẫn Build và Chạy Container

### Build Docker Image
```bash
docker build -t hw-backend:v1 .
```

### Chạy Container
```bash
docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1
```

### Kiểm tra trạng thái và logs
```bash
docker ps
docker logs app-single-stage
```

### Kiểm tra phản hồi API
```bash
curl -i http://localhost:8080/
```

Response mong đợi:
```json
{
  "status": "success",
  "message": "Hello from Docker Single-stage!"
}
```

### Dừng và dọn dẹp container
```bash
docker stop app-single-stage
docker rm app-single-stage
```
