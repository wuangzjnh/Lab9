USE MASTER
GO
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME = 'QUANLYTHUVIEN')
DROP DATABASE QUANLYTHUVIEN
GO
CREATE DATABASE QUANLYTHUVIEN
GO
USE QUANLYTHUVIEN
GO

CREATE TABLE DOCGIA 
(
	MaDocGia Varchar(15) not null,
	HoTen Nvarchar(30) not null,
	NgaySinh Date not null,
	PRIMARY KEY(MaDocGia)
)

CREATE TABLE SACH
(
	MaSach Varchar(15),
	TenSach Nvarchar(30),
	TacGia Nvarchar(30),
	SoLuong int,
	PRIMARY KEY(MaSach)
)

CREATE TABLE MUONSACH
(
	MaPhieuMuon Varchar(15),
	MaDocGia Varchar(15),
	NgayMuon Date,
	PRIMARY KEY(MaPhieuMuon),
	FOREIGN KEY(MaDocGia) REFERENCES DOCGIA(MaDocGia)
)


CREATE TABLE CTPM
(
	MaPhieuMuon Varchar(15),
	MaSach Varchar(15),
	NgayTra Date,
	PRIMARY KEY(MaPhieuMuon, MaSach),
	FOREIGN KEY(MaPhieuMuon) REFERENCES MUONSACH(MaPhieuMuon),
	FOREIGN KEY(MaSach) REFERENCES SACH(MaSach)
)

