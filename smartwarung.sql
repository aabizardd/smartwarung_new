-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2021 at 08:50 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartwarung`
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
(1, 'Rating warung kecil '),
(2, 'Banyak komentar barang tidak sesuai');

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
(24, 'Oktrichavita Jassinda', 'ocha', 'admin', 'asdasdas', 0, NULL, '4d6c36856d70ba140390d889aeda73ea.jpeg', 0, '2021-07-11 06:43:37'),
(25, 'Oktrichavita Jassinda', 'ocha', 'admin', 'asdasd', 0, NULL, '08ac0cca7ba159caeb2a6e3c0386fead.jpg', 0, '2021-07-11 06:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `config_email`
--

CREATE TABLE `config_email` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config_email`
--

INSERT INTO `config_email` (`id`, `email`, `password`) VALUES
(1, 'smartwarung11@gmail.com', 'Adm_Smrt12');

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
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user`, `warung`, `origin`, `origin_id`, `destination`, `destination_id`, `distance`, `delivery_fee`, `billing`, `total`, `method`, `bank_type`, `bank_account_number`, `pdf_url`, `status`, `date`) VALUES
('invoice60eab7ca42f6b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'EjlKYWxhbiBTdWthYmlydXMsIENpdGV1cmV1cCwgQmFuZHVuZywgV2VzdCBKYXZhLCBJbmRvbmVzaWEiLiosChQKEglXwE9wpeloLhEXdO7et4UW3xIUChIJG0JxZqbpaC4R_3Oh4-GkIFg', 0, 0, 6300, 6300, 'COD', NULL, NULL, NULL, 'Sedang dikirim', '2021-07-11 09:20:10'),
('invoice60eab7ee4716b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Sukabirus Residence, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJp_aztKXpaC4RR7tcT6Ch85Q', 0.4, 1000, 6300, 7300, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-08-12 09:20:46');

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
(27, 'alaw', 'KOBE Mi Bon Cabe', 2, 5, 6299, 'Mi Boncabe merupakan mie instan kenyal yang dipadukan dengan pedas sedapnya Boncabe, sehingga menjadi kombinasi mantap bagi Anda pecinta sensasi makan mie pedas yang HQQ. Kelebihan Mi Boncabe dengan produk Mie pedas lainnya adalah kepingan mie-nya sendiri sudah mengandung Boncabe. Mi Boncabe kepingan mie-nya tidak berwarna kuning, melainkan agak kemerahan karena kandungan Boncabe-nya. Selain itu, Mie goreng Boncahe ini juga bisa dimakan polos tanpa bumbu pun sudah ada sensasi khas Boncabe-nya.', 'e8d3b958968612f43a649380e5ba3be1.jpg', 0, 0, 1, NULL, '2021-05-06 08:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_aktifasi_akun`
--

CREATE TABLE `pengajuan_aktifasi_akun` (
  `id_pengajuan` int(11) NOT NULL,
  `nama_lengkap` varchar(250) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `no_hp` varchar(250) NOT NULL,
  `kendala` text NOT NULL,
  `bukti` varchar(250) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengajuan_aktifasi_akun`
--

INSERT INTO `pengajuan_aktifasi_akun` (`id_pengajuan`, `nama_lengkap`, `username`, `email`, `no_hp`, `kendala`, `bukti`, `status`) VALUES
(1, 'Mang Asep Odah', 'rajawali', 'yenny@gmail.com', '081386278822', 'ada dana yang ingin belum ditarik', '6108af07d19c2.png', 0),
(2, 'Jali Rojali', 'waruh', 'ocha@gmail.com', '08127362899', 'ada pemesanan yang belum selesai', '6108af7aa6709.png', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `review_warung`
--

CREATE TABLE `review_warung` (
  `id_review` int(11) NOT NULL,
  `sender_name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `to_whom` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0,
  `id_reply` int(11) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review_warung`
--

INSERT INTO `review_warung` (`id_review`, `sender_name`, `username`, `to_whom`, `message`, `type`, `id_reply`, `foto`, `rating`, `date`) VALUES
(1, 'Oktrichavita Jassinda', 'ocha', 'waruh', 'asd', 0, NULL, '9bfb5b0e321451ff6637ba75d37d99c6.png', 5, '2021-08-03 06:40:25'),
(5, 'Oktrichavita Jassinda', 'ocha', 'waruh', 'aa', 0, NULL, 'ce31160cf98c772f47b1196639f7e8d1.png', 5, '2021-08-03 06:48:08');

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
(16, '9175', 'rajawali', 'Sudah ditransfer', '2021-07-07 10:44:46', '0a8904bd0476c1db539a355874373ca4.png'),
(17, '12399', 'rajawali', '', '2021-07-07 13:07:28', ''),
(18, '9175', 'rajawali', '', '2021-07-08 05:55:59', ''),
(19, '12399', 'rajawali', '', '2021-07-08 16:41:53', ''),
(20, '9175', 'rajawali', '', '2021-07-08 16:47:52', ''),
(21, '9175', 'rajawali', '', '2021-07-09 06:55:31', ''),
(22, '9175', 'rajawali', '', '2021-07-09 13:32:36', ''),
(23, '12399', 'rajawali', '', '2021-07-10 09:35:30', ''),
(24, '13000', 'busari', '', '2021-07-11 09:14:00', '');

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
('Warung Ibu Ika', 'ibuika', 'e2fc714c4727ee9395f324cd2e7f331f', '086532515211', 'warungibuika@gmail.com', 1, '19747304c29bebbbdb059a5f877e07b2.jpg', 1, ''),
('Azhyra Rana Pinasthika', 'jira', 'd20c781e9483ebfeddbaf38eeb88fdf7', '081386397855', 'ani@gmail.com', 0, NULL, 1, ''),
('Jumahid Habib', 'jumahid', '86dd55229128fd39981a8e19d2026386', '082137244805', 'jmhdoaoe@gmail.com', 0, NULL, 1, ''),
('Oktrichavita Jassinda', 'ocha', '2ea4dce70aecd3a50945105a01aa2cba', '0812345678', 'm.abizard1123@gmail.com', 0, NULL, 1, ''),
('Vita Jassinda', 'pipit', '5c40ee0ae05c339a9f8502d29a49541d', '08155069724', 'oktrichavitajk@gmail.com', 0, NULL, 1, ''),
('Rajawali', 'rajawali', 'e2fc714c4727ee9395f324cd2e7f331f', '0812', 'a@b.cd', 1, '2557a0a8a0e7856fe8b6c5f4908229c8.png', 1, ''),
('sukapura', 'sukapura', 'e2fc714c4727ee9395f324cd2e7f331f', '08122222', 'adika@b.c', 1, '61f19a0afedc177bb403276b484e5a11.jpg', 1, ''),
('warung jauh', 'waruh', 'e2fc714c4727ee9395f324cd2e7f331f', '12312312312312', 'm.abizard1123@gmail.com', 1, '9cb9f89968549f060c7a6a3a1102b168.jpg', 1, '');

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
(14, 'rajawali', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', '-6.978006', '107.631006', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'Sudah diverifikasi', NULL, '', 1, '2020-04-20'),
(15, 'sukapura', 'ChIJQXjDl6zpaC4RuiyZXIf658I', '-6.9699811', '107.6289307', 'Sukapura, Bandung, West Java, Indonesia', 'Belum diverifikasi', NULL, '', 0, '2021-04-28'),
(18, 'alaw', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', '-6.972428900000001', '107.6341047', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'Sudah diverifikasi', '5f75462113c0904fb17f7e0bd9d21576.png', 'ini orang jail, Berisik, Sangat Mengganggu', 0, '2021-05-06'),
(19, 'ibuika', 'ChIJP8tCLpfmaC4RFk9fbCqNrvU', '-6.872345399999999', '107.5881284', 'Warung Ibu Ika, Jalan Picung, Sukarasa, Bandung City, West Java, Indonesia', 'Belum diverifikasi', '932a71465c0b848c1444f2dc70809bec.jpg', NULL, 0, NULL),
(20, 'waruh', 'EltKbC4gVGFtYW4gTG90dXMsIFJULjAxL1JXLjE1LCBDaWJhZGFrLCBLZWMuIFRhbmFoIFNlcmVhbCwgS290YSBCb2dvciwgSmF3YSBCYXJhdCwgSW5kb25lc2lhIi4qLAoUChIJMbQoJIHDaS4RE8YDZyZ2eZASFAoSCVnUKDSBw2kuETctrm-egU8q', '-6.543210200000001', '106.775597', 'Jl. Taman Lotus, RT.01/RW.15, Cibadak, Tanah Sereal, Bogor, West Java 16166, Indonesia', 'Sudah diverifikasi', 'cf41cdd708f19987128e356a043e2d51.jpg', 'Rating warung kecil , Banyak komentar barang tidak sesuai, ', 1, '2021-07-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alasan_penolakans`
--
ALTER TABLE `alasan_penolakans`
  ADD PRIMARY KEY (`id_tolak`);

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
-- Indexes for table `config_email`
--
ALTER TABLE `config_email`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pengajuan_aktifasi_akun`
--
ALTER TABLE `pengajuan_aktifasi_akun`
  ADD PRIMARY KEY (`id_pengajuan`);

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
-- Indexes for table `review_warung`
--
ALTER TABLE `review_warung`
  ADD PRIMARY KEY (`id_review`);

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
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `config_email`
--
ALTER TABLE `config_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `pengajuan_aktifasi_akun`
--
ALTER TABLE `pengajuan_aktifasi_akun`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_reviews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `review_warung`
--
ALTER TABLE `review_warung`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
