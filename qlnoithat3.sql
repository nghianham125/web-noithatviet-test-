use master
go
create database ql_noithat
go
use ql_noithat
go

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE chi_tiet_hoa_don (
  ma_cthd int NOT NULL primary key identity,
  ma_hd int NOT NULL,
  ma_sp int NOT NULL,
  so_luong int NOT NULL,
  gia float NOT NULL
) ;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `hoa_don`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hoa_don (
  ma_hd int NOT NULL primary key identity,
  ma_kh int NOT NULL,
  ngay_dat date NOT NULL,
  tong_tien float NOT NULL
) ;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `khach_hang`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE khach_hang (
  ma_kh int NOT NULL primary key identity,
  ten_kh nvarchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  dia_chi nvarchar(500) NOT NULL,
  sdt varchar(11) NOT NULL
) ;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `loai_san_pham`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE loai_san_pham (
  ma_loai int NOT NULL primary key identity,
  ten_loai nvarchar(100) NOT NULL
) ;

--
-- SQLINES DEMO *** table `loai_san_pham`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO loai_san_pham ( ten_loai) VALUES
( N'Sản phẩm hot'),
( N'Sản phẩm khuyến mãi'),
( N'Sản phẩm mới'),
( N'Nội thất phòng khách'),
( N'Nội thất phòng ngủ'),
( N'Nội thất phòng ăn'),
( N'Nội thất phòng bếp'),
( N'Phòng làm việc'),
( N'Hàng trang trí'),
( N'Bộ sưu tập');

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `san_pham`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE san_pham (
  ma_sp int NOT NULL primary key identity,
  ten_sp nvarchar(100) NOT NULL,
  mo_ta nvarchar(500) NOT NULL,
  gia float NOT NULL,
  hinh varchar(100) NOT NULL,
  ma_loai int NOT NULL
) ;

--
-- SQLINES DEMO *** table `san_pham`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO san_pham ( ten_sp, mo_ta, gia, hinh, ma_loai) VALUES
( N'Tủ Kệ Tivi Gỗ MOHO OSLO 201', '', 2290000, 'pk1.jpg', 4),
( N'Kệ Gỗ - Kệ Sách MOHO OSLO 901', '', 1690000, 'pk2.jpg', 4),
( N'Bàn Sofa – Bàn Café – Bàn Trà Gỗ MOHO OSLO 901', '', 1290000, 'pk3.jpg', 4),
( N'Ghế Sofo Gỗ Tràm Tự Nhiên MOHO VLINE 601', '', 7490000, 'pk4.jpg', 4),
( N'Ghế Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601', '', 7490000, 'pk5.jpg', 4),
( N'Bàn Sofa – Bàn Cafe – Bàn Trà Tròn Gỗ MOHO OSLO 901', '', 1290000, 'pk6.jpg', 4),
( N'Tủ Giày – Tủ Trang Trí Gỗ MOHO OSLO 901', '', 2190000, 'pk7.jpg', 4),
( N'Tủ Kệ Tivi Gỗ Tràm MOHO VLINE 301', '', 2990000, 'pk8.jpg', 4),
( N'Tủ Giày – Tủ Trang Trí Gỗ Tràm MOHO VLINE 601', '', 2490000, 'pk9.jpg', 4),
( N'Bàn sofa – Bàn café – Bàn trà tròn cao gỗ MOHO OSLO 901', '', 590000, 'pk10.jpg', 4),
( N'Kệ gỗ - Kệ sách MOHO OSLO 902', '', 1990000, 'pk11.jpg', 4),
( N'Bàn Sofa – Bàn Cafe – Bàn trà gỗ MOHO VLINE 501', '', 1390000, 'pk12.jpg', 4),
( N'Bàn Sofa – Bàn Cafe – Bàn trà gỗ cao su MOHO MILAN 601 xám', '', 590000, 'pk13.jpg', 4),
( N'Bàn Sofa – Bàn Café – Bàn trà gỗ cao su MOHO MILAN 602', '', 590000, 'pk14.jpg', 4),
( N'Tủ kệ tivi gỗ MOHO VLINE 301', '', 2990000, 'pk15.jpg', 4),
( N'Bàn Sofa – Bàn Cafe – Bàn trà gỗ cao su MOHO MILAN 601 trắng', '', 590000, 'pk16.jpg', 4),
( N'Set 2 bàn Sofa – Bàn Cafe – Bàn trà gỗ cao su MOHO MILAN 601', '', 1120000, 'pk17.jpg', 4),
( N'Tủ  giày – Tủ trang trí gỗ MOHO VIENNA 203', '', 2990000, 'pk18.jpg', 4),
( N'Ghế Sofa gỗ cao su tự nhiên MOHO FYN 901', '', 11990000, 'pk19.jpg', 4),
( N'Tủ giày – Tủ trang trí gỗ MOHO VLINE 601', '', 2490000, 'pk20.jpg', 4),
( N'Giường ngủ gỗ tràm MOHO VLINE 601 Nhiều kích thước', '', 4490000, 'pn1.jpg', 5),
( N'Tủ đầu giường gỗ MOHO VLINE 801', '', 1990000, 'pn2.jpg', 5),
( N'Giường ngủ gỗ tram MOHO DALUMD 301', '', 5290000, 'pn3.jpg', 5),
( N'Full combo phòng ngủ MOHO KOSTER màu nâu', '', 13870000, 'pn4.jpg', 5),
( N'Set tủ quần áo gỗ MOHO VIENNA 2013 3 cánh kệ ngăn 4 màu', '', 8290000, 'pn5.jpg', 5),
( N'Bàn trang điểm gỗ đa năng MOHO VIENNA 202 màu tự nhiên', '', 3990000, 'pn6.jpg', 5),
( N'Giường ngủ gỗ cao su MOHO HOBRO 301', '', 7490000, 'pn7.jpg', 5),
( N'Full combo phòng ngủ Ubeda 201 màu tự nhiên', '', 10960000, 'pn8.jpg', 5),
( N'Giường ngủ gỗ tram MOHO MALAGA 301 V2', '', 5490000, 'pn9.jpg', 5),
( N'Combo basic phòng ngủ Ubeda 201 màu nâu', '', 4780000, 'pn10.jpg', 5),
( N'Full combo phòng ngủ MOHO LANGO màu nâu cam', '', 12070000, 'pn11.jpg', 5),
( N'Giường ngủ gỗ MOHO VLINE 601 nhiều kích thước', '', 4490000, 'pn12.jpg', 5),
( N'Tủ quần áo gỗ 2 cánh MOHO VIENNA 201 4 màu', '', 5290000, 'pn13.jpg', 5),
( N'Tủ quần áo gỗ kệ ngăn MOHO VIENNA 201 4 màu', '', 3990000, 'pn14.jpg', 5),
( N'Tủ đầu giường gỗ MOHO VIENNA 201', '', 1290000, 'pn15.jpg', 5),
( N'Tủ quần áo gỗ MOHO VLINE 601', '', 3490000, 'pn16.jpg', 5),
( N'Giường tủ gỗ tram MOHO MALAGA 302 nhiều kích thước', '', 4290000, 'pn17.jpg', 5),
( N'Tủ đầu giường gỗ MOHO VLINE 801 màu tự nhiên', '', 1990000, 'pn18.jpg', 5),
( N'Tủ quần áo gỗ thanh treo MOHO VIENNA 201 4 màu', '', 3990000, 'pn19.jpg', 5),
( N'Tủ đầu giường gỗ MOHO MALAGA 302', '', 1490000, 'pn20.jpg', 5),
( N'Ghế ăn gỗ cao su tự nhiên MOHO OSLO 601', '', 1090000, 'pa1.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO VLINE 601', '', 1290000, 'pa2.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO FYN', '', 1590000, 'pa3.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO ODESSA', '', 1190000, 'pa4.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO MILAN 601 màu nâu', '', 1390000, 'pa5.jpg', 6),
( N'Ghế băng dài gỗ cao su tự nhiên MOHO VLINE 602', '', 1390000, 'pa6.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO MILAN 601 màu gỗ', '', 1390000, 'pa7.jpg', 6),
( N'Ghế băng tựa gỗ cao su tự nhiên MOHO VLINE 601', '', 1890000, 'pa8.jpg', 6),
( N'Bàn gỗ cao su MOHO OSLO 901', '', 3790000, 'pa9.jpg', 6),
( N'Bàn ăn gỗ MOHO MILAN 901 màu gỗ', '', 2990000, 'pa10.jpg', 6),
( N'Bàn ăn gỗ cao su tự nhiên MOHO VLINE 601 1m6', '', 3790000, 'pa11.jpg', 6),
( N'Bộ bàn ăn gỗ cao su tự nhiên MOHO VLINE 601', '', 5770000, 'pa12.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO VERONA 601', '', 1190000, 'pa13.jpg', 6),
( N'Bộ bàn ăn gỗ 4 ghế cao su MOHO OSLO 601', '', 6950000, 'pa14.jpg', 6),
( N'Bàn ăn gỗ cao su tự nhiên MOHO VLINE 601 90cm', '', 2790000, 'pa15.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO MALAGA 601', '', 1190000, 'pa16.jpg', 6),
( N'Ghế ăn gỗ cao su tự nhiên MOHO NEXO 601', '', 1190000, 'pa17.jpg', 6),
( N'Bộ bàn ghế gỗ MOHO MILAN 901 (1m25)', '', 7350000, 'pa18.jpg', 6),
( N'Bàn ăn gỗ cao su tự nhiên MOHO VLINE 602', '', 3990000, 'pa19.jpg', 6),
( N'Bàn ăn gỗ cao su tự nhiên MOHO VLINE 602', '', 3990000, 'pa20.jpg', 6),
( N'Hệ tủ bếp MOHO Kitchen Premium Grenaa nhiều kích thước', '', 11890000, 'pb1.jpg', 7),
( N'Hệ tủ bếp MOH Kitchen Prmium Ubeda nhiều kích thước', '', 11890000, 'pb2.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Premium Narvik nhiều kích thước', '', 11890000, 'pb3.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Smart Grenaa nhiều kích thước', '', 8490000, 'pb4.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Smart Ubeda nhiều kích thước', '', 8490000, 'pb5.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Smart Narvik nhiều kích thước', '', 8490000, 'pb6.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Essential Grenaa nhiều kích thước', '', 7890000, 'pb7.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Essential Ubeda nhiều kích thước', '', 7890000, 'pb8.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen Essential Narvik nhiều kích thước', '', 7890000, 'pb9.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen dòng Premium', '', 45000000, 'pb10.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen dòng STANDARD', '', 35000000, 'pb11.jpg', 7),
( N'Hệ tủ bếp MOHO Kitchen dòng ESSENTIAL', '', 30000000, 'pb12.jpg', 7),
( N'Kệ gỗ - Kệ sách MOHO OSLO 901', '', 1690000, 'plv1.jpg', 8),
( N'Bàn làm việc gỗ MOHO VLINE 601 màu nâu', '', 1590000, 'plv2.jpg', 8),
( N'Bàn làm việc gỗ MOHO VLINE 601 màu tự nhiên', '', 1590000, 'plv3.jpg', 8),
( N'Bàn làm việc gỗ MOHO WORKS 701', '', 1490000, 'plv4.jpg', 8),
( N'Hộc tủ 3 năng lưu trữ tài liệu có khoá MOHO WORKS 201', '', 990000, 'plv5.jpg', 8),
( N'Kệ gỗ - Kệ sách MOHO OSLO 902', '', 1990000, 'plv6.jpg', 8),
( N'Ghế xoay văn phòng tay gập thông minh MOHO RIGA 701', '', 1190000, 'plv7.jpg', 8),
( N'Ghế văn phòng chân xoay MOHO MAJOR 701', '', 1190000, 'plv8.jpg', 8),
( N'Bàn máy tính gỗ MOHO WORKS 702', '', 1690000, 'plv9.jpg', 8),
( N'Bàn làm việc gỗ có kệ MOHO VLINE 602 màu nâu', '', 1790000, 'plv10.jpg', 8),
( N'Bàn làm việc gỗ MOHO FYN 601 màu nâu', '', 1990000, 'plv11.jpg', 8),
( N'Ghế văn phòng ngả lưng MOHO JEFE 701', '', 2190000, 'plv12.jpg', 8),
( N'Kệ để sách 3 tầng MOHO WORKS 703', '', 1390000, 'plv13.jpg', 8),
( N'Bàn làm việc gỗ có kệ MOHO VLINE 602 màu tự nhiên', '', 1790000, 'plv14.jpg', 8),
( N'Kệ để sách 5 tầng MOHO WORKS 701', '', 2490000, 'plv15.jpg', 8),
( N'Bàn làm việc gỗ MOHO FYN 601 màu tự nhiên', '', 1990000, 'plv16.jpg', 8),
( N'Kệ để sách tủ khoá MOHO WORKS 702', '', 3190000, 'plv17.jpg', 8),
( N'Ghế văn phòng chân quỳ MOHO CALLOSO 701', '', 1090000, 'plv18.jpg', 8),
( N'Tủ giày – Tủ trang trí Gỗ MOHO OSLO 901', '', 2190000, 'tt1.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ MHO VLINE 601', '', 2490000, 'tt2.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ MOHO VIENNA 203', '', 2990000, 'tt3.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ MOHO VIENNA 204', '', 2490000, 'tt4.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ MOHO VIENNA 201', '', 1990000, 'tt5.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ MOHO VIENNA 202', '', 3490000, 'tt6.jpg', 9),
( N'Tủ giày – Tủ trang trí gỗ tràm MOHO VLINE 601', '', 2490000, 'tt7.jpg', 9),
( N'Bàn trang điểm 02', '', 1200000, 'sph1.jpg', 1),
( N'Ghế sofa nâu cao cấp', '', 2400000, 'sph2.jpg', 1),
( N'Giường đôi cao cấp', '', 5700000, 'sph3.jpg', 1),
( N'Ghế nỉ cốm', '', 2200000, 'sph4.jpg', 1),
( N'Ghế da nâu', '', 1200000, 'sph5.jpg', 1),
( N'Bàn làm việc cao', '', 2100000, 'sph6.jpg', 1),
( N'Bàn làm việc gỗ thấp', '', 2700000, 'sph7.jpg', 1),
( N'Bàn ăn gỗ ', '', 2500000, 'sph8.jpg', 1),
( N'Ghế da hiện đại', '', 1299999, 'sph9.jpg', 1),
( N'Sofa phòng khách', '', 5850000, 'sph10.jpg', 1),
( N'Ghế nỉ kem', '', 1500000, 'sph11.jpg', 1),
( N'Ghế sofa nâu', '', 1200000, 'sph12.jpg', 1),
( N'Bàn trang điểm', '', 2400000, 'sph13.jpg', 1),
( N'Ghế sofa gỗ tram tự nhiên MOHO VLINE 601', '', 7490000, 'spkm1.jpg', 2),
( N'Giường ngủ gỗ tràm MOHO VLINE 601 nhiều kích thước', '', 4490000, 'spkm2.jpg', 2),
( N'Tủ đầu giường gỗ MOHO VLINE 801', '', 1990000, 'spkm3.jpg', 2),
( N'Kệ gỗ - Kệ sách MOHO OSLO 901', '', 1690000, 'spkm4.jpg', 2),
( N'Ghế sofa gỗ cao su tự nhiên MOHO HOBRO 601', '', 10990000, 'spkm5.jpg', 2),
( N'Set tủ quần áo MOHO VLINE 601 3 cánh', '', 9490000, 'spkm6.jpg', 2),
( N'Ghế ăn gỗ cao su tự nhiên MOHO NEXO 601', '', 1190000, 'spkm7.jpg', 2),
( N'Bàn làm việc gỗ MOHO FYN 601 màu nâu', '', 1990000, 'spkm8.jpg', 2),
( N'Tủ tài liệu SM8450H', '', 4898031, 'spm1.jpg', 3),
( N'Tủ tài liệu SM8350', '', 2906156, 'spm2.jpg', 3),
( N'Hộc di động', '', 780000, 'spm3.jpg', 3),
( N'Tủ tài liệu SM8650', '', 3568530, 'spm4.jpg', 3),
( N'Tủ tài liệu SM6220', '', 1117500, 'spm5.jpg', 3),
( N'Tủ tài liệu SM8550', '', 3765180, 'spm6.jpg', 3),
( N'Tủ tài liệu SM8150', '', 1894255, 'spm7.jpg', 3),
( N'Tủ tài liệu SM8710H', '', 2610850, 'spm8.jpg', 3),
( N'Giường sắt sinh viên JSV', '', 9592000, 'spm9.jpg', 3),
( N'Giường gỗ khung sắt 2', '', 7463500, 'spm10.jpg', 3),
( N'Giường sắt 2 tầng JS-2T', '', 2755500, 'spm11.jpg', 3),
( N'Combo basic phòng ăn Grenaa 201 màu nâu', '', 4450000, 'bst1.jpg', 10),
( N'Combo basic phòng khách Grenaa 201 màu nâu', '', 5870000, 'bst2.jpg', 10),
( N'Combo basic phòng ngủ Grenaa 201 màu nâu', '', 5080000, 'bst3.jpg', 10),
( N'Full combo phòng khách Grenaa 201 màu nâu', '', 7460000, 'bst4.jpg', 10),
( N'Full combo phòng ngủ Grenaa 201 màu nâu', '', 12060000, 'bst5.jpg', 10),
( N'Full combo (Combo basic) bộ sưu tập Grenaa 201 màu nâu', '', 14600000, 'bst6.jpg', 10),
( N'Full house bộ sưu tập Grenaa 201 màu nâu', '', 22770000, 'bst7.jpg', 10);

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `thanh_toan`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE thanh_toan (
  ma_tt int NOT NULL primary key identity,
  ma_hd int NOT NULL,
  phuong_thuc nvarchar(100) NOT NULL DEFAULT 'Tiền mặt',
  ngay_tt int NOT NULL,
  tong_tien float NOT NULL,
  trang_thai nvarchar(100) NOT NULL DEFAULT 'Chưa thanh toán'
) ;

-- SQLINES DEMO *** ---------------------------------------

--
-- SQLINES DEMO *** or table `user`
--

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE [user] (
  id_user int NOT NULL primary key identity,
  username varchar(50) NOT NULL,
  [password] varchar(50) NOT NULL,
  is_admin bit NOT NULL DEFAULT 0,
  ma_kh int NOT NULL
) ;

--
-- SQLINES DEMO *** d tables
--

--
-- SQLINES DEMO ***  `chi_tiet_hoa_don`
--
-- Convert ALTER TABLE chi_tiet_hoa_don

CREATE INDEX IDX_chi_tiet_hoa_don_ma_hd ON chi_tiet_hoa_don(ma_hd, ma_sp);
CREATE INDEX IDX_chi_tiet_hoa_don_ma_sp ON chi_tiet_hoa_don(ma_sp);

-- Convert ALTER TABLE hoa_don


CREATE INDEX IDX_hoa_don_ma_kh ON hoa_don(ma_kh);



--
-- SQLINES DEMO ***  `khach_hang`
--


--
-- SQLINES DEMO ***  `loai_san_pham`
--


--
-- SQLINES DEMO ***  `san_pham`
--
-- Convert ALTER TABLE san_pham


CREATE INDEX IDX_san_pham_ma_loai ON san_pham(ma_loai);

-- Convert ALTER TABLE thanh_toan


CREATE INDEX IDX_thanh_toan_ma_hd ON thanh_toan(ma_hd);

-- Convert ALTER TABLE [user]


CREATE INDEX IDX_user_ma_kh ON [user](ma_kh);


--
-- SQLINES DEMO *** r dumped tables
--

--
-- SQLINES DEMO *** r table `chi_tiet_hoa_don`
--
-- Add identity columns (auto increment) in SQL Server





-- Add foreign key constraints in SQL Server
ALTER TABLE chi_tiet_hoa_don
  ADD CONSTRAINT FK_CTHD_HD FOREIGN KEY (ma_hd) REFERENCES hoa_don (ma_hd) ON DELETE NO ACTION ON UPDATE CASCADE;
go
ALTER TABLE chi_tiet_hoa_don
  ADD CONSTRAINT FK_CTHD_SP FOREIGN KEY (ma_sp) REFERENCES san_pham (ma_sp) ON DELETE NO ACTION ON UPDATE CASCADE;


--
-- SQLINES DEMO *** able `hoa_don`
--
ALTER TABLE hoa_don
  ADD CONSTRAINT FK_HD_KH FOREIGN KEY (ma_kh) REFERENCES khach_hang (ma_kh) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- SQLINES DEMO *** able `san_pham`
--
ALTER TABLE san_pham
  ADD CONSTRAINT FK_SP_LOAISP FOREIGN KEY (ma_loai) REFERENCES loai_san_pham (ma_loai) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- SQLINES DEMO *** able `thanh_toan`
--
ALTER TABLE thanh_toan
  ADD CONSTRAINT FK_TT_HD FOREIGN KEY (ma_hd) REFERENCES hoa_don (ma_hd) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- SQLINES DEMO *** able `user`
--
ALTER TABLE [user]
  ADD CONSTRAINT FK_USER_KH FOREIGN KEY (ma_kh) REFERENCES khach_hang (ma_kh) ON DELETE NO ACTION ON UPDATE CASCADE;

  go
  select * from khach_hang
  go
  select * from [user]
  go
  go
  insert into khach_hang
  values (
	N'Nhâm Trung Nghĩa', 'nghianham125@gmail.com', N'140 Lê Trọng Tấn', '0903376314'
  )
  insert into [user]
  values (
	'admin', 'admin', 1, 1
  )