create database quanlinv
go
use quanlinv
go
create table PhongBan(
     MaPB varchar(7) primary key,
	 TenPB nvarchar(50)
)
go
create table NhanVien(
     MaNV varchar(7) primary key,
	 TenNV nvarchar(50),
	 NgaySinh datetime,
	 SoCMND int,
	 GioiTinh Char(1) default 'M',--M: nam|| F: nữ 
	 DiaChi nvarchar(100),
	 NgayVaoLam Datetime,
	 MaPB varchar(7) 
	 foreign key (MaPB) references PhongBan(MaPB)
)
go
create table LuongDA(
      MaDA varchar(8),
	  MaNV varchar(7),
	  NgayNhan datetime not null,
	  SoTien money check( SoTien>0),
	  Primary key (MaDA,MaNV),
	  foreign key (MaNV) references NhanVien(MaNV)
)
go

insert into PhongBan values(520, N'Nhân sự'),
                           (521, N'Kế Toán'),
						   (522, N'Thiết kế'),
						   (523, N'Marketing'),
						   (524, N'Bảo an')
go
insert into NhanVien values(1,N'Nguyễn Đắc Dũng','2003-03-24','34155313','M',N'Khoái Châu-Hưng Yên','2021-05-16',522),
                           (2,N'Nguyễn Duy Tộ','2000-04-22','34155346','M',N'Hà Đông-Hà Nội','2020-03-04',524),
						   (3,N'Nguyễn Mai Lan','2000-04-12','34143346','F',N'Hà Đông-Hà Nội','2019-04-04',523),
						   (5,N'Võ Danh Hùng','1995-04-22','34235346','M',N'Phố Cổ-Hà Nội','2020-03-06',520),
						   (4,N'Nguyễn Hải Linh','1996-04-22','34445346','F',N'Hà Nam-Hà Nội','2019-03-04',521)
go
insert into LuongDA(MaDA,MaNV,NgayNhan) values('N09','1','2021-01-12'),
                         ('N08','1','2020-10-12'),
						 ('N07','2','2020-11-02'),
						 ('N06','5','2020-01-10'),
						 ('N05','2','2021-01-13'),
						 ('N04','3','2020-01-24')
go
select*From[NhanVien]
where GioiTinh='F';
go
select*from LuongDA
go
select*from NhanVien
go
select*from PhongBan
go
select count(MaNV),SoTien
from LuongDA
group by SoTien
order by COUNT(MaNV) desc;
go
select*from NhanVien
where MaPB=522
go
select*from NhanVien
where SoCMND like '%6'
go
select*from NhanVien
where GioiTinh='F' and
go
select*from NhanVien
where TenNV like 'N%'
go
delete from LuongDA
where MaDA='N04'
go
select*from LuongDA
go

