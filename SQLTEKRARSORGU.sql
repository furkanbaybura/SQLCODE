create database ORNEKDB collate Turkish_CS_AS 
GO

USE ORNEKDB
GO

CREATE TABLE ORNEKTABLE_1
(
ID INT UNIQUE,
ADI NVARCHAR(50),
SOYADI NVARCHAR(50),
YAS INT,
SEHIR NVARCHAR(50)
)

--NOT NULL
			--ALTER TABLE ORNEKTABLE_1 ALTER COLUMN ADI NVARCHAR(50) NOT NULL
-- UNIQUE
		--UNIQUEL�K KALDIRMA
			--ALTER TABLE ORNEKTABLE_3 DROP CONSTRAINT 

		--UNIQUEL�K EKLEME
			--ALTER TABLE ORNEKTABLE_3 ADD CONSTRAINT UQ_ORNEKTABLE_ID UNIQUE(ID)

--PRIMARY KEY
			-- 1 => ID INT PRIMARY KEY 
			-- 2 => CONSTRAINT PK_ID_ PRIMARY KEY (ID)
			
--FOREIGN KEY
			--ALTER TABLE SIPARISLER
			-- ADD CONSTRAINT FK_MUSTERILER_MUSTERI_ID FOREIGN KEY (MUSTERI_ID) REFERENCES MUSTERILER (ID)

-- CHECK
		--EKLEMEK
			-- (INSERT EDERKEN)  CONSTRAINT CHK_YAS_18_BUYUK_ESIT CHECK (YAS >= 18)
			--(SONRADAN) ALTER TABLE ORNEKTABLE_1 ADD CONSTRAINT CHK_YAS_18_BUYUK_ESIT CHECK(YAS >= 18)
		--KALDIRMAK
			--ALTER TABLE ORNEKTABLE_1 DROP CONSTRAINT CHK_YAS_18_BUYUK_ESIT

--DEFAULT
		--KALDIRMAK
			-- ALTER TABLE ORNEKTABLE_1 DROP CONSTRAINT DF_ORNEKTABL_OLUST_4222D4EF
		--EKLEMEK
			-- ALTER TABLE ORNEKTABLE_1 ADD CONSTRAINT DF_ORNEKTABLE_SEHIR_ANKARA DEFAULT 'Ankara' FOR SEHIR 

--DELETE 
		--1
			--DELETE FROM TABLO WHERE ID = 2 (HARD DELETE)
		--2
			--UPDATE TABLO SET SILINDI = 1 WHERE ID = 6 (SOFT DELETE)