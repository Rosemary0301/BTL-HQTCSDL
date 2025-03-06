use BaiTapLon

-- B?ng Khách Hàng
create table KhachHang (
    MaKhachHang varchar(10) primary key,
    TenKhachHang varchar(100) not null,
    ThongTinLienHe varchar(100),
	SoDuNo decimal(10, 2) default 0.00
);

-- B?ng S?n Ph?m
create table SanPham (
    MaSanPham varchar(10) primary key,
    TenSanPham varchar(100) not null,
    SoLuongTrongKho int not null,
    Gia decimal(10, 2) not null
);

-- B?ng ??n ??t Hàng
create table DonDatHang (
    MaDonHang varchar(10) primary key,
    MaKhachHang varchar(10),
    NgayDatHang date,
    TongTien decimal(10, 2),
    TrangThaiThanhToan varchar(20),
    foreign key (MaKhachHang) references KhachHang(MaKhachHang)
);

-- B?ng Chi Ti?t ??n Hàng
create table ChiTietDonHang (
    MaChiTietDonHang varchar(10) primary key,
    MaDonHang varchar(10),
    MaSanPham varchar(10),
    SoLuong int,
    Gia decimal(10, 2),
    foreign key (MaDonHang) references DonDatHang(MaDonHang),
    foreign key (MaSanPham) references SanPham(MaSanPham)
);

-- B?ng Hóa ??n
create table HoaDon (
    MaHoaDon varchar(10) primary key,
    MaDonHang varchar(10),
    NgayThanhToan date,
    SoTienThanhToan decimal(10, 2),
    foreign key (MaDonHang) references DonDatHang(MaDonHang)
);

-- B?ng Xu?t Kho
create table XuatKho (
    MaXuatKho varchar(10) primary key,
    MaDonHang varchar(10),
    NgayXuatKho date,
    foreign key (MaDonHang) references DonDatHang(MaDonHang)
);

