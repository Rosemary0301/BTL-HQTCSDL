use BaiTapLon

insert into KhachHang(MaKhachHang,TenKhachHang, ThongTinLienHe, SoDuNo)
values('KH001', N'Trịnh Công Hiệp', '0898436205', 2000000),
('KH002', N'Nguyễn Đức Triệu', '0359359982', 0),
('KH003', N'Phạm Thế Hoán', '0129381838', 0),
('KH004', N'Nguyễn Hữu Lam Trường', '0936487940', 3000000);

insert into SanPham(MaSanPham, TenSanPham, SoLuongTrongKho, Gia)
values('SP01', N'Sữa Milo', 100, 300000),
('SP02', N'Mì Cay Hàn Quốc', 100, 400000),
('SP03', N'Snack khoai tây', 200, 200000),
('SP04', N'Xà phòng tắm', 100, 300000),
('SP05', N'Nước rửa chén Sunlight', 300, 600000),
('SP06', N'kem đánh răng PS', 400, 200000);

insert into DonDatHang(MaDonHang, MaKhachHang, NgayDatHang, TongTien, TrangThaiThanhToan)
values('DH01', 'KH001', '2024-12-5', 5000000, N'Chưa thanh toán'),
('DH02', 'KH002', '2025-1-7', 6000000, N'Đã thanh toán'),
('DH03', 'KH003', '2025-2-5', 5500000, N'Đã thanh toán'),
('DH04', 'KH004', '2025-2-9', 3000000, N'Chưa thanh toán');

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

--Các câu truy vấn cơ bản
--Truy vấn Select
select * from XuatKho
select * from ChiTietDonHang

--Truy vấn Insert
insert into KhachHang(MaKhachHang,TenKhachHang, ThongTinLienHe, SoDuNo)
values('KH005', N'Nguyễn Văn Hoàn', '0929122005', 1000000)

--Truy vấn Update
update KhachHang 
set ThongTinLienHe = '0914856291'
where MaKhachHang = 'KH003';

update SanPham 
set Gia = '150000'
where MaSanPham = 'SP01';

--Tuy vấn Delete
delete from KhachHang
where MaKhachHang = 'KH005';

--Truy vấn nâng cao
-- truy vấn inner join
--Lấy danh sách đơn hàng kèm theo tên khách hàng
select DH.MaDonHang, KH.TenKhachHang, DH.NgayDatHang, DH.TongTien, DH.TrangThaiThanhToan from DonDatHang DH
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang;

--Lấy danh sách chi tiết đơn hàng kèm theo tên sản phẩm
select CT.MaChiTietDonHang, CT.MaDonHang, SP.TenSanPham, CT.SoLuong, CT.Gia from ChiTietDonHang CT
inner join SanPham SP on CT.MaSanPham = SP.MaSanPham;

--Truy vấn group by
--Tính tổng tiền hàng của mỗi khách hàng
select KH.TenKhachHang, sum(DH.TongTien) as TongTienMua
from DonDatHang DH
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang
group by KH.TenKhachHang;

--Tính tổng số lượng sản phẩm đã bán theo từng sản phẩm
select SP.TenSanPham, sum(CT.SoLuong) as TongSoLuongBan  
from ChiTietDonHang CT  
inner join SanPham SP on CT.MaSanPham = SP.MaSanPham  
group by SP.TenSanPham ;

--Truy vấn having
--Lọc khách hàng có tổng tiền mua hàng > 5 triệu
select KH.TenKhachHang, sum(DH.TongTien) as TongTienMua  
from DonDatHang DH  
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang  
group by KH.TenKhachHang  
having sum(DH.TongTien) > 5000000;

--Lọc sản phẩm có số lượng bán ra > 5 đơn vị
select SP.TenSanPham, sum(CT.SoLuong) as TongSoLuongBan  
from ChiTietDonHang CT  
inner join SanPham SP on CT.MaSanPham = SP.MaSanPham  
group by SP.TenSanPham  
having sum(CT.SoLuong) > 5;

--Lập trình T-SQL
--Tạo 8 view từ cơ bản đến nâng cao
--1.Tạo view lấy thông tin khách hàng với số dư nợ hiện tại
create view View_DanhSachKhachHang as  
select MaKhachHang, TenKhachHang, ThongTinLienHe, SoDuNo  
from KhachHang;
select * from View_DanhSachKhachHang;

--2.Lấy danh sách sản phẩm và số lượng trong kho
create view View_DanhSachSanPham as  
select MaSanPham, TenSanPham, SoLuongTrongKho, Gia  
from SanPham;
select * from View_DanhSachSanPham;

--3.Lấy thông tin đơn hàng kèm trạng thái thanh toán
create view View_DanhSachDonHang as  
select DH.MaDonHang, KH.TenKhachHang, DH.NgayDatHang, DH.TongTien, DH.TrangThaiThanhToan  
from DonDatHang DH  
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang;
select * from View_DanhSachDonHang;

--4.Liệt kê chi tiết đơn hàng và thông tin sản phẩm
create view View_ChiTietDonHang as  
select CT.MaChiTietDonHang, CT.MaDonHang, SP.TenSanPham, CT.SoLuong, CT.Gia  
from ChiTietDonHang CT  
inner join SanPham SP on CT.MaSanPham = SP.MaSanPham;
select * from View_ChiTietDonHang;

--5.Tổng hợp tổng tiền mua hàng của khách hàng từ đơn đặt hàng
create view View_TongTienKhachHang as  
select KH.TenKhachHang, sum(DH.TongTien) as TongTienMua  
from DonDatHang DH  
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang  
group by KH.TenKhachHang;
select * from View_TongTienKhachHang;

--6.Liệt kê các đơn hàng có trạng thái "Chưa thanh toán"
create view View_DonHangChuaThanhToan as  
select DH.MaDonHang, KH.TenKhachHang, DH.NgayDatHang, DH.TongTien  
from DonDatHang DH  
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang  
where DH.TrangThaiThanhToan = N'Chưa thanh toán';
select * from View_DonHangChuaThanhToan;

--7.Hiển thị thông tin xuất kho kèm tên khách hàng
create view View_XuatKhoChiTiet as  
select XK.MaXuatKho, XK.MaDonHang, KH.TenKhachHang, XK.NgayXuatKho  
from XuatKho XK  
inner join DonDatHang DH on XK.MaDonHang = DH.MaDonHang  
inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang;
select * from View_XuatKhoChiTiet;

--8.Danh sách khách hàng đang nợ trên 1 triệu
create view View_KhachHangNoCao as  
select MaKhachHang, TenKhachHang, SoDuNo  
from KhachHang  
where SoDuNo > 1000000;
select * from View_KhachHangNoCao;

--Tạo Index cho các bảng
--Tạo Index trên các cột thường dùng để join giúp tăng tốc truy vấn
create nonclustered index Index_DonDatHang_MaKhachHang on DonDatHang(MaKhachHang);
create nonclustered index Index_ChiTietDonHang_MaDonHang on ChiTietDonHang(MaDonHang);
create nonclustered index Index_ChiTietDonHang_MaSanPham on ChiTietDonHang(MaSanPham);
create nonclustered index Index_HoaDon_MaDonHang on HoaDon(MaDonHang);
create nonclustered index Index_XuatKho_MaDonHang on XuatKho(MaDonHang);

--Tạo Index trên các cột thường xuyên tìm kiếm
create nonclustered index Index_KhachHang_TenKhachHang on KhachHang(TenKhachHang);
create nonclustered index Index_DonDatHang_TrangThaiThanhToan on DonDatHang(TrangThaiThanhToan);
create nonclustered index Index_DonDatHang_NgayDatHang on DonDatHang(NgayDatHang);

--Tạo Index trên cột thường được GROUP BY, HAVING
create nonclustered index IX_DoanhThu_NgayDatHang on DonDatHang(NgayDatHang);
create nonclustered index Index_TongTien_KhachHang on DonDatHang(MaKhachHang, TongTien);
create nonclustered index Index_TongSoLuongBan on ChiTietDonHang(MaSanPham, SoLuong);

--Tạo Index trên các cột thường xuyên cập nhật(Update, Delete)
create nonclustered index IX_KhachHang_SoDuNo on KhachHang(SoDuNo);
create nonclustered index IX_SanPham_SoLuongTrongKho on SanPham(SoLuongTrongKho);
create nonclustered index IX_DonDatHang_TongTien on DonDatHang(TongTien);

--Tạo 10 store procedure
--1.Stored Procedure lấy danh sách tất cả khách hàng
create procedure Proc_LayDanhSachKhachHang
as
begin
    select * from KhachHang;
end;
exec Proc_LayDanhSachKhachHang;

--2.Stored Procedure lấy thông tin đơn hàng theo mã khách hàng
create procedure Proc_LayDonHang_TheoKhachHang
    @MaKhachHang nvarchar(10)
as
begin
    select * from DonDatHang where MaKhachHang = @MaKhachHang;
end;
exec Proc_LayDonHang_TheoKhachHang @MaKhachHang = 'KH001';

--3.Stored Procedure lấy danh sách đơn hàng trong khoảng thời gian
create procedure Proc_LayDonHang_TheoNgay
    @NgayBatDau date,
    @NgayKetThuc date
as
begin
    select * from DonDatHang 
    where NgayDatHang between @NgayBatDau and @NgayKetThuc;
end;
exec Proc_LayDonHang_TheoNgay '2024-01-01', '2024-12-31';

--4.Stored Procedure cập nhật số lượng sản phẩm trong kho
create procedure Proc_CapNhat_SoLuongSanPham
    @MaSanPham nvarchar(10),
    @SoLuongMoi int
as
begin
    update SanPham 
    set SoLuongTrongKho = @SoLuongMoi
    where MaSanPham = @MaSanPham;
end;
exec Proc_CapNhat_SoLuongSanPham 'SP01', 150;

--5. Stored Procedure Xóa khách hàng chỉ khi không có đơn hàng nào
create procedure Proc_XoaKhachHang
    @MaKhachHang nvarchar(10)
as
begin
    if exists (select 1 from DonDatHang where MaKhachHang = @MaKhachHang)
    begin
        print N'Không thể xóa, khách hàng đã có đơn hàng!';
    end
    else
    begin
        delete from KhachHang where MaKhachHang = @MaKhachHang;
        print N'Xóa khách hàng thành công!';
    end
end;
exec proc_XoaKhachHang 'KH002';

--6. Stored Procedure tính tổng số lượng sản phẩm đã bán của 1 sản phẩm
create procedure Proc_TinhTongSanPhamDaBan
    @MaSanPham nvarchar(10),
    @TongSoLuong int output
as
begin
    select @TongSoLuong = sum(SoLuong)
    from ChiTietDonHang
    where MaSanPham = @MaSanPham;
end;
declare @SoLuong int;
exec Proc_TinhTongSanPhamDaBan 'SP01', @SoLuong output;
print N'Tổng số lượng đã bán: ' + cast(@SoLuong as nvarchar);

--7.Stored Procedure thêm khách hàng mới vào bảng KhachHang
create procedure Proc_ThemKhachHang
    @MaKhachHang nvarchar(10),
    @TenKhachHang nvarchar(50),
    @ThongTinLienHe nvarchar(50),
    @SoDuNo int
as
begin
    insert into KhachHang (MaKhachHang, TenKhachHang, ThongTinLienHe, SoDuNo)
    values (@MaKhachHang, @TenKhachHang, @ThongTinLienHe, @SoDuNo);
end;
exec Proc_ThemKhachHang 'KH005', N'Nguyễn Văn Hoàn', '09291220051', 1000000;

--8.Stored Procedure đánh dấu đơn hàng là đã thanh toán
create procedure Proc_CapNhatTrangThaiThanhToan
    @MaDonHang nvarchar(10)
as
begin
    update DonDatHang
    set TrangThaiThanhToan = N'Đã thanh toán'
    where MaDonHang = @MaDonHang;
end; 
exec Proc_CapNhatTrangThaiThanhToan 'DH01';

--9.Stored Procedure trả về tổng doanh thu theo tháng và năm
create procedure Proc_DoanhThu_TheoThang
    @Nam int
as
begin
    select year(NgayDatHang) as Nam, month(NgayDatHang) as Thang, sum(TongTien) as TongDoanhThu
    from DonDatHang
    where year(NgayDatHang) = @Nam
    group by year(NgayDatHang), month(NgayDatHang)
    order by Thang;
end;
exec Proc_DoanhThu_TheoThang 2024;

--10. Stored Procedure lấy danh sách sản phẩm có số lượng tồn kho dưới mức cảnh báo (<50)
create procedure Proc_LaySanPham_TonKhoThap
as
begin
    select MaSanPham, TenSanPham, SoLuongTrongKho
    from SanPham
    where SoLuongTrongKho < 50;
end;
exec Proc_LaySanPham_TonKhoThap;

--Tạo 10 Function
--Hàm vô hướng(Scalar Function)
--1.Tính tổng số lượng sản phẩm đã bán theo mã sản phẩm
create function Func_TinhTongSanPhamDaBan (@MaSanPham nvarchar(10))
returns int
as
begin
    declare @TongSoLuong int;
    select @TongSoLuong = sum(SoLuong) 
    from ChiTietDonHang 
    where MaSanPham = @MaSanPham;

    return isnull(@TongSoLuong, 0);
end;
select dbo.Func_TinhTongSanPhamDaBan('SP01') as TongSoLuong;

--2.Tính tổng tiền của một đơn hàng
create function Func_TinhTongTienDonHang (@MaDonHang nvarchar(10))
returns int
as
begin
    declare @TongTien int;
    select @TongTien = sum(SoLuong * Gia) 
    from ChiTietDonHang
    where MaDonHang = @MaDonHang;

    return isnull(@TongTien, 0);
end;
select dbo.Func_TinhTongTienDonHang('DH01') as TongTien;

--3. Kiểm tra số lượng sản phẩm trong kho
create function Func_KiemTraTonKho (@MaSanPham nvarchar(10))
returns nvarchar(50)
as
begin
    declare @SoLuong int;
    select @SoLuong = SoLuongTrongKho from SanPham where MaSanPham = @MaSanPham;

    if @SoLuong is null
        return N'Sản phẩm không tồn tại';
    if @SoLuong < 10
        return N'Tồn kho thấp';
    
    return N'Tồn kho đủ';
end;
select dbo.Func_KiemTraTonKho('SP01');

--4. Lấy số lượng đơn hàng của một khách hàng
create function Func_TinhSoLuongDonHang (@MaKhachHang nvarchar(10))
returns int
as
begin
    declare @SoLuong int;
    select @SoLuong = count(*) 
    from DonDatHang 
    where MaKhachHang = @MaKhachHang;

    return isnull(@SoLuong, 0);
end;
select dbo.Func_TinhSoLuongDonHang('KH001') as SoLuongDonHang;

--5. Tính tổng doanh thu của cửa hàng
create function Func_TinhTongDoanhThu ()
returns int
as
begin
    declare @TongDoanhThu int;
    select @TongDoanhThu = sum(TongTien) from DonDatHang;

    return isnull(@TongDoanhThu, 0);
end;
select dbo.Func_TinhTongDoanhThu() as TongDoanhThu;

--Hàm bảng(Table-Valued Function)
--6. Lấy danh sách sản phẩm tồn kho thấp (dưới 50 sản phẩm)
create function Func_LaySanPhamTonKhoThap ()
returns table
as
return
(
    select MaSanPham, TenSanPham, SoLuongTrongKho
    from SanPham
    where SoLuongTrongKho < 50
);
select * from dbo.Func_LaySanPhamTonKhoThap();

--7. Lấy danh sách đơn hàng chưa thanh toán
create function Func_LayDonHangChuaThanhToan ()
returns table
as
return
(
    select * from DonDatHang where TrangThaiThanhToan = N'Chưa thanh toán'
);
select * from dbo.Func_LayDonHangChuaThanhToan();

--8.Lấy danh sách hóa đơn có giá trị cao (> 5 triệu)
create function Func_LayHoaDonGiaTriCao ()
returns table
as
return
(
    select hd.MaHoaDon, hd.NgayThanhToan, hd.SoTienThanhToan
    from HoaDon hd
    where hd.SoTienThanhToan > 5000000
);
select * from dbo.Func_LayHoaDonGiaTriCao();

--9.Lấy danh sách khách hàng có tổng tiền mua lớn hơn 5 triệu
create function Func_KhachHangMuaNhieu ()
returns table
as
return
(
    select KH.MaKhachHang, KH.TenKhachHang, sum(DH.TongTien) as TongTienMua
    from DonDatHang DH
    inner join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang
    group by KH.MaKhachHang, KH.TenKhachHang
    having sum(DH.TongTien) > 5000000
);
select * from dbo.Func_KhachHangMuaNhieu();

--10. Lấy danh sách doanh thu theo tháng
create function Func_DoanhThuTheoThang (@Nam int)
returns table
as
return
(
    select year(NgayDatHang) as Nam, month(NgayDatHang) as Thang, sum(TongTien) as TongDoanhThu
    from DonDatHang
    where year(NgayDatHang) = @Nam
    group by year(NgayDatHang), month(NgayDatHang)
);
select * from dbo.Func_DoanhThuTheoThang(2024);

--Trigger Kiểm Soát Dữ Liệu Trên Bảng SanPham
--1. Ngăn nhập sản phẩm có giá ≤ 0
create trigger Trgg_KiemTraGiaSanPham
on SanPham
instead of insert
as
begin
    if exists (select * from inserted where Gia <= 0)
    begin
        raiserror(N'Giá sản phẩm phải lớn hơn 0!', 16, 1);
        rollback transaction;
    end
    else
    begin
        insert into SanPham(MaSanPham, TenSanPham, SoLuongTrongKho, Gia)
        select MaSanPham, TenSanPham, SoLuongTrongKho, Gia from inserted;
    end
end;
insert into SanPham values ('SP07', N'Bánh quy', 50, -200000); -- Sẽ báo lỗi

--2. Tự động cập nhật số lượng tồn kho khi có đơn hàng
create trigger Trgg_CapNhatTonKho
on ChiTietDonHang
after insert
as
begin
    update SanPham
    set SoLuongTrongKho = SanPham.SoLuongTrongKho - inserted.SoLuong
    from SanPham
    join inserted on SanPham.MaSanPham = inserted.MaSanPham;
end;
insert into ChiTietDonHang values ('MDH14', 'DH01', 'SP01', 5, 300000);

--Trigger Kiểm Soát Dữ Liệu Trên Bảng DonDatHang
--3. Ngăn khách hàng đặt hàng khi còn nợ
create trigger Trgg_KiemTraNoKhachHang
on DonDatHang
instead of insert
as
begin
    if exists (
        select 1 
        from inserted i
        join KhachHang KH on i.MaKhachHang = KH.MaKhachHang
        where KH.SoDuNo > 0
    )
    begin
        raiserror(N'Khách hàng còn nợ, không thể đặt hàng!', 16, 1);
        rollback transaction;
    end
    else
    begin
        insert into DonDatHang (MaDonHang, MaKhachHang, NgayDatHang, TongTien, TrangThaiThanhToan)
        select MaDonHang, MaKhachHang, NgayDatHang, TongTien, TrangThaiThanhToan 
        from inserted;
    end
end;
insert into DonDatHang values ('DH05', 'KH001', '2025-03-15', 2000000, N'Chưa thanh toán'); 

--4. Tự động cập nhật trạng thái thanh toán khi đã thanh toán đủ
create trigger Trgg_CapNhatTrangThaiThanhToan
on HoaDon
after insert
as
begin
    update DonDatHang
    set TrangThaiThanhToan = N'Đã thanh toán'
    from DonDatHang dh
    join inserted hd on dh.MaDonHang = hd.MaDonHang;
end;
insert into HoaDon values ('MHD05', 'DH01', '2025-03-15', 5000000);
select * from DonDatHang where MaDonHang = 'DH01'; -- Trạng thái sẽ đổi thành "Đã thanh toán"

--Trigger Kiểm Soát Dữ Liệu Trên Bảng KhachHang
--5. Tự động xóa tất cả đơn hàng khi xóa khách hàng
create trigger Trgg_XoaDonHangKhiXoaKhach
on KhachHang
after delete
as
begin
    delete from DonDatHang where MaKhachHang in (select MaKhachHang from deleted);
end;
delete from KhachHang where MaKhachHang = 'KH002';
select * from DonDatHang where MaKhachHang = 'KH002'; -- Không còn đơn hàng của KH002

--6. Cảnh báo khi cập nhật thông tin khách hàng có đơn hàng chưa thanh toán
create trigger Trgg_KiemTraTonKho
on ChiTietDonHang
instead of insert
as
begin
    if exists (
        select 1
        from inserted i
        join SanPham SP on i.MaSanPham = SP.MaSanPham
        where i.SoLuong > SP.SoLuongTrongKho
    )
    begin
        raiserror(N'Số lượng sản phẩm trong kho không đủ!', 16, 1);
        rollback transaction;
    end
    else
    begin
        -- Chèn dữ liệu nếu đủ hàng
        insert into ChiTietDonHang (MaChiTietDonHang, MaDonHang, MaSanPham, SoLuong, Gia)
        select MaChiTietDonHang, MaDonHang, MaSanPham, SoLuong, Gia 
        from inserted;

        -- Giảm số lượng trong kho
        update SP
        set SP.SoLuongTrongKho = SP.SoLuongTrongKho - i.SoLuong
        from SanPham SP
        join inserted i on SP.MaSanPham = i.MaSanPham;
    end
end;
insert into ChiTietDonHang values ('MDH14', 'DH02', 'SP01', 500, 300000);

--Trigger Kiểm Soát Dữ Liệu Trên Bảng ChiTietDonHang
--7. Ngăn đặt hàng với số lượng lớn hơn tồn kho
create trigger trg_KiemTraNoTruocThanhToan
on HoaDon
instead of insert
as
begin
    if exists (
        select 1
        from inserted i
        join DonDatHang DH on i.MaDonHang = DH.MaDonHang
        join KhachHang KH on DH.MaKhachHang = KH.MaKhachHang
        where KH.SoDuNo > 0
    )
    begin
        raiserror(N'Khách hàng còn nợ, không thể thanh toán!', 16, 1);
        rollback transaction;
    end
    else
    begin
        insert into HoaDon (MaHoaDon, MaDonHang, NgayThanhToan, SoTienThanhToan)
        select MaHoaDon, MaDonHang, NgayThanhToan, SoTienThanhToan 
        from inserted;
    end
end;

insert into HoaDon values ('MHD05', 'DH01', '2025-03-15', 2000000);

--8. Cập nhật nợ sau khi thanh toán hóa đơn
create trigger Trgg_CapNhatNoSauThanhToan
on HoaDon
after insert
as
begin
    update KH
    set KH.SoDuNo = KH.SoDuNo - i.SoTienThanhToan
    from KhachHang KH
    join DonDatHang DH on KH.MaKhachHang = DH.MaKhachHang
    join inserted i on DH.MaDonHang = i.MaDonHang;
end;
insert into HoaDon values ('MHD06', 'DH02', '2025-03-15', 6000000);

--Tạo người dùng
create login User_NhanVien with password = 'NhanVien123';
create login User_QuanLy with password = 'QuanLy123';
create login User_Admin with password = 'Admin123';
create user NhanVien for login User_NhanVien;
create user QuanLy for login User_QuanLy;
create user Admin for login User_Admin;

--Thiết lập quyền truy cập và phân quyền người dùng
--phân quyền cho nhân viên)chỉ đọc dữ liệu)
grant select on KhachHang to NhanVien;
grant select on DonDatHang to NhanVien;
grant select on SanPham to NhanVien;

--Phân quyền cho Quản lý (có thể xem, sửa nhưng không thể xóa)
grant select, insert, update on KhachHang to QuanLy;
grant select, insert, update on DonDatHang to QuanLy;
grant select, insert, update on SanPham to QuanLy;

--Phân quyền cho Admin (toàn quyền trên tất cả các bảng)
grant all privileges on KhachHang to Admin;
grant all privileges on DonDatHang to Admin;
grant all privileges on SanPham to Admin;

--Hạn chế quyền xóa dữ liệu (deny)
deny delete on KhachHang to QuanLy;
deny delete on DonDatHang to QuanLy;
deny delete on SanPham to QuanLy;

--Phục hồi dữ liệu từ bản sao lưu
restore database BaiTapLon 
from disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.DNU\MSSQL\Backup\BaiTapLon.bak'
with replace, recovery;