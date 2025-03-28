use BaiTapLon

-- Bang Khâch Hang
create table KhachHang (
    MaKhachHang varchar(10) primary key,
    TenKhachHang nvarchar(100) not null,
    ThongTinLienHe nvarchar(100),
	SoDuNo int
);

-- Bang San Pham
create table SanPham (
    MaSanPham varchar(10) primary key,
    TenSanPham nvarchar(100) not null,
    SoLuongTrongKho int not null,
    Gia decimal(10, 2) not null
);

-- Bang Don Dat Hang
create table DonDatHang (
    MaDonHang varchar(10) primary key,
    MaKhachHang varchar(10),
    NgayDatHang date,
    TongTien decimal(10, 2),
    TrangThaiThanhToan nvarchar(20),
    foreign key (MaKhachHang) references KhachHang(MaKhachHang)
);

-- Bang Chi Tiet Don Hang
create table ChiTietDonHang (
    MaChiTietDonHang varchar(10) primary key,
    MaDonHang varchar(10),
    MaSanPham varchar(10),
    SoLuong int,
    Gia decimal(10, 2),
    foreign key (MaDonHang) references DonDatHang(MaDonHang),
    foreign key (MaSanPham) references SanPham(MaSanPham)
);

-- Bang Hoa Don
create table HoaDon (
    MaHoaDon varchar(10) primary key,
    MaDonHang varchar(10),
    NgayThanhToan date,
    SoTienThanhToan decimal(10, 2),
    foreign key (MaDonHang) references DonDatHang(MaDonHang)
);

-- Bang Xuat Kho
create table XuatKho (
    MaXuatKho varchar(10) primary key,
    MaDonHang varchar(10),
    NgayXuatKho date,
    foreign key (MaDonHang) references DonDatHang(MaDonHang)
);

