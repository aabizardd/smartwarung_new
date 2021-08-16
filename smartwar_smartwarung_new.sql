-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2021 at 05:19 PM
-- Server version: 10.3.29-MariaDB-log-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartwar_smartwarung_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `alasan_penolakans`
--

CREATE TABLE `alasan_penolakans` (
  `id_tolak` int(11) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alasan_penolakans`
--

INSERT INTO `alasan_penolakans` (`id_tolak`, `keterangan`) VALUES
(1, 'ini orang jail'),
(2, 'Berisik');

-- --------------------------------------------------------

--
-- Table structure for table `alasan_tolak_pesan`
--

CREATE TABLE `alasan_tolak_pesan` (
  `id_tolak_pesan` int(11) NOT NULL,
  `keterangan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alasan_tolak_pesan`
--

INSERT INTO `alasan_tolak_pesan` (`id_tolak_pesan`, `keterangan`) VALUES
(1, 'A'),
(2, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id_bank_account` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `warung_username` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id_bank_account`, `account_name`, `account_number`, `bank`, `warung_username`, `date`, `update`) VALUES
(1, 'Smart Warung', '9999999', 'BCA', 'admin', '2021-01-11 18:09:21', '2021-01-11 18:09:21'),
(2, 'Smart Warung', '123123123', 'BNI', 'admin', '2021-01-11 19:01:11', '2021-01-11 19:01:11'),
(3, 'Smart Warung', '111222333', 'BRI', 'admin', '2021-01-11 19:01:11', '2021-01-11 19:01:11'),
(4, 'Rajawalss', '1123123', 'BCA', 'rajawali', '2021-03-14 06:53:32', '2021-03-14 06:53:32'),
(7, 'Gallery', '1234', 'BNI', 'gallery', '2021-05-04 05:24:52', '2021-05-04 05:24:52'),
(9, 'Alaw', '12345', 'BCA', 'alaw', '2021-05-06 08:10:02', '2021-05-06 08:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `username`) VALUES
('cart5e954667e6f6a', 'abcd'),
('cart602542b2c3dee', 'jumahid'),
('cart6082c60ae3dab', 'ocha'),
('cart60eab361dbca7', 'pipit');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` varchar(255) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `item`, `quantity`) VALUES
('cart6082c60ae3dab', 75, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Sembako'),
(2, 'Makanan'),
(3, 'Laundry'),
(7, 'Kebersihan'),
(8, 'Perlengkapan Mandi'),
(9, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `to_whom` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` int(11) DEFAULT 0,
  `id_reply` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id_comment`, `sender_name`, `username`, `to_whom`, `message`, `type`, `id_reply`, `foto`, `rating`, `date`) VALUES
(23, 'Oktrichavita Jassinda', 'ocha', 'waruh', 'mantap nih warung', 0, NULL, '2a8dd973c60aef89dc25c7315f1185db.jpg', 5, '2021-07-11 06:36:30'),
(24, 'Oktrichavita Jassinda', 'ocha', 'admin', 'asdasdas', 0, NULL, '4d6c36856d70ba140390d889aeda73ea.jpeg', 0, '2021-07-11 06:43:37'),
(25, 'Oktrichavita Jassinda', 'ocha', 'admin', 'asdasd', 0, NULL, '08ac0cca7ba159caeb2a6e3c0386fead.jpg', 0, '2021-07-11 06:44:33'),
(26, 'Oktrichavita Jassinda', 'ocha', 'waruh', 'warung keren dah', 0, NULL, '4a5b46f42693c920df420754cebddedb.jpg', 5, '2021-07-11 06:44:54'),
(27, 'Vita Jassinda', 'pipit', 'busari', 'Barangnya murah-murah dan pengirimnya ramah', 0, NULL, '7aaea9bb9f73add80945228e11bd0544.jpeg', 5, '2021-07-11 09:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `warung` varchar(255) NOT NULL,
  `origin` varchar(255) NOT NULL,
  `origin_id` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `destination_id` varchar(255) NOT NULL,
  `distance` float NOT NULL,
  `delivery_fee` int(11) NOT NULL,
  `billing` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `method` enum('Transfer','COD') NOT NULL,
  `bank_type` varchar(255) DEFAULT NULL,
  `bank_account_number` varchar(255) DEFAULT NULL,
  `pdf_url` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `date` varchar(250) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user`, `warung`, `origin`, `origin_id`, `destination`, `destination_id`, `distance`, `delivery_fee`, `billing`, `total`, `method`, `bank_type`, `bank_account_number`, `pdf_url`, `status`, `date`) VALUES
('invoice60eab7ca42f6b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'EjlKYWxhbiBTdWthYmlydXMsIENpdGV1cmV1cCwgQmFuZHVuZywgV2VzdCBKYXZhLCBJbmRvbmVzaWEiLiosChQKEglXwE9wpeloLhEXdO7et4UW3xIUChIJG0JxZqbpaC4R_3Oh4-GkIFg', 0, 0, 6300, 6300, 'COD', NULL, NULL, NULL, 'Sudah diterima', '2021-07-11 16:20:10'),
('invoice60eab7ee4716b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Sukabirus Residence, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJp_aztKXpaC4RR7tcT6Ch85Q', 0.4, 1000, 6300, 7300, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-07-11 16:20:46');

--
-- Triggers `invoices`
--
DELIMITER $$
CREATE TRIGGER `after_transfer` AFTER UPDATE ON `invoices` FOR EACH ROW BEGIN
      IF (OLD.method = 'Transfer' AND NEW.status = 'Sudah diterima') THEN
      		INSERT INTO transfer
            SET total = OLD.billing,
            username = OLD.warung,
            date = now();
      END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` varchar(255) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `item`, `quantity`, `price`) VALUES
('invoice60eab7ca42f6b', 34, 1, 6300),
('invoice60eab7ee4716b', 34, 1, 6300);

--
-- Triggers `invoice_details`
--
DELIMITER $$
CREATE TRIGGER `after_buy_products` AFTER INSERT ON `invoice_details` FOR EACH ROW BEGIN
	UPDATE items
    SET items.stock = items.stock-NEW.quantity
    WHERE items.id = NEW.item;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `photo` text NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0,
  `discount` int(11) DEFAULT 0,
  `is_week_sale` int(11) NOT NULL DEFAULT 0,
  `date_week_sale` date DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `username`, `name`, `category`, `stock`, `price`, `description`, `photo`, `hide`, `discount`, `is_week_sale`, `date_week_sale`, `date`) VALUES
(26, 'gallery', 'Indomie Rendang', 2, 14, 3000, '<p>Mie Instan</p>\r\n', '86b9efb592a7b11d8cb18008e50d4e5f.jpg', 0, 2, 1, '2021-07-01', '2021-05-05 06:40:43'),
(27, 'alaw', 'KOBE Mi Bon Cabe', 2, 5, 6299, 'Mi Boncabe merupakan mie instan kenyal yang dipadukan dengan pedas sedapnya Boncabe, sehingga menjadi kombinasi mantap bagi Anda pecinta sensasi makan mie pedas yang HQQ. Kelebihan Mi Boncabe dengan produk Mie pedas lainnya adalah kepingan mie-nya sendiri sudah mengandung Boncabe. Mi Boncabe kepingan mie-nya tidak berwarna kuning, melainkan agak kemerahan karena kandungan Boncabe-nya. Selain itu, Mie goreng Boncahe ini juga bisa dimakan polos tanpa bumbu pun sudah ada sensasi khas Boncabe-nya.', 'e8d3b958968612f43a649380e5ba3be1.jpg', 0, 0, 1, NULL, '2021-05-06 08:52:36'),
(28, 'waruh', 'nasi merah', 2, 1, 30000, '<p>harga kiloan ya gan</p>\r\n', '28797ed3a9d43bc8664b4c65b26ee842.jpg', 0, 0, 0, NULL, '2021-07-08 17:31:33'),
(29, 'gallery', 'Vixal 500 ml', 7, 100, 13927, '<p>Vixal pembersih porselen merupakan cairan pembersih porselen yang diformulasikan secara khusus agar mampu menghilangkan segala noda.</p>\r\n', '5853a7da76945a072cbf8bebff39c512.jpeg', 0, 0, 0, NULL, '2021-07-11 05:34:50'),
(30, 'gallery', 'Biore White Scrub 450 ml', 8, 50, 27500, '<p>Biore body foam white scrub merupakan body foam yang diformulasi dengan paduan Brightening Beads, Vitamin E dan geen Tea Extract untuk mengangkat sel kulit mati dan kusam</p>\r\n', 'be2aefdfe332c303d0b43fdadda3a3bb.jpeg', 0, 0, 0, NULL, '2021-07-11 05:39:30'),
(31, 'gallery', 'Downy 720 ml', 3, 60, 33898, '<p>Downy Anti Bacterial Refill Pewangi Pakaian adalah larutan pelembut dan pewangi pakaian dengan kandungan kapsul mikro-parfum yang diformulasi membuat pakaian tetap lembut bahkan setelah kering dan dapat melepaskan wangi parfum secara perlahan, membuat Anda selalu wangi sepanjang hari seperti menggunakan parfum meskipun sedang berkeringat.</p>\r\n', 'ff9a4cb32db473e6cfa57cbc0fdadef9.jpeg', 0, 0, 0, NULL, '2021-07-11 05:49:07'),
(32, 'gallery', 'Beras Tawon 5 Kg', 1, 45, 62000, '<p>Beras super poles yg punel, putih, wangi dan tanpa bahan pengawet tambahan.</p>\r\n', '1edd3089549ec83e1a7493e847845a42.jpeg', 0, 0, 0, NULL, '2021-07-11 05:51:11'),
(33, 'gallery', 'Coca Cola 1500 ml', 9, 50, 10788, '<p>Minuman berkarbonasi rasa kola cocok diminum untuk menemani aktifitas anda sehari hari</p>\r\n', '8b6b9b7508f29eb456578d109e6a9bcd.jpeg', 0, 0, 0, NULL, '2021-07-11 05:52:37'),
(34, 'rajawali', 'Gayung Plastik Diameter 16 cm', 8, 67, 6300, '<p>Gayung merk Lion star dgn warna berbeda.</p>\r\n', '72c190df6c408f1084f3d8dc6da02737.jpeg', 0, 0, 0, NULL, '2021-07-11 05:57:44'),
(35, 'busari', 'Lifebuoy Sabun Cair 900 ml', 8, 79, 37500, '<p>Lifebuoy adalah sabun mandi keluarga yang di keluarkan oleh Unilever di Indonesia sejak 80 tahun yang lalu.</p>\r\n', '19610adbe4c997fc53643899aa59408b.jpeg', 0, 0, 0, NULL, '2021-07-11 06:00:14'),
(36, 'busari', 'Porstex Ungu Botol 500 ml', 7, 75, 10200, '<p>Porstex Pembersih Keramik Ungu Botol 500 Ml adalah cairan pembersih lantai dan mengandung Antibakteri. Digunakan untuk berbagai macam lantai ruangan, rumah, kantor dan lainnya.</p>\r\n', 'e6fcd64c101f4b9c1608d810937f3fd4.jpeg', 0, 0, 0, NULL, '2021-07-11 06:01:54'),
(37, 'busari', 'Rinso Molto Cair Botol 1L', 3, 45, 29900, '<p>Kini hadir dengan teknologi SmartFoam, busa lebih cepat hilang saat membilas, menghemat hingga setengah air bilasan. Dengan formulasi anti noda, cepat menghilangkan noda membandel hanya dengan 1X kucek! Memberikan keharuman memikat Violet dan Raspberry yang tahan hingga 21 hari.</p>\r\n', '5ef29e7c852ac7a14ff46f4f74fefa1d.jpeg', 0, 0, 0, NULL, '2021-07-11 06:04:57'),
(38, 'busari', 'Indomie Kari Ayam', 2, 100, 2496, '<p>Indomie Kari Ayam Nikmat dan Lezat Mie merupakan sebuah jenis makanan yang nikmat dan lezat.</p>\r\n', '98a62272fca29beba9ac0298fe1e0421.jpeg', 0, 0, 0, NULL, '2021-07-11 06:06:48'),
(39, 'busari', 'Beras Pelikan 5 Kg', 1, 35, 64000, '<p>Beras poles super premium</p>\r\n', 'ed67ad0b8ed26082601b697911102e1f.jpeg', 0, 0, 0, NULL, '2021-07-11 06:09:03'),
(40, 'busari', 'Fanta 1,5L', 9, 50, 10900, '<p>Kesegaran minuman ini akan membuat siapa saja yang meminumnya bersemangat menjalani setiap hari yang dijalani dengan hebat.</p>\r\n', '96a16feb3815c467847eb79a3d444e13.jpeg', 0, 0, 0, NULL, '2021-07-11 06:11:33'),
(41, 'rezeki', 'Sabun Dove 400 ML', 8, 50, 35000, '<p>Dove Deeply Nourishing dengan Natrium Moisture dapat menutrisi dan melembabkan hingga ke dalam lapisan kulit lebih baik dari susu.</p>\r\n', 'f30f9176fc4110b7e1cb41390e260d64.jpeg', 0, 0, 0, NULL, '2021-07-11 06:18:32'),
(42, 'rezeki', 'Harpic 450 ml', 7, 30, 20500, '<p>Harpic&nbsp;merupakan cairan pembersih yang mengkobinasikan berbagai aroma yang menyegarkan dengan formula pembersih yang maksimal.</p>\r\n', '9d17d1fe60a13ac2baa48862ccf057c4.jpeg', 0, 0, 0, NULL, '2021-07-11 06:22:18'),
(43, 'rezeki', 'Vanish Cair 500 ml', 3, 40, 25600, '<p>Menghilangkan noda-noda yang membandel dan sulit dihilangkan dengan deterjen biasa Lembut di tangan, wangi dan tahan lama Tidak merusak warna pada pakaian berwarna Aman digunakan pada katun, sutra, wol, dan kain halus lainnya.</p>\r\n', '32cec27a3badcae3cc506678d631956d.jpeg', 0, 0, 0, NULL, '2021-07-11 06:24:24'),
(44, 'rezeki', 'Mie Sedaap Goreng 90 gr', 2, 100, 2800, '<p>Mie sedaap goreng favorit orang sekarang, dengan bumbu yang nendang dan isi mie nya banyak.</p>\r\n', '579c86eb77c262604b015fe55650c670.jpeg', 0, 0, 0, NULL, '2021-07-11 06:28:02'),
(45, 'rezeki', 'Indomie Goreng Mie Instant', 2, 100, 2850, '<p>Indomie Goreng</p>\r\n\r\n<p>Rasa: Mie Goreng</p>\r\n', 'e287ac24480461fa8764cb3ecb095f47.jpeg', 0, 0, 0, NULL, '2021-07-11 06:30:19'),
(46, 'rezeki', 'Beras Putri Biru 5 Kg', 1, 24, 60000, '<p>Beras cap PUTRI BIRU merupakan beras produksi PT.Sari Tani Indonesia yang kualitasnya paling top yang diperuntukkan untuk kalangan eksekutif dan masyarakat yang menghendaki beras yang berkualitas bagus tidak saja secara fisik tetapi juga menghasilkan nasi yang berkualitas super dengan rasa yang enak dan sangat pulen. Beras cap Putri Biru diproduksi dengan mesin modern dari bahan 100% beras jenis Membramo. Nasi yang dihasilkan dari beras ini sangat cocok untuk disajikan dengan masakan yang tidak terlalu berkuah, seperti ayam/bebek/ikan goreng,sate dan sejenisnya.</p>\r\n', 'e9d0a3141e21ef22a6cf80ecc9d7c500.jpeg', 0, 0, 0, NULL, '2021-07-11 06:32:40'),
(47, 'rezeki', 'Sprite 1,5 L', 9, 20, 10950, '<p>Sprite Pet Minuman Bersoda 1,5 L&nbsp;merupakan minuman soda rasa lime yang unik dalam setiap teguknya. Kemasan botol yang cocok dinikmati bersama teman dan keluarga.</p>\r\n', 'ef621a13e8ac10b0c51920489e8e91c5.jpeg', 0, 0, 0, NULL, '2021-07-11 06:34:40'),
(48, 'rezeki', 'Ultra Milk Coklat UHT 200 ml', 9, 25, 4500, '<p>Susu ultra milk UHT rasa coklat.</p>\r\n', '31d887d2c803898e451c5cbb8aa5c47c.jpeg', 0, 0, 0, NULL, '2021-07-11 06:37:41'),
(49, 'sejahtera', 'Ultra Milk Strawberry UHT 200 ml', 9, 20, 4900, '<p>Susu Ultra Milk UHT rasa strawberry.</p>\r\n', '76f5456bea3f66e3e8858869b4495930.jpeg', 0, 0, 0, NULL, '2021-07-11 06:43:16'),
(50, 'sejahtera', 'Ultra Milk Full Cream UHT 200 ml', 9, 30, 4000, '<p>Susu ultra milk UHT rasa full cream.</p>\r\n', 'f8311e423435a54d86eb0d2b86b72276.jpeg', 0, 0, 0, NULL, '2021-07-11 06:44:25'),
(51, 'sejahtera', 'Ultra Milk Taro UHT 200 ml', 9, 10, 5000, '<p>Susu ultra milk UHT rasa taro.</p>\r\n', 'c3e83b32cc729c64189a4d67403022d2.jpeg', 0, 0, 0, NULL, '2021-07-11 06:45:33'),
(52, 'sejahtera', 'Sabun Lux Cair 400 ml', 8, 20, 39900, '<p>Lux Body Wash Sakura merupakan sabun mandi dengan keharuman lembut bunga yang terinspirasi dari semerbak bunga Sakura yang dapat membuat kulit bersih dan cerah merona.</p>\r\n', '811410f88561b4a912160b02b7ccbe02.jpeg', 0, 10, 0, NULL, '2021-07-11 06:47:43'),
(53, 'sejahtera', 'Sabun Nuvo Cair 450 ml', 8, 29, 21000, '<p>Nuvo Liquid Soap merupakan sabun mandi cair yang ampuh dalam membunuh kuman dan melindungi keluarga secara optimal.</p>\r\n', 'b271af8ae2ff4e84484ab13b8714455d.jpeg', 0, 0, 0, NULL, '2021-07-11 06:49:59'),
(54, 'sejahtera', 'Sabun Dettol Cair 450 ml', 8, 20, 52000, '<p>Dettol Original Sabun Mandi Cair merupakan sabun cair anti bakteri untuk melindungi keluarga Anda dari kuman.</p>\r\n', 'b25968f0579f766ad2571a3c1e3199bf.jpeg', 0, 20, 0, NULL, '2021-07-11 06:51:24'),
(55, 'sejahtera', 'Mr. Muscle Axi Triguna 800 ml', 7, 20, 11000, '<p>Mr. Muscle AXI Triguna, pembersih lantai plus disinfektan, dapat digunakan untuk semua jenis lantai, menjadikan lantai berish kilap, wangi higienis. Dengan daya bersih extra kuat, mampu menghilangkan debu, kotoran dan noda minyak dengan mudah pada lantai sehingga membuat lantai bersih. Mengandung Benzalkonium Klorida, efektif membunuh kuman penyebab penyakit dan bau busuk sehingga cocok untuk membersihkan kamar mandi.</p>\r\n', '7773bcd88b6f2a30bc00454441b5b5f5.jpeg', 0, 0, 0, NULL, '2021-07-11 06:54:54'),
(56, 'sejahtera', 'Attack Violet Perfume 800 gr', 3, 15, 20900, '<p>Attack Plus Violet Aroma 800 gr adalah deterjen yang ramah lingkungan dan berkualitas. Mampu untuk menyuci pakaian hingga keseluruhan sehingga membuat pakaian menjadi lebih bersih, lembut dan mudah untuk disetrika. Sabun cuci pakaian dengan aroma violet yang tahan sampai seharian dan memberikan kesan manis disetiap aromanya.</p>\r\n', '5e13d1d23b5e1615423d0bf90aa58d67.jpeg', 0, 0, 0, NULL, '2021-07-11 06:57:14'),
(57, 'sejahtera', 'Indomie Ayam Bawang', 2, 50, 2800, '<p>Indomie kuah ayam bawang instant.</p>\r\n', 'a2fbc82f9f32dcc6418b04344be7429f.jpeg', 0, 0, 0, NULL, '2021-07-11 07:07:16'),
(58, 'sejahtera', 'Indomie Kaldu Ayam', 2, 50, 2800, '<p>Indomie kuah instant rasa kaldu ayam.</p>\r\n', '97ba9a4974c01467b20d16f8916e75fa.jpeg', 0, 0, 0, NULL, '2021-07-11 07:09:58'),
(59, 'sejahtera', 'Beras Rojolele 5 Kg', 1, 14, 64000, '<p>Kondisi beras: baru</p>\r\n\r\n<p>Warna beras: putih</p>\r\n\r\n<p>Bahan: beras panjang / ir64 / setra ramos / ramos setra</p>\r\n\r\n<p>Kategori: beras premium Berat: 5Kg</p>\r\n\r\n<p>Kemasan: plastik</p>\r\n', 'b753076df845b2dfe485a5601132b639.jpeg', 0, 20, 0, NULL, '2021-07-11 07:12:17'),
(60, 'busari', 'Super Pell Pembersih Lantai 280 ml', 7, 30, 4600, '<p>Pembersih lantai Berfungsi untuk membersihkan lantai agar terbebas kuman 99% ampuh membunuh kuman Memberikan wangi yang segar didalam rumah atau ruangan Anda.</p>\r\n', 'f72ff532810e75863ca6a681120cbfd1.jpeg', 0, 0, 0, NULL, '2021-07-11 07:19:15'),
(61, 'busari', 'Pepsodent Herbal 190 gr', 8, 15, 19200, '<p>Pepsodent Action 123 Pasta Gigi Herbal merupakan produk pasta gigi Pepsodent yang ampuh digunakan untuk melindungi dan menjaga kesehatan gigi. Daun Sirih dikenal sebagai anti kuman agar gigi dan mulut tetap sehat. Garam dikenal sebagai bahan alami yang bermanfaat bagi mulut. Jeruk Nipis dikenal dapat membantu memberikan rasa segar.</p>\r\n', 'fcccf68a1fb18632e739e5c0b6a4e47f.jpeg', 0, 0, 0, NULL, '2021-07-11 07:21:17'),
(62, 'busari', 'Supermi Ayam Bawang', 2, 20, 2500, '<p>Mi instant rasa ayam bawang.</p>\r\n', '44b9c54f12123067225a1b78a5cae03c.jpeg', 0, 0, 0, NULL, '2021-07-11 07:23:39'),
(63, 'busari', 'Sarimi Ayam Bawang', 2, 25, 1800, '<p>Mi instant rasa ayam bawang dari sarimi.</p>\r\n', '2f3940da1023d44dbad6e2bff332f8ae.jpeg', 0, 0, 0, NULL, '2021-07-11 07:25:32'),
(64, 'rezeki', 'Sabun Shinzui Cair 400 ml', 8, 15, 21500, '<p>Shinzui Skin Lightening Body Cleanser diperkaya dengan Herba Matsu Oil Japan yang membantu mengubah pigmen melanin penyebab warna kulit gelap menjadi leuko-melanin yang lebih cerah. Kulit tampak lebih putih dan lembab. Produk ini juga mengandung Sakura Flower Extract yang membantu proses regenerasi sel kulit sehingga kulit tidak kusam. Kulit tampak bening dan kenyal. Perpaduan Herba Matsu Oil Japan dan Sakura Flower Extract merawat kulit tubuh agar tampak lebih cerah dan menjaga kelembaban alami kulit.</p>\r\n', '663ac901c2f20616b15709eb14038df1.jpeg', 0, 0, 0, NULL, '2021-07-11 07:28:31'),
(65, 'rezeki', 'so Klin Lantai Sereh 780 ml', 7, 15, 11200, '<p>so Klin Lantai sereh. Pembersih lantai wangi.</p>\r\n', 'fae785a834db00614ed3240eb3ee9824.jpeg', 0, 0, 0, NULL, '2021-07-11 07:31:44'),
(66, 'rezeki', 'so Klin Lantai Orange Sparkle 780 ml', 7, 20, 11200, '<p>so Klin Lantai orange sparkle. Pembersih Lantai wangi.</p>\r\n', '40f35caad748fcf70ef5abccf1ecd67d.jpeg', 0, 0, 0, NULL, '2021-07-11 07:33:35'),
(67, 'rezeki', 'Close Up Pasta Gigi 110 gr', 8, 20, 11500, '<p>Closeup Odol Pasta Gigi Green menjadikan nafas lebih segar hingga 12 jam. Dengan Active Zinc Mouthwash, Crsytal Micro Shine dan Fluoride mampu melawan kuman penyebab bau mulut hingga 99%, membantu gigi tampak lebih putih, serta gigi tetap kuat.</p>\r\n', '34a9f23da0fab2ac33670a900a7c532e.jpeg', 0, 0, 0, NULL, '2021-07-11 07:36:22'),
(68, 'sejahtera', 'so Klin Lantai Marine Mint 780 ml', 7, 20, 11500, '<p>so Klin Lantai marine mint. Pembersih lantai wangi.</p>\r\n', '7d5e8216c5d40623df7b4821c83838f1.jpeg', 0, 0, 0, NULL, '2021-07-11 07:40:19'),
(69, 'sejahtera', 'Daia Detergen + Softener Pink 850 gr', 3, 15, 19500, '<p>DAIA Deterjen + Softener [850 g] merupakan deterjen bubuk yang diformulasi ampuh untuk membersihkan pakaian dari kotoran serta membunuh kuman yang menempel pada pakaian saat dijemur hingga kering. Juga ampuh membunuh dan mencegah kuman penyebab bau apek pada pakaian.</p>\r\n', '8f3bbda9924d143888658396f62bde3f.jpeg', 0, 0, 0, NULL, '2021-07-11 07:42:19'),
(70, 'sejahtera', 'Mie Burung Dara 200 gr', 2, 25, 6500, '<p>Mie Burung Dara Mie Istimewa 200gr<br />\r\nKarena mie ini sangat enak dan kenyal, dan sangat menguntungkan untuk dijual kembali.</p>\r\n', 'd78dee21da0d1ef4d08ac0e02127621b.jpeg', 0, 0, 0, NULL, '2021-07-11 07:45:33'),
(71, 'sejahtera', 'Gulaku Tebu Kuning 1 kg', 1, 20, 15300, '<p>Dibuat dari Tebu Alami Gula Pasir dari Gulaku adalah salah satu gula bermerek pertama di Indonesia yang menyediakan gula berkualitas tinggi.&nbsp;</p>\r\n', 'cdfb69c08392ed5a5cf832144a58be16.jpeg', 0, 0, 0, NULL, '2021-07-11 07:48:50'),
(72, 'busari', 'Gula Pasir Rose Brand 1 Kg', 1, 24, 13000, '<p>Gula Kristal Putih Premium Rose Brand (Kemasan Hijau) 1 Kg adalah gula terbuat dari tebu pilihan berkualitas terbaik dan melalui proses penggilingan yang higienis, sehingga lulus standar kebersihan pangan. Beberapa tahap proses penyaringan menghasilkan warna gula alami. Gula Kristal Rose Brand mengandung fruktosa alami yang dapat memberikan rasa manis, sehingga dapat dijadikan sebagai pelengkap di setiap masakan atau minuman sesuai selera Anda.</p>\r\n', '6f591c52455d93b4e7a049491ba2542e.jpeg', 0, 0, 0, NULL, '2021-07-11 07:51:47'),
(73, 'busari', 'Gula Pasir Tropicana Slim 25 Sachet', 1, 20, 23500, '<p>Solusi Untuk Hidup Sehat dan Bebas Gula Pentingnya untuk menjaga kesehatan tubuh, tidak hanya olahraga yang teratur saja.</p>\r\n', 'ea1f4257f03f911bfb9f85d7807cd827.jpeg', 0, 0, 0, NULL, '2021-07-11 07:54:48'),
(74, 'busari', 'Sabun GIV Cair 450 ml', 8, 15, 46000, '<p>Sabun GIV&nbsp;merupakan sabun cair yang terbuat dari paduan mulberry dan collagen yang bermanfaat untuk kulit lebih terang, lebih elastis dan mampu melembabkan kulit. Sabun cair ini juga dikombinasikan dengan sempurna sehingga mampu memberikan perasaan sensasional serta melindungi dan melembabkan kulit. Dilengkapi dengan vita white kompleks spesial dan special natural ingredients yang mampu melembabkan dan melembutkan kulit.</p>\r\n', 'ca5cba568f7e5f6abb0fbde466905ffe.jpeg', 0, 0, 0, NULL, '2021-07-11 07:56:59'),
(75, 'busari', 'Minyak Goreng Bimoli 1 L', 1, 15, 15000, '<p>Minyak goreng yang terbuat dari biji kelapa sawit yang dapat menurunkan kolesterol LDL dan menaikkan kolesterol HDL. Bimoli dapat menjaga rasa makanan dan membuat makanan renyah. Mengandung:</p>\r\n\r\n<p>- Omega 9</p>\r\n\r\n<p>- Beta-karoten</p>\r\n\r\n<p>- Vitamin E</p>\r\n', '8a6280c445bbac1d70e9d9d0ae70b030.jpeg', 0, 5, 0, NULL, '2021-07-11 07:59:46'),
(76, 'rezeki', 'Minyak Goreng Filma 1 L', 1, 15, 15500, '<p>Minyak goreng dengan bahan klapasawit pilihan. Kemasan ekonomis 1liter, filma jernih... Yuk goreng goreng dengan minyak goreng filma</p>\r\n', '276c5ea7a183239f115fbe90dd16fb33.jpeg', 0, 0, 0, NULL, '2021-07-11 08:02:35'),
(77, 'rezeki', 'Minyak Goreng Sunco 1 L', 1, 20, 15200, '<p>&bull; Minyak goreng<br />\r\n&bull; Diproduksi dari buah kelapa sawit segar pilihan dan difortifikasi dengan vitamin A<br />\r\n&bull; Membantu mempertahankan keutuhan lapisan permukaan mukosa<br />\r\n&bull; Melalui 5x proses, yaitu 3x pemurnian dan 2x penyaringan, sehingga menghasilkan minyak goreng yang bening dan berkualitas<br />\r\n&bull; Berat bersih : 1000 mL</p>\r\n', '36cc72bd97522d0808ff8059d3a94fc6.jpeg', 0, 10, 0, NULL, '2021-07-11 08:04:15'),
(78, 'rezeki', 'Telur Ayam 1 Kg', 1, 150, 22500, '<p>Telur ayam negeri&nbsp;</p>\r\n', 'bbeba6bd83b3f043b40abf0384ab7504.jpeg', 0, 0, 0, NULL, '2021-07-11 08:07:21'),
(79, 'rezeki', 'Telur Ayam 1/2 Kg', 1, 150, 11250, '<p>Telur ayam negeri.</p>\r\n', '7b6e2ea17d513fa4821908dafc1a90ae.jpeg', 0, 0, 0, NULL, '2021-07-11 08:08:13'),
(80, 'rezeki', 'Telur Ayam 1/4 Kg', 1, 100, 6000, '<p>Telur ayam negeri.</p>\r\n', '4963fd491ea80be6f5835ea92c74940d.jpeg', 0, 0, 0, NULL, '2021-07-11 08:09:20'),
(81, 'sejahtera', 'Telur Ayam 1 Kg', 1, 150, 23000, '<p>Telur ayam negeri 1 kg.</p>\r\n', 'cb2e7e9f245c6a93429f1976e6deecce.jpeg', 0, 0, 0, NULL, '2021-07-11 08:11:22'),
(82, 'sejahtera', 'Telur Ayam 1/2 Kg', 1, 150, 12000, '<p>Telur ayam negeri 1/2 kg.</p>\r\n', '317db4ce67a25314d4f7839bda82f306.jpeg', 0, 0, 0, NULL, '2021-07-11 08:12:36'),
(83, 'sejahtera', 'Telur Ayam 1/4 Kg', 1, 100, 5700, '<p>Telur ayam negeri 1/4 kg.</p>\r\n', 'a49ea4791a0eb9aef0bd765474eeac12.jpeg', 0, 0, 0, NULL, '2021-07-11 08:13:14'),
(84, 'sejahtera', 'Minyak Goreng Tropical 1 L', 1, 30, 11000, '<p>Memasak dengan menggunakan minyak goreng sehat akan membantu Ibu menghadirkan hidangan lezat bernutrisi bagi keluarga.&nbsp;</p>\r\n', '971b5cc3cb15d150bb5461ec24806898.jpeg', 0, 0, 0, NULL, '2021-07-11 08:14:38'),
(85, 'busari', 'Telur Ayam 1 Kg', 1, 180, 22000, '<p>Telur ayam negeri 1 kg.</p>\r\n', '46c74ced93c11ea79afbeffa6c3c4fa4.jpeg', 0, 0, 0, NULL, '2021-07-11 08:16:15'),
(86, 'busari', 'Telur Ayam 1/2 Kg', 1, 150, 11000, '<p>Telur ayam negeri 1/2 kg.</p>\r\n', '9b3dd8324e2f562d60db0973a0e01dd7.jpeg', 0, 0, 0, NULL, '2021-07-11 08:16:49'),
(87, 'busari', 'Telur Ayam 1/4 Kg', 1, 100, 5500, '<p>Telur ayam negeri 1/4 kg.</p>\r\n', '94f3b8e9d5bcb5720581c30ee8004aec.jpeg', 0, 0, 0, NULL, '2021-07-11 08:17:24'),
(88, 'busari', 'Mi Telur Cap 3 Ayam', 2, 45, 4297, '<p>Mie telur keriting ini yang mempunyai keunggulan dengan tekstur yang baik. Terbuat dari bahan berkualitas tinggi dan halal.</p>\r\n', '63a930a40c339a6690a887b7cc86b3ba.jpeg', 0, 0, 0, NULL, '2021-07-11 08:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `username` varchar(255) NOT NULL,
  `item` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id_reviews` int(11) NOT NULL,
  `invoice_id` varchar(250) NOT NULL,
  `username` varchar(255) NOT NULL,
  `item` int(11) NOT NULL,
  `review` text NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id_reviews`, `invoice_id`, `username`, `item`, `review`, `rating`) VALUES
(13, 'invoice60eab5d27f53d', 'pipit', 72, 'Gulanya bagus dan manis', 5),
(14, 'invoice60eab7ee4716b', 'ocha', 34, 'gayungnya oke, mulus, no lecet, package kayu mantap', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` int(11) NOT NULL,
  `total` decimal(32,0) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bukti` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`id`, `total`, `username`, `status`, `date`, `bukti`) VALUES
(16, 9175, 'rajawali', 'Sudah ditransfer', '2021-07-07 10:44:46', '0a8904bd0476c1db539a355874373ca4.png'),
(17, 12399, 'rajawali', '', '2021-07-07 13:07:28', ''),
(18, 9175, 'rajawali', '', '2021-07-08 05:55:59', ''),
(19, 12399, 'rajawali', '', '2021-07-08 16:41:53', ''),
(20, 9175, 'rajawali', '', '2021-07-08 16:47:52', ''),
(21, 9175, 'rajawali', '', '2021-07-09 06:55:31', ''),
(22, 9175, 'rajawali', '', '2021-07-09 13:32:36', ''),
(23, 12399, 'rajawali', '', '2021-07-10 09:35:30', ''),
(24, 13000, 'busari', '', '2021-07-11 09:14:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `is_aktif_cust` int(11) DEFAULT 1,
  `alasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `username`, `password`, `phone`, `email`, `role`, `photo`, `is_aktif_cust`, `alasan`) VALUES
('Ulalalalala', 'abcd', 'e2fc714c4727ee9395f324cd2e7f331f', '08123', 'a@b.c', 0, NULL, 1, ''),
('admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '08111111', 'admin@smartwarung.com', 99, NULL, 1, ''),
('Toko Alaw', 'alaw', 'e2fc714c4727ee9395f324cd2e7f331f', '08123345665', 'alaw@gmail.com', 1, '851e30aef96292cb123a3efab99f19a4.png', 1, ''),
('Warung Bu Sari', 'busari', 'e2fc714c4727ee9395f324cd2e7f331f', '08122334455', 'warungbusari@gmail.com', 1, '83ace84b375bb5018677d2350d79d722.png', 1, ''),
('Gallery', 'gallery', 'e2fc714c4727ee9395f324cd2e7f331f', '123', '1@s.c', 1, '7d6019698936a373c869ee6de7ed275e.jpg', 1, ''),
('Warung Ibu Ika', 'ibuika', 'e2fc714c4727ee9395f324cd2e7f331f', '086532515211', 'warungibuika@gmail.com', 1, '19747304c29bebbbdb059a5f877e07b2.jpg', 1, ''),
('Jumahid Habib', 'jumahid', '86dd55229128fd39981a8e19d2026386', '082137244805', 'jmhdoaoe@gmail.com', 0, NULL, 1, ''),
('Warung Kerabat', 'kerabat', 'e2fc714c4727ee9395f324cd2e7f331f', '0812', 'a@b.c', 1, '17cf68a4ff5b1c1f1fe2eb39373d3cfa.jpg', 1, ''),
('Oktrichavita Jassinda', 'ocha', '2ea4dce70aecd3a50945105a01aa2cba', '0812345678', 'oktrichavitajk@gmail.com', 0, NULL, 1, ''),
('Vita Jassinda', 'pipit', '5c40ee0ae05c339a9f8502d29a49541d', '08155069724', 'oktrichavitajk@gmail.com', 0, NULL, 1, ''),
('Rajawali', 'rajawali', 'e2fc714c4727ee9395f324cd2e7f331f', '0812', 'a@b.cd', 1, '2557a0a8a0e7856fe8b6c5f4908229c8.png', 1, ''),
('Warung Rezeki', 'rezeki', 'e2fc714c4727ee9395f324cd2e7f331f', '0822113366', 'warungrezeki@gmail.com', 1, '80506c85f99a853b76a2b47c62483d0d.jpeg', 1, ''),
('Warung Sejahtera', 'sejahtera', 'e2fc714c4727ee9395f324cd2e7f331f', '08123456789', 'warungsejahtera@gmail.com', 1, '6ba4d74c84747d63a18d8cdd5b4c3426.jpeg', 1, ''),
('sukapura', 'sukapura', 'e2fc714c4727ee9395f324cd2e7f331f', '08122222', 'adika@b.c', 1, '61f19a0afedc177bb403276b484e5a11.jpg', 1, ''),
('warung jauh', 'waruh', '81dc9bdb52d04dc20036dbd8313ed055', '12312312312312', 'apajaa@gmail.com', 1, '9cb9f89968549f060c7a6a3a1102b168.jpg', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `warungs`
--

CREATE TABLE `warungs` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `place_id` varchar(255) NOT NULL,
  `lat` varchar(255) NOT NULL,
  `lng` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` enum('Belum diverifikasi','Sudah diverifikasi','Verifikasi tidak disetujui','') NOT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `alasan` text DEFAULT NULL,
  `is_aktif` int(11) NOT NULL DEFAULT 0,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warungs`
--

INSERT INTO `warungs` (`id`, `username`, `place_id`, `lat`, `lng`, `address`, `status`, `ktp`, `alasan`, `is_aktif`, `updated_at`) VALUES
(10, 'kerabat', 'ChIJF6V9W1wo1i0RlY84avKFRIY', '-6.978006', '107.631006', 'Telkom University, Jalan Telekomunikasi Jl. Terusan Buah Batu, Sukapura, Bandung, West Java, Indonesia', 'Sudah diverifikasi', NULL, NULL, 1, '2020-04-01'),
(11, 'rajawali', 'ChIJhYoXcKXpaC4RtsIsukYN274', '-6.978006', '107.631006', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'Sudah diverifikasi', NULL, '', 1, '2021-04-15'),
(14, 'gallery', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', '-6.978006', '107.631006', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'Sudah diverifikasi', NULL, '', 1, '2020-04-20'),
(15, 'sukapura', 'ChIJQXjDl6zpaC4RuiyZXIf658I', '-6.9699811', '107.6289307', 'Sukapura, Bandung, West Java, Indonesia', 'Belum diverifikasi', NULL, '', 0, '2021-04-28'),
(18, 'alaw', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', '-6.972428900000001', '107.6341047', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'Sudah diverifikasi', '5f75462113c0904fb17f7e0bd9d21576.png', 'ini orang jail, Berisik, Sangat Mengganggu', 0, '2021-05-06'),
(19, 'ibuika', 'ChIJP8tCLpfmaC4RFk9fbCqNrvU', '-6.872345399999999', '107.5881284', 'Warung Ibu Ika, Jalan Picung, Sukarasa, Bandung City, West Java, Indonesia', 'Belum diverifikasi', '932a71465c0b848c1444f2dc70809bec.jpg', NULL, 0, NULL),
(20, 'waruh', 'EltKbC4gVGFtYW4gTG90dXMsIFJULjAxL1JXLjE1LCBDaWJhZGFrLCBLZWMuIFRhbmFoIFNlcmVhbCwgS290YSBCb2dvciwgSmF3YSBCYXJhdCwgSW5kb25lc2lhIi4qLAoUChIJMbQoJIHDaS4RE8YDZyZ2eZASFAoSCVnUKDSBw2kuETctrm-egU8q', '-6.543210200000001', '106.775597', 'Jl. Taman Lotus, RT.01/RW.15, Cibadak, Tanah Sereal, Bogor, West Java 16166, Indonesia', 'Sudah diverifikasi', 'cf41cdd708f19987128e356a043e2d51.jpg', NULL, 1, '2021-07-08'),
(21, 'busari', 'ChIJUcJXEGLk1y0R0fTl0ZnOhqo', '-7.389154899999999', '112.7321814', 'Jl. Puri Surya Jaya No.14, Demeling, Gedangan, Kabupaten Sidoarjo, Jawa Timur, Indonesia', 'Sudah diverifikasi', '48a321e62757e60ec7960cd9b401c9c9.jpeg', NULL, 1, '2021-07-11'),
(22, 'rezeki', 'ElhKbC4gUGFsZW0gUHV0cmkgSW5kYWgsIEtldGFqZW4sIEtlYy4gR2VkYW5nYW4sIEthYnVwYXRlbiBTaWRvYXJqbywgSmF3YSBUaW11ciwgSW5kb25lc2lhIi4qLAoUChIJDzRt-1_k1y0RZG8wSnZNWqASFAoSCcd3s_qK5NctEU_WO-_sc5yF', '-7.3871799', '112.7397565', 'Jalan Palem Putri Indah, Ketajen, Kabupaten Sidoarjo, Jawa Timur, Indonesia', 'Sudah diverifikasi', '7fccbd2f14715002b1368f496d10e0c4.jpeg', NULL, 1, '2021-07-11'),
(23, 'sejahtera', 'ElNKbC4gQXRoZW5hIFRpbXVyLCBLZXRhamVuLCBLZWMuIEdlZGFuZ2FuLCBLYWJ1cGF0ZW4gU2lkb2Fyam8sIEphd2EgVGltdXIsIEluZG9uZXNpYSIuKiwKFAoSCS_m5khh5NctEbnQkL__M8qtEhQKEgnHd7P6iuTXLRFP1jvv7HOchQ', '-7.394338599999999', '112.7342925', 'Jl. Athena Timur, Ketajen, Kabupaten Sidoarjo, Jawa Timur, Indonesia', 'Sudah diverifikasi', '3659f7a96ed36ca69591976589175921.png', NULL, 1, '2021-07-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alasan_penolakans`
--
ALTER TABLE `alasan_penolakans`
  ADD PRIMARY KEY (`id_tolak`);

--
-- Indexes for table `alasan_tolak_pesan`
--
ALTER TABLE `alasan_tolak_pesan`
  ADD PRIMARY KEY (`id_tolak_pesan`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id_bank_account`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD KEY `to_cart` (`id`),
  ADD KEY `to_items` (`item`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`,`warung`),
  ADD KEY `user_2` (`user`,`warung`),
  ADD KEY `warung` (`warung`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD KEY `id` (`id`,`item`),
  ADD KEY `invoice_details_ibfk_2` (`item`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `users_foods_fk1` (`username`);
ALTER TABLE `items` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD KEY `item` (`item`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id_reviews`),
  ADD KEY `username` (`username`),
  ADD KEY `item` (`item`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `warungs`
--
ALTER TABLE `warungs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_user` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alasan_penolakans`
--
ALTER TABLE `alasan_penolakans`
  MODIFY `id_tolak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alasan_tolak_pesan`
--
ALTER TABLE `alasan_tolak_pesan`
  MODIFY `id_tolak_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id_bank_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_reviews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `warungs`
--
ALTER TABLE `warungs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `to_cart` FOREIGN KEY (`id`) REFERENCES `carts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `to_items` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`warung`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FK_warungg` FOREIGN KEY (`username`) REFERENCES `warungs` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`item`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warungs`
--
ALTER TABLE `warungs`
  ADD CONSTRAINT `to_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
