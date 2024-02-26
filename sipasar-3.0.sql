-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 01:54 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipasar`
--

-- --------------------------------------------------------

--
-- Table structure for table `pasar`
--

CREATE TABLE `pasar` (
  `id_pasar` bigint(20) NOT NULL,
  `nama_pasar` varchar(100) DEFAULT NULL,
  `kelas_pasar` int(11) DEFAULT NULL,
  `alamat_pasar` varchar(255) DEFAULT NULL,
  `kecamatan_pasar` varchar(50) DEFAULT NULL,
  `lonlan` point DEFAULT NULL,
  `kodepos` char(5) DEFAULT NULL,
  `instagram` varchar(50) DEFAULT NULL,
  `deskripsi_pasar` text DEFAULT NULL,
  `sejarah_pasar` text DEFAULT NULL,
  `jumlah_pedagang` int(11) DEFAULT NULL,
  `jumlah_lantai` int(11) DEFAULT NULL,
  `is_aktif` tinyint(1) DEFAULT NULL,
  `is_denah` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasar`
--

INSERT INTO `pasar` (`id_pasar`, `nama_pasar`, `kelas_pasar`, `alamat_pasar`, `kecamatan_pasar`, `lonlan`, `kodepos`, `instagram`, `deskripsi_pasar`, `sejarah_pasar`, `jumlah_pedagang`, `jumlah_lantai`, `is_aktif`, `is_denah`) VALUES
(1, 'Pasar Beringharjo', 1, 'Jl. Margo Mulyo No.16, Ngupasan, Kec. Gondomanan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55122', 'Gondomanan', 0x000000000101000000f6ab1edaca311fc004da81895f975b40, '55122', '', 'Pasar Beringharjo merupakan pasar yang terletak di lokasi pariwista Yogyarta tepatnya disamping Malioboro.  Selain itu Pasar Beringharjo menjalankan 3 fungsi pilar yaitu pilar ekonomi, pendidikan dan wisata. Tidak heran Beringharjo sering disebut julukan one stop shopping centre,karena pasar ini menyediakan segala macam kebutuhan pengunjung maupun wisatawan. Pasar Beringharjo terbagi menjadi 3 lokasi yaitu Pasar Beringharjo Timur, Pasar Beringharjo Tengah dan Pasar Beringharjo Barat', 'Tahun 1925, Raja Kasultanan Ngayogyakarta Hadiningrat Sri Sultan HB XI mendirikan bangunan pasar permanen dan pada saat peresmian disematkan nama Pasar Beringharjo. Nama tersebut berawal dari lokasi didirikannya pasar beringharjo merupakah wilayah yang memiliki banyak pohon beringin. Menurut filosofinya pohon beringin diharapkan dapat memberikan kesejahteraan bagi warga Yogyakarta dari kata bering yang bermakna hutan beringin dan harjo yang bermakna kesejahteraan. Pasar Bringharjo sudah menjadi salah satu ciri khas Kota Yogyakarta sejak zaman pemerintahaan Hindia Belanda. ', 6000, 3, 1, 1),
(2, 'Pasar Giwangan', 2, 'Jl. Imogiri Timur No. 212, Giwangan', 'Umbulharjo', 0x000000000101000000a301850892531fc079bc4b83f2985b40, '55163', NULL, 'Pasar Giwangan merupakan pasar yang menjadi pusat grosir buah dan sayuran di Wilayah Jawa Tengah dan DIY. Pasar ini beroperasi 24 jam nonstop. Buah dan sayur yang dijual tersedia dalam berbagai grade. Puncak keramaian pasar dapat dilihat dari sore hari hingga menjelang pasar.', 'Lokasi Pasar Giwangan sebelumnya adalah Balai Benih Ikan. Dengan adanya kebijakan penataan pasar tradsional, pemerintah melakukan relokasi pedagang buah dan sayur dari Jalan Sriwedani, Jalan Pabringan, serta Kawasan Shoping Center dan sekitarnya ke Pasar Giwangan. Tepat pada 14 Desember 2004 relokasi pedagang berhasil dilakukan, sejak itu tanggal tersebut dijadikan Hari Jadi Pasar Giwangan', 981, 1, 1, 0),
(3, 'Pasar Kranggan', 3, 'Jl. Poncowinatan, Gowongan, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55233', 'Jetis', 0x000000000101000000552d243538211fc075cd485e67975b40, '55233', NULL, 'Pasar Kranggan merupakan pasar yang menjual berbagai jajanan tradisional. Terdapat tiga area yang dibagi menjadi dua lantai. Area pertama terletak di sisi utara jalan Diponegoro yang menyediakan berbadai macam jajanan pasar, bunga tabur, toko emas dan toko grosir. Area kedua merupakan gedung utama pasar yang menyediakan berbagai jenis kebutuhan rumah tangga seperti, bumbu dapur, rempah-rempah dan obat tradisional. Sedangkan bagian ketiga berada di sisi belakang pasar menjual sayur mayur dan sembako.', ' Pasar Kranggan diresmikan sejak 15 Agustus 1978, Pasar ini dibangun atas permintaan Tumenggung Rangga Prawirasantika yang hidup pada masa penjajahan Belanda. Sejak itu lokasi pasar diberi nama \"Kranggan\" yang berasal dari kata Ka-Rangga-an yang disingkat menjadi \"Kranggan\".', 707, 2, 1, 0),
(4, 'Pasar Demangan', 3, 'Jl. Affandi No.345, Demangan, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55221', 'Gondokusuman', 0x0000000001010000003e2a3f15771f1fc07663f883de985b40, '55221', NULL, 'Pasar Demangan merupakan pasar yang terletak diperbatasan Kota Yogyakarta dengan Kabupaten Sleman. Pasar ini memiliki ciri khas menjual ikan segar dan daging segar di area paling belakang. Saat malam hari, area teras pasar berubah menjadi sentra kuliner kaki lima yang ramai dikunjungi wisatawan.', 'Tahun 1980 Pasar Demangan direlokasi oleh pemerintah Kota Yogyakarta di Jalan Afandi.', 717, 1, 1, 0),
(5, 'Pasar Sentul', 3, 'Jl. Sultan Agung No.52, Gunungketur, Pakualaman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55166', 'Pakualaman', 0x000000000101000000ef73ddc22a351fc09b630b4a27985b40, '55166', 'https://www.instagram.com/sentul.pasarjogja/', 'Lokasi Pasar Sentul persis di depan Pura Pakualaman, pasar ini bisa menjadi salah satu daya tarik wisatawan setelah mengunjungi Pura Pakualaman Kota Yogyakarta. Pasar ini memiliki ciri khas pada cat pasar yang berwarna cerah.', 'Pasar Sentul diresmikan Walikota Yogyakarta, Soegiarto pada 22 Februari 1986. Dulu Pasar Sentul menjadi tempat singgah para pedangang, hingga pada akhirnya tempat peristirahatan tersebut menjadi pasar ', 373, 1, 1, 0),
(6, 'Pasar Legi Kotagede', 3, 'Jl. Mentaok Raya, Purbayan, Kec. Kotagede, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55173', 'Kotagede', 0x000000000101000000ef7ef41c01501fc08bab56e395995b40, '55173', 'https://www.instagram.com/kotagede.pasarjogja/', 'Pasar Legi Kotagede memiliki nilai historis yang menyimpan berbagai cerita dan makna filosofi. Sekeliling pasar terdapat berbagai pedagang toko perak, hingga daerah Kotagede dikenal sebagai sentra pembuat kerajinan dan perhiasan perak.', 'Pasar Legi Kotagede dibangun sejak abad ke 16 pada pemerintahan Panembahan Senopati pada masa Kerajaan Mataram. Dahulu Pasar Legi Kotagede merupakan Alas Mentaok yang dibuka oleh Ki Gede Pemanahan sebagai imbalan Jaka Tigkir saat mengalahkan Arya Penangsang. Karena perkembangan jaman, lokasi ini dijadikan Panembahan Senopati sebagai pusat kerajaan saat menjadi raja dan berkembang menjadi pusat keramaian hingga saat ini.', 609, 1, 1, 0),
(7, 'Pasar Serangan', 3, 'Jl. R. E. Martadinata No.2, Pakuncen', 'Wirobrajan', 0x000000000101000000dc47b7f7af291fc0d384ed258e965b40, '55253', NULL, 'Pasar ini memiliki komoditas unik daripada pasar tradisional lainnya. Banyak penjual makanan tradisional khas Gunung Kidul yang bisa ditemukan di sini yaitu, Thiwul dan Tempe benguk. Selain itu pasar ini juga terkenal sebagai pasar yang menjual arang kayu yang dapat dijadikan bahan bakar tradisional.', 'Pasar Serangan diresmikan sejak tanggal 22 Februari 1986', 314, 1, 1, 0),
(8, 'Pasar Klithikan Pakuncen', 3, 'Jl. HOS Cokroaminoto No.34,Pakuncen,Wirobrajan,Kota Yogyakarta, Daerah Istimewa Yogyakarta 55253', 'Wirobrajan', 0x00000000010100000090decd6343301fc046cfc6819e965b40, '55253', 'https://www.instagram.com/pakuncen.pasarjogja/', 'Kehadiran Pasar Pakuncen menjadi salah satu daya tarik tersendiri bagi masyarakat Yogyakarta. Pasar ini menjual aneka barang  bekas dari peralatan elektronik, onderdil, alat-alat rumah tangga, alat tukang, buku, dan pakaian. Menariknya ada salah satu sudut pasar terdapat penjual uang kuno yang sudah terkenal hingga turis asing. ', 'Pasar Klitikan Pakuncen merupakan pasar yang menjual barang - barang klithikan. Dahulu pasar ini merupakan pasar hewan yang berada diantara pemukiman warga. Karena kondisi tersebut, maka pemerintah Kota Yogyakarta merelokasi pasar hewan tersebut. Sebelum pasar klithikan ini terkenal, banyak para pedagang klithikan berjualan di sekitan jalan mangkubumi, jalan alun - alun kidul kraton dan jalan Asemgede. Dinas terkait mencoba untuk merelokasi tiga titik lokasi pedagang klithikan ke dalam pasar pakuncen. Pasar ini diresmikan pada 11 November 2007 oleh menteri UKM dan Koperasi Surya Dharma Ali.', 740, 1, 1, 0),
(9, 'Pasar Pathuk', 3, 'Jl. Bhayangkara No.6, Ngupasan, Kec. Gondomanan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55261', 'Gondomanan', 0x00000000010100000081a23ca3542f1fc091b37d862e975b40, '55261', NULL, 'Pasar Pathuk menjadi salah satu destinasi yang sering dikunjungi para wisatawan untuk membeli oleh - oleh khas Yogyakarta. Selain itu pasar ini menjadi daya tarik sebagai pasar yang memiliki nilai nostalgia bagi pengunjung yang ingin mencari kuliner tradisional khas Tionghoa. Hal tersebut terjadi karena letak dari Pasar Pathuk ini berada dalam wilayah pecinan di Kota Yogyakarta', 'Pasar Pathuk sendiri berdiri sekitar tahun 1977. Di pasar ini kita bisa menemukan banyak penjual Bakpia. Bakpia sendiri merupakan makanan khas dari Tionghoa yang aslinya bernama Tou Luk Pia yang berarti kue kacang hijau. Walaupun marak di tahun 80an sebagai kue oleh-oleh dari Jogja, bakpia di Pasar Pathuk sendiri bisa ditelusuri sampai sejauh tahun 1948.', 247, 1, 1, 0),
(10, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 3, 'Jl. Bantul KM.1 No.141, Gedongkiwo, Kec. Mantrijeron, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55142', 'Mantrijeron', 0x0000000001010000009937b4f5b34c1fc0af874da9b9965b40, '55142', NULL, 'Pasar PASTY terkenal dengan pasar hewan, dimana pasar tersebut menjual aneka satwa dan tanaman hias. Pasar dengan konsep yang unik ini juga menjadi salah satu destinasi kunjungan fieldtrip sekolah dari jenjang TK hingga SMP. Selain itu pasar ini juga menjadi salah satu area masyarakat Yogyakarta untuk melatih hewan mereka untuk mengikuti kontes seperti, kontes burung, kontes ayam ketawa, kontes ikan hias, kontes ayam serama. Lebih menarik lagi Pasar PASTY juga memiliki area playground yang ramah untuk anak-anak.', 'Pasar PASTY didirikan pada tanggal 22 April 2010 dan diresmikan oleh bapak walikota Heri Zudianto. Pasar yang satu ini didirikan untuk menjawab kebutuhan masyarakat akan sebuah tempat jual beli hewan dan tanaman hias. Dulunya pasar hewan dan tanaman hias ini masih berada di kawasan Ngasem.', 408, 1, 1, 0),
(11, 'Pasar Ngasem', 3, 'Jl. Polowijan No.11, Patehan, Kecamatan Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55133', 'Kraton', 0x0000000001010000008ec85190aa3b1fc012a6110008975b40, '55133', 'https://www.instagram.com/ngasem.pasarjogja/', 'Pasar Ngasem memiliki keunikan tersendiri bagi wisatawan baik domestik maupun manca negara. Pasar ini terkenal dengan barang kerajinan di Kota Yogyakarta. Selain itu lokasi Pasar Ngasem terletak didalam area cagar budaya atau heritage area. Pasar Ngasem juga menjadi salah satu pintu masuk menuju area obyek wisata Taman Sari.', 'Dahulu Pasar Ngasem merupakan sebuah danau yang biasa digunakan Sultan Hamengkubuwono II untuk menikmati pemandangan diluar area kraton. Berjalannya waktu area tersebut menjadi area perkampungan dan terdapat pasar yang menjual burung. Pada Tahun 1809 Pasar Ngasem resmi menjadi Pasar Burung. Kehadirannya sangat terkenal setelah tahun 1960. Pada tanggal 11 Mei 2020 dinas terkait melakukan penataan ulang kawasan Pasar Ngasem.', 392, 1, 1, 0),
(12, 'Pasar Terban', 4, 'Jl. C. Simanjuntak No.21, Terban, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55223', 'Gondokusuman', 0x000000000101000000a1aa6f6fc51f1fc0433aee16d5975b40, '55223', NULL, 'Pasar Terban merupakan induk pasar ayam di Yogyakarta. Banyak restoran besar yang bergantung pasokan ayam dari pasar ini. Tidak hanya DIY yang mengambil pasokan ayam pada pasar ini, namun juga daerah di luar DIY seperti Jawa Tengah dan bahkan Jakarta. Sebanyak 50% dari juragan ayam di DIY ada di Pasar Terban, sehingga pasar ini tidak heran jika diberi julukan Sentra Pedagang Ayam. Selain ayam, pasar ini cukup unik karena satu-satunya pasar yang berdampingan dengan lapak agen perjalanan. Mengikuti perkembangan zaman, pedagang Pasar Terban juga terbuka untuk melakukan jual-beli secara online. Cukup dengan mengirimkan sms/chat ke pedagang, maka pembeli dapat memesan dan pesanan dapat diantarkan. Pasar Terban juga memiliki lima Rumah Pemotongan Hewan dan terdapa juga pedagang lainnya seperti sayuran, sembako, kuliner khas Yogyakarta, dan jajanan pasar.', 'Sebelum tahun 1991, para pedagang ayam ini berjualan di Pasar Beringharjo. Namun dengan jumlah pedagang yang semakin meningkat dan lahan yang tidak mencukupi, maka dilakukan relokasi ke sebuah lahan kosong di belakang Terminal Terban. Maka dari itu, pada pasar ini terdapat juga agen perjalanan yang masih tersisa hingga saat ini. ', 145, 1, 1, 0),
(13, 'Pasar Legi Patangpuluhan', 4, 'Jl. Bugisan No.25, Patangpuluhan, Wirobrajan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55251', 'Wirobrajan', 0x000000000101000000ab4b1210cf3c1fc0c95892af63965b40, '55251', NULL, 'Pasar ini populer dengan siswa SMA karena letaknya yang strategis dekat dengan 3 SMA yaitu SMAN 1 Yogyakarta, SMA Muhammadiyah 3 Yogyakarta, dan SMA Muhammadiyah 7 Yogyakarta. Pasar ini buka dari jam 05.00 WIB dan pedagang akan mulai berkemas pada jam 10.00 WIB. Beberapa los masih buka hingga jam 17.00 WIB. Barang dagang yang ditawarkan pada pasar ini adalah kebutuhan sehari-hari, seperti sayur, buah, daging ayam, daging sapi, ikan, daging kambing, peralatan mandi, dan sembako.', 'Pasar Legi Patangpuluhan diresmikan pada tahun 1986 oleh Walikota Yogyakarta Soegiarto. Pasar ini merupakan relokasi pedagang Pasar Ringin, Pasar Patangpuluhan, dan Pasar Wirobrajan.', 328, 1, 1, 0),
(14, 'Pasar Lempuyangan', 4, 'Jl. Hayam Wuruk, Tegal Panggung, Kec. Danurejan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55212', 'Danurejan', 0x0000000001010000002a8d0be2f22a1fc074a54830e6975b40, '55212', 'https://www.instagram.com/pasarlempuyangan/', 'Pasar Lempuyangan merupakan pasar yang menjual kebutuhan masyarakat sehari-hari seperti sembako, sayur, jajanan pasar, pakaian, dan peralatan rumah tangga. Selain itu, pasar ini juga terkenal sebagai distributor beras. Terdapat dua distributor beras besar yang menjual dagangannya ke Pasar Lempuyangan. Pasar ini buka dari pukul 05.00 WIB hingga 17.00 WIB. Namun, terdapat beberapa kuliner di pasar ini yang buka hingga malam.', 'Gedung Pasar Lempuyangan dulunya merupakan gedung Sekolah Dasar Negeri (SDN) Lempuyangan. Sebelum tahun 1960, gedung ini sangat sederhana, terbuat hanya dari anyaman bambu. Pada tahun 1972, Dinas Pasar Kota Yogyakarta berinisiatif untuk melakukan relokasi pedagang yang berjualan di trotoar Tegal Lempuyangan ke bangunan pasar yang lantainya masih tanah. Para pedagang saat itu bekerjasama untuk meningkatkan Pasar Lempuyangan dengan gotong royong iuran harian. Pada tahun 1986, Pemkot Yogayakarta mengapresiasi tindakan tersebut dengan membangun gedung baru di Pasar Lempuyangan.', 350, 1, 1, 0),
(15, 'Pasar Ciptomulyo', 4, 'Jl. Sisingamangaraja No.1, Brontokusuman', 'Mergangsan', 0x0000000001010000007c1ebc45f5421fc0ecce0930e4975b40, '55153', NULL, 'Pasar tradisional ini menjual barang-barang untuk kebutuhan pembangunan atau renovasi rumah. Pada Pasar Ciptomulyo terdapat 31 pedagang yang menjual berbagai macam materi bangunan yang dikirimkan dari Kebumen dan Sleman. Tidak hanya menjual saja, beberapa kios bahkan dapat membuat sendiri barang dagangannya.', 'Pada tahun 1950, lokasi Pasar Ciptomulyo merupakan tempat berteduh para gelandangan dan pengemis, atau yang sering disingkat dengan gepeng. Berawal dengan dua kios yang menjual batu alam, para gepeng berteduh sekaligus membantu pedagang untuk merapikan barang dagangannya. Akhirnya pemerintah memutuskan untuk memindahkan para gepeng ke asrama, sekaligus menata pasar. ', 31, 1, 1, 0),
(16, 'Pasar Prawirotaman', 4, 'Jl. Parangtritis No.103, Brontokusuman, Kec. Mergangsan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55153', 'Mergangsan', 0x0000000001010000007a94ae2068471fc0b32eb80190975b40, '55153', 'https://www.instagram.com/pasarprawirotaman/', 'Pasar Prawirotaman tidak asing dikunjungi oleh wisatawan asing , hal tersebut terjadi karena lokasi dari Pasar merupakan kawasan hotel-hotel yang banyak menampung wisatawan asing. Para pedagang yang sudah terbiasa melihat fotografer asing atau domestik untuk berburu foto di pasar.', NULL, 631, 1, 1, 0),
(17, 'Pasar Pingit', 4, 'Jl. Kyai Mojo No.9, Bumijo, Kec. Jetis, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55231', 'Jetis', 0x000000000101000000a5c3912a9d211fc0eac19d31f7965b40, '55231', 'https://www.instagram.com/pasarpingityogyakarta/', 'Pasar Pingit merupakan pasar yang komplit. Dagangan yang ditawarkan di pasar ini sangat bervariasi dari sembako, sayuran, barang bekas, hingga bibit ikan. Setelah penataan pasar di tahun 2017, Pasar Pingit menjadi semakin maju dengan semakin meningkatnya kebersihan dan penataan pasar yang lebih baik. Pasar Pingit memiliki zonasi khusus untuk barang bekas, yang menyediakan barang elektronik, pecah belah. dan juga pakaian. Selain itu, terdapat juga zonasi ikan hias dan bibit ikan yang bahkan sekarang menjadi ikon Pasar Pingit. ', 'Pada tahun 1950, Pasar Pingit masih termasuk sangat sederhana, tanpa atap dan hanya ada tikar atau terpal. Pedagang melakukan aktivitas jual-beli di atas alas sederhana tersebut dengan dagangan sayur dan buah-buahan saja. Pada saat itu, kegunaan pasar ini hanya sebagai transit pedagang Pasar Beringharjo dan pasar-pasar besar yang lain. Mulai tahun 1975, pedagang Pasar Pingit mulai beranekaragam dari sembako, makanan, ikan, dan daging. Para pedagang pun datang dari berbagai tempat di luar Kota Yogyakarta, seperti Bantul, Kulonprogo, dan Gunungkidul. Alhasil, kebanyakan dari mereka memilih untuk tidur di pasar untuk menghemat perjalanan pulang-pergi ke rumah. Melalui pengalaman ini keakraban antar pedagang menjadi meningkat. \n\nPasar Pingit kini juga terkenal dengan ikan hias. Para pedagang ini bermula menjual ikan hias di depan Samsat Yogyakarta, sebanyak lima pedagang. Pada tahun 2015, pedagang-pedagang tersebut direlokasi ke Pasar Pingit, membawa juga pelanggan setia mereka. ', 223, 1, 1, 0),
(18, 'Pasar Gading', 4, 'Jl. DI Panjaitan, Kec. Mantrijeron, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55143', 'Mantrijeron', 0x00000000010100000067b0095f6f411fc097d4ed4039975b40, '55143', NULL, 'Pasar Gading memiliki dua lantai, dimana pada lantai dua kebanyakan pedagang yang direlokasi dari Pasar Shoping. Kios pada pasar ini dibuka hingga malam, seperti kios sate ayam terkenal yang ada di lantai dua. Keunggulan pasar ini ada pada tempat pemotongan daging ayam dan sapi yang selalu dijaga kebersihannya. Para pedagang sangat memperhatikan kebersihan sehingga pasar tetap nyaman. Pasar Gading juga menyediakan bahan makanan sehari-hari seperti sayur, beras, bumbu masak, peralatan dapur, dan tembikar.', 'Sebelum Pasar Gading didirikan, di sepanjang trotoar Jalan Panjaitan sudah ada pedagang yang menjual berbagai macam hal. Pada tahun 1994 juga terdapat kios jahit dan plastik di daerah Plengkung Gading. Disebut sebagai Pasar tumpah, tempat ini selalu ramai oleh pengunjung dan buka hingga sore hari. Saat itu kios-kios masih apa adanya, tanpa ada atap. Pada tahun 2003, akhirnya para pedagang ini direlokasikan ke bangunan Pasar Gading yang dibangun dengan dua lantai.', 180, 1, 1, 0),
(19, 'Pasar Talok Gendeng', 4, 'Jl. Tri Dharma, Baciro, Kec. Gondokusuman, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55225', 'Gondokusuman', 0x000000000101000000bb56dd5db1271fc0d44faf70fe985b40, '55225', NULL, 'Pasar yang pada awalnya berlokasi di pinggir rel kereta api ini pernah meraih lomba kebersihan pasar Kota Jogja pada 2012 juara III. Sekarang pasar talok sudah di relokasi tidak jauh dari rel kereta api. Pasar talok memiliki satu paguyuban yang  dinamakan Paguyuban Pasar Talok Sido Rahayu. Berbagai aktivitas yang sudah dilakukan seperti aktivitas sosial, pengajian, grup campursari.', NULL, 121, 1, 1, 0),
(20, 'Pasar Sepeda Tunjungsari', 4, 'Jl. Menteri Supeno No.46, Sorosutan, Kec. Umbulharjo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55161', 'Umbulharjo', 0x0000000001010000001f38f1c3c9431fc0efe9108d58985b40, '55161', NULL, 'Pasar yang identik dengan pasar sepeda ini menjual berbagai merk sepeda seperti Gazelle, Phoenix, Sparta, Simplex dan lainnya. Pasar ini juga menjual sepeda antik atau kuno. Banyak komunitas pecinta sepeda yang menghabiskan waktunya di pasar ini untuk melihat sepeda yang ada.', NULL, 38, 1, 1, 0),
(21, 'Pasar Telo Karangakajen', 4, 'Jl. Sisingamangaraja, Brontokusuman, Mergangsan, Yogyakarta City, Special Region of Yogyakarta 55153', 'Mergangsan', 0x00000000010100000040b0c3aee54b1fc0e3995385e1975b40, '55153', NULL, 'Pasar Telo merupakan pasar satu - satunya pasar yang menjual komoditas khusus ketela di Indonesia. Pasar ini menjadi awal toko -toko bakpia di Yogyakarta hidup. Banyak juga resto maupun rumah makan yang menggunakan bahan dasar ketela berbelanja di pasar ini. Jenis ketela yang adapun didatangkan dari berbagai daerah seperti Tawangmangu, Ngawi, Malang, Pacet, Mojokerto, Magekang, Windusari, Muntilan, dan Tempel.', NULL, 37, 1, 1, 0),
(22, 'Pasar Karangwaru', 4, 'Jl. Magelang, Karangwaru, Kec. Tegalrejo, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55241', 'Tegalrejo', 0x000000000101000000be69667d18171fc0544f33e824975b40, '55241', NULL, 'Pasar ini berawal dari para pedagang yang menjual jajanan pasar atau tenongan. Mayoritas asal pedagang berasal dari Cebongan Sleman. ', NULL, 82, 1, 1, 0),
(23, 'Pasar Gedongkuning', 5, 'Jalan Kebunraya, Rejowinangun, Kec. Kotagede, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55171', 'Kotagede', 0x000000000101000000ff805d1982361fc04ba45f2985995b40, '55171', 'https://www.instagram.com/gedongkuning.pasarjogja/', 'Pasar Gedongkuning memang bukan pasar yang paling besar di Kota Yogyakarta, namun pasar ini memiliki keunggulannya sendiri. Pasar ini termasuk pasar yang bersih, bahkan sempat meraih penghargaan Juara 1 Pasar Terbersih di Kota Yogyakarta pada tahun 2018. Selain itu, pasar ini terkenal dengan para pedagangnya yang ramah dan harmonis. Di pasar yang memiliki luas 1.224 meter ini, terlihat kreasi pedagang dalam benuk botol air mineral yang disulap menjadi pot tanaman, serta peralatan bersih-bersih yang selalu tersedia di tiap los. Pada Pasar Gedongkuning terdapat kebutuhan sehari-hari, sembako, daging, ikan laut segar, ayam potong, pakaian, serta penjual kelapa.', 'Pada tahun 1970, Pasar Gedongkuning merupakan pasar tumpah yang berada di sekitar Jalan Kusumanegara. Setelah itu, pasar direlokasikan ke lokasi saat ini yaiu di Jalan Kebun Raya, Gembiraloka. ', 193, 1, 1, 0),
(24, 'Pasar Senen', 5, 'Jl. Jogonegaran No.13, Ngampilan, Gedong Tengen, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55272', 'Gedong Tengen', 0x00000000010100000021d6306b722e1fc0174e6e3421975b40, '55272', NULL, 'Pasar Senen atau yang biasa disebut dengan Pasar Candi berlokasi dekat dengan Candi Pathuk. Hal ini menjadi salah satu daya tarik pasar karena lokasinya berdekatan dengan candi. Selain itu bentuk bangunan dari Pasar Senen berupa los yang menyerupai rumah-rumah penduduk. ', NULL, 227, 1, 1, 0),
(25, 'Pasar Pujokusuman', 5, 'Jl. Sisingamangaraja, Keparakan, Kec. Mergangsan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55131', 'Mergangsan', 0x0000000001010000008c0840fb40411fc0044d71aa9f975b40, '55131', NULL, 'Pasar yang berlokasi di kawasan Heritage ini memiliki salah satu keunikan dari bangunannya. Bangunan Pasar Pujokusuman mirip dengan benteng yang memiliki banyak pintu. Khas dari Pasar ini memiliki bangunan dengan kombinasi Belanda dan Jawa.', NULL, 92, 1, 1, 0),
(26, 'Pasar Sanggrahan Baciro', 5, 'Jalan Mawar IV, Baciro, Yogyakarta, UPT Reksonegaran', 'Gondokusuman', 0x0000000001010000005ff1dcdfb92b1fc0d715641e99985b40, '55225', NULL, 'Pasar Sanggrahan merupakan pasar yang pernah mendapatkan penghargaan pasar terbersih di Kota Yogyakarta tahun 2014. Pasar ini memiliki keunikan , karena hanya 11 pedagang yang menjual belikan barang dagangannya.', 'Pasar yang dibangun oleh Dinas Pasar Kota Yogyakarta pada tahun 1980. Pasar ini berawal dari beberapa warga Sanggrahan, Baciro yang berdagang di pinggiran selokan pada tahun 1960. Kejayaan Pasar Sanggrahan terlihat pada tahun 1972, dimana pada tahunnya belum banyak terdapat pasar yang menggunakan lincak untuk berdagang.', 21, 1, 1, 0),
(27, 'Pasar Kluwih Ngadikusuman', 5, 'Jl. Suryoputran No.2, Panembahan, Kecamatan Kraton, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55131', 'Kraton', 0x000000000101000000bc181e29a43c1fc0bee3b3e963975b40, '55131', NULL, 'Pasar Kluwih Ngadikusuman merupakan pasar yang berlokasi di lingkungan Kraton Yogyakarta. Pasar ini juga berlokasi di dekat Masjid Wiworojati. Menariknya pasar ini dulu berawal dari pedagang Gua Selarong yang bermigrasi ke jalan Suryoputran untuk menjajakan aneka macam buah.', 'Tahun 1950, Pasar Ngadikusuman merupakan salah satu pasar yang memperjual belikan buah-buahan. Pada tahun tersebut, buah yang diperjual belikan masih menempel pada batang dan daunnya. Sehingga pasar tersebut dulunya terkenal juga dengan komoditas kayu bakar dari batang buah-buahan tersebut.', 31, 1, 1, 0),
(28, 'Pasar Ledok Gondomanan', 5, 'Jalan Lobaningratan, Pawirodirjan, Gondomanan, Yogyakarta', 'Gondomanan', 0x00000000010100000014078d043c371fc0d2f1bd32ce975b40, '55121', NULL, 'Pasar Ledok Gondomanan ini termasuk salah satu pasar kecil yang ada di kota Yogyakarta. Namun Pasar ini menjual barang dagangan yang lengkap, seperti sembako, daging ayam, sayur mayur, bumbu dapur dan lain sebagainya.', NULL, 9, 1, 1, 0),
(29, 'Pasar Pace', 5, 'Jalan Kusumanegara, Semaki, Umbulharjo, Yogyakarta', 'Umbulharjo', 0x0000000001010000005eb7302a11351fc043a7db95b8985b40, '55166', NULL, 'Pasar Pace cukup unik karena lokasinya yang berada di sebuah gang sempit yang memiliki nama Semaki. Lokasinya yang dekat dengan pemukiman warga, membuat pasar ini cukup ramai dengan pelanggan warga setempat. Barang yang dapat ditemukan di pasar ini adalah kebutuhan sehari-hari. Yang membuat spesial Pasar Pace adalah kekeluargaan yang ada antara pedagang dan pembeli. Pasar Pace buka dari jam 05.00 WIB - 11.00 WIB.', 'Pasar ini dulunya terletak di dekat pohon beringin, atau pohon pace, di ahun 1950. Tahun 1970 hingga 1974 merupakan puncak kejayaan Pasar Pace. Meskipun berlokasi di gang sempit, pedagang Pasar Pace dapat ditemukan hingga ke trotoar Kusumanegara. Pedagang yang di pasar ini sudah merupakan generasi kedua dan ketiga.', 21, 1, 1, 0),
(30, 'Pasar Suryobrantan', 5, 'Jl. Achmad Dahlan, Notoprajan', 'Ngampilan', 0x0000000001010000003f66dbf914341fc0bfde18ece1965b40, '55262', NULL, 'Pasar Suryobrantan merupakan pasar yang menjualkan makanan jadi seperti soto, gudeg, lotek dan lain-lain. Berbeda dengan pasar lainnya yang memiliki lokasi di tempat yang lebih lapang, Pasa Suryobrantan berlokasi ditengah gang kecil dekat pemukiman warga.', NULL, 26, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pasarfasilitas`
--

CREATE TABLE `pasarfasilitas` (
  `id_pasar_fasilitas` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `fasilitas` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarfasilitas`
--

INSERT INTO `pasarfasilitas` (`id_pasar_fasilitas`, `nama_pasar`, `id_pasar`, `fasilitas`) VALUES
(1, 'Pasar Beringharjo', 1, 'Koperasi Dan Perbankan'),
(2, 'Pasar Beringharjo', 1, 'Atm Center'),
(3, 'Pasar Beringharjo', 1, 'Area Parkir'),
(4, 'Pasar Beringharjo', 1, 'Radio Pasar'),
(5, 'Pasar Beringharjo', 1, 'Toilet'),
(6, 'Pasar Beringharjo', 1, 'Eskalator'),
(7, 'Pasar Beringharjo', 1, 'Mushola'),
(8, 'Pasar Beringharjo', 1, 'Klinik Kesehatan'),
(9, 'Pasar Beringharjo', 1, 'Ruang Laktasi'),
(10, 'Pasar Beringharjo', 1, 'E-Retribusi'),
(11, 'Pasar Demangan', 4, 'WC'),
(12, 'Pasar Demangan', 4, 'Mushola'),
(13, 'Pasar Demangan', 4, 'Radio Pasar'),
(14, 'Pasar Demangan', 4, 'Aula'),
(15, 'Pasar Demangan', 4, 'Koperasi'),
(16, 'Pasar Giwangan', 2, '3 Tempat Lahan Parkir'),
(17, 'Pasar Giwangan', 2, '4 Toilet'),
(18, 'Pasar Giwangan', 2, '2 Mushola'),
(19, 'Pasar Giwangan', 2, 'Atm'),
(20, 'Pasar Giwangan', 2, 'Radio Pasar'),
(21, 'Pasar Giwangan', 2, '3 Tempat Bongkar Muat'),
(22, 'Pasar Giwangan', 2, 'Gudang'),
(23, 'Pasar Giwangan', 2, '2 Kantor Pengelola'),
(24, 'Pasar Karangwaru', 22, 'WC'),
(25, 'Pasar Klithikan Pakuncen', 8, 'WC'),
(26, 'Pasar Klithikan Pakuncen', 8, 'Mushola'),
(27, 'Pasar Klithikan Pakuncen', 8, 'Radio Pasar'),
(28, 'Pasar Klithikan Pakuncen', 8, 'Lahan Parkir'),
(29, 'Pasar Klithikan Pakuncen', 8, 'Klinik Kesehatan'),
(30, 'Pasar Kranggan', 3, 'Mushola'),
(31, 'Pasar Kranggan', 3, 'Area Parkir'),
(32, 'Pasar Kranggan', 3, 'Toilet Umum'),
(33, 'Pasar Kranggan', 3, 'Aula'),
(34, 'Pasar Legi Kotagede', 6, 'WC'),
(35, 'Pasar Legi Kotagede', 6, 'Mushola'),
(36, 'Pasar Legi Kotagede', 6, 'Radio Pasar'),
(37, 'Pasar Legi Kotagede', 6, 'Layanan Kesehatan'),
(38, 'Pasar Legi Kotagede', 6, 'Tempat Penampungan Sampah Sementara'),
(39, 'Pasar Ngasem', 11, 'WC'),
(40, 'Pasar Ngasem', 11, 'Lahan Parkir'),
(41, 'Pasar Ngasem', 11, 'Panggung Kesenian'),
(42, 'Pasar Ngasem', 11, 'Mushola'),
(43, 'Pasar Pathuk', 9, 'WC'),
(44, 'Pasar Pathuk', 9, 'Mushola'),
(45, 'Pasar Pathuk', 9, 'Lahan Parkir'),
(46, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'WC'),
(47, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Mushola'),
(48, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Lahan Parkir'),
(49, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Klinik Hewan'),
(50, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Area Lomba Burung Kicau'),
(51, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Free Wifi'),
(52, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'Foodcourt'),
(53, 'Pasar Sentul', 5, 'WC'),
(54, 'Pasar Sentul', 5, 'Radio Pasar'),
(55, 'Pasar Sentul', 5, 'Mushola'),
(56, 'Pasar Sepeda Tunjungsari', 20, 'WC'),
(57, 'Pasar Sepeda Tunjungsari', 20, 'Kantro Ppsy'),
(58, 'Pasar Sepeda Tunjungsari', 20, 'Musholla'),
(59, 'Pasar Sepeda Tunjungsari', 20, 'Parkir'),
(60, 'Pasar Serangan', 7, 'WC'),
(61, 'Pasar Serangan', 7, 'Mushola'),
(62, 'Pasar Serangan', 7, 'Radio Pasar'),
(63, 'Pasar Talok Gendeng', 19, 'Musholla'),
(64, 'Pasar Talok Gendeng', 19, 'WC'),
(65, 'Pasar Talok Gendeng', 19, 'Parkir');

-- --------------------------------------------------------

--
-- Table structure for table `pasarfoto`
--

CREATE TABLE `pasarfoto` (
  `id_pasar_foto` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `id_pasar` int(11) DEFAULT NULL,
  `nama_file` tinytext DEFAULT NULL,
  `caption` varchar(500) DEFAULT NULL,
  `is_sejarah` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarfoto`
--

INSERT INTO `pasarfoto` (`id_pasar_foto`, `nama_pasar`, `id_pasar`, `nama_file`, `caption`, `is_sejarah`) VALUES
(1, 'Pasar Beringharjo', 1, 'beringharjo-depan.jpg', NULL, 0),
(2, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-1.jpg', NULL, 0),
(3, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-2.jpg', NULL, 0),
(4, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-3.jpg', NULL, 0),
(5, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-4.jpeg', NULL, 0),
(6, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-5.jpeg', NULL, 0),
(7, 'Pasar Beringharjo', 1, 'beringharjo-fasilitas-6.jpeg', NULL, 0),
(8, 'Pasar Beringharjo', 1, 'sejarah-beringharjo-1956.jpg', 'Pasar Beringharjo tahun 1956', 1),
(9, 'Pasar Beringharjo', 1, 'sejarah-beringharjo-pembangunan-pasar-tambahan.jpg', 'Pembangunan pasar tambahan di Pasar Beringharjo', 1),
(10, 'Pasar Kranggan', 3, 'sejarah-kranggan-1956.jpg', 'Pasar Kranggan tahun 1956', 1),
(11, 'Pasar Lempunyangan', 14, 'sejarah-lempuyangan-1956.jpg', 'Pasar Lempunyangan tahun 1956', 1),
(12, 'Pasar Sentul', 5, 'sejarah-sentul-1956.jpg', 'Pasar Sentul tahun 1956', 1),
(13, 'Pasar Sentul', 5, 'sejarah-sentul-pembukaan.jpg', 'Pembukaan Pasar Sentul', 1),
(14, 'Pasar Terban', 12, 'sejarah-terban-hutpemda.jpg', 'Pasar Terban pada HUT Pemda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pasarketerangan`
--

CREATE TABLE `pasarketerangan` (
  `id_pasar_keterangan` bigint(20) NOT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `nama_pasar` varchar(100) DEFAULT NULL,
  `keterangan` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarketerangan`
--

INSERT INTO `pasarketerangan` (`id_pasar_keterangan`, `id_pasar`, `nama_pasar`, `keterangan`) VALUES
(1, 1, 'Pasar Beringharjo', 'Pasar Beringharjo memiliki julukan Eender Mooiste Passerop Java yang artinya pasar terindah di pulau Jawa.'),
(2, 1, 'Pasar Beringharjo', 'Pasar Beringharjo terletak di pusat kota dengan akses yang mudah ditempuh karena berdekatan dengan stasiun tugu, stasiun lempuyangan dan moda transportasi lainnya'),
(3, 15, 'Pasar Ciptomulyo', 'Pasar Ciptomulyo letaknya memanjang di sisi trotoar Sisingamangraja'),
(4, 15, 'Pasar Ciptomulyo', 'Pasar ini spesialis materi bangunan'),
(5, 4, 'Pasar Demangan', 'Kios sekitar Pasar banyak terdapat toko elektronik lengkap'),
(6, 4, 'Pasar Demangan', 'Barang dagangan Lengkap : daging dan ikan segar, sayuran,buah, perabotan rumah tangga'),
(7, 18, 'Pasar Gading', 'Juara II Lomba Kebersihan Pasar se-Kota Yogyakarta Tahun 2017'),
(8, 18, 'Pasar Gading', 'Juara III Lomba Kebersihan Pasar se-Kota Yogyakarta Tahun 2016'),
(9, 18, 'Pasar Gading', 'Pasar Gading tempat pemotongan daging ayam atau daging sapi'),
(10, 18, 'Pasar Gading', 'Pasar ini tempat yang tepat untuk mencari sayurang segar di malam hari'),
(11, 23, 'Pasar Gedongkuning', 'Juara I Lomba Kebersihan Pasar se-Kota Yogyakarta Tahun 2018'),
(12, 23, 'Pasar Gedongkuning', 'Pasar ini memiliki pedagang yang ramah dan harmonis'),
(13, 23, 'Pasar Gedongkuning', 'Pasar yang bersih dan nyaman'),
(14, 2, 'Pasar Giwangan', 'Pusat Grosir buah dan sayuran Jawa tengah dan DIY'),
(15, 2, 'Pasar Giwangan', 'Beroperasi 24jam nonstop'),
(16, 8, 'Pasar Klithikan Pakuncen', 'Barang dagangan : barang - barang bekas'),
(17, 8, 'Pasar Klithikan Pakuncen', 'Adanya komunitas numismatik'),
(18, 8, 'Pasar Klithikan Pakuncen', 'Terdapat barang - barang unik dan jadul (Jaman Dulu) yang menjadi daya tarik pasar'),
(19, 8, 'Pasar Klithikan Pakuncen', 'Tempat yang bisa menjadi alternatif memesan mahar pernikahan dengan uang kuni'),
(20, 27, 'Pasar Kluwih Ngadikusuman', 'Pasar yang berlokasi di lingkungan kraton Yogyakarta'),
(21, 3, 'Pasar Kranggan', 'Jajanan Pasar'),
(22, 6, 'Pasar Legi Kotagede', 'Pasar tertua penuh keunikan dan historis'),
(23, 6, 'Pasar Legi Kotagede', 'Pasa legimerupakan salah satu pasar cagar budaya yang dilindungi'),
(24, 13, 'Pasar Legi Patangpuluhan', 'Populer dengan siswa SMA untuk sarapan dan mencari minuman dingin.'),
(25, 13, 'Pasar Legi Patangpuluhan', 'Terdapat lapak sarapan bubur gudeg dan jenang.'),
(26, 13, 'Pasar Legi Patangpuluhan', 'Para pedagang menjunjung tinggi kebersihan untuk memenuhi slogan: Pasare Resik, Atine Becik, Sing Tuku Ora Kecelik'),
(27, 14, 'Pasar Lempuyangan', NULL),
(28, 14, 'Pasar Lempuyangan', 'Pasar Lempuyangan meraih penghargaan Adipura pada tahun 2009.'),
(29, 14, 'Pasar Lempuyangan', 'Merupakan pusat beras.'),
(30, 11, 'Pasar Ngasem', 'Pasar yang terkenal menjadi Sentral Kerajinan dan Kesenian'),
(31, 11, 'Pasar Ngasem', 'Pedagang burung di Pasar Ngasem direlokasi ke Pasar Satwa dan Tanaman Hias Yogyakarta'),
(32, 29, 'Pasar Pace', 'Pasar ramai di gang sempit'),
(33, 9, 'Pasar Pathuk', 'Pasar yang menjual banyak ragam jajanan tradisional khas pecinan'),
(34, 9, 'Pasar Pathuk', 'Banyak toko Bakpia'),
(35, 17, 'Pasar Pingit', 'Barang dagangan lengkap: sayur,  buah, aneka bumbu, perlengkapan dapur, sembako, ayam, ikan laut, pakaian, barang bekas, ikan hias'),
(36, 17, 'Pasar Pingit', 'Memiliki zonasi khusus barang bekas, khususnya barang elektronik, pecah belah, dan pakaian'),
(37, 17, 'Pasar Pingit', 'Memiliki zonasi khusus ikan hias dan bibit ikan.'),
(38, 17, 'Pasar Pingit', 'Setiap Gerebeg Pasar, para pedagang membuat maskot ikan hias yang dibuat dari triplek dan kawat.'),
(39, 16, 'Pasar Prawirotaman', 'Pasar Kampung Wisata internasional karena lokasinya berdekatan dengan hotel-hotel kawasan wisatawan asing'),
(40, 25, 'Pasar Pujokusuman', 'Pasar yang berada di kawasan Heritage tepatnya di sebelah Ndalem Pujokusuman'),
(41, 26, 'Pasar Sanggrahan Baciro', NULL),
(42, 10, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'Barang yang diperjual belikan yaitu, berbagai jenis hewan, tanaman hias di Yogyakarta'),
(43, 10, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'Pasar yang menjadi salah satu tempat untuk lombang burung berkicau'),
(44, 10, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'Menjadi salah satu lokasi fieldtrip atau proses belajar mengajar yang dilakukan di lapangan atau diluar kelas dari jenjang TK sampai SMP'),
(45, 24, 'Pasar Senen', 'Pasar terpanjang di Kota Yogyakarta'),
(46, 5, 'Pasar Sentul', 'Pasar yang terdapat banyak penjual jagung mentah.'),
(47, 5, 'Pasar Sentul', 'Salah satu komoditas utama adalah pisang dengan berbagai jenis dan ukuran'),
(48, 20, 'Pasar Sepeda Tunjungsari', 'Pasar yang menjual sepeda antik, kuno, bekas, maupun baru.'),
(49, 7, 'Pasar Serangan', 'Sentra belanja Tempe Benguk, Thiwul dan Arang'),
(50, 30, 'Pasar Suryobrantan', 'Barang yang dijual merupakan makanan jadi seperti soto, gudeg, bakmi godong dan sebagainya.'),
(51, 30, 'Pasar Suryobrantan', 'Pasar yang memiliki aktivitasi mulai pukul 05.00 - 10.00'),
(52, 19, 'Pasar Talok Gendeng', 'Pasar dengan lokasi berdekatan dengan rel kereta api'),
(53, 19, 'Pasar Talok Gendeng', 'Pasar percontohan sistem pembayaran retribusi melalui QR Code'),
(54, 21, 'Pasar Telo Karangakajen', 'Pasar dengan komoditas dagangan yaitu Ketela dan Singkong'),
(55, 21, 'Pasar Telo Karangakajen', 'Pasar satu-satunya di Indonesia yang berjualan khusus Ketala dan Singkong saja.'),
(56, 12, 'Pasar Terban', 'Sentra Pedagang Ayam.'),
(57, 12, 'Pasar Terban', 'Pemasokan ayam restoran-restoran ternama di Yogyakarta bergantung pada pasar ini, dari 10 hingga 100 ekor ayam tiap harinya.'),
(58, 12, 'Pasar Terban', 'Pasar yang inovatif dalam acara Kirab Pasar di HUT Yogyakarta. Contohnya pedagang membuat sebuah gunungan 1.5 meter yang dibuat dari ayam ingkung goreng.'),
(59, 12, 'Pasar Terban', 'Ada tradisi membagi ayam gratis yang dibagikan oleh Walikota atau pejabat lainnya. Masyarakat mengaggap pemberian ayam ini sebagai berkat dan biasanya ayam yang diberikan dipelihara.');

-- --------------------------------------------------------

--
-- Table structure for table `pasarkios`
--

CREATE TABLE `pasarkios` (
  `id_pasar_kios` bigint(20) NOT NULL,
  `nama_kios` varchar(150) DEFAULT NULL,
  `lokasi_kios` varchar(255) DEFAULT NULL,
  `gedung` varchar(25) DEFAULT NULL,
  `lantai` int(11) DEFAULT NULL,
  `kode_svg` varchar(50) DEFAULT NULL,
  `sumber` varchar(500) DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `id_pasar_lantai` bigint(20) DEFAULT NULL,
  `nama_pasar` varchar(100) DEFAULT NULL,
  `foto_kios` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarkios`
--

INSERT INTO `pasarkios` (`id_pasar_kios`, `nama_kios`, `lokasi_kios`, `gedung`, `lantai`, `kode_svg`, `sumber`, `id_pasar`, `id_pasar_lantai`, `nama_pasar`, `foto_kios`) VALUES
(1, 'Batik Atik Ibrahim', NULL, 'DEPAN', 1, 'beringharjo-kiosatikibrahim', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiosatikibrahim.jpg'),
(2, 'Batik H.Ibrahim', NULL, 'DEPAN', 1, 'beringharjo-kiosbatikibrahim', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiosBatikIbrahim.jpg'),
(3, 'Batik Sri Sundari', NULL, 'DEPAN', 1, 'beringharjo-kiossrisundari', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiossrisundari.jpg'),
(4, 'Gado-Gado Bu Hadi', NULL, 'BELAKANG', 2, 'beringharjo-kiosbuhadi', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kiosbuhadi.jpg'),
(5, 'Kanza Accecoris', NULL, 'BELAKANG', 1, 'beringharjo-kioskanzaaccecoris', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kiosKanzaAccecoris.jpg'),
(6, 'Kerajinan Larissa', NULL, 'BELAKANG', 2, 'beringharjo-kioslarissa', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kioslarissa.jpg'),
(7, 'Kukka Bag & Craft', NULL, 'BELAKANG', 2, 'beringharjo-kioskukka', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kioskukka.jpg'),
(8, 'Warung Makan Pak Sukir', NULL, 'BELAKANG', 2, 'beringharjo-kiossukir', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kiossukir.jpg'),
(9, 'Batik Soenardi', 'dekat lurah pasar, di sisi kanan dari arah depan', 'DEPAN', 1, 'beringharjo-kiossoenardi', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiossoenardi.jpg'),
(10, 'Soto Pak Muh', 'dekat pintu tengah gedung belakang', 'BELAKANG', 1, 'beringharjo-kiosmuh', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kiosmuh.jpeg'),
(11, 'Pecel Lontong Mbak Sri Cilik', 'depan pintu gerbang Pasar Beringharjo', 'DEPAN', 1, 'beringharjo-kiossricilik', NULL, 1, 2, 'Pasar Beringharjo', NULL),
(12, 'Dawet Mbah Hari', 'di pintu Pasar Beringharjo Sayap Utara', 'BELAKANG', 1, 'beringharjo-kioshari', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kioshari.jpg'),
(13, 'Batik Subagyo', 'Los 6 Utara', 'DEPAN', 1, 'beringharjo-kiosbatiksubagyo', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiosBatiksubagyo.jpg'),
(14, 'Jamu Bu Wignyo', 'Los 8', 'BELAKANG', 1, 'beringharjo-kiosjamubuwignyo', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kiosJamuBuWignyo.jpg'),
(15, 'Soto Pithes Bu Sutri Riwet', 'los Pasar Beringharjo paling timur, dekat los bahan untuk jamu.', 'BELAKANG', 1, 'beringharjo-kiossutririwet', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kiossutririwet.jpg'),
(16, 'Soto Bu Pudjo', 'Pasar Beringharjo Jogjakarta (Lantai 2)', 'BELAKANG', 2, 'beringharjo-kiospudjo', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kiospudjo.jpg'),
(17, 'Clorot', 'Pasar Beringharjo pintu belakang', 'BELAKANG', 1, 'beringharjo-kiosclorot', NULL, 1, 1, 'Pasar Beringharjo', NULL),
(18, 'Sate Kere Bu Suwarni', 'Pintu masuk selatan', 'DEPAN', 1, 'beringharjo-kiossuwarni', NULL, 1, 2, 'Pasar Beringharjo', 'beringharjo-kiossuwarni.jpg'),
(19, 'Jenang Bu Darmini', 'Pintu masuk selatan, dekat Sate Kere', 'DEPAN', 1, 'beringharjo-kiosdarmini', NULL, 1, 2, 'Pasar Beringharjo', NULL),
(20, 'Bakso Pak Jenggot', 'Pintu samping utara bringharjo', 'BELAKANG', 1, 'beringharjo-kiosjenggot', NULL, 1, 1, 'Pasar Beringharjo', 'beringharjo-kiosjenggot.jpg'),
(21, 'Burung Puyuh Bacem', 'pintu selatan sisi tengah', 'BELAKANG', 3, 'beringharjo-kiosburungpuyuhbacem', NULL, 1, 6, 'Pasar Beringharjo', NULL),
(22, 'Sego Empal Bu Warno', 'Sego Empal Bu Warno Pasar Beringharjo Lantai 2 Los Timur PA 1 No 423', 'BELAKANG', 2, 'beringharjo-kioswarno', NULL, 1, 4, 'Pasar Beringharjo', 'beringharjo-kioswarno.jpg'),
(23, 'Bahan Kue Toko Bu Kris', NULL, NULL, NULL, 'demangan-bahankuetokobukris', NULL, 4, NULL, 'Pasar Demangan', NULL),
(24, 'Kios Bu Tentrem', NULL, NULL, NULL, 'demangan-kioskiosbutentrem', NULL, 4, NULL, 'Pasar Demangan', NULL),
(25, 'Sayur Segar Mbah Sarwito', NULL, NULL, NULL, 'demangan-sayursegarmbahsarwito', NULL, 4, NULL, 'Pasar Demangan', NULL),
(26, 'Seafood Mbak Uki', NULL, NULL, NULL, 'demangan-kiosseafoodmbakuki', NULL, 4, NULL, 'Pasar Demangan', NULL),
(27, 'Nasi Campur Demangan', 'Jalan Affandi (depan Apotek Ardi Farma), Gejayan, Yogyakarta', NULL, NULL, 'demangan-kiosnasicampurdemangan', 'https://www.yogyes.com/id/yogyakarta-culinary/nasi-campur-gejayan/', 4, NULL, 'Pasar Demangan', NULL),
(28, 'Soto Lamongan Pasar Demangan', 'Jl. Affandi (teras depan pasar)', NULL, NULL, 'demangan-sotolamonganpasardemangan', 'https://jogja.mblusuk.com/434-Soto-Galau-Lamongan-Pasar-Demangan.html', 4, NULL, 'Pasar Demangan', NULL),
(29, 'Sate Ayam Pak Pawiro', NULL, NULL, NULL, 'gading-kiossateayampakpawiro', NULL, 18, NULL, 'Pasar Gading', NULL),
(30, 'Kios Buah Pak Bayu', NULL, NULL, NULL, 'giwangan-kiosbuahpakbayu', 'Hasil kuisioner', 2, NULL, 'Pasar Giwangan', NULL),
(31, 'Jamu Bu Sabar', NULL, NULL, NULL, 'karangwaru-kiosjamubusabar', NULL, 22, NULL, 'Pasar Karangwaru', NULL),
(32, 'Bakpao 52', NULL, NULL, NULL, 'klithikanpakuncen-kiosbakpao52', NULL, 8, NULL, 'Pasar Klithikan Pakuncen', NULL),
(33, 'Beras Bu Subi', NULL, 'UTAMA', 1, 'kranggan-berasbusubi', NULL, 3, 16, 'Pasar Kranggan', NULL),
(34, 'Bu Evi Kambing', NULL, 'UTAMA', 1, 'kranggan-buevikambing', NULL, 3, 16, 'Pasar Kranggan', NULL),
(35, 'Buah Mbak Sam', NULL, 'UTAMA', 1, 'kranggan-buahmbaksam', NULL, 3, 16, 'Pasar Kranggan', NULL),
(36, 'Ikan Keranjang Pak Teguh', NULL, 'UTAMA', 1, 'kranggan-ikankeranjangpakteguh', NULL, 3, 16, 'Pasar Kranggan', NULL),
(37, 'Ikan Laut Bu Ika', NULL, 'UTAMA', 1, 'kranggan-ikanlautbuika', NULL, 3, 16, 'Pasar Kranggan', NULL),
(38, 'Jajan Pasar Toko Madan', NULL, 'UTAMA', 1, 'kranggan-jajanpasartokomadan', NULL, 3, 16, 'Pasar Kranggan', NULL),
(39, 'Kacang Mbak Har', NULL, 'UTAMA', 1, 'kranggan-kacangmbakhar', NULL, 3, 16, 'Pasar Kranggan', NULL),
(40, 'Kios Sayur Mayur Katiyem', NULL, 'UTAMA', 1, 'kranggan-kiossayurmayurkatiyem', NULL, 3, 16, 'Pasar Kranggan', NULL),
(41, 'Kios Sayur Pak Hadi', NULL, 'UTAMA', 1, 'kranggan-kiossayurpakhadi', NULL, 3, 16, 'Pasar Kranggan', NULL),
(42, 'Mas Robby Ikan', NULL, 'UTAMA', 1, 'kranggan-masrobbyikan', NULL, 3, 16, 'Pasar Kranggan', NULL),
(43, 'Mbak Jam Ayam Kampung', NULL, 'UTAMA', 1, 'kranggan-mbakjamayamkampung', NULL, 3, 16, 'Pasar Kranggan', NULL),
(44, 'Mie Ayam Pak Yono', NULL, 'UTAMA', 1, 'kranggan-mieayampakyono', NULL, 3, 16, 'Pasar Kranggan', NULL),
(45, 'Sembako Mbak Mumun', NULL, 'UTAMA', 1, 'kranggan-sembakombakmumun', NULL, 3, 16, 'Pasar Kranggan', NULL),
(46, 'Sembako Mbak Tutik', NULL, 'UTAMA', 1, 'kranggan-sembakombaktutik', NULL, 3, 16, 'Pasar Kranggan', NULL),
(47, 'Sembako Tante Yeye', NULL, 'UTAMA', 1, 'kranggan-sembakotanteyeye', NULL, 3, 16, 'Pasar Kranggan', NULL),
(48, 'Snack Bu Welas', NULL, 'UTAMA', 1, 'kranggan-snackbuwelas', NULL, 3, 16, 'Pasar Kranggan', NULL),
(49, 'Snack Tenongan (Mantan/ Jebolan Trubus)', NULL, 'UTAMA', 1, 'kranggan-snacktenonganmantanjebolantrubus', NULL, 3, 16, 'Pasar Kranggan', NULL),
(50, 'Udang Lapis Siip', NULL, 'UTAMA', 1, 'kranggan-udanglapissiip', NULL, 3, 16, 'Pasar Kranggan', NULL),
(51, 'Jenang Delapan Rasa', NULL, 'UTAMA', 1, 'kranggan-kiosjenangdelapanrasa', 'https://travelingyuk.com/jajanan-tradisional-pasar-kranggan/146163/', 3, 16, 'Pasar Kranggan', NULL),
(52, 'Telor Mbak Supriyatin', 'Depan Depot Ponco', 'UTAMA', 1, 'kranggan-telormbaksupriyatin', NULL, 3, 16, 'Pasar Kranggan', NULL),
(53, 'Bu Sri Jamur', 'Depan klenteng', 'UTAMA', 1, 'kranggan-busrijamur', NULL, 3, 16, 'Pasar Kranggan', NULL),
(54, 'Buah Mbak Mini', 'Depan Klenteng', 'UTAMA', 1, 'kranggan-buahmbakmini', NULL, 3, 16, 'Pasar Kranggan', NULL),
(55, 'Soto Sampah', 'Jalan Kranggan Nomor 2, Cokrodiningratan, Jetis, Yogyakarta', 'UTAMA', 1, 'kranggan-sotosampah', 'https://travel.tempo.co/read/1051563/3-menu-kuliner-ala-bujet-mahasiswa-di-pasar-kranggan-yogyakarta', 3, 16, 'Pasar Kranggan', NULL),
(56, 'Wedang Tahu Bu Sukardi', 'Jalan Kranggan Nomor 75, Cokrodiningratan, Jetis, Yogyakarta', 'UTAMA', 1, 'kranggan-wedangtahubusukardi', 'https://travel.tempo.co/read/1051563/3-menu-kuliner-ala-bujet-mahasiswa-di-pasar-kranggan-yogyakarta', 3, 16, 'Pasar Kranggan', NULL),
(57, 'Gandos Rangin Siti', 'Perempatan Pasar Kranggan, Cokrodiningratan, Jetis, Yogyakarta', 'UTAMA', 1, 'kranggan-kiosgandosranginsiti', 'https://travel.tempo.co/read/1051563/3-menu-kuliner-ala-bujet-mahasiswa-di-pasar-kranggan-yogyakarta', 3, 16, 'Pasar Kranggan', NULL),
(58, 'Ikan Segar Mbak Ika', NULL, NULL, NULL, 'legikotagede-kiosikanmbakika', NULL, 6, NULL, 'Pasar Legi Kotagede', NULL),
(59, 'Legomoro', NULL, NULL, NULL, 'legikotagede-kioslegomoro', NULL, 6, NULL, 'Pasar Legi Kotagede', NULL),
(60, 'Snack Bu Supriyati', NULL, NULL, NULL, 'legikotagede-kiosjajanbusupriyati', NULL, 6, NULL, 'Pasar Legi Kotagede', NULL),
(61, 'Makanan Tradisional Suminah', NULL, NULL, NULL, 'legikotagede-makanantradisionalsuminah', 'https://gudeg.net/read/10492/ayo-ke-pasar-kotagede-banyak-jajanan-legendaris.html', 6, NULL, 'Pasar Legi Kotagede', NULL),
(62, 'Batagor Pak Sugeng', NULL, NULL, NULL, 'legikotagede-kiosbatagorpaksugeng', 'https://youtu.be/W3zJDiGvx84', 6, NULL, 'Pasar Legi Kotagede', NULL),
(63, 'Dawet Kotagede Pak Man Kumis', NULL, NULL, NULL, 'legikotagede-kiosdawetmankumis', 'https://youtu.be/W3zJDiGvx84', 6, NULL, 'Pasar Legi Kotagede', NULL),
(64, 'Kipa Ibu Istri Rahayu', 'Jalan Mondorakan No. 27 Kotagede', NULL, NULL, 'legikotagede-kioskipaibuistrirahayu', 'http://dpad.jogjaprov.go.id/public/article/526/PASAR_KOTAGEDE.pdf', 6, NULL, 'Pasar Legi Kotagede', NULL),
(65, 'Yangko Pak Prapto', 'Jalan Pramuka No. 82, Kotagede', NULL, NULL, 'legikotagede-kiosyangkopakprapto', 'http://dpad.jogjaprov.go.id/public/article/526/PASAR_KOTAGEDE.pdf', 6, NULL, 'Pasar Legi Kotagede', NULL),
(66, 'Sate Kambing Mbah Man', 'Pasar Kotagede, Jl. Masjid Besar No.172 B', NULL, NULL, 'legikotagede-kiossatembahman', 'https://youtu.be/W3zJDiGvx84', 6, NULL, 'Pasar Legi Kotagede', NULL),
(67, 'Capcay Pasar Patangpuluhan', NULL, NULL, NULL, 'legipatangpuluhan-capcaypasarpatangpuluhan', 'https://afanrida.com/kuliner/best-seller-of-capcay/', 13, NULL, 'Pasar Legi Patangpuluhan', NULL),
(68, 'Soto Ayam Lentok Pak Yono', NULL, NULL, NULL, 'lempunyangan-sotoayamlentokpakyono', 'https://www.anekawisata.com/kuliner-pasar-lempuyangan.html', 14, NULL, 'Pasar Lempuyangan', NULL),
(69, 'Soto Ayam Pak Gareng', NULL, NULL, NULL, 'lempunyangan-sotoayampakgareng', 'https://www.anekawisata.com/kuliner-pasar-lempuyangan.html', 14, NULL, 'Pasar Lempuyangan', NULL),
(70, 'Jenang Bu Gesti', NULL, NULL, NULL, 'lempunyangan-kiosbugesti', 'https://www.instagram.com/p/B5bqLQJhe8G/', 14, NULL, 'Pasar Lempuyangan', NULL),
(71, 'Tongseng Dan Sate Ayam Pak Tumiyo', NULL, NULL, NULL, 'lempunyangan-tongsengdansateayampaktumiyo', 'https://www.instagram.com/p/Bvc2G20FkmL/', 14, NULL, 'Pasar Lempuyangan', NULL),
(72, 'Lupis Bu Suharti', NULL, NULL, NULL, 'lempunyangan-lupisbusuharti', 'https://www.instagram.com/p/CDT_g48lw1V/', 14, NULL, 'Pasar Lempuyangan', NULL),
(73, 'Es Jaipong Lempuyangan', NULL, NULL, NULL, 'lempunyangan-esjaiponglempuyangan', 'https://www.instagram.com/p/CLjSe7irBQ5/', 14, NULL, 'Pasar Lempuyangan', NULL),
(74, 'Warung Makan Pak Parno', NULL, NULL, NULL, 'lempunyangan-warungmakanpakparno', 'https://www.yogyadise.com/sate-pak-parno-lempuyangan/', 14, NULL, 'Pasar Lempuyangan', NULL),
(75, 'Soto Kudus Kang Miun', ' Jalan C. Simanjuntak No. 31A, Yogyakarta 55223', NULL, NULL, 'lempunyangan-sotokuduskangmiun', 'https://teamtouring.net/soto-kudus-kang-miun-yogyakarta.html', 14, NULL, 'Pasar Lempuyangan', NULL),
(76, 'Apem Bu Wanti', NULL, NULL, NULL, 'ngasem-kiosapembuwanti', NULL, 11, NULL, 'Pasar Ngasem', NULL),
(77, 'Brongkos Bu Rini', NULL, 'UTAMA', 1, 'ngasem-kiosbrongkosburini', 'https://ksmtour.com/wisata-kuliner/kuliner-yogyakarta/brongkos-rini-kuliner-legendaris-yogyakarta.html', 11, 23, 'Pasar Ngasem', NULL),
(78, 'Warung Makan Bu Ngademi', NULL, 'UTAMA', 1, 'ngasem-kioswarungmakanbungademi', 'https://travelingyuk.com/bubur-genjer-bu-ngademi-jogja/225539', 11, 23, 'Pasar Ngasem', NULL),
(79, 'Terang Bulan Mbak Rus', NULL, 'UTAMA', 1, 'ngasem-kiosterangbulanmbakrus', 'https://travelingyuk.com/rm-taman-sari-karanganyar/287674/', 11, 23, 'Pasar Ngasem', NULL),
(80, 'Apem Bu Siti', NULL, 'UTAMA', 1, 'ngasem-kiosapembusiti', 'https://www.instagram.com/p/B8aLcc8Bn9p/\nhttps://www.instagram.com/p/BqBfb2hjwgU/', 11, 23, 'Pasar Ngasem', NULL),
(81, 'Apem Ngasem Bu Wanti', NULL, 'UTAMA', 1, 'ngasem-kiosapemngasembuwanti', 'https://www.instagram.com/p/B8aLcc8Bn9p/\nhttps://www.instagram.com/p/BqBfb2hjwgU/', 11, 23, 'Pasar Ngasem', NULL),
(82, 'Bubur Krecek Nasi Rames Bu Sirep', NULL, 'UTAMA', 1, 'ngasem-kiosbuburkreceknasiramesbusirep', '\nhttps://youtu.be/vlaWHFFkY5c', 11, 23, 'Pasar Ngasem', NULL),
(83, 'Dawet Pasar Ngasem Mb Ari', NULL, 'UTAMA', 1, 'ngasem-kiosdawetpasarngasemmbari', 'https://youtu.be/Q1AHvr_ioPY', 11, 23, 'Pasar Ngasem', NULL),
(84, 'Ayam Gr Bu Suntari', NULL, 'UTAMA', 1, 'pathuk-kiosayamgrbusuntari', NULL, 9, 25, 'Pasar Pathuk', NULL),
(85, 'Ayam Potong Pak Joko', NULL, 'UTAMA', 1, 'pathuk-kiosayampotongpakjoko', NULL, 9, 25, 'Pasar Pathuk', NULL),
(86, 'Bakso Bu Miyar', NULL, 'UTAMA', 1, 'pathuk-kiosbaksobumiyar', NULL, 9, 25, 'Pasar Pathuk', NULL),
(87, 'Bolang-Baling Benny', NULL, 'UTAMA', 1, 'pathuk-kiosbolangbalingbenny', NULL, 9, 25, 'Pasar Pathuk', NULL),
(88, 'Jual Babi Cik Hwa', NULL, 'UTAMA', 1, 'pathuk-kiosjualbabicikhwa', NULL, 9, 25, 'Pasar Pathuk', NULL),
(89, 'Kios Daging Babi (Aking)', NULL, 'UTAMA', 1, 'pathuk-kioskiosdagingbabiaking', NULL, 9, 25, 'Pasar Pathuk', NULL),
(90, 'Mie Ayam Bandung 59', NULL, 'UTAMA', 1, 'pathuk-kiosmieayambandung', NULL, 9, 25, 'Pasar Pathuk', NULL),
(91, 'Nasi Kuning Bu Asri', NULL, 'UTAMA', 1, 'pathuk-kiosnasikuningbuasri', NULL, 9, 25, 'Pasar Pathuk', NULL),
(92, 'Pecel Mi Mbak Tati', NULL, 'UTAMA', 1, 'pathuk-kiospecelmimbaktati', 'https://gudeg.net/read/10539/pasar-pathuk-pasar-akulturasi-jogja-suguhkan-kuliner-peranakan.html', 9, 25, 'Pasar Pathuk', NULL),
(93, 'Ayam Panggang Klaten Mbah Pur', NULL, 'UTAMA', 1, 'pathuk-kiosayampanggangklatenmbahpur', 'https://travelingyuk.com/kulineran-di-pasar-pathuk-jogja/137801', 9, 25, 'Pasar Pathuk', NULL),
(94, 'Nasi Kuning Muna Chung', 'Jl. Beskalan (Pintu Selatan Pasar Pathuk), Gondomanan, Yogyakarta', 'UTAMA', 1, 'pathuk-kiosnasikuningmunachung', 'https://www.dimanaja.com/place/129338/muna-cung-nasi-kuning-beskalan', 9, 25, 'Pasar Pathuk', NULL),
(95, 'Jenang Gempol Simbok', 'Pasar Patuk (Pintu Barat Pasar Patuk), Jl. Bhayangkara', 'UTAMA', 1, 'pathuk-kiosjenanggempolsimbok', 'https://travelingyuk.com/kulineran-di-pasar-pathuk-jogja/137801', 9, 25, 'Pasar Pathuk', NULL),
(96, 'Jenang Gempol Bu Santo', 'Pintu Barat Pasar Pathuk', 'UTAMA', 1, 'pathuk-kiosjenanggempolbusanto', 'https://gudeg.net/read/14946/jenang-gempol-bu-santo-kuliner-lawas-yang-menggoda.html', 9, 25, 'Pasar Pathuk', NULL),
(97, 'Martabak Telur Puyuh Pathuk', 'Pintu Barat Pasar Pathuk', 'UTAMA', 1, 'pathuk-kiosmartabaktelurpuyuhpathuk', 'https://travelingyuk.com/kulineran-di-pasar-pathuk-jogja/137801', 9, 25, 'Pasar Pathuk', NULL),
(98, 'Kue Rangi Samping Pasar Pathuk', 'Samping Pasar Pathuk', 'UTAMA', 1, 'pathuk-kioskuerangisampingpasarpathuk', 'https://travelingyuk.com/kulineran-di-pasar-pathuk-jogja/137801', 9, 25, 'Pasar Pathuk', NULL),
(99, 'Soto Ayam Bu Yati', NULL, NULL, NULL, 'pingit-kiossotoayambuyati', 'https://www.instagram.com/p/Bm5ApRbBdod/', 17, NULL, 'Pasar Pingit', NULL),
(100, 'Kios Ikan Hias Alex/Bu Ena', NULL, NULL, NULL, 'pingit-kiosikanhiasalexbuena', 'https://www.instagram.com/p/BmSMfQahVaT/', 17, NULL, 'Pasar Pingit', NULL),
(101, 'Kios Iwak Hias Mas Ari', NULL, NULL, NULL, 'pingit-kiosiwakhiasmasari', 'https://www.instagram.com/p/BmSMfQahVaT/', 17, NULL, 'Pasar Pingit', NULL),
(102, 'Jenang Gempol Bu Yah', NULL, NULL, NULL, 'pujokusuman-kiosjenanggempolbuyah', NULL, 25, NULL, 'Pasar Pujokusuman', NULL),
(103, 'Daging Babi Pak Kris', NULL, NULL, NULL, 'senen-kiosdagingbabipakkris', NULL, 24, NULL, 'Pasar Senen', NULL),
(104, 'Bu Kris Sembako', NULL, NULL, NULL, 'sentul-kiosbukrissembako', NULL, 5, NULL, 'Pasar Sentul', NULL),
(105, 'Gudeg Bu Dar', NULL, NULL, NULL, 'sentul-kiosgudegbudar', NULL, 5, NULL, 'Pasar Sentul', NULL),
(106, 'Toko Yobel Plastik', NULL, NULL, NULL, 'sentul-tokoyobelplastik', NULL, 5, NULL, 'Pasar Sentul', NULL),
(107, 'Jenang Gempol Pasar Sentul', NULL, NULL, NULL, 'sentul-kiosjenanggempolpasarsentul', 'https://travelingyuk.com/jenang-enak-jogja/59514', 5, NULL, 'Pasar Sentul', NULL),
(108, 'Pemotongan Ayam Mbk Yah', NULL, 'UTAMA', 1, 'terban-ayammbakyah', NULL, 12, 37, 'Pasar Terban', NULL),
(109, 'Soto Dalbe', NULL, 'UTAMA', 1, 'terban-sotodalbe', NULL, 12, 37, 'Pasar Terban', NULL),
(110, 'Soto Kudus Kang Miun', ' Jalan C. Simanjuntak No. 31A, Yogyakarta 55223', 'UTAMA', 1, 'terban-sotokudusmiun', 'https://teamtouring.net/soto-kudus-kang-miun-yogyakarta.html', 12, 37, 'Pasar Terban', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pasarkiostag`
--

CREATE TABLE `pasarkiostag` (
  `id_pasar_kios_tag` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `tag` tinytext DEFAULT NULL,
  `nama_kios` tinytext DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `id_pasar_tag` bigint(20) DEFAULT NULL,
  `id_pasar_kios` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarkiostag`
--

INSERT INTO `pasarkiostag` (`id_pasar_kios_tag`, `nama_pasar`, `tag`, `nama_kios`, `id_pasar`, `id_pasar_tag`, `id_pasar_kios`) VALUES
(1, 'Pasar Beringharjo', 'jenang', 'Jenang Bu Darmini', 1, 103, 19),
(2, 'Pasar Beringharjo', 'sego empal', 'Sego Empal Bu Warno', 1, 186, 22),
(3, 'Pasar Beringharjo', 'iso', 'Sego Empal Bu Warno', 1, 84, 22),
(4, 'Pasar Beringharjo', 'sate kere', 'Sate Kere Bu Suwarni', 1, 178, 18),
(5, 'Pasar Beringharjo', 'bakso', 'Bakso Pak Jenggot', 1, 15, 20),
(6, 'Pasar Beringharjo', 'burung puyuh bacem', 'Burung Puyuh Bacem', 1, 44, 21),
(7, 'Pasar Beringharjo', 'dawet', 'Dawet Mbah Hari', 1, 60, 12),
(8, 'Pasar Beringharjo', 'soto', 'Soto Bu Pudjo', 1, 195, 16),
(9, 'Pasar Beringharjo', 'clorot', 'Clorot', 1, 49, 17),
(10, 'Pasar Beringharjo', 'soto', 'Soto Pak Muh', 1, 195, 10),
(11, 'Pasar Beringharjo', 'soto', 'Soto Pithes Bu Sutri Riwet', 1, 195, 15),
(12, 'Pasar Beringharjo', 'pecel', 'Pecel Lontong Mbak Sri Cilik', 1, 154, 11),
(13, 'Pasar Beringharjo', 'craft', 'Kukka Bag & Craft', 1, 50, 7),
(14, 'Pasar Beringharjo', 'batik', 'Batik Sri Sundari', 1, 22, 3),
(15, 'Pasar Beringharjo', 'aksesoris', 'Kanza Accecoris', 1, 1, 5),
(16, 'Pasar Beringharjo', 'jamu', 'Jamu Bu Wignyo', 1, 97, 14),
(17, 'Pasar Beringharjo', 'batik', 'Batik H.Ibrahim', 1, 22, 2),
(18, 'Pasar Beringharjo', 'batik', 'Batik Subagyo', 1, 22, 13),
(19, 'Pasar Beringharjo', 'warung makan', 'Warung Makan Pak Sukir', 1, 221, 8),
(20, 'Pasar Beringharjo', 'craft', 'Kerajinan Larissa', 1, 50, 6),
(21, 'Pasar Beringharjo', 'gado-gado', 'Gado-Gado Bu Hadi', 1, 67, 4),
(22, 'Pasar Beringharjo', 'batik', 'Batik Atik Ibrahim', 1, 22, 1),
(23, 'Pasar Beringharjo', 'batik', 'Batik Soenardi', 1, 22, 9),
(24, 'Pasar Demangan', 'nasi campur', 'Nasi Campur Demangan', 4, 146, 27),
(25, 'Pasar Demangan', 'soto', 'Soto Lamongan Pasar Demangan', 4, 196, 28),
(26, 'Pasar Demangan', 'sayur segar', 'Sayur Segar Mbah Sarwito', 4, 182, 25),
(27, 'Pasar Demangan', 'bahan kue', 'Bahan Kue Toko Bu Kris', 4, 11, 23),
(28, 'Pasar Demangan', 'sembako', 'Kios Bu Tentrem', 4, 187, 24),
(29, 'Pasar Demangan', 'seafood', 'Seafood Mbak Uki', 4, 185, 26),
(30, 'Pasar Gading', 'sate ayam', 'Sate Ayam Pak Pawiro', 18, 172, 29),
(31, 'Pasar Giwangan', 'buah', 'Kios Buah Pak Bayu', 2, 32, 30),
(32, 'Pasar Karangwaru', 'jamu', 'Jamu Bu Sabar', 22, 99, 31),
(33, 'Pasar Klithikan Pakuncen', 'bakpao', 'Bakpao 52', 8, 14, 32),
(34, 'Pasar Kranggan', 'gandos', 'Gandos Rangin Siti', 3, 68, 57),
(35, 'Pasar Kranggan', 'jenang', 'Jenang Delapan Rasa', 3, 104, 51),
(36, 'Pasar Kranggan', 'soto', 'Soto Sampah', 3, 197, 55),
(37, 'Pasar Kranggan', 'wedang tahu', 'Wedang Tahu Bu Sukardi', 3, 222, 56),
(38, 'Pasar Kranggan', 'udang', 'Udang Lapis Siip', 3, 216, 50),
(39, 'Pasar Kranggan', 'ikan', 'Ikan Keranjang Pak Teguh', 3, 78, 36),
(40, 'Pasar Kranggan', 'ikan', 'Ikan Laut Bu Ika', 3, 78, 37),
(41, 'Pasar Kranggan', 'mie ayam', 'Mie Ayam Pak Yono', 3, 143, 44),
(42, 'Pasar Kranggan', 'kios sembako', 'Sembako Tante Yeye', 3, 125, 47),
(43, 'Pasar Kranggan', 'kios sembako', 'Beras Bu Subi', 3, 125, 33),
(44, 'Pasar Kranggan', 'kacang', 'Kacang Mbak Har', 3, 112, 39),
(45, 'Pasar Kranggan', 'kios sembako', 'Telor Mbak Supriyatin', 3, 125, 52),
(46, 'Pasar Kranggan', 'kios buah', 'Buah Mbak Sam', 3, 123, 35),
(47, 'Pasar Kranggan', 'kios buah', 'Buah Mbak Mini', 3, 123, 54),
(48, 'Pasar Kranggan', 'sayur segar', 'Kios Sayur Mayur Katiyem', 3, 184, 40),
(49, 'Pasar Kranggan', 'kios sembako', 'Sembako Mbak Mumun', 3, 125, 45),
(50, 'Pasar Kranggan', 'kios sembako', 'Sembako Mbak Tutik', 3, 125, 46),
(51, 'Pasar Kranggan', 'jajan pasar', 'Snack Tenongan (Mantan/ Jebolan Trubus)', 3, 90, 49),
(52, 'Pasar Kranggan', 'sayur segar', 'Kios Sayur Pak Hadi', 3, 184, 41),
(53, 'Pasar Kranggan', 'jajan pasar', 'Jajan Pasar Toko Madan', 3, 90, 38),
(54, 'Pasar Kranggan', 'jajan pasar', 'Snack Bu Welas', 3, 90, 48),
(55, 'Pasar Kranggan', 'daging', 'Bu Evi Kambing', 3, 52, 34),
(56, 'Pasar Kranggan', 'daging', 'Mbak Jam Ayam Kampung', 3, 52, 43),
(57, 'Pasar Kranggan', 'sayur segar', 'Bu Sri Jamur', 3, 184, 53),
(58, 'Pasar Kranggan', 'ikan', 'Mas Robby Ikan', 3, 78, 42),
(59, 'Pasar Legi Kotagede', 'kipa', 'Kipa Ibu Istri Rahayu', 6, 126, 64),
(60, 'Pasar Legi Kotagede', 'kipo', 'Kipa Ibu Istri Rahayu', 6, 127, 64),
(61, 'Pasar Legi Kotagede', 'makanan tradisional', 'Makanan Tradisional Suminah', 6, 136, 61),
(62, 'Pasar Legi Kotagede', 'yangko', 'Yangko Pak Prapto', 6, 224, 65),
(63, 'Pasar Legi Kotagede', 'sate kambing', 'Sate Kambing Mbah Man', 6, 176, 66),
(64, 'Pasar Legi Kotagede', 'dawet', 'Dawet Kotagede Pak Man Kumis', 6, 61, 63),
(65, 'Pasar Legi Kotagede', 'batagor', 'Batagor Pak Sugeng', 6, 21, 62),
(66, 'Pasar Legi Kotagede', 'ikan', 'Ikan Segar Mbak Ika', 6, 79, 58),
(67, 'Pasar Legi Kotagede', 'jajan pasar', 'Snack Bu Supriyati', 6, 91, 60),
(68, 'Pasar Legi Kotagede', 'makanan tradisional', 'Legomoro', 6, 136, 59),
(69, 'Pasar Legi Patangpuluhan', 'capcay', 'Capcay Pasar Patangpuluhan', 13, 45, 67),
(70, 'Pasar Lempuyangan', 'jenang', 'Jenang Bu Gesti', 14, 105, 70),
(71, 'Pasar Lempuyangan', 'sate kambing', 'Warung Makan Pak Parno', 14, 177, 74),
(72, 'Pasar Lempuyangan', 'tongseng kambing', 'Warung Makan Pak Parno', 14, 215, 74),
(73, 'Pasar Lempuyangan', 'soto kudus', 'Soto Kudus Kang Miun', 14, 202, 75),
(74, 'Pasar Lempuyangan', 'soto ayam', 'Soto Ayam Lentok Pak Yono', 14, 200, 68),
(75, 'Pasar Lempuyangan', 'soto ayam', 'Soto Ayam Pak Gareng', 14, 200, 69),
(76, 'Pasar Lempuyangan', 'tongseng ayam', 'Tongseng Dan Sate Ayam Pak Tumiyo', 14, 214, 71),
(77, 'Pasar Lempuyangan', 'sate ayam', 'Tongseng Dan Sate Ayam Pak Tumiyo', 14, 173, 71),
(78, 'Pasar Lempuyangan', 'lupis', 'Lupis Bu Suharti', 14, 135, 72),
(79, 'Pasar Lempuyangan', 'es jaipong', 'Es Jaipong Lempuyangan', 14, 66, 73),
(80, 'Pasar Ngasem', 'apem beras', 'Apem Bu Siti', 11, 2, 80),
(81, 'Pasar Ngasem', 'apem beras', 'Apem Ngasem Bu Wanti', 11, 2, 81),
(82, 'Pasar Ngasem', 'brongkos', 'Brongkos Bu Rini', 11, 31, 77),
(83, 'Pasar Ngasem', 'nasi rames', 'Bubur Krecek Nasi Rames Bu Sirep', 11, 150, 82),
(84, 'Pasar Ngasem', 'bubur krecek', 'Bubur Krecek Nasi Rames Bu Sirep', 11, 38, 82),
(85, 'Pasar Ngasem', 'nasi rames', 'Warung Makan Bu Ngademi', 11, 150, 78),
(86, 'Pasar Ngasem', 'bobor bayam', 'Warung Makan Bu Ngademi', 11, 28, 78),
(87, 'Pasar Ngasem', 'terang bulan', 'Terang Bulan Mbak Rus', 11, 210, 79),
(88, 'Pasar Ngasem', 'dawet', 'Dawet Pasar Ngasem Mb Ari', 11, 62, 83),
(89, 'Pasar Ngasem', 'apem beras', 'Apem Bu Wanti', 11, 2, 76),
(90, 'Pasar Pathuk', 'nasi kuning', 'Nasi Kuning Muna Chung', 9, 148, 94),
(91, 'Pasar Pathuk', 'pecel mi', 'Pecel Mi Mbak Tati', 9, 156, 92),
(92, 'Pasar Pathuk', 'jenang gempol', 'Jenang Gempol Simbok', 9, 107, 95),
(93, 'Pasar Pathuk', 'ayam panggang', 'Ayam Panggang Klaten Mbah Pur', 9, 7, 93),
(94, 'Pasar Pathuk', 'jenang gempol', 'Jenang Gempol Bu Santo', 9, 107, 96),
(95, 'Pasar Pathuk', 'nasi kuning', 'Nasi Kuning Bu Asri', 9, 148, 91),
(96, 'Pasar Pathuk', 'kue rangi', 'Kue Rangi Samping Pasar Pathuk', 9, 131, 98),
(97, 'Pasar Pathuk', 'martabak telur puyuh', 'Martabak Telur Puyuh Pathuk', 9, 139, 97),
(98, 'Pasar Pathuk', 'ayam potong', 'Ayam Potong Pak Joko', 9, 9, 85),
(99, 'Pasar Pathuk', 'bakso', 'Bakso Bu Miyar', 9, 16, 86),
(100, 'Pasar Pathuk', 'mie ayam', 'Mie Ayam Bandung 59', 9, 144, 90),
(101, 'Pasar Pathuk', 'ayam goreng', 'Ayam Gr Bu Suntari', 9, 6, 84),
(102, 'Pasar Pathuk', 'bolang baling', 'Bolang-Baling Benny', 9, 30, 87),
(103, 'Pasar Pathuk', 'babi', 'Jual Babi Cik Hwa', 9, 10, 88),
(104, 'Pasar Pathuk', 'babi', 'Kios Daging Babi (Aking)', 9, 10, 89),
(105, 'Pasar Pingit', 'ikan hias', 'Kios Iwak Hias Mas Ari', 17, 81, 101),
(106, 'Pasar Pingit', 'ikan hias', 'Kios Ikan Hias Alex/Bu Ena', 17, 81, 100),
(107, 'Pasar Pingit', 'soto ayam', 'Soto Ayam Bu Yati', 17, 201, 99),
(108, 'Pasar Pujokusuman', 'jenang gempol', 'Jenang Gempol Bu Yah', 25, 108, 102),
(109, 'Pasar Senen', 'daging babi', 'Daging Babi Pak Kris', 24, 55, 103),
(110, 'Pasar Sentul', 'jenang gempol', 'Jenang Gempol Pasar Sentul', 5, 109, 107),
(111, 'Pasar Sentul', 'jenang gempol', 'Gudeg Bu Dar', 5, 109, 105),
(112, 'Pasar Sentul', 'jenang gempol', 'Bu Kris Sembako', 5, 109, 104),
(113, 'Pasar Sentul', 'jenang gempol', 'Toko Yobel Plastik', 5, 109, 106),
(114, 'Pasar Terban', 'soto kudus', 'Soto Kudus Kang Miun', 12, 203, 110),
(115, 'Pasar Terban', 'soto', 'Soto Dalbe', 12, 199, 109),
(116, 'Pasar Terban', 'pemotongan ayam', 'Pemotongan Ayam Mbk Yah', 12, 163, 108);

-- --------------------------------------------------------

--
-- Table structure for table `pasarlantai`
--

CREATE TABLE `pasarlantai` (
  `id_pasar_lantai` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `lantai` double DEFAULT NULL,
  `nama_gedung` tinytext DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `kode_svg` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarlantai`
--

INSERT INTO `pasarlantai` (`id_pasar_lantai`, `nama_pasar`, `lantai`, `nama_gedung`, `id_pasar`, `kode_svg`) VALUES
(1, 'Pasar Beringharjo', 1, 'BELAKANG', 1, 'beringharjo-1-belakang'),
(2, 'Pasar Beringharjo', 1, 'DEPAN', 1, 'beringharjo-1-depan'),
(3, 'Pasar Beringharjo', 1, 'KECIL', 1, 'beringharjo-1-kecil'),
(4, 'Pasar Beringharjo', 2, 'BELAKANG', 1, 'beringharjo-2-belakang'),
(5, 'Pasar Beringharjo', 2, 'KECIL', 1, 'beringharjo-2-kecil'),
(6, 'Pasar Beringharjo', 3, 'BELAKANG', 1, 'beringharjo-3-belakang'),
(7, 'Pasar Beringharjo', 3, 'KECIL', 1, 'beringharjo-3-kecil'),
(8, 'Pasar Ciptomulyo', 1, 'UTAMA', 15, 'ciptomulyo-1-utama'),
(9, 'Pasar Demangan', 1, 'UTAMA', 4, 'demangan-1-utama'),
(10, 'Pasar Gading', 1, 'UTAMA', 18, 'gading-1-utama'),
(11, 'Pasar Gedongkuning', 1, 'UTAMA', 23, 'gedongkuning-1-utama'),
(12, 'Pasar Giwangan', 1, 'UTAMA', 2, 'giwangan-1-utama'),
(13, 'Pasar Karangwaru', 1, 'UTAMA', 22, 'karangwaru-1-utama'),
(14, 'Pasar Klithikan Pakuncen', 1, 'UTAMA', 8, 'klithikanpakuncen-1-utama'),
(15, 'Pasar Klithikan Pakuncen', 2, 'UTAMA', 8, 'klithikanpakuncen-2-utama'),
(16, 'Pasar Kranggan', 1, 'UTAMA', 3, 'kranggan-1-utama'),
(17, 'Pasar Kranggan', 2, 'UTAMA', 3, 'kranggan-2-utama'),
(18, 'Pasar Ledok Gondomanan', 1, 'UTAMA', 28, 'ledokgondomanan-1-utama'),
(19, 'Pasar Legi Kotagede', 1, 'UTAMA', 6, 'legikotagede-1-utama'),
(20, 'Pasar Legi Patangpuluhan', 1, 'UTAMA', 13, 'legipatangpuluhan-1-utama'),
(21, 'Pasar Lempuyangan', 1, 'UTAMA', 14, 'lempuyangan-1-utama'),
(22, 'Pasar Kluwih Ngadikusuman', 1, 'UTAMA', 27, 'kluwihngadikusuman-1-utama'),
(23, 'Pasar Ngasem', 1, 'UTAMA', 11, 'ngasem-1-utama'),
(24, 'Pasar Pace', 1, 'UTAMA', 29, 'pace-1-utama'),
(25, 'Pasar Pathuk', 1, 'UTAMA', 9, 'pathuk-1-utama'),
(26, 'Pasar Pingit', 1, 'UTAMA', 17, 'pingit-1-utama'),
(27, 'Pasar Prawirotaman', 1, 'UTAMA', 16, 'prawirotaman-1-utama'),
(28, 'Pasar Pujokusuman', 1, 'UTAMA', 25, 'pujokusuman-1-utama'),
(29, 'Pasar Sanggrahan Baciro', 1, 'UTAMA', 26, 'sanggrahanbaciro-1-utama'),
(30, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 1, 'UTAMA', 10, 'pasty-1-utama'),
(31, 'Pasar Senen', 1, 'UTAMA', 24, 'senen-1-utama'),
(32, 'Pasar Sentul', 1, 'UTAMA', 5, 'sentul-1-utama'),
(33, 'Pasar Serangan', 1, 'UTAMA', 7, 'serang-1-utama'),
(34, 'Pasar Suryobrantan', 1, 'UTAMA', 30, 'suryobrantan-1-utama'),
(35, 'Pasar Talok Gendeng', 1, 'UTAMA', 19, 'talokgendeng-1-utama'),
(36, 'Pasar Telo Karangakajen', 1, 'UTAMA', 21, 'telokarangkajen-1-utama'),
(37, 'Pasar Terban', 1, 'UTAMA', 12, 'terban-1-utama'),
(38, 'Pasar Sepeda Tunjungsari', 1, 'UTAMA', 20, 'sepedatunjungsari-1-utama'),
(39, 'Pasar Pace Semaki', 1, 'UTAMA', NULL, 'pace-1-utama');

-- --------------------------------------------------------

--
-- Table structure for table `pasarnamalain`
--

CREATE TABLE `pasarnamalain` (
  `id_pasar_nama_lain` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `nama_lain` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasarnamalain`
--

INSERT INTO `pasarnamalain` (`id_pasar_nama_lain`, `nama_pasar`, `id_pasar`, `nama_lain`) VALUES
(1, 'Pasar Beringharjo', 1, 'Pasar Bringharjo'),
(2, 'Pasar Ciptomulyo', 15, 'Tungkak'),
(3, 'Pasar Klithikan Pakuncen', 8, 'PKP'),
(4, 'Pasar Legi Kotagede', 6, 'Kotagede'),
(5, 'Pasar Legi Kotagede', 6, 'Sarlegi'),
(6, 'Pasar Legi Patangpuluhan', 13, 'Pasar Legi Bugisan'),
(7, 'Pasar Ngasem', 11, 'PSKY'),
(8, 'Pasar Pace', 29, 'Pasar Pace Semaki'),
(9, 'Pasar Pathuk', 9, 'Patok'),
(10, 'Pasar Prawirotaman', 16, 'Pasar Kampung Wisata Internasional'),
(11, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 10, 'PASTY'),
(12, 'Pasar Senen', 24, 'Pasar Candi'),
(13, 'Pasar Senen', 24, 'Pasar Senin'),
(14, 'Pasar Sentul', 5, 'Pasar Tamsis'),
(15, 'Pasar Sepeda Tunjungsari', 20, 'Pasar Sepeda'),
(16, 'Pasar Sepeda Tunjungsari', 20, 'Pasar Tunjungsari'),
(17, 'Pasar Suryobrantan', 30, 'Pasar Makanan Jadi'),
(18, 'Pasar Talok Gendeng', 19, 'Pasar Pinggir Rel Kereta'),
(19, 'Pasar Telo Karangakajen', 21, 'Pasar Telo');

-- --------------------------------------------------------

--
-- Table structure for table `pasartag`
--

CREATE TABLE `pasartag` (
  `id_pasar_tag` bigint(20) NOT NULL,
  `nama_pasar` tinytext DEFAULT NULL,
  `tag` tinytext DEFAULT NULL,
  `sumber` tinytext DEFAULT NULL,
  `id_pasar` bigint(20) DEFAULT NULL,
  `id_tag` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasartag`
--

INSERT INTO `pasartag` (`id_pasar_tag`, `nama_pasar`, `tag`, `sumber`, `id_pasar`, `id_tag`) VALUES
(1, 'Pasar Beringharjo', 'aksesoris', NULL, 1, 1),
(2, 'Pasar Ngasem', 'apem beras', NULL, 11, 2),
(3, 'Pasar Demangan', 'ayam', NULL, 4, 3),
(4, 'Pasar Terban', 'ayam', NULL, 12, 3),
(5, 'Pasar Demangan', 'ayam goreng', NULL, 4, 4),
(6, 'Pasar Pathuk', 'ayam goreng', NULL, 9, 4),
(7, 'Pasar Pathuk', 'ayam panggang', NULL, 9, 5),
(8, 'Pasar Gedongkuning', 'ayam potong', NULL, 23, 6),
(9, 'Pasar Pathuk', 'ayam potong', NULL, 9, 6),
(10, 'Pasar Pathuk', 'babi', NULL, 9, 7),
(11, 'Pasar Demangan', 'bahan kue', NULL, 4, 8),
(12, 'Pasar Pathuk', 'bakcang', NULL, 9, 9),
(13, 'Pasar Pathuk', 'bakmoy', NULL, 9, 10),
(14, 'Pasar Klithikan Pakuncen', 'bakpao', NULL, 8, 11),
(15, 'Pasar Beringharjo', 'bakso', NULL, 1, 12),
(16, 'Pasar Pathuk', 'bakso', NULL, 9, 12),
(17, 'Pasar Pathuk', 'bakso talas', NULL, 9, 13),
(18, 'Pasar Klithikan Pakuncen', 'barang antik', NULL, 8, 14),
(19, 'Pasar Klithikan Pakuncen', 'barang bekas', NULL, 8, 15),
(20, 'Pasar Pingit', 'barang bekas', NULL, 17, 15),
(21, 'Pasar Legi Kotagede', 'batagor', NULL, 6, 16),
(22, 'Pasar Beringharjo', 'batik', NULL, 1, 17),
(23, 'Pasar Legi Kotagede', 'batik', NULL, 6, 17),
(24, 'Pasar Ciptomulyo', 'batu alam', NULL, 15, 18),
(25, 'Pasar Legi Kotagede', 'batu permata', NULL, 6, 19),
(26, 'Pasar Gedongkuning', 'bersih', NULL, 23, 20),
(27, 'Pasar Pingit', 'bibit ikan', NULL, 17, 21),
(28, 'Pasar Ngasem', 'bobor bayam', NULL, 11, 22),
(29, 'Pasar Ngasem', 'bobor kelor', NULL, 11, 23),
(30, 'Pasar Pathuk', 'bolang baling', NULL, 9, 24),
(31, 'Pasar Ngasem', 'brongkos', NULL, 11, 25),
(32, 'Pasar Giwangan', 'buah', NULL, 2, 26),
(33, 'Pasar Pace', 'buah', NULL, 29, 26),
(34, 'Pasar Terban', 'buah', NULL, 12, 26),
(35, 'Pasar Kranggan', 'bubur candil', NULL, 3, 27),
(36, 'Pasar Terban', 'bubur gudeg', NULL, 12, 28),
(37, 'Pasar Beringharjo', 'bubur jenang', NULL, 1, 29),
(38, 'Pasar Ngasem', 'bubur krecek', NULL, 11, 30),
(39, 'Pasar Pace', 'bubur krecek', NULL, 29, 30),
(40, 'Pasar Demangan', 'bumbu', NULL, 4, 31),
(41, 'Pasar Pathuk', 'bumbu rempah', NULL, 9, 32),
(42, 'Pasar Kranggan', 'bunga tabur', NULL, 3, 33),
(43, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'burung', NULL, 10, 34),
(44, 'Pasar Beringharjo', 'burung puyuh bacem', NULL, 1, 35),
(45, 'Pasar Legi Patangpuluhan', 'capcay', NULL, 13, 36),
(46, 'Pasar Legi Kotagede', 'celupan', NULL, 6, 37),
(47, 'Pasar Ngasem', 'ceplukan', NULL, 11, 38),
(48, 'Pasar Pathuk', 'cha kwe', NULL, 9, 39),
(49, 'Pasar Beringharjo', 'clorot', NULL, 1, 40),
(50, 'Pasar Beringharjo', 'craft', NULL, 1, 41),
(51, 'Pasar Gedongkuning', 'daging', NULL, 23, 42),
(52, 'Pasar Kranggan', 'daging', NULL, 3, 42),
(53, 'Pasar Gading', 'daging ayam', NULL, 18, 43),
(54, 'Pasar Terban', 'daging ayam', NULL, 12, 43),
(55, 'Pasar Senen', 'daging babi', NULL, 24, 44),
(56, 'Pasar Terban', 'daging kambing', NULL, 12, 45),
(57, 'Pasar Gading', 'daging sapi', NULL, 18, 46),
(58, 'Pasar Terban', 'daging sapi', NULL, 12, 46),
(59, 'Pasar Demangan', 'daging segar', NULL, 4, 47),
(60, 'Pasar Beringharjo', 'dawet', NULL, 1, 48),
(61, 'Pasar Legi Kotagede', 'dawet', NULL, 6, 48),
(62, 'Pasar Ngasem', 'dawet', NULL, 11, 48),
(63, 'Pasar Kranggan', 'depot telur', NULL, 3, 49),
(64, 'Pasar Legi Kotagede', 'emas', NULL, 6, 50),
(65, 'Pasar Demangan', 'empal bacem', NULL, 4, 51),
(66, 'Pasar Lempuyangan', 'es jaipong', NULL, 14, 52),
(67, 'Pasar Beringharjo', 'gado-gado', NULL, 1, 53),
(68, 'Pasar Kranggan', 'gandos', NULL, 3, 54),
(69, 'Pasar Pathuk', 'gandos', NULL, 9, 54),
(70, 'Pasar Serangan', 'gatot', NULL, 7, 55),
(71, 'Pasar Prawirotaman', 'gendar', NULL, 16, 56),
(72, 'Pasar Legi Kotagede', 'gerabah', NULL, 6, 57),
(73, 'Pasar Legi Kotagede', 'gethuk', NULL, 6, 58),
(74, 'Pasar Legi Kotagede', 'grontol', NULL, 6, 59),
(75, 'Pasar Pace', 'gudeg', NULL, 29, 60),
(76, 'Pasar Sentul', 'gudeg', NULL, 5, 60),
(77, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'hewan', NULL, 10, 61),
(78, 'Pasar Kranggan', 'ikan', NULL, 3, 62),
(79, 'Pasar Legi Kotagede', 'ikan', NULL, 6, 62),
(80, 'Pasar Terban', 'ikan', NULL, 12, 62),
(81, 'Pasar Pingit', 'ikan hias', NULL, 17, 63),
(82, 'Pasar Gedongkuning', 'ikan laut segar', NULL, 23, 64),
(83, 'Pasar Demangan', 'ikan segar', NULL, 4, 65),
(84, 'Pasar Beringharjo', 'iso', NULL, 1, 66),
(85, 'Pasar Kranggan', 'jadah koro', NULL, 3, 67),
(86, 'Pasar Sentul', 'jagung bakar', NULL, 5, 68),
(87, 'Pasar Sentul', 'jagung mentah', NULL, 5, 69),
(88, 'Pasar Sentul', 'jagung rebus', NULL, 5, 70),
(89, 'Pasar Demangan', 'jajan pasar', NULL, 4, 71),
(90, 'Pasar Kranggan', 'jajan pasar', NULL, 3, 71),
(91, 'Pasar Legi Kotagede', 'jajan pasar', NULL, 6, 71),
(92, 'Pasar Sentul', 'jajan pasar', NULL, 5, 71),
(93, 'Pasar Legi Kotagede', 'jajanan kipo', NULL, 6, 72),
(94, 'Pasar Pace', 'jajanan pasar', NULL, 29, 73),
(95, 'Pasar Legi Kotagede', 'jajanan tradisional', NULL, 6, 74),
(96, 'Pasar Klithikan Pakuncen', 'jam tangan', NULL, 8, 75),
(97, 'Pasar Beringharjo', 'jamu', NULL, 1, 76),
(98, 'Pasar Demangan', 'jamu', NULL, 4, 76),
(99, 'Pasar Karangwaru', 'jamu', NULL, 22, 76),
(100, 'Pasar Kranggan', 'jamu', NULL, 3, 76),
(101, 'Pasar Legi Kotagede', 'jamu', NULL, 6, 76),
(102, 'Pasar Pace', 'jamu gendong', NULL, 29, 77),
(103, 'Pasar Beringharjo', 'jenang', NULL, 1, 78),
(104, 'Pasar Kranggan', 'jenang', NULL, 3, 78),
(105, 'Pasar Lempuyangan', 'jenang', NULL, 14, 78),
(106, 'Pasar Terban', 'jenang', NULL, 12, 78),
(107, 'Pasar Pathuk', 'jenang gempol', NULL, 9, 79),
(108, 'Pasar Pujokusuman', 'jenang gempol', NULL, 25, 79),
(109, 'Pasar Sentul', 'jenang gempol', NULL, 5, 79),
(110, 'Pasar Sentul', 'jenang grendul', NULL, 5, 80),
(111, 'Pasar Kranggan', 'jenang upih', NULL, 3, 81),
(112, 'Pasar Kranggan', 'kacang', NULL, 3, 82),
(113, 'Pasar Pathuk', 'kampung pecinan', NULL, 9, 83),
(114, 'Pasar Legi Kotagede', 'katun', NULL, 6, 84),
(115, 'Pasar Pace', 'kebutuhan sehari-hari', NULL, 29, 85),
(116, 'Pasar Gedongkuning', 'kelapa parut', NULL, 23, 86),
(117, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'kelinci', NULL, 10, 87),
(118, 'Pasar Legi Kotagede', 'kendi', NULL, 6, 88),
(119, 'Pasar Legi Kotagede', 'kendil', NULL, 6, 89),
(120, 'Pasar Ciptomulyo', 'keramik', NULL, 15, 90),
(121, 'Pasar Ngasem', 'kicau birung', NULL, 11, 91),
(122, 'Pasar Demangan', 'kios buah', NULL, 4, 92),
(123, 'Pasar Kranggan', 'kios buah', NULL, 3, 92),
(124, 'Pasar Prawirotaman', 'kios buah', NULL, 16, 92),
(125, 'Pasar Kranggan', 'kios sembako', NULL, 3, 93),
(126, 'Pasar Legi Kotagede', 'kipa', NULL, 6, 94),
(127, 'Pasar Legi Kotagede', 'kipo', NULL, 6, 95),
(128, 'Pasar Ciptomulyo', 'konblok', NULL, 15, 96),
(129, 'Pasar Legi Kotagede', 'kue banjar', NULL, 6, 97),
(130, 'Pasar Kranggan', 'kue ku', NULL, 3, 98),
(131, 'Pasar Pathuk', 'kue rangi', NULL, 9, 99),
(132, 'Pasar Legi Kotagede', 'kue ukel', NULL, 6, 100),
(133, 'Pasar Legi Kotagede', 'lilin', NULL, 6, 101),
(134, 'Pasar Kranggan', 'lupis', NULL, 3, 102),
(135, 'Pasar Lempuyangan', 'lupis', NULL, 14, 102),
(136, 'Pasar Legi Kotagede', 'makanan tradisional', NULL, 6, 103),
(137, 'Pasar Gading', 'malam', NULL, 18, 104),
(138, 'Pasar Legi Kotagede', 'malam', NULL, 6, 104),
(139, 'Pasar Pathuk', 'martabak telur puyuh', NULL, 9, 105),
(140, 'Pasar Ciptomulyo', 'materi bangunan', NULL, 15, 106),
(141, 'Pasar Legi Kotagede', 'mbang waru', NULL, 6, 107),
(142, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'media tanah', NULL, 10, 108),
(143, 'Pasar Kranggan', 'mie ayam', NULL, 3, 109),
(144, 'Pasar Pathuk', 'mie ayam', NULL, 9, 109),
(145, 'Pasar Ngasem', 'mpon-mpon', NULL, 11, 110),
(146, 'Pasar Demangan', 'nasi campur', NULL, 4, 111),
(147, 'Pasar Demangan', 'nasi kuning', NULL, 4, 112),
(148, 'Pasar Pathuk', 'nasi kuning', NULL, 9, 112),
(149, 'Pasar Pathuk', 'nasi langgi', NULL, 9, 113),
(150, 'Pasar Ngasem', 'nasi rames', NULL, 11, 114),
(151, 'Pasar Senen', 'nasi rames', NULL, 24, 114),
(152, 'Pasar Klithikan Pakuncen', 'onderdil', NULL, 8, 115),
(153, 'Pasar Pathuk', 'otek-otek', NULL, 9, 116),
(154, 'Pasar Beringharjo', 'pecel', NULL, 1, 117),
(155, 'Pasar Demangan', 'pecel lele', NULL, 4, 118),
(156, 'Pasar Pathuk', 'pecel mi', NULL, 9, 119),
(157, 'Pasar Lempuyangan', 'pedagang ayam', NULL, 14, 120),
(158, 'Pasar Terban', 'pedagang ayam', NULL, 12, 120),
(159, 'Pasar Legi Kotagede', 'pedagang hewan', NULL, 6, 121),
(160, 'Pasar Gading', 'pemenang lomba', NULL, 18, 122),
(161, 'Pasar Gedongkuning', 'pemenang lomba', NULL, 23, 122),
(162, 'Pasar Gading', 'pemotongan ayam', NULL, 18, 123),
(163, 'Pasar Terban', 'pemotongan ayam', NULL, 12, 123),
(164, 'Pasar Gading', 'pemotongan sapi', NULL, 18, 124),
(165, 'Pasar Legi Kotagede', 'perak', NULL, 6, 125),
(166, 'Pasar Terban', 'peralatan mandi', NULL, 12, 126),
(167, 'Pasar Pathuk', 'peranakan tionghoa', NULL, 9, 127),
(168, 'Pasar Legi Kotagede', 'perhiasan', NULL, 6, 128),
(169, 'Pasar Legi Kotagede', 'puli', NULL, 6, 129),
(170, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'pupuk', NULL, 10, 130),
(171, 'Pasar Pace', 'sarapan', NULL, 29, 131),
(172, 'Pasar Gading', 'sate ayam', NULL, 18, 132),
(173, 'Pasar Lempuyangan', 'sate ayam', NULL, 14, 132),
(174, 'Pasar Pathuk', 'sate babi', NULL, 9, 133),
(175, 'Pasar Gading', 'sate gading', NULL, 18, 134),
(176, 'Pasar Legi Kotagede', 'sate kambing', NULL, 6, 135),
(177, 'Pasar Lempuyangan', 'sate kambing', NULL, 14, 135),
(178, 'Pasar Beringharjo', 'sate kere', NULL, 1, 136),
(179, 'Pasar Pathuk', 'sate kere', NULL, 9, 136),
(180, 'Pasar Pace', 'sayur', NULL, 29, 137),
(181, 'Pasar Terban', 'sayur', NULL, 12, 137),
(182, 'Pasar Demangan', 'sayur segar', NULL, 4, 138),
(184, 'Pasar Kranggan', 'sayur segar', NULL, 3, 138),
(185, 'Pasar Demangan', 'seafood', NULL, 4, 139),
(186, 'Pasar Beringharjo', 'sego empal', NULL, 1, 140),
(187, 'Pasar Demangan', 'sembako', NULL, 4, 141),
(188, 'Pasar Gedongkuning', 'sembako', NULL, 23, 141),
(189, 'Pasar Pace', 'sembako', NULL, 29, 141),
(190, 'Pasar Sentul', 'sembako', NULL, 5, 141),
(191, 'Pasar Terban', 'sembako', NULL, 12, 141),
(192, 'Pasar Ciptomulyo', 'semen', NULL, 15, 142),
(193, 'Pasar Terban', 'sentra ayam', NULL, 12, 143),
(194, 'Pasar Pingit', 'serba ada', NULL, 17, 144),
(195, 'Pasar Beringharjo', 'soto', NULL, 1, 145),
(196, 'Pasar Demangan', 'soto', NULL, 4, 145),
(197, 'Pasar Kranggan', 'soto', NULL, 3, 145),
(198, 'Pasar Pathuk', 'soto', NULL, 9, 145),
(199, 'Pasar Terban', 'soto', NULL, 12, 145),
(200, 'Pasar Lempuyangan', 'soto ayam', NULL, 14, 146),
(201, 'Pasar Pingit', 'soto ayam', NULL, 17, 146),
(202, 'Pasar Lempuyangan', 'soto kudus', NULL, 14, 147),
(203, 'Pasar Terban', 'soto kudus', NULL, 12, 147),
(204, 'Pasar Lempuyangan', 'soto lenthuk', NULL, 14, 148),
(205, 'Pasar Klithikan Pakuncen', 'sparepart motor', NULL, 8, 149),
(206, 'Pasar Pathuk', 'talas goreng', NULL, 9, 150),
(207, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'tanaman', NULL, 10, 151),
(208, 'Pasar Satwa dan Tanaman Hias Yogyakarta', 'tanaman hias', NULL, 10, 152),
(209, 'Pasar Ciptomulyo', 'tempat cuci piring', NULL, 15, 153),
(210, 'Pasar Ngasem', 'terang bulan', NULL, 11, 154),
(211, 'Pasar Serangan', 'thiwul', NULL, 7, 155),
(212, 'Pasar Legi Kotagede', 'thiwul tolo', NULL, 6, 156),
(213, 'Pasar Sentul', 'toko plastik', NULL, 5, 157),
(214, 'Pasar Lempuyangan', 'tongseng ayam', NULL, 14, 158),
(215, 'Pasar Lempuyangan', 'tongseng kambing', NULL, 14, 159),
(216, 'Pasar Kranggan', 'udang', NULL, 3, 160),
(217, 'Pasar Pathuk', 'udang lapis', NULL, 9, 161),
(218, 'Pasar Legi Kotagede', 'unggas', NULL, 6, 162),
(219, 'Pasar Terban', 'unggas', NULL, 12, 162),
(220, 'Pasar Ciptomulyo', 'ventilasi udara', NULL, 15, 163),
(221, 'Pasar Beringharjo', 'warung makan', NULL, 1, 164),
(222, 'Pasar Kranggan', 'wedang tahu', NULL, 3, 165),
(223, 'Pasar Legi Kotagede', 'wedang uwuh', NULL, 6, 166),
(224, 'Pasar Legi Kotagede', 'yangko', NULL, 6, 167),
(225, 'Pasar Beringharjo', 'alat wedding', NULL, 1, 168),
(226, 'Pasar Beringharjo', 'kain batik', NULL, 1, 169),
(227, 'Pasar Beringharjo', 'krat bambu', NULL, 1, 170),
(228, 'Pasar Beringharjo', 'home decor', NULL, 1, 171),
(229, NULL, NULL, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id_tag` bigint(20) NOT NULL,
  `tag` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id_tag`, `tag`) VALUES
(1, 'aksesoris'),
(2, 'apem beras'),
(3, 'ayam'),
(4, 'ayam goreng'),
(5, 'ayam panggang'),
(6, 'ayam potong'),
(7, 'babi'),
(8, 'bahan kue'),
(9, 'bakcang'),
(10, 'bakmoy'),
(11, 'bakpao'),
(12, 'bakso'),
(13, 'bakso talas'),
(14, 'barang antik'),
(15, 'barang bekas'),
(16, 'batagor'),
(17, 'batik'),
(18, 'batu alam'),
(19, 'batu permata'),
(20, 'bersih'),
(21, 'bibit ikan'),
(22, 'bobor bayam'),
(23, 'bobor kelor'),
(24, 'bolang baling'),
(25, 'brongkos'),
(26, 'buah'),
(27, 'bubur candil'),
(28, 'bubur gudeg'),
(29, 'bubur jenang'),
(30, 'bubur krecek'),
(31, 'bumbu'),
(32, 'bumbu rempah'),
(33, 'bunga tabur'),
(34, 'burung'),
(35, 'burung puyuh bacem'),
(36, 'capcay'),
(37, 'celupan'),
(38, 'ceplukan'),
(39, 'cha kwe'),
(40, 'clorot'),
(41, 'craft'),
(42, 'daging'),
(43, 'daging ayam'),
(44, 'daging babi'),
(45, 'daging kambing'),
(46, 'daging sapi'),
(47, 'daging segar'),
(48, 'dawet'),
(49, 'depot telur'),
(50, 'emas'),
(51, 'empal bacem'),
(52, 'es jaipong'),
(53, 'gado-gado'),
(54, 'gandos'),
(55, 'gatot'),
(56, 'gendar'),
(57, 'gerabah'),
(58, 'gethuk'),
(59, 'grontol'),
(60, 'gudeg'),
(61, 'hewan'),
(62, 'ikan'),
(63, 'ikan hias'),
(64, 'ikan laut segar'),
(65, 'ikan segar'),
(66, 'iso'),
(67, 'jadah koro'),
(68, 'jagung bakar'),
(69, 'jagung mentah'),
(70, 'jagung rebus'),
(71, 'jajan pasar'),
(72, 'jajanan kipo'),
(73, 'jajanan pasar'),
(74, 'jajanan tradisional'),
(75, 'jam tangan'),
(76, 'jamu'),
(77, 'jamu gendong'),
(78, 'jenang'),
(79, 'jenang gempol'),
(80, 'jenang grendul'),
(81, 'jenang upih'),
(82, 'kacang'),
(83, 'kampung pecinan'),
(84, 'katun'),
(85, 'kebutuhan sehari-hari'),
(86, 'kelapa parut'),
(87, 'kelinci'),
(88, 'kendi'),
(89, 'kendil'),
(90, 'keramik'),
(91, 'kicau birung'),
(92, 'kios buah'),
(93, 'kios sembako'),
(94, 'kipa'),
(95, 'kipo'),
(96, 'konblok'),
(97, 'kue banjar'),
(98, 'kue ku'),
(99, 'kue rangi'),
(100, 'kue ukel'),
(101, 'lilin'),
(102, 'lupis'),
(103, 'makanan tradisional'),
(104, 'malam'),
(105, 'martabak telur puyuh'),
(106, 'materi bangunan'),
(107, 'mbang waru'),
(108, 'media tanah'),
(109, 'mie ayam'),
(110, 'mpon-mpon'),
(111, 'nasi campur'),
(112, 'nasi kuning'),
(113, 'nasi langgi'),
(114, 'nasi rames'),
(115, 'onderdil'),
(116, 'otek-otek'),
(117, 'pecel'),
(118, 'pecel lele'),
(119, 'pecel mi'),
(120, 'pedagang ayam'),
(121, 'pedagang hewan'),
(122, 'pemenang lomba'),
(123, 'pemotongan ayam'),
(124, 'pemotongan sapi'),
(125, 'perak'),
(126, 'peralatan mandi'),
(127, 'peranakan tionghoa'),
(128, 'perhiasan'),
(129, 'puli'),
(130, 'pupuk'),
(131, 'sarapan'),
(132, 'sate ayam'),
(133, 'sate babi'),
(134, 'sate gading'),
(135, 'sate kambing'),
(136, 'sate kere'),
(137, 'sayur'),
(138, 'sayur segar'),
(139, 'seafood'),
(140, 'sego empal'),
(141, 'sembako'),
(142, 'semen'),
(143, 'sentra ayam'),
(144, 'serba ada'),
(145, 'soto'),
(146, 'soto ayam'),
(147, 'soto kudus'),
(148, 'soto lenthuk'),
(149, 'sparepart motor'),
(150, 'talas goreng'),
(151, 'tanaman'),
(152, 'tanaman hias'),
(153, 'tempat cuci piring'),
(154, 'terang bulan'),
(155, 'thiwul'),
(156, 'thiwul tolo'),
(157, 'toko plastik'),
(158, 'tongseng ayam'),
(159, 'tongseng kambing'),
(160, 'udang'),
(161, 'udang lapis'),
(162, 'unggas'),
(163, 'ventilasi udara'),
(164, 'warung makan'),
(165, 'wedang tahu'),
(166, 'wedang uwuh'),
(167, 'yangko');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `token`) VALUES
(4, 'agata', '$2y$10$skt97ZYxAmicvgRyksVyc.uJIzErvWs2bBLkW5.XiyF3Q5WnfQSbK', 'Administrator', 'WeCF804tFUJBVSNmh6MAgvf8QcgfP71dLCmpLTcy'),
(5, 'admin', '$2y$10$ZweK3Esfh5hJVQ03GbMBx.gJ0.41m6B4BvN4S2JrLwe8ZHdAn1R6K', 'Administrator', 'lOCPT1O92hjxFmAFMHdOrEChGTzMQm1N8tpeK2gQ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pasar`
--
ALTER TABLE `pasar`
  ADD PRIMARY KEY (`id_pasar`),
  ADD UNIQUE KEY `idx_pasar_pk` (`id_pasar`),
  ADD KEY `idx_pasar_lookup` (`nama_pasar`);

--
-- Indexes for table `pasarfasilitas`
--
ALTER TABLE `pasarfasilitas`
  ADD PRIMARY KEY (`id_pasar_fasilitas`),
  ADD UNIQUE KEY `idx_pasarfasilitas_pk` (`id_pasar_fasilitas`),
  ADD KEY `idx_pasarfasilitas_lookup` (`id_pasar`,`fasilitas`(255));

--
-- Indexes for table `pasarfoto`
--
ALTER TABLE `pasarfoto`
  ADD PRIMARY KEY (`id_pasar_foto`),
  ADD UNIQUE KEY `idx_pasarfoto_pk` (`id_pasar_foto`),
  ADD KEY `idx_pasarfoto_lookup` (`nama_pasar`(255),`nama_file`(255));

--
-- Indexes for table `pasarketerangan`
--
ALTER TABLE `pasarketerangan`
  ADD PRIMARY KEY (`id_pasar_keterangan`),
  ADD UNIQUE KEY `idx_pasarketerangan_pk` (`id_pasar_keterangan`),
  ADD KEY `idx_pasarketerangan_lookup` (`id_pasar`,`keterangan`(255));

--
-- Indexes for table `pasarkios`
--
ALTER TABLE `pasarkios`
  ADD PRIMARY KEY (`id_pasar_kios`);

--
-- Indexes for table `pasarkiostag`
--
ALTER TABLE `pasarkiostag`
  ADD PRIMARY KEY (`id_pasar_kios_tag`),
  ADD UNIQUE KEY `idx_pasarkiostag_pk` (`id_pasar_kios_tag`);

--
-- Indexes for table `pasarlantai`
--
ALTER TABLE `pasarlantai`
  ADD PRIMARY KEY (`id_pasar_lantai`),
  ADD UNIQUE KEY `idx_pasarlantai_pk` (`id_pasar_lantai`),
  ADD KEY `idx_pasarlantai_lookup` (`nama_pasar`(255),`lantai`,`nama_gedung`(255));

--
-- Indexes for table `pasarnamalain`
--
ALTER TABLE `pasarnamalain`
  ADD PRIMARY KEY (`id_pasar_nama_lain`),
  ADD UNIQUE KEY `idx_pasarnamalain_pk` (`id_pasar_nama_lain`),
  ADD KEY `idx_pasarnamalain_lookup` (`id_pasar`,`nama_lain`(255));

--
-- Indexes for table `pasartag`
--
ALTER TABLE `pasartag`
  ADD PRIMARY KEY (`id_pasar_tag`),
  ADD UNIQUE KEY `idx_pasartag_pk` (`id_pasar_tag`),
  ADD KEY `idx_pasartag_lookup` (`nama_pasar`(255),`tag`(255));

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`),
  ADD UNIQUE KEY `idx_tag_pk` (`id_tag`),
  ADD KEY `idx_tag_lookup` (`tag`(255));

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pasar`
--
ALTER TABLE `pasar`
  MODIFY `id_pasar` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pasarfasilitas`
--
ALTER TABLE `pasarfasilitas`
  MODIFY `id_pasar_fasilitas` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `pasarfoto`
--
ALTER TABLE `pasarfoto`
  MODIFY `id_pasar_foto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pasarketerangan`
--
ALTER TABLE `pasarketerangan`
  MODIFY `id_pasar_keterangan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `pasarkios`
--
ALTER TABLE `pasarkios`
  MODIFY `id_pasar_kios` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `pasarkiostag`
--
ALTER TABLE `pasarkiostag`
  MODIFY `id_pasar_kios_tag` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `pasarlantai`
--
ALTER TABLE `pasarlantai`
  MODIFY `id_pasar_lantai` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pasarnamalain`
--
ALTER TABLE `pasarnamalain`
  MODIFY `id_pasar_nama_lain` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pasartag`
--
ALTER TABLE `pasartag`
  MODIFY `id_pasar_tag` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
