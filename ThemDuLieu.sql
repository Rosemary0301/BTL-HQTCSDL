use BaiTapLon

insert into KhachHang(MaKhachHang,TenKhachHang, ThongTinLienHe, SoDuNo)
values('KH001', N'Tr?nh Công Hi?p', '0898436205', 2000000),
('KH002', N'Nguy?n ??c Tri?u', '0359359982', 0),
('KH003', N'Ph?m Th? Hoán', '0129381838', 0),
('KH004', N'Nguy?n H?u Lam Tr??ng', '0936487940', 3000000);

insert into SanPham(MaSanPham, TenSanPham, SoLuongTrongKho, Gia)
values('SP01', N'S?a Milo', 100, 300000),
('SP02', N'Mì Cay Hàn Qu?c', 100, 400000),
('SP03', N'Snack khoai tây', 200, 200000),
('SP04', N'Xà phòng t?m', 100, 300000),
('SP05', N'N??c r?a chén Sunlight', 300, 600000),
('SP06', N'kem ?ánh r?ng PS', 400, 200000);

insert into DonDatHang(MaDonHang, MaKhachHang, NgayDatHang, TongTien, TrangThaiThanhToan)
values('DH01', 'KH001', '2024-12-5', 5000000, N'Ch?a thanh toán'),
('DH02', 'KH002', '2025-1-7', 6000000, N'?ã thanh toán'),
('DH03', 'KH003', '2025-2-5', 5500000, N'?ã thanh toán'),
('DH04', 'KH004', '2025-2-9', 3000000, N'Ch?a thanh toán');

insert into ChiTietDonHang(MaChiTietDonHang, MaDonHang, MaSanPham, SoLuong, Gia)
values('MDH01', 'DH01', 'SP01' , 10, 3000000),
('MDH02', 'DH01', 'SP02' , 2, 800000),
('MDH03', 'DH01', 'SP03' , 6, 1200000),
('MDH04', 'DH02', 'SP05' , 10, 6000000),
('MDH05', 'DH03', 'SP06' , 5, 1000000),
('MDH06', 'DH03', 'SP01' , 4, 1200000),
('MDH07', 'DH03', 'SP04' , 1, 300000),
('MDH08', 'DH03', 'SP05' , 3, 1800000),
('MDH09', 'DH03', 'SP03' , 1, 200000),
('MDH10', 'DH04', 'SP06' ,5, 1000000),
('MDH11', 'DH04', 'SP01' , 4, 1200000),
('MDH12', 'DH04', 'SP03' , 1, 200000),
('MDH13', 'DH04', 'SP05' , 1, 600000);

insert into HoaDon(MaHoaDon, MaDonHang, NgayThanhToan, SoTienThanhToan)
values('MHD01', 'DH01','2025-12-06', '5000000'),
('MHD02', 'DH02','2025-01-08', '6000000'),
('MHD03', 'DH03','2025-02-10', '5500000'),
('MHD04', 'DH04','2025-02-10', '3000000');

insert into XuatKho(MaXuatKho, MaDonHang, NgayXuatKho)
values('MXK01', 'DH01', '2024-12-06'),
('MXK02', 'DH02', '2025-01-09'),
('MXK03', 'DH03', '2025-02-11'),
('MXK04', 'DH04', '2025-02-10');

select * from XuatKho