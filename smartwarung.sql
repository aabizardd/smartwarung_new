-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 06:50 AM
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
(2, 'Banyak komentar barang tidak sesuai'),
(3, 'Barang yang dikirim rusak'),
(4, 'warung mengirim barang kadaluarsa');

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
(4, 'Rajawalss', '1123123456', 'BCA', 'rajawali', '2021-03-14 06:53:32', '2021-08-03 07:40:34'),
(7, 'Gallery', '1234567890', 'BNI', 'gallery', '2021-05-04 05:24:52', '2021-08-03 07:39:54'),
(9, 'Alaw', '1122334455', 'BCA', 'alaw', '2021-05-06 08:10:02', '2021-08-03 07:40:15'),
(11, 'elit class', '808098987474', 'MANDIRI', 'elit', '2021-08-11 04:50:51', '2021-08-11 04:50:51'),
(12, 'Dhana', '08847547844', 'MANDIRI', 'Dhana', '2021-08-11 04:54:53', '2021-08-11 04:54:53');

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
('cart611555672837e', 'amin'),
('cart611557d89c6d6', 'bilqis'),
('cart6082c60ae3dab', 'ocha'),
('cart60eab361dbca7', 'pipit'),
('cart6112589c8eaf0', 'yenny');

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
('cart6082c60ae3dab', 91, 1),
('cart6112589c8eaf0', 97, 1);

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
(34, 'Amin lie', 'amin', 'admin', 'Bagaimana cara mengubah no handphone yang sudah didaftarkan', 0, NULL, '47333f8a301a829f1e7bff2157e01f48.JPG', 0, '2021-08-13 02:44:26'),
(36, 'Christine Yenny', 'yenny', 'admin', 'Bagaimana cara mengganti nama pada akun saya?', 0, NULL, '3d0c6d8a171e633632afa35bbeecf14a.JPG', 0, '2021-08-13 02:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `config_email`
--

CREATE TABLE `config_email` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `config_email`
--

INSERT INTO `config_email` (`id`, `email`, `password`) VALUES
(1, 'smartwarung11@gmail.com', 'c457247c4fdb87a4522c708162dcfb0ba413683e90dbc2a0594bb0c52ca1a1a7a7bd81e5b0693d23208cd20dd6649d7b825aa995aa1c592cc8c982cdaa2a2c45CpxpH/MsxyesOUBiXEjPwfscctiocLWKXgh7m/EDUYQ=');

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
  `method` enum('Transfer','COD','QRIS') NOT NULL,
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
('invoice60eab7ca42f6b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'EjlKYWxhbiBTdWthYmlydXMsIENpdGV1cmV1cCwgQmFuZHVuZywgV2VzdCBKYXZhLCBJbmRvbmVzaWEiLiosChQKEglXwE9wpeloLhEXdO7et4UW3xIUChIJG0JxZqbpaC4R_3Oh4-GkIFg', 0, 0, 6300, 6300, 'COD', NULL, NULL, NULL, 'Sudah diterima', '2021-07-11 09:20:10'),
('invoice60eab7ee4716b', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJhYoXcKXpaC4RtsIsukYN274', 'Sukabirus Residence, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJp_aztKXpaC4RR7tcT6Ch85Q', 0.4, 1000, 6300, 7300, 'Transfer', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-08-02 09:20:46'),
('invoice6109019e30986', 'ocha', 'alaw', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', 0, 0, 6299, 6299, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-08-03 08:43:10'),
('invoice6111fcca52513', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', 'Jalan Adhyaksa III No.3, Sukapura, Bandung, West Java, Indonesia', 'ChIJER85Qk3oaC4R6cj20X-UTrg', 1.5, 3750, 23000, 26750, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-07-28 04:12:58'),
('invoice6111ff243dfbe', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', 'Jalan Adhyaksa V No.3, Sukapura, Bandung, West Java, Indonesia', 'Ej5KYWxhbiBBZGh5YWtzYSBWIE5vLjMsIFN1a2FwdXJhLCBCYW5kdW5nLCBXZXN0IEphdmEsIEluZG9uZXNpYSJQEk4KNAoyCYeFCHtN6GguEYbo2owmBN_oGh4LEO7B7qEBGhQKEgm_-R6cRehoLhEAu45W68UAHAwQAyoUChIJ8WMFg1LoaC4RLOmxNTPbz78', 1.7, 4250, 10000, 14250, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-07-30 04:23:00'),
('invoice6111ff608bc1f', 'ocha', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', 'Jalan Adhyaksa Raya No.4, Kujangsari, Bandung City, West Java, Indonesia', 'ChIJD2gxkfDpaC4R1UbTX984eYQ', 2.1, 5250, 76000, 81250, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-08-10 04:24:00'),
('invoice611262d885db5', 'yenny', 'Dhana', 'Jalan Adhyaksa IV, Sukapura, Bandung, Jawa Barat, Indonesia', 'EktKbC4gQWRoeWFrc2EgSVYsIFN1a2FwdXJhLCBLZWMuIERheWV1aGtvbG90LCBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnvX-ljTehoLhEjdDMGgIPk_BIUChIJQXjDl6zpaC4RuiyZXIf658I', 'Jalan Adhyaksa III No.22, Sukapura, Bandung, Jawa Barat, Indonesia', 'ChIJDbbavDTpaC4RhtrqD4OhRFs', 0.1, 250, 18000, 18250, 'COD', NULL, NULL, NULL, 'Sudah diterima dan diulas', '2021-08-10 11:28:24'),
('invoice611268a48e49e', 'yenny', 'Dhana', 'Jalan Adhyaksa IV, Sukapura, Bandung, Jawa Barat, Indonesia', 'EktKbC4gQWRoeWFrc2EgSVYsIFN1a2FwdXJhLCBLZWMuIERheWV1aGtvbG90LCBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnvX-ljTehoLhEjdDMGgIPk_BIUChIJQXjDl6zpaC4RuiyZXIf658I', 'Jalan Adhyaksa 5, Sukapura, Bandung, Jawa Barat, Indonesia', 'EjpKYWxhbiBBZGh5YWtzYSA1LCBTdWthcHVyYSwgQmFuZHVuZywgSmF3YSBCYXJhdCwgSW5kb25lc2lhIi4qLAoUChIJ8WMFg1LoaC4RLOmxNTPbz78SFAoSCUF4w5es6WguEbosmVyH-ufC', 0.2, 500, 13000, 13500, 'Transfer', NULL, NULL, 'https://app.sandbox.midtrans.com/snap/v1/transactions/7270cd43-1ec1-41df-8bff-dddb9299d6e4/pdf', '201', '2021-08-10 11:53:37'),
('invoice61153ee1c51d4', 'ocha', 'Dhana', 'Jalan Adhyaksa IV, Sukapura, Bandung, Jawa Barat, Indonesia', 'EktKbC4gQWRoeWFrc2EgSVYsIFN1a2FwdXJhLCBLZWMuIERheWV1aGtvbG90LCBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnvX-ljTehoLhEjdDMGgIPk_BIUChIJQXjDl6zpaC4RuiyZXIf658I', 'Jl. Adhyaksa I, Sukapura, Bandung, West Java, Indonesia', 'EjdKbC4gQWRoeWFrc2EgSSwgU3VrYXB1cmEsIEJhbmR1bmcsIFdlc3QgSmF2YSwgSW5kb25lc2lhIi4qLAoUChIJYSbWWU3oaC4RFkviJt4RUhISFAoSCUF4w5es6WguEbosmVyH-ufC', 0.2, 500, 11700, 12200, 'Transfer', 'bca', '24677373366', 'https://app.sandbox.midtrans.com/snap/v1/transactions/cba30d9a-d72f-4db3-b590-57100f7b8c7a/pdf', 'Sedang dikirim', '2021-08-12 15:32:20'),
('invoice6115558125235', 'amin', 'Dhana', 'Jalan Adhyaksa IV, Sukapura, Bandung, Jawa Barat, Indonesia', 'EktKbC4gQWRoeWFrc2EgSVYsIFN1a2FwdXJhLCBLZWMuIERheWV1aGtvbG90LCBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnvX-ljTehoLhEjdDMGgIPk_BIUChIJQXjDl6zpaC4RuiyZXIf658I', 'Jalan Adhyaksa Raya No.3, Cangkuang Kulon, Bandung City, West Java, Indonesia', 'ChIJUURpfE3oaC4R3ZE0lyLfF8Q', 0.1, 250, 18000, 18250, 'Transfer', 'bca', '24677721762', 'https://app.sandbox.midtrans.com/snap/v1/transactions/da4cfe99-6550-4bf0-abe7-a4210e30f3ec/pdf', 'Sudah diterima dan diulas', '2021-08-12 17:08:33'),
('invoice611557f919d88', 'bilqis', 'rajawali', 'D\' Gallery Futsal, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJ4XzVX6XpaC4RG0c8UhI-qnc', 'Masjid An-Nur Sukabirus, Jalan Sukabirus, Citeureup, Bandung, West Java, Indonesia', 'ChIJpfwzkqXpaC4RFWI6r6caiyE', 0.4, 1000, 12000, 13000, 'Transfer', 'bca', '24677147244', 'https://app.sandbox.midtrans.com/snap/v1/transactions/07dacea0-ac62-4c75-8e21-61d30945908f/pdf', 'Sudah diterima dan diulas', '2021-08-12 17:19:06'),
('invoice6115bd3e77d8a', 'yenny', 'alaw', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', 'Jl. Adhyaksa I, Sukapura, Bandung, West Java, Indonesia', 'EjdKbC4gQWRoeWFrc2EgSSwgU3VrYXB1cmEsIEJhbmR1bmcsIFdlc3QgSmF2YSwgSW5kb25lc2lhIi4qLAoUChIJYSbWWU3oaC4RFkviJt4RUhISFAoSCUF4w5es6WguEbosmVyH-ufC', 0.6, 1500, 6299, 7799, 'Transfer', 'bca', '24677439476', 'https://app.sandbox.midtrans.com/snap/v1/transactions/dbd32391-e36e-416b-b2fd-ad268d7dea42/pdf', 'Sudah diterima dan diulas', '2021-08-13 00:31:20'),
('invoice611685219399e', 'ocha', 'elit', 'Jalan Mengger Girang, Pasirluyu, Kecamatan Regol, Kota Bandung, Jawa Barat, Indonesia', 'Ek5KbC4gTWVuZ2dlciBHaXJhbmcsIFBhc2lybHV5dSwgS2VjLiBSZWdvbCwgS290YSBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnB2ytk8-hoLhFW3zXMs9AwnhIUChIJSWonsovoaC4R6ZdS8WthLc4', 'Jalan Mengger Girang, Pasirluyu, Kecamatan Regol, Kota Bandung, Jawa Barat, Indonesia', 'ElVKYWxhbiBNZW5nZ2VyIEdpcmFuZywgUGFzaXJsdXl1LCBLZWNhbWF0YW4gUmVnb2wsIEtvdGEgQmFuZHVuZywgSmF3YSBCYXJhdCwgSW5kb25lc2lhIi4qLAoUChIJwdsrZPPoaC4RVt81zLPQMJ4SFAoSCUlqJ7KL6GguEemXUvFrYS3O', 0, 0, 8000, 8000, 'Transfer', 'bca', '24677954622', 'https://app.sandbox.midtrans.com/snap/v1/transactions/6e2bc917-d1e0-4734-bbba-3b6f6dbe5b3c/pdf', '201', '2021-08-13 14:44:50');

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
('invoice6109019e30986', 27, 1, 6299),
('invoice611262d885db5', 97, 1, 18000),
('invoice611268a48e49e', 96, 10, 1300),
('invoice61153ee1c51d4', 96, 9, 1300),
('invoice6115558125235', 97, 1, 18000),
('invoice611557f919d88', 93, 1, 12000),
('invoice6115bd3e77d8a', 27, 1, 6299),
('invoice611685219399e', 99, 5, 1600);

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
(27, 'alaw', 'KOBE Mi Bon Cabe', 2, 48, 6299, 'Mi Boncabe merupakan mie instan kenyal yang dipadukan dengan pedas sedapnya Boncabe, sehingga menjadi kombinasi mantap bagi Anda pecinta sensasi makan mie pedas yang HQQ. Kelebihan Mi Boncabe dengan produk Mie pedas lainnya adalah kepingan mie-nya sendiri sudah mengandung Boncabe. Mi Boncabe kepingan mie-nya tidak berwarna kuning, melainkan agak kemerahan karena kandungan Boncabe-nya. Selain itu, Mie goreng Boncahe ini juga bisa dimakan polos tanpa bumbu pun sudah ada sensasi khas Boncabe-nya.', 'e8d3b958968612f43a649380e5ba3be1.jpg', 0, 0, 1, NULL, '2021-05-06 08:52:36'),
(91, 'rajawali', 'Telur', 1, 100, 1500, '<p>harga 1 butir</p>\r\n', '741933ab788f91035200d4f1c68fe58a.jpg', 0, 0, 0, NULL, '2021-08-10 10:19:32'),
(92, 'rajawali', 'Beras Haryana', 1, 20, 76000, '<p>1 kg</p>\r\n', '3213b260624c5b2cbb7d4bd643995284.jpg', 0, 0, 0, NULL, '2021-08-10 10:20:12'),
(93, 'rajawali', 'Gula Tebu', 1, 19, 12000, '<p>1 kg</p>\r\n', '8afc03c0d2824bca89f2074896ed1011.jpg', 0, 0, 0, NULL, '2021-08-10 10:22:26'),
(94, 'rajawali', 'Aqua Botol', 1, 50, 3000, '<p>600 ml</p>\r\n', '00d3de2c79755a7a26b01b1ef5b17286.jpg', 0, 0, 0, NULL, '2021-08-10 10:25:45'),
(95, 'rajawali', 'Galon Aqua', 1, 30, 20000, '<p>19 Liter&nbsp;</p>\r\n', 'c96fe40bf33b7b8439d755ba85711469.jpg', 0, 0, 0, NULL, '2021-08-10 10:26:44'),
(96, 'Dhana', 'Telur', 1, 41, 1300, '<p>harga 1 butir</p>\r\n', 'c9a36342b419a6f42e0ff6bd863184bc.jpg', 0, 0, 0, NULL, '2021-08-10 10:50:13'),
(97, 'Dhana', 'Galon Aqua', 1, 26, 18000, '<p>19 liter</p>\r\n', 'ec53e89285cd0bcdb94aa01b617c599d.jpg', 0, 0, 0, NULL, '2021-08-10 10:50:51'),
(99, 'elit', 'Telur', 1, 87, 1600, '<p>harga grosir</p>\r\n', 'a328cd18a8c5cdae53f8dfaf1f1125a5.jpg', 1, 0, 0, NULL, '2021-08-11 04:51:33'),
(100, 'sukapura', 'Amer', 9, 10, 76000, '<p>kadar alkohol 16%</p>\r\n', '19d9338db88de466e8d2f6cc9d0d8a10.jpg', 1, 0, 0, NULL, '2021-08-12 17:33:14'),
(101, 'sukapura', 'Soju', 9, 15, 65000, '<p>Soju dari korea</p>\r\n', '1355992fa4eba6ff53740875043be4ca.jpg', 1, 0, 0, NULL, '2021-08-12 17:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_aktifasi_akun`
--

CREATE TABLE `pengajuan_aktifasi_akun` (
  `id_pengajuan` int(11) NOT NULL,
  `nama_lengkap` varchar(250) CHARACTER SET latin1 NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
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
(3, 'Dian Lestari', 'waruh', 'waruh123@gmail.com', '081234567890', 'saya tidak bisa login karena akun saya di nonaktifkan', '61126a225a8e2.jpg', 1),
(4, 'Dicky', 'rajawali', 'a@b.cd', '081238767342', 'akun saya di nonaktifkan', '61135913ca58b.jpg', 1);

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
(19, 'invoice61125a7a82bbc', 'ocha', 91, 'harganya murah, sukaa', 5),
(20, 'invoice61125be10e4c4', 'ocha', 91, 'telurnya ga pecah pas ketika sampai', 4),
(21, 'invoice611262d885db5', 'yenny', 97, 'Barangnya murah dan sesuai ', 4),
(22, 'invoice61126d5c41cfd', 'ocha', 27, 'pengirimannya agak lama', 3),
(24, 'invoice6115558125235', 'amin', 97, 'pengirimannya agak lama', 3),
(25, 'invoice611557f919d88', 'bilqis', 93, 'barangnya sesuai', 4),
(26, 'invoice6115bd3e77d8a', 'yenny', 27, 'barangnya sesuai dengan gambar', 4);

-- --------------------------------------------------------

--
-- Table structure for table `review_warung`
--

CREATE TABLE `review_warung` (
  `id_review` int(11) NOT NULL,
  `sender_name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `to_whom` varchar(250) CHARACTER SET latin1 NOT NULL,
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
(6, 'Oktrichavita Jassinda', 'ocha', 'rajawali', 'saya sering belanja di sini, pengiriman barangnya cepat dan barangnya juga sesuai', 0, NULL, '2bcc12bce0ef57d7bcb5775007730bcb.JPG', 4, '2021-08-10 04:32:11'),
(7, 'Oktrichavita Jassinda', 'ocha', 'rajawali', 'bagus, barang yang dikirim sesuai', 0, NULL, 'bf070ad0071d8a9ce6a675deece33ad3.JPG', 5, '2021-08-10 04:32:50'),
(8, 'christine yenny', 'yenny', 'Dhana', 'pengirimannya lama', 0, NULL, '77246febed71bb958b414b3ac33444df.JPG', 4, '2021-08-12 17:14:15'),
(10, 'Billqisty', 'bilqis', 'rajawali', 'pengirimannya lumayan cepat dan barang sesuai ', 0, NULL, '4e2aaa8884871e15564364458ece366e.JPG', 4, '2021-08-12 17:23:53'),
(11, 'Oktrichavita Jassinda', 'ocha', 'alaw', 'pengirimannya lama ', 0, NULL, 'd53079cb00d573abba42ea7d1c861a29.JPG', 3, '2021-08-12 17:27:09'),
(12, 'Christine Yenny', 'yenny', 'alaw', 'warungnya cepat untuk pengiriman barang', 0, NULL, 'f8361f068926d955b8f4fdb0978d0adc.JPG', 4, '2021-08-13 00:34:05');

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
(20, '7300', 'rajawali', 'Sudah ditransfer', '2021-08-12 17:35:53', '7a24b1a1dfa137d0d854f68a6ec80d15.jpg'),
(25, '6299', 'alaw', 'Sudah ditransfer', '2021-08-12 17:37:39', 'ca104cff691322020fd92be243daff63.jpeg'),
(27, '18000', 'Dhana', 'Sudah ditransfer', '2021-08-13 00:23:46', '0a25966995def38906252f40aead429c.jpeg'),
(28, '12000', 'rajawali', 'Sudah ditransfer', '2021-08-13 00:24:05', '17a1cf495bb624a06e227f700a69157b.jpeg'),
(29, '6299', 'alaw', 'Sudah ditransfer', '2021-08-13 08:29:23', '2aa98cd20972d785768278660d989852.jpeg');

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
('admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '08111111', 'admin@smartwarung.com', 99, NULL, 1, ''),
('Toko Alaw', 'alaw', 'e2fc714c4727ee9395f324cd2e7f331f', '08123345665', 'alaw@gmail.com', 1, '851e30aef96292cb123a3efab99f19a4.png', 1, ''),
('Amin lie', 'amin', 'e2fc714c4727ee9395f324cd2e7f331f', '0825555577345', 'amin@gmail.com', 0, NULL, 1, ''),
('Billqisty', 'bilqis', 'e2fc714c4727ee9395f324cd2e7f331f', '0837537853834', 'bilqis@gmail.com', 0, NULL, 1, ''),
('warung dhana', 'Dhana', 'e2fc714c4727ee9395f324cd2e7f331f', '081234567891', 'm.abizard1123@gmail.com', 1, '523798383edf73d5b17dae06acb77347.jpg', 0, ''),
('warung elit', 'elit', 'e2fc714c4727ee9395f324cd2e7f331f', '0876423476527', 'elit@gmail.com', 1, 'de3b94971c615360e4886abf03d22c89.jpg', 99, ''),
('Shakilla FAR', 'fara', 'e2fc714c4727ee9395f324cd2e7f331f', '0868845467643', 'fara@gmail.com', 0, NULL, 1, ''),
('Warung Ibu Ika', 'ibuika', 'e2fc714c4727ee9395f324cd2e7f331f', '086532515211', 'warungibuika@gmail.com', 1, '19747304c29bebbbdb059a5f877e07b2.jpg', 99, ''),
('Azhyra Rana Pinasthika', 'jira', 'd20c781e9483ebfeddbaf38eeb88fdf7', '081386397855', 'ani@gmail.com', 0, NULL, 1, ''),
('warung marsel', 'marsel', 'e2fc714c4727ee9395f324cd2e7f331f', '08254347234', 'marsel@gmail.com', 1, 'f0505d084a78ef84b11304bd6b42393e.jpg', 1, ''),
('Oktrichavita Jassinda', 'ocha', '2ea4dce70aecd3a50945105a01aa2cba', '081234567867', 'ocha1123@gmail.com', 0, NULL, 1, ''),
('Vita Jassinda', 'pipit', '5c40ee0ae05c339a9f8502d29a49541d', '08155069724', 'oktrichavitajk@gmail.com', 0, NULL, 1, ''),
('Rajawali', 'rajawali', 'e2fc714c4727ee9395f324cd2e7f331f', '08124567678897', 'a@b.cd', 1, '2557a0a8a0e7856fe8b6c5f4908229c8.png', 1, ''),
('warung rara', 'rara', 'e2fc714c4727ee9395f324cd2e7f331f', '082345678191', 'rara123@gmail.com', 1, '9ad6d711f3975d06d1f341adc4468536.jpg', 1, ''),
('sukapura', 'sukapura', 'e2fc714c4727ee9395f324cd2e7f331f', '08122222235', 'adika@b.c', 1, '21decb76776de1d4d02147d6fd7523bc.jpg', 1, ''),
('warung jauh', 'waruh', 'e2fc714c4727ee9395f324cd2e7f331f', '081234567890', 'waruh123@gmail.com', 1, '9cb9f89968549f060c7a6a3a1102b168.jpg', 1, ''),
('Christine Yenny', 'yenny', 'e2fc714c4727ee9395f324cd2e7f331f', '082149638130', 'christin.yenny11@gmail.com', 0, NULL, 1, ''),
('Zara', 'zara', 'e2fc714c4727ee9395f324cd2e7f331f', '0822474654635', 'zara@gmail.com', 0, NULL, 0, '');

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
(15, 'sukapura', 'ChIJQXjDl6zpaC4RuiyZXIf658I', '-6.9699811', '107.6289307', 'Sukapura, Bandung, West Java, Indonesia', 'Sudah diverifikasi', NULL, '', 1, '2021-08-10'),
(18, 'alaw', 'ChIJTz8UzZTpaC4RQMvmtO2PRoY', '-6.972428900000001', '107.6341047', 'Toko Alaw, Sukapura, Bandung, West Java, Indonesia', 'Sudah diverifikasi', '5f75462113c0904fb17f7e0bd9d21576.png', '', 1, '2021-05-06'),
(19, 'ibuika', 'ChIJP8tCLpfmaC4RFk9fbCqNrvU', '-6.872345399999999', '107.5881284', 'Warung Ibu Ika, Jalan Picung, Sukarasa, Bandung City, West Java, Indonesia', 'Sudah diverifikasi', '932a71465c0b848c1444f2dc70809bec.jpg', '', 1, '2021-08-13'),
(20, 'waruh', 'EltKbC4gVGFtYW4gTG90dXMsIFJULjAxL1JXLjE1LCBDaWJhZGFrLCBLZWMuIFRhbmFoIFNlcmVhbCwgS290YSBCb2dvciwgSmF3YSBCYXJhdCwgSW5kb25lc2lhIi4qLAoUChIJMbQoJIHDaS4RE8YDZyZ2eZASFAoSCVnUKDSBw2kuETctrm-egU8q', '-6.543210200000001', '106.775597', 'Jl. Taman Lotus, RT.01/RW.15, Cibadak, Tanah Sereal, Bogor, West Java 16166, Indonesia', 'Sudah diverifikasi', 'cf41cdd708f19987128e356a043e2d51.jpg', 'Barang yang dikirim rusak, warung mengirim barang kadaluarsa, ', 1, '2021-07-08'),
(24, 'Dhana', 'EktKbC4gQWRoeWFrc2EgSVYsIFN1a2FwdXJhLCBLZWMuIERheWV1aGtvbG90LCBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnvX-ljTehoLhEjdDMGgIPk_BIUChIJQXjDl6zpaC4RuiyZXIf658I', '-6.9668705', '107.6340869', 'Jalan Adhyaksa IV, Sukapura, Bandung, Jawa Barat, Indonesia', 'Sudah diverifikasi', '2b2937641714c1efdd1130f4669556db.jpg', 'Email tidak valid, KTP tidak valid, ', 1, '2021-08-23'),
(25, 'rara', 'ChIJt7ep6czpaC4RRT_yEQVVQYU', '-6.971317699999998', '107.6353593', 'Babakan Ciamis IV, Jalan Babakan Ciamis, Sukapura, Bandung, Jawa Barat, Indonesia', 'Sudah diverifikasi', '36155f9f21e0fd53ae455a3674a2aa16.jpg', NULL, 1, '2021-08-13'),
(28, 'elit', 'Ek5KbC4gTWVuZ2dlciBHaXJhbmcsIFBhc2lybHV5dSwgS2VjLiBSZWdvbCwgS290YSBCYW5kdW5nLCBKYXdhIEJhcmF0LCBJbmRvbmVzaWEiLiosChQKEgnB2ytk8-hoLhFW3zXMs9AwnhIUChIJSWonsovoaC4R6ZdS8WthLc4', '-6.9509287', '107.6171148', 'Jalan Mengger Girang, Pasirluyu, Kecamatan Regol, Kota Bandung, Jawa Barat, Indonesia', 'Sudah diverifikasi', '33decfc6042ef57e0a5f33399fd44a70.jpg', '', 1, '2021-08-11'),
(29, 'marsel', 'Ek1KbC4gQWRoeWFrc2EgUmF5YSwgU3VrYXB1cmEsIEtlYy4gRGF5ZXVoa29sb3QsIEJhbmR1bmcsIEphd2EgQmFyYXQsIEluZG9uZXNpYSIuKiwKFAoSCVH4l-RM6GguEd7vMv7d5R5pEhQKEglBeMOXrOloLhG6LJlch_rnwg', '-6.966086799999999', '107.6353739', 'Jalan Adhyaksa Raya, Sukapura, Bandung City, West Java, Indonesia', 'Sudah diverifikasi', 'a642096acffd82ab357b9d281fe20cc4.jpg', '', 1, '2021-08-16');

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
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `FK_Ajuan` (`username`);

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
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `FK_Review_Warung` (`to_whom`);

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
  MODIFY `id_tolak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id_bank_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `config_email`
--
ALTER TABLE `config_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `pengajuan_aktifasi_akun`
--
ALTER TABLE `pengajuan_aktifasi_akun`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id_reviews` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `review_warung`
--
ALTER TABLE `review_warung`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `warungs`
--
ALTER TABLE `warungs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
-- Constraints for table `pengajuan_aktifasi_akun`
--
ALTER TABLE `pengajuan_aktifasi_akun`
  ADD CONSTRAINT `FK_Ajuan` FOREIGN KEY (`username`) REFERENCES `warungs` (`username`);

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
-- Constraints for table `review_warung`
--
ALTER TABLE `review_warung`
  ADD CONSTRAINT `FK_Review_Warung` FOREIGN KEY (`to_whom`) REFERENCES `warungs` (`username`);

--
-- Constraints for table `warungs`
--
ALTER TABLE `warungs`
  ADD CONSTRAINT `to_user` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
