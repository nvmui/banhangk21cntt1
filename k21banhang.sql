-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221226.e06ada1bf0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2023 at 03:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k21banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitiet`
--

CREATE TABLE `chitiet` (
  `IDChiTiet` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `CauHinh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chitiethd`
--

CREATE TABLE `chitiethd` (
  `IDHDB` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `IDDonGia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `danhgia`
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
-- Table structure for table `dongia`
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
-- Dumping data for table `dongia`
--

INSERT INTO `dongia` (`IDDonGia`, `IDSanPham`, `GiaBan`, `GiaNhap`, `Ngay`, `Chon`) VALUES
(1, 1, 19900000, 17900000, '2023-01-10', b'1'),
(2, 2, 19900000, 17900000, '2023-01-10', b'1'),
(3, 3, 19900000, 17900000, '2023-01-10', b'1'),
(4, 4, 19900000, 17900000, '2023-01-10', b'0'),
(5, 4, 18900000, 16900000, '2023-01-10', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `IDHang` int(11) NOT NULL,
  `TenHang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`IDHang`, `TenHang`) VALUES
(1, 'SamSung'),
(2, 'Apple'),
(3, 'Oppo'),
(4, 'ViVo');

-- --------------------------------------------------------

--
-- Table structure for table `hoadonban`
--

CREATE TABLE `hoadonban` (
  `IDHDB` int(11) NOT NULL,
  `IDKhachHang` int(11) DEFAULT NULL,
  `NgayBan` date DEFAULT NULL,
  `NoiDung` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `IDKhachHang` int(11) NOT NULL,
  `TenKH` varchar(30) DEFAULT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `passwword` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `loaisp`
--

CREATE TABLE `loaisp` (
  `IDLoaiSP` int(11) NOT NULL,
  `TenLoai` varchar(30) DEFAULT NULL,
  `MoTa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `loaisp`
--

INSERT INTO `loaisp` (`IDLoaiSP`, `TenLoai`, `MoTa`) VALUES
(1, 'Điện thoại', 'aaa'),
(2, 'Laptop', 'lap'),
(3, 'Phụ kiện', '1'),
(4, 'SmartWach', '1');

-- --------------------------------------------------------

--
-- Table structure for table `loaitin`
--

CREATE TABLE `loaitin` (
  `IDLoaiTin` int(11) NOT NULL,
  `TenLoai` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `IDNhaCungCap` int(11) NOT NULL,
  `TenNhaCC` varchar(30) DEFAULT NULL,
  `DiaChi` varchar(30) DEFAULT NULL,
  `SDT` varchar(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`IDNhaCungCap`, `TenNhaCC`, `DiaChi`, `SDT`, `Email`) VALUES
(1, 'FPT Shope', '143 Nguyễn Lương Bằng', '0819173817', 'fptshope@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
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
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`IDSanPham`, `TenSP`, `IDLoaiSP`, `IDHang`, `IDNhaCungCap`, `MoTaSP`, `HinhDaiDien`, `TrangThai`) VALUES
(1, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(2, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(3, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1'),
(4, 'Iphone 13', 1, 2, 1, 'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.', 'iphone-13.jpg', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `IDTinTuc` int(11) NOT NULL,
  `IDLoaiTin` int(11) NOT NULL,
  `NoiDungTin` varchar(225) DEFAULT NULL,
  `NgayDang` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tonkho`
--

CREATE TABLE `tonkho` (
  `IDTon` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuongTon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `xuatnhapsp`
--

CREATE TABLE `xuatnhapsp` (
  `IDXuatNhap` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `SoLuongNhap` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitiet`
--
ALTER TABLE `chitiet`
  ADD PRIMARY KEY (`IDChiTiet`),
  ADD KEY `fk_a` (`IDSanPham`);

--
-- Indexes for table `chitiethd`
--
ALTER TABLE `chitiethd`
  ADD PRIMARY KEY (`IDHDB`,`IDSanPham`),
  ADD KEY `fk_hdb` (`IDSanPham`);

--
-- Indexes for table `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`IDDanhGia`,`IDSanPham`);

--
-- Indexes for table `dongia`
--
ALTER TABLE `dongia`
  ADD PRIMARY KEY (`IDDonGia`,`IDSanPham`),
  ADD KEY `fk_dg` (`IDSanPham`);

--
-- Indexes for table `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`IDHang`);

--
-- Indexes for table `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD PRIMARY KEY (`IDHDB`),
  ADD KEY `fk_db` (`IDKhachHang`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`IDKhachHang`,`username`);

--
-- Indexes for table `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`IDLoaiSP`);

--
-- Indexes for table `loaitin`
--
ALTER TABLE `loaitin`
  ADD PRIMARY KEY (`IDLoaiTin`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`IDNhaCungCap`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`IDSanPham`),
  ADD KEY `fk_lsp` (`IDLoaiSP`),
  ADD KEY `fk_ncc` (`IDNhaCungCap`),
  ADD KEY `IDHang` (`IDHang`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`IDTinTuc`,`IDLoaiTin`),
  ADD KEY `fk_tt` (`IDLoaiTin`);

--
-- Indexes for table `tonkho`
--
ALTER TABLE `tonkho`
  ADD PRIMARY KEY (`IDTon`),
  ADD KEY `fk_sp` (`IDSanPham`);

--
-- Indexes for table `xuatnhapsp`
--
ALTER TABLE `xuatnhapsp`
  ADD PRIMARY KEY (`IDXuatNhap`,`IDSanPham`),
  ADD KEY `fk_sn` (`IDSanPham`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitiet`
--
ALTER TABLE `chitiet`
  ADD CONSTRAINT `fk_a` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Constraints for table `chitiethd`
--
ALTER TABLE `chitiethd`
  ADD CONSTRAINT `fk_hd` FOREIGN KEY (`IDHDB`) REFERENCES `hoadonban` (`IDHDB`),
  ADD CONSTRAINT `fk_hdb` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Constraints for table `dongia`
--
ALTER TABLE `dongia`
  ADD CONSTRAINT `fk_dg` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Constraints for table `hoadonban`
--
ALTER TABLE `hoadonban`
  ADD CONSTRAINT `fk_db` FOREIGN KEY (`IDKhachHang`) REFERENCES `khachhang` (`IDKhachHang`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_lsp` FOREIGN KEY (`IDLoaiSP`) REFERENCES `loaisp` (`IDLoaiSP`),
  ADD CONSTRAINT `fk_ncc` FOREIGN KEY (`IDNhaCungCap`) REFERENCES `nhacungcap` (`IDNhaCungCap`),
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`IDHang`) REFERENCES `hangsanxuat` (`IDHang`);

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `fk_tt` FOREIGN KEY (`IDLoaiTin`) REFERENCES `loaitin` (`IDLoaiTin`);

--
-- Constraints for table `tonkho`
--
ALTER TABLE `tonkho`
  ADD CONSTRAINT `fk_sp` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);

--
-- Constraints for table `xuatnhapsp`
--
ALTER TABLE `xuatnhapsp`
  ADD CONSTRAINT `fk_sn` FOREIGN KEY (`IDSanPham`) REFERENCES `sanpham` (`IDSanPham`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
