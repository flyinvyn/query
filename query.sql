-- BUAT DATABASE
CREATE DATABASE perpustakaan;

-- BUAT TABEL
CREATE TABLE penerbit(
    id_penerbit INT NOT NULL,
    nama_penerbit VARCHAR(255) NOT NULL,
    alamat TEXT NOT NULL,
    PRIMARY KEY(id_penerbit));

CREATE TABLE buku (
    id_buku INT NOT NULL,
    jdl_buku VARCHAR(255),
    stok INT,
    id_penerbit INT,
    PRIMARY KEY(id_buku),
    FOREIGN KEY(id_penerbit) REFERENCES penerbit(id_penerbit));

CREATE TABLE siswa(
    nis INT NOT NULL,
    nama_siswa VARCHAR(255),
    alamat TEXT,
    kode_siswa VARCHAR(255),
    PRIMARY KEY(nis),
    FOREIGN KEY(kode_siswa) REFERENCES kartu_siswa(kode_siswa));

CREATE TABLE pinjam(
    kode_pinjam VARCHAR(255),
    id_buku INT,
    nis INT,
    PRIMARY KEY(kode_pinjam),
    FOREIGN KEY(nis) REFERENCES siswa(nis),
    FOREIGN KEY(id_buku) REFERENCES buku(id_buku));

CREATE TABLE kartu_siswa(
    kode_siswa VARCHAR(255),
    tgl_terbit TIMESTAMP,
    PRIMARY KEY(kode_siswa));

-- MEMASUKAN DATA KE DALAM TABEL BUKU
INSERT INTO buku(id_buku,jdl_buku,stok,id_penerbit)VALUES
    (1,'The Cat Lovers',20,1),
    (2,'My Heroine',15,2),
    (3,'The First Love',25,3);


-- MEMASUKAN DATA KE DALAM TABEL PENERBIT
INSERT INTO penerbit(id_penerbit,nama_penerbit,alamat)VALUES
    (1,'Wahyu','Jl Tanjung Jakarta'),
    (2,'Udin','Jl Tomo Sumedang'),
    (3,'Novi','Jl Wado Sumedang');

-- MEMASUKAN DATA KE DALAM TABEL PINJAM
INSERT INTO pinjam(kode_pinjam,nis,id_buku)VALUES
    ('k101',111,1),
    ('k102',112,2),
    ('k103',113,3);

-- MEMASUKAN DATA KE DALAM TABEL SISWA
INSERT INTO siswa(nis,nama_siswa,alamat,kode_siswa)VALUES
    (111,'Hary','Jl Terusan','P01'),
    (112,'Mebel','Jl Babakan','P02'),
    (113,'Suzie','Jl Ambit','P03');

-- MEMASUKAN DATA KE DALAM TABEL KARTU_SISWA
INSERT INTO kartu_siswa(kode_siswa,tgl_terbit)VALUES
    ('P01','11-06-2023'),
    ('P02','11-06-2023'),
    ('P03','11-06-2023');

--MENAMPILKAN SEMUA ISI TABEL
SELECT * FROM buku;
SELECT * FROM kartu_siswa;
SELECT * FROM penerbit;
SELECT * FROM pinjam;
SELECT * FROM siswa;

--MENGGABUNGKAN / MERELASI TABEL KARTU_SISWA DAN TABEL SISWA
SELECT siswa.*,kartu_siswa.tgl_terbit FROM siswa JOIN kartu_siswa ON siswa.kode_siswa = kartu_siswa.kode_siswa;
--MENGGABUNGKAN / MERELASI TABEL BUKU DAN PENERBIT
SELECT buku.*,penerbit.* FROM buku JOIN penerbit ON buku.id_penerbit = penerbit.id_penerbit;
--MENGGABUNGKAN / MERELASI TABEL PINJAM, BUKU, DAN SISWA
SELECT pinjam.*,buku.*,siswa.* FROM pinjam JOIN buku ON pinjam.id_buku = buku.id_buku JOIN siswa ON pinjam.nis = siswa.nis;