-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221226.e06ada1bf0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 18, 2023 lúc 06:21 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `k21banhang`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet`
--

CREATE TABLE `chitiet` (
  `IDChiTiet` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `CauHinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethd`
--

CREATE TABLE `chitiethd` (
  `IDHDB` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitiethd`
--

INSERT INTO `chitiethd` (`IDHDB`, `IDSanPham`, `SoLuong`, `DonGia`) VALUES
(10, 1, 1, 19900000),
(10, 2, 2, 19900000),
(10, 8, 1, 31490000),
(11, 1, 1, 19900000),
(11, 5, 1, 31990000),
(12, 1, 1, 19900000),
(12, 2, 1, 19900000),
(13, 1, 1, 19900000),
(13, 2, 1, 19900000),
(13, 5, 1, 31990000),
(14, 2, 1, 19900000),
(14, 5, 1, 31990000),
(14, 8, 1, 31490000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `IDDanhGia` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `NoiDung` varchar(255) DEFAULT NULL,
  `ThoiGian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongia`
--

CREATE TABLE `dongia` (
  `IDDonGia` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `GiaNhap` int(11) DEFAULT NULL,
  `Ngay` date DEFAULT NULL,
  `Chon` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dongia`
--

INSERT INTO `dongia` (`IDDonGia`, `IDSanPham`, `GiaBan`, `GiaNhap`, `Ngay`, `Chon`) VALUES
(0, 5, 31990000, 26990000, '2023-02-06', b'1'),
(1, 1, 19900000, 17900000, '2023-01-10', b'1'),
(2, 2, 19900000, 17900000, '2023-01-10', b'1'),
(3, 3, 19900000, 17900000, '2023-01-10', b'1'),
(4, 4, 19900000, 17900000, '2023-01-10', b'0'),
(5, 4, 18900000, 16900000, '2023-01-10', b'1'),
(6, 6, 37390000, 32390000, '2023-02-23', b'1'),
(7, 8, 31490000, 26990000, '2023-02-23', b'1'),
(8, 9, 19990000, 16900000, '2023-02-23', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `IDHang` int(11) NOT NULL,
  `TenHang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`IDHang`, `TenHang`) VALUES
(1, 'SamSung'),
(2, 'Apple'),
(3, 'Oppo'),
(4, 'ViVo'),
(5, 'DELL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonban`
--

CREATE TABLE `hoadonban` (
  `IDHDB` int(11) NOT NULL,
  `IDKhachHang` int(11) DEFAULT NULL,
  `NgayBan` date DEFAULT NULL,
  `NoiDung` varchar(30) DEFAULT NULL,
  `phuongthuc` int(11) NOT NULL,
  `trangthai` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadonban`
--

INSERT INTO `hoadonban` (`IDHDB`, `IDKhachHang`, `NgayBan`, `NoiDung`, `phuongthuc`, `trangthai`) VALUES
(10, 2, '2023-03-30', 'Khách đặt hàng', 1, 0),
(11, 2, '2023-03-30', 'Khách đặt hàng', 3, 0),
(12, 2, '2023-03-30', 'Khách đặt hàng', 0, 1),
(13, 2, '2023-04-04', 'Khách đặt hàng', 3, 1),
(14, 1, '2023-04-06', 'Khách đặt hàng', 1, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `IDKhachHang` int(11) NOT NULL,
  `TenKH` varchar(30) DEFAULT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `username` varchar(250) NOT NULL,
  `passwword` varchar(250) DEFAULT NULL,
  `phanquyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`IDKhachHang`, `TenKH`, `DiaChi`, `SDT`, `email`, `username`, `passwword`, `phanquyen`) VALUES
(1, 'Quản trị hệ thống', '143 Nguyễn Lương Bằng', '0819173817', 'quantri@gmail.com', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0),
(2, 'Tiến Ngọc', '143 Nguyễn Lương Bằng', '0819173817', 'ngoc@gmail.com', 'tienngoc', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

CREATE TABLE `loaisp` (
  `IDLoaiSP` int(11) NOT NULL,
  `TenLoai` varchar(30) DEFAULT NULL,
  `MoTa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`IDLoaiSP`, `TenLoai`, `MoTa`) VALUES
(1, 'Điện thoại', 'aaa'),
(2, 'Laptop', 'lap'),
(3, 'Phụ kiện', '1'),
(4, 'SmartWach', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaitin`
--

CREATE TABLE `loaitin` (
  `IDLoaiTin` int(11) NOT NULL,
  `TenLoai` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `IDNhaCungCap` int(11) NOT NULL,
  `TenNhaCC` varchar(30) DEFAULT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`IDNhaCungCap`, `TenNhaCC`, `DiaChi`, `SDT`, `Email`) VALUES
(1, 'FPT Shope', '143 Nguyễn Lương Bằng', '0819173817', 'fptshope@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `IDSanPham` int(11) NOT NULL,
  `TenSP` varchar(30) DEFAULT NULL,
  `IDLoaiSP` int(11) NOT NULL,
  `IDHang` int(11) NOT NULL,
  `IDNhaCungCap` int(11) NOT NULL,
  `MoTaSP` varchar(255) DEFAULT NULL,
  `HinhDaiDien` varchar(250) DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`IDSanPham`, `TenSP`, `IDLoaiSP`, `IDHang`, `IDNhaCungCap`, `MoTaSP`, `HinhDaiDien`, `TrangThai`) VALUES
(0, 'Samsung Galaxy S23 Ultra 5G', 1, 1, 1, 'Cuối cùng thì chiếc điện thoại Samsung Galaxy S23 cũng đã chính thức ra mắt tại sự kiện Galaxy Unpacked vào đầu tháng 2 năm 2023, máy nổi bật với bộ ống kính chất lượng, hiệu năng mạnh mẽ nhờ tích hợp chipset tiên tiến và được trang bị thêm nhiều công ngh', 'samsung-galaxy-s23-ultra-1-600x600.jpg', b'1'),
(1, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(2, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(3, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(4, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(5, 'Samsung Galaxy S23 Ultra 5G', 1, 1, 1, 'Cuối cùng thì chiếc điện thoại Samsung Galaxy S23 cũng đã chính thức ra mắt tại sự kiện Galaxy Unpacked vào đầu tháng 2 năm 2023, máy nổi bật với bộ ống kính chất lượng, hiệu năng mạnh mẽ nhờ tích hợp chipset tiên tiến và được trang bị thêm nhiều công ngh', 'samsung-galaxy-s23-ultra-1-600x600.jpg', b'1'),
(6, 'MacBook Air M2 2022 16GB/512GB', 2, 2, 1, 'Chip Apple M2 vẫn được sản xuất ở tiến trình 5 nm với 4 nhân hiệu năng cao và 4 nhân tiết kiệm kiệm như dòng M1 nhưng tốc độ băng thông đã được cải tiến vượt trội lên đến 100GB/s, cùng với đó là sự trợ giúp của 20 nghìn tỷ bóng bán dẫn giúp hiệu suất hoạt', 'upload/vi-vn-apple-macbook-air-m2-2022-16gb-6.jpg', b'1'),
(7, 'MacBook Air M1 2020 16GB/512GB', 2, 2, 1, 'MacBook chip M1 được thiết kế CPU 8 lõi và Neural Engine 16 lõi mang đến tốc độ hiệu năng nhanh hơn gấp 3.5 lần, đem đến khả năng vận hành mạnh mẽ trong mọi tác vụ với Word, Excel hay thỏa sức sáng tạo với các phần mềm thiết kế, cho hiệu quả công việc cao', '', b'1'),
(8, 'MacBook Air M1 2020 16GB/512GB', 2, 2, 1, 'MacBook chip M1 được thiết kế CPU 8 lõi và Neural Engine 16 lõi mang đến tốc độ hiệu năng nhanh hơn gấp 3.5 lần, đem đến khả năng vận hành mạnh mẽ trong mọi tác vụ với Word, Excel hay thỏa sức sáng tạo với các phần mềm thiết kế, cho hiệu quả công việc cao', 'vi-vn-apple-macbook-air-m1-2020-8-core-gpu-8.jpg', b'1'),
(9, 'Vostro 3510 i5 1135G7/8GB/512G', 2, 5, 1, 'Được trang bị dòng chip Intel Core i5 Tiger Lake 1135G7 mạnh mẽ, hoạt động trên xung nhịp cơ bản 2.4 GHz và ép xung lên đến 4.2 GHz ở chế độ Turbo Boost, Dell Vostro 3510 dễ dàng giải quyết mượt mà các tác vụ như soạn thảo hợp đồng trên Word, nhập liệu và', 'dell-vostro-3510-i5-p112f002bbl-14.jpg', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_donvi`
--

CREATE TABLE `tbl_donvi` (
  `iddv` int(11) NOT NULL,
  `TenDV` varchar(150) NOT NULL,
  `DiaChi` varchar(255) NOT NULL,
  `DienThoai` varchar(40) NOT NULL,
  `MST` varchar(30) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Website` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tbl_donvi`
--

INSERT INTO `tbl_donvi` (`iddv`, `TenDV`, `DiaChi`, `DienThoai`, `MST`, `Email`, `Website`) VALUES
(1, 'Công ty TNHH ABC', '250 Nguyễn Tất - Liên Chiểu - Đà Nẵng', '0236 998 998/ 0956 879 987', '04872652442', 'abchoang@gmail.com', 'http://wwww.abchoang.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tintuc`
--

CREATE TABLE `tintuc` (
  `IDTinTuc` int(11) NOT NULL,
  `IDLoaiTin` int(11) NOT NULL,
  `NoiDungTin` varchar(225) DEFAULT NULL,
  `NgayDang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tonkho`
--

CREATE TABLE `tonkho` (
  `IDTon` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuongTon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xuatnhapsp`
--

CREATE TABLE `xuatnhapsp` (
  `IDXuatNhap` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuongNhap` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitiet`
--
ALTER TABLE `chitiet`
  ADD PRIMARY KEY (`IDChiTiet`);

--
-- Chỉ mục cho bảng `chitiethd`
--
ALTER TABLE `chitiethd`
  ADD PRIMARY KEY (`IDHDB`,`IDSanPham`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`IDDanhGia`,`IDSanPham`);

--
-- Chỉ mục cho bảng `dongia`
--
ALTER TABLE `dongia`
  ADD PRIMARY KEY (`IDDonGia`,`IDSanPham`),
  ADD KEY `fk_dg` (`IDSanPham`);

--
-- Chỉ mục cho bảng `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`IDHang`);

--
-- Chỉ mục cho bảng `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD PRIMARY KEY (`IDHDB`),
  ADD KEY `fk_db` (`IDKhachHang`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`IDKhachHang`,`username`);

--
-- Chỉ mục cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`IDLoaiSP`);

--
-- Chỉ mục cho bảng `loaitin`
--
ALTER TABLE `loaitin`
  ADD PRIMARY KEY (`IDLoaiTin`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`IDNhaCungCap`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`IDSanPham`),
  ADD KEY `fk_lsp` (`IDLoaiSP`),
  ADD KEY `fk_ncc` (`IDNhaCungCap`),
  ADD KEY `IDHang` (`IDHang`),
  ADD KEY `IDSanPham` (`IDSanPham`);

--
-- Chỉ mục cho bảng `tbl_donvi`
--
ALTER TABLE `tbl_donvi`
  ADD PRIMARY KEY (`iddv`);

--
-- Chỉ mục cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`IDTinTuc`,`IDLoaiTin`),
  ADD KEY `fk_tt` (`IDLoaiTin`);

--
-- Chỉ mục cho bảng `tonkho`
--
ALTER TABLE `tonkho`
  ADD PRIMARY KEY (`IDTon`),
  ADD KEY `fk_sp` (`IDSanPham`);

--
-- Chỉ mục cho bảng `xuatnhapsp`
--
ALTER TABLE `xuatnhapsp`
  ADD PRIMARY KEY (`IDXuatNhap`,`IDSanPham`),
  ADD KEY `fk_sn` (`IDSanPham`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hoadonban`
--
ALTER TABLE `hoadonban`
  MODIFY `IDHDB` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `tbl_donvi`
--
ALTER TABLE `tbl_donvi`
  MODIFY `iddv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethd`
--
ALTER TABLE `chitiethd`
  ADD CONSTRAINT `fk_hdb` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Các ràng buộc cho bảng `dongia`
--
ALTER TABLE `dongia`
  ADD CONSTRAINT `fk_dg` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Các ràng buộc cho bảng `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD CONSTRAINT `fk_db` FOREIGN KEY (`IDKhachHang`) REFERENCES `khachhang` (`IDKhachHang`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_lsp` FOREIGN KEY (`IDLoaiSP`) REFERENCES `loaisp` (`IDLoaiSP`),
  ADD CONSTRAINT `fk_ncc` FOREIGN KEY (`IDNhaCungCap`) REFERENCES `nhacungcap` (`IDNhaCungCap`),
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`IDHang`) REFERENCES `hangsanxuat` (`IDHang`);

--
-- Các ràng buộc cho bảng `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `fk_tt` FOREIGN KEY (`IDLoaiTin`) REFERENCES `loaitin` (`IDLoaiTin`);

--
-- Các ràng buộc cho bảng `tonkho`
--
ALTER TABLE `tonkho`
  ADD CONSTRAINT `fk_sp` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Các ràng buộc cho bảng `xuatnhapsp`
--
ALTER TABLE `xuatnhapsp`
  ADD CONSTRAINT `fk_sn` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
