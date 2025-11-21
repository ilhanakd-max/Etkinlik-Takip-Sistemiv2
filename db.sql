-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: sql211.infinityfree.com
-- Üretim Zamanı: 18 Kas 2025, 16:45:11
-- Sunucu sürümü: 11.4.7-MariaDB
-- PHP Sürümü: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `if0_40197167_cesmebld`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `full_name`, `email`, `is_active`, `created_at`) VALUES
(4, 'djmaster', '$2y$10$UW3E437tp9dsdtnfVycfBOAc7I6xDB5nGE4qI/u2LKtlIGJhIf4oe', 'İlhan Akdeniz', 'ilhanakd@gmail.com', 1, '2025-10-14 07:22:08'),
(2, 'admin', '$2y$10$7irqARE1EwYwptYm9UFoqOoijWNHAUnyv5VVFW6fEJ1EulNsLJaym', 'Yedek Admin', 'admin@cesme.bel.tr', 1, '2025-10-13 17:51:14'),
(3, 'test', '$2y$10$eHPtUF.xVJ7drGPwb0WaweWKMl.u4A2AxRn5d2OcBGcdVwL5FFA6a', 'Test Kullanıcı', '', 1, '2025-10-13 18:01:28'),
(5, 'azizburhan', '$2y$10$X8w6BynzTSlU3cUbM57nBeLv0R5jdwm8KvVECSMgSULnbpR8R9gpm', 'Aziz Burhan', '', 1, '2025-10-30 10:42:40'),
(6, 'deryaefdal', '$2y$10$/.Uc4dLa8KCWYHDyCyHfIuHFRAGdkjIbkJ1KHLjiPbropxeEhIjNS', 'Derya Efdal', 'derya.efdal@gmail.com', 1, '2025-10-30 12:32:15'),
(7, 'pınarkaplan', '$2y$10$YashLBZeO5EOCEMHnf4jSuSC3jrY8DQ.ueuKfq48xGhyoN7mxRAdW', 'Pınar Kaplan', 'pinarkaplann@gmail.com', 1, '2025-11-02 08:48:55'),
(8, 'ezgileblebicioğlu', '$2y$10$IVdrRp6/cIt9aNc6qVsxo.8baKqOFk/V/cHGMUEIp107mNnJgzyFG', 'Ezgi Leblebicioğlu', 'ezleblebici@gmail.com', 1, '2025-11-02 08:49:48'),
(9, 'aydındogruyol', '$2y$10$lIN.bESj2kbskDt4t00ND.9zr6gOqShA.QM8bt64JcdNuuTDshujy', 'Aydın Doğruyol', '', 1, '2025-11-02 08:51:26'),
(10, 'dilekkaraoğlu', '$2y$10$OrqCfU5kMtq8n1/zAJiVbeMcoJQzZE8w3nPC3UP6Cr6cs/X.TM2Dy', 'Dilek Karaoğlu', '', 1, '2025-11-02 09:05:43'),
(11, 'kilise', '$2y$10$ueQII73LG.2a2ph45oi.HuwCFsodkNmYOu60JbXF/4Ouj.UHyEyaK', 'Nilüfer Eriş', '', 1, '2025-11-02 09:09:23'),
(12, 'çeşmeamfi', '$2y$10$wxf8KwwDSGszmDhT0vvw6u0SZdr08zfyg70uRPpd887GrhRLbDgTG', 'Çeşme Amfi Açık Hava Tiyatrosu', '', 1, '2025-11-02 09:10:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `show_author` tinyint(1) DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `announcements`
--

INSERT INTO `announcements` (`id`, `content`, `admin_user_id`, `show_author`, `start_date`, `end_date`, `created_at`) VALUES
(7, 'İlhan beyin güncellemeleri ve Etkinliğe yönelik taleplerimiz çerçevesinde uygulama geliştirilmeye devam ediyor. Test olarak kullanıma açıldı. Aramıza yeni katılan Derya Efdal arkadaşımız, uygulama içerisine Çakabey, Kilise, Düğün Salonları etkinliklerini girmeye devam ediyor. Tüm testler bittikten sonra Aralık ayında bu program üzerinden sistemi kullanacağız. Diğer admin olacak arkadaşların kullanıcı adları alındı.\r\n\r\npınarkaplan\r\naydındoğruyol\r\nezgileblebicioğlu\r\ndilekkaraoğlu\r\n\r\n\r\n\r\nşifre: 12345', 5, 1, '2025-11-02 11:57:00', '2025-11-30 11:57:00', '2025-11-02 09:01:06'),
(8, 'Mevcut tüm program girilmiştir. Çakabey, Kilise, Düğün Salonu... Drive daki listeler aktarılmış olup, yedekli olarak tutulmaya devam edecektir. 1 Aralık itibarıyla bu uygulama aktif olarak kullanılacaktır.', 5, 1, '2025-11-06 11:09:00', '2025-11-30 11:09:00', '2025-11-06 08:10:04'),
(9, 'Raporlama bölümüne test amaçlı \"Excel Raporlama\" fonksiyonu eklendi.', 4, 1, '2025-11-09 02:01:00', '2025-11-13 02:01:00', '2025-11-08 23:01:57'),
(10, 'Yinelenen \"Resmi Tatiller\" otomatik hale getirildi, ilave resmi tatiller yöneticiler tarafından manuel eklenebilir.', 4, 1, '2025-11-09 23:21:00', '2025-11-13 23:21:00', '2025-11-09 20:21:14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `app_settings`
--

CREATE TABLE `app_settings` (
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `app_settings`
--

INSERT INTO `app_settings` (`setting_key`, `setting_value`, `updated_at`) VALUES
('maintenance_mode', '0', '2025-11-10 22:59:24');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `event_date` date NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_time` varchar(100) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('confirmed','option','cancelled','free') DEFAULT 'confirmed',
  `payment_status` enum('paid','not_paid','to_be_paid') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `events`
--

INSERT INTO `events` (`id`, `unit_id`, `event_date`, `event_name`, `event_time`, `contact_info`, `notes`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-01-10', 'Çocuk Tiyatrosu', '14:00-16:00', 'Ahmet Yılmaz - 0532 123 4567', 'Çocuklar için eğitici tiyatro oyunu', 'confirmed', 'paid', '2025-10-13 17:39:05', '2025-10-13 17:39:05'),
(2, 11, '2025-01-15', 'Düğün Organizasyonu', '18:00-23:00', 'Ayşe Demir - 0541 234 5678', 'Mehmet & Ayşe düğün töreni', 'confirmed', 'paid', '2025-10-13 17:39:05', '2025-10-16 17:42:36'),
(3, 3, '2025-01-20', 'Yaz Konseri', '20:00-22:00', 'Kültür Müdürlüğü - 0232 123 4567', 'Yerel sanatçılar konseri', 'confirmed', 'to_be_paid', '2025-10-13 17:39:05', '2025-10-15 21:34:18'),
(5, 5, '2025-02-01', 'Resim Sergisi', '10:00-18:00', 'Sanat Galerisi - 0533 345 6789', 'Yerel ressamlar sergisi', 'option', 'to_be_paid', '2025-10-13 17:39:05', '2025-10-13 17:39:05'),
(6, 6, '2025-02-05', 'Eğitim Semineri', '13:00-17:00', 'Eğitim Derneği - 0544 456 7890', 'Kişisel gelişim semineri', 'free', NULL, '2025-10-13 17:39:05', '2025-10-16 17:42:07'),
(22, 1, '2025-10-06', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro çalışması', 'Tam gün', '', 'Saat 15:00 da başlayacak', 'free', NULL, '2025-10-15 14:55:19', '2025-10-16 17:42:07'),
(21, 1, '2025-10-04', 'Alaçatı Ilıca kültür sanat derneği \'\'Masal Kabare\'\' oyunu', 'Tam gün', 'Serdar alaca tel: 5055899941', '', 'confirmed', 'paid', '2025-10-15 14:53:58', '2025-10-15 14:53:58'),
(20, 1, '2025-10-03', 'Alaçatı Ilıca kültür sanat derneği \'\'Masal Kabare oyunu', '14:00 - 17:00', 'iletişim Serdar alaca tel: 5055899941', 'Prova tüm gün', 'confirmed', 'paid', '2025-10-15 14:52:14', '2025-10-16 08:16:56'),
(23, 1, '2025-10-10', 'Dev-Sen Çeşme Şubesi kongre toplantısı', '14:00 - 17:00', 'İbrahim Tuz tel: 5326719836', '', 'free', NULL, '2025-10-15 15:37:49', '2025-10-16 17:42:07'),
(24, 1, '2025-10-13', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro çalışması', 'Tam gün', '', '', 'free', NULL, '2025-10-15 15:39:23', '2025-10-16 17:42:07'),
(25, 1, '2025-10-15', 'Spor müdürlüğü toplantısı', '10:00', '', '', 'free', NULL, '2025-10-15 15:41:09', '2025-10-16 17:42:07'),
(26, 1, '2025-10-15', 'İklim Değişikliği Müdürlüğü Seminer', '14.00 - 16.30', '', '', 'free', NULL, '2025-10-15 15:42:07', '2025-10-16 17:42:07'),
(27, 1, '2025-10-17', 'afet müdürlüğü yangın eğitimi seminer kesin', 'belli değil', '', '', 'free', NULL, '2025-10-15 16:19:10', '2025-10-16 17:42:07'),
(28, 1, '2025-10-18', 'Nasrettin Hoca Müzikali opsiyon iletişim', 'Belli değil', 'Volkan Özyurt iletişim 0546 930 5556', '', 'cancelled', NULL, '2025-10-15 17:17:22', '2025-10-16 17:42:15'),
(29, 1, '2025-10-20', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro çalışması', 'Tüm gün', '', '', 'free', NULL, '2025-10-15 17:28:58', '2025-10-16 17:42:07'),
(30, 3, '2025-10-01', 'Deneme etkinliği', '14:00 - 17:00', '05321234567', '', 'option', 'to_be_paid', '2025-10-15 17:34:53', '2025-10-15 17:34:53'),
(31, 11, '2025-10-01', 'Nikah Töreni', '19:00', '54544155454', 'Nikah masası ve sandalye düzeni sağlanacak.', 'confirmed', 'paid', '2025-10-16 08:00:37', '2025-10-16 10:30:32'),
(32, 11, '2025-10-02', 'deneme', '14:00 - 17:00', '4654545454', 'deneme test 123', 'option', 'to_be_paid', '2025-10-16 08:02:31', '2025-10-16 15:38:58'),
(33, 1, '2025-10-19', 'izmir Büyük Şehir Belediyesi \"Küçük Göz yaşı\" tiyatro oyunu', 'Tam gün', '', '20.00 prova  13.00 - 13.00 arası', 'cancelled', NULL, '2025-10-16 17:17:46', '2025-10-16 17:42:15'),
(34, 1, '2025-10-23', 'Kadın Aile müdürlüğü  meme kanseri farkındalık semineri', 'Belli değil', '', '', 'cancelled', NULL, '2025-10-17 06:53:18', '2025-10-23 06:35:33'),
(35, 1, '2025-10-25', 'Grand Fondo organizasyon', '16.00 - 19.00 arasında', '', '', 'cancelled', NULL, '2025-10-17 06:55:27', '2025-10-24 22:41:51'),
(36, 1, '2025-10-27', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro çalışması', 'Tam gün', '', '', 'free', NULL, '2025-10-17 06:56:42', '2025-10-17 06:56:42'),
(38, 1, '2025-10-30', 'Hacı Murat Lisesi 10 Kasım anma prova', '08:30', '', '', 'free', NULL, '2025-10-17 06:57:53', '2025-10-17 07:19:14'),
(39, 1, '2025-10-31', 'Hacı Murat Lisesi 10 Kasım anma prova', '08:30', '', '', 'free', NULL, '2025-10-17 06:58:26', '2025-10-17 07:18:58'),
(40, 7, '2025-10-17', 'Nikah Töreni', '15:00', 'Test İletişim', 'Test notu.', 'confirmed', 'paid', '2025-10-17 14:20:18', '2025-10-17 14:20:18'),
(47, 1, '2025-10-29', 'Film Gösterimi: \"Bir Cumhuriyet Şarkısı\"', '17.00', '', 'Çakabey Kültür Merkezi\r\nTiyatro Salonu\r\n\r\n29 Ekim de Sinema Gösterimi yapılacaktır. \r\n\r\nFilm: \"Bir Cumhuriyet Şarkısı\"\r\nYer: Çakabey Kültür Merkezi\r\nSaat: 17.00\r\n\r\nProjeksiyon ve Laptopun hazır olması hususunda gerekli çalışmayı yapalım. \r\n\r\n@İlhan', 'free', NULL, '2025-10-21 11:11:52', '2025-10-21 11:11:52'),
(48, 1, '2025-10-26', 'Çocuk tiyatrosu', '11:00 - 18:00', '', '', 'confirmed', 'paid', '2025-10-24 22:43:27', '2025-10-24 22:43:27'),
(49, 11, '2025-11-04', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'cancelled', NULL, '2025-10-30 12:46:28', '2025-11-04 05:28:47'),
(50, 11, '2025-11-11', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'cancelled', NULL, '2025-10-30 12:47:10', '2025-11-04 05:28:59'),
(51, 11, '2025-11-18', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'confirmed', '', '2025-10-30 12:47:39', '2025-10-30 13:04:26'),
(52, 11, '2025-11-25', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'confirmed', '', '2025-10-30 12:48:11', '2025-10-30 13:04:35'),
(53, 11, '2025-11-23', 'Düğün', '20.00', 'Hilal Yağcıoğlu 05546922586', '', 'confirmed', 'paid', '2025-10-30 12:49:00', '2025-10-30 12:52:04'),
(54, 11, '2025-12-02', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'confirmed', '', '2025-10-30 12:49:59', '2025-10-30 13:04:52'),
(55, 11, '2025-12-09', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Ekinci', 'confirmed', '', '2025-10-30 12:50:22', '2025-10-30 13:05:01'),
(56, 11, '2025-12-16', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Etkinliği', 'confirmed', '', '2025-10-30 12:50:53', '2025-10-30 13:05:07'),
(57, 11, '2025-12-23', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Etkinliği', 'confirmed', '', '2025-10-30 12:51:09', '2025-10-30 13:05:12'),
(58, 11, '2025-12-30', 'Yoga Etkinliği', '10.00', '', 'Çeşme Kent Konseyi Nermin Etkinliği', 'confirmed', '', '2025-10-30 12:51:27', '2025-10-30 13:05:18'),
(59, 11, '2025-12-06', 'Nişan', '20.00', 'Onur Biçer 05385137903', '', 'confirmed', 'paid', '2025-10-30 12:52:51', '2025-11-06 13:31:44'),
(60, 7, '2025-11-01', 'Kültür Yolu Festivali', '19.30', '', 'Türk Sanat Müziği Konseri', 'confirmed', '', '2025-10-30 12:58:07', '2025-10-30 12:59:02'),
(61, 7, '2025-11-02', 'Kültür Yolu Festivali', '19.30', '', 'Türk Halk Müziği Konseri', 'confirmed', '', '2025-10-30 12:58:55', '2025-10-30 12:58:55'),
(62, 7, '2025-11-03', 'Kültür Yolu Festivali Etkinlikleri', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:07:50', '2025-10-30 13:07:50'),
(63, 7, '2025-11-04', 'Kültür Yolu Festivali Etkinlikleri', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:08:11', '2025-10-30 13:08:11'),
(64, 7, '2025-11-05', 'Mehmet Culum Kitap İmza Günü', '14.30', '', '', 'confirmed', '', '2025-10-30 13:09:13', '2025-10-30 13:09:13'),
(65, 7, '2025-11-07', 'Çeşme Belediye Spor Atatürk Haftası Satranç Turnuvası', '09.00-00.00', '', '', 'option', '', '2025-10-30 13:09:56', '2025-11-04 13:12:42'),
(66, 7, '2025-11-08', 'Çeşme Belediye Spor Atatürk Haftası Satranç Turnuvası', '09.00-00.00', '', '', 'confirmed', '', '2025-10-30 13:10:21', '2025-10-31 14:03:58'),
(67, 7, '2025-11-09', 'Çeşme Belediye Spor Atatürk Haftası Satranç Turnuvası', '09.00-00.00', '', '', 'confirmed', '', '2025-10-30 13:10:29', '2025-10-31 14:04:02'),
(68, 7, '2025-11-23', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi Hazırlığı', '09.00-00.00', '', 'Hazırlık-Tüm Gün', 'confirmed', '', '2025-10-30 13:11:14', '2025-10-30 13:35:09'),
(69, 7, '2025-11-24', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi Hazırlığı', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:29:48', '2025-10-30 13:34:57'),
(70, 7, '2025-11-25', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Açılış- Tüm Gün', 'confirmed', '', '2025-10-30 13:30:04', '2025-10-30 13:34:31'),
(71, 7, '2025-11-26', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:30:26', '2025-10-30 13:34:15'),
(72, 7, '2025-11-27', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:30:37', '2025-10-30 13:34:10'),
(73, 7, '2025-11-28', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:30:55', '2025-10-30 13:34:05'),
(74, 7, '2025-11-29', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:31:13', '2025-10-30 13:33:59'),
(75, 7, '2025-11-30', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:31:23', '2025-10-30 13:33:53'),
(76, 7, '2025-12-01', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:31:42', '2025-10-30 13:33:44'),
(77, 7, '2025-12-02', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:31:51', '2025-10-30 13:33:40'),
(78, 7, '2025-12-03', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:32:00', '2025-10-30 13:33:36'),
(79, 7, '2025-12-04', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:32:09', '2025-10-30 13:33:31'),
(80, 7, '2025-12-05', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:32:18', '2025-10-30 13:33:26'),
(81, 7, '2025-12-06', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:32:30', '2025-10-30 13:33:21'),
(82, 7, '2025-12-07', 'Size Şapka Çıkartıyoruz 25 Kasım Kadına Yönelik Şiddetle Mücadele Günü Şapka Sergisi', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:32:52', '2025-10-30 13:33:11'),
(83, 1, '2025-11-03', 'Hacı Murat Lisesi 10 Kasım Anma Günü Provası ve Çeşme Belediyesi Tiyatro Çalışması', '13.00-16.00', '', '13.00-15.00 Arası Hacı Murat Lisesi Çalışması\r\n\r\n15.00-22.00 Kent Enstitüsü Tiyatro Çalışması', 'confirmed', '', '2025-10-30 13:37:59', '2025-10-30 13:54:27'),
(84, 1, '2025-11-04', 'Hacı Murat Lisesi 10 Kasım Anma Günü', '09.00-00.00', '', 'Prova-Tüm Gün', 'confirmed', '', '2025-10-30 13:39:58', '2025-10-30 13:39:58'),
(85, 1, '2025-11-05', 'Hacı Murat Lisesi 10 Kasım Anma Günü', '09.00-00.00', '', 'Prova-Tüm Gün', 'confirmed', '', '2025-10-30 13:40:29', '2025-10-30 13:40:44'),
(86, 1, '2025-11-06', 'Hacı Murat Lisesi 10 Kasım Anma Günü', '09.00-00.00', '', 'Prova-Tüm Gün', 'confirmed', '', '2025-10-30 13:41:00', '2025-10-30 13:41:00'),
(87, 1, '2025-11-07', 'Hacı Murat Lisesi 10 Kasım Anma Günü', '09.00-00.00', '', 'Prova-Tüm Gün', 'confirmed', '', '2025-10-30 13:41:14', '2025-10-30 13:41:14'),
(88, 1, '2025-11-09', 'İzmir Aşkına Mübadelede Aşk Oyunu', '20.00', '', '', 'confirmed', '', '2025-10-30 13:42:01', '2025-10-30 13:42:01'),
(89, 1, '2025-11-10', 'Hacı Murat Lisesi 10 Kasım', '09.00-00.00', '', 'Anma Töreni Günü', 'confirmed', '', '2025-10-30 13:42:54', '2025-11-05 13:58:13'),
(90, 1, '2025-11-11', 'İnsan Kaynakları Müdürlüğü Semineri', '09.00-00.00', '', '', 'confirmed', '', '2025-10-30 13:43:28', '2025-10-30 13:43:28'),
(91, 1, '2025-11-12', 'Yağmuru Sevmeyen Çocuk-Sıcakken Sanat', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:43:50', '2025-11-07 11:11:43'),
(92, 1, '2025-11-13', 'İzbb Ürkmez Çocukça Tiyatro', '13.00 ve 15.00', '', '2 seans', 'confirmed', '', '2025-10-30 13:43:59', '2025-11-04 12:31:28'),
(93, 1, '2025-11-14', 'Kamptaki Sürpriz-İzmir Sanat Etkinlikleri', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:44:08', '2025-11-05 14:16:29'),
(94, 1, '2025-11-15', 'Özel Kalem Müdürlüğü Toplantısı', '12.00-16.00', '', 'Gürkan Bey', 'confirmed', '', '2025-10-30 13:44:16', '2025-11-05 13:01:46'),
(95, 1, '2025-11-16', 'Gerçek Oyun-Sıcakken Sanat', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:44:25', '2025-11-05 14:17:07'),
(96, 1, '2025-11-17', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:45:10', '2025-10-30 13:45:10'),
(97, 1, '2025-11-24', '24 Kasım Öğretmenler Günü Programı Atatürk AL', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:45:35', '2025-11-05 08:20:26'),
(98, 1, '2025-11-21', '24 Kasım Öğretmenler Günü Ramazan Hoca\'nın Provası Atatürk AL', '09.00-00.00', '', '', 'confirmed', '', '2025-10-30 13:45:51', '2025-11-05 08:19:31'),
(99, 1, '2025-11-22', 'Minik\'in Oyuncakları-Maske Sanat', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:46:01', '2025-11-05 14:18:01'),
(100, 1, '2025-11-23', '24 Kasım Öğretmenler Günü Ramazan Hoca\'nın Provası Atatürk AL', '09.00-00.00', '', '', 'confirmed', '', '2025-10-30 13:46:09', '2025-11-05 08:20:06'),
(101, 1, '2025-11-28', 'Yetişkin Tiyatro Hizmet Temini', '20.30', '', 'getireceğimiz tiyatro', 'option', '', '2025-10-30 13:46:21', '2025-11-17 10:39:08'),
(102, 1, '2025-11-29', 'Şakacı Fırfır-Maske Sanat', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:46:28', '2025-11-05 14:19:33'),
(103, 1, '2025-11-30', 'Don Kişot-Maske Sanat', '12.00-15.00', '', '2 temsil ve halka ücretsiz', 'confirmed', '', '2025-10-30 13:46:35', '2025-11-05 14:20:07'),
(104, 1, '2025-12-01', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:47:04', '2025-10-30 13:47:04'),
(105, 1, '2025-12-05', 'Oyun', '09.00-00.00', '', 'Dünya Kadın Hakları Günü Kapsamında Bir Oyun Sergilenecek', 'option', '', '2025-10-30 13:47:17', '2025-11-03 06:03:42'),
(106, 1, '2025-12-06', 'Minik Bezelye-Çocuk Tiyatrosu', '12.00-15.00', '', '2 seans ve halka ücretsizdir', 'confirmed', '', '2025-10-30 13:47:28', '2025-11-06 06:54:43'),
(107, 1, '2025-12-07', 'Oyun', '09.00-00.00', '', '', 'option', '', '2025-10-30 13:47:34', '2025-10-30 13:47:34'),
(108, 1, '2025-12-08', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:47:54', '2025-10-30 13:47:59'),
(109, 1, '2025-12-12', 'Oyun', '09.00-00.00', '', 'Tüm Gün', 'option', '', '2025-10-30 13:48:20', '2025-10-30 13:48:20'),
(110, 1, '2025-12-13', 'Oyun', '09.00-00.00', '', 'Tüm Gün', 'option', '', '2025-10-30 13:48:37', '2025-10-30 13:48:37'),
(111, 1, '2025-12-14', 'Oyun', '09.00-00.00', '', 'Tüm Gün', 'option', '', '2025-10-30 13:48:45', '2025-10-30 13:48:45'),
(112, 1, '2025-12-19', 'Oyun', '09.00-00.00', '', 'Tüm Gün', 'option', '', '2025-10-30 13:49:00', '2025-10-30 13:49:00'),
(113, 1, '2025-12-20', 'Nazan Kesal Tiyatro Oyunu', '09.00-00.00', '', 'Yaralarım Aşktandır', 'confirmed', '', '2025-10-30 13:49:10', '2025-11-17 10:41:02'),
(114, 1, '2025-12-21', 'Oyun', '09.00-00.00', '', 'Tüm Gün', 'option', '', '2025-10-30 13:49:19', '2025-10-30 13:49:19'),
(115, 1, '2025-12-15', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:49:36', '2025-10-30 13:49:36'),
(116, 1, '2025-12-22', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:49:48', '2025-10-30 13:49:48'),
(117, 1, '2025-12-29', 'Çeşme Belediyesi Kent Enstitüsü Tiyatro Çalışması', '09.00-00.00', '', 'Tüm Gün', 'confirmed', '', '2025-10-30 13:50:06', '2025-10-30 13:50:06'),
(118, 1, '2025-12-25', 'İnsan Kaynakları ve Eğitim Müdürlüğü', '12.00-', '', 'Öğleden Sonra', 'confirmed', '', '2025-10-30 13:50:53', '2025-10-30 13:50:53'),
(119, 7, '2025-11-10', 'Atatürk Anma Günü', '09.00-00.00', '', 'Atatürk\'ün Sevdiği Şarkılar-Tüm Gün', 'confirmed', '', '2025-10-31 09:06:31', '2025-10-31 09:06:31'),
(120, 11, '2025-11-08', 'Nişan', '20.00', 'Raziye Yıldırım 05072809680', '', 'confirmed', 'paid', '2025-10-31 10:47:34', '2025-10-31 10:47:34'),
(122, 1, '2025-11-10', 'Çeşme Kent Enstitüsü Tiyatro Dersi', '13.00-22.00', '', '', 'option', '', '2025-11-03 06:06:17', '2025-11-03 06:06:17'),
(123, 1, '2026-01-11', 'Esnaf ve Sanatkarlar Odası', '09.00-00.00', '', '', 'option', '', '2025-11-03 08:52:21', '2025-11-03 08:52:21'),
(124, 1, '2025-11-08', 'Sirk Gösterisi', '11.00-19.00', 'Efe Pamukova-05516970616', '13.00-15.00-17.00-19.00 olmak üzere 4 seans olacaktır.', 'confirmed', 'paid', '2025-11-03 11:41:22', '2025-11-07 07:26:51'),
(125, 1, '2025-11-25', 'Kadına Şiddetle Mücadele Günü', '10.00', '', '', 'option', '', '2025-11-04 11:34:28', '2025-11-04 11:34:28'),
(126, 1, '2025-11-26', '2025 Aile Yılına Özel Mutlu Birey mutlu aile mutlu toplum', '10.00-20.00', 'Haydar Şentürk 05558018343', 'Semazen ve Ney Dinletisi', 'confirmed', 'paid', '2025-11-04 11:39:03', '2025-11-14 12:46:50'),
(127, 1, '2025-11-25', 'Kadına Şiddetle Mücadele Günü Kapsamında Tiyatro Oyunu', '19.00-20.00', '', 'İnsanca Tiyatro Oyunu', 'confirmed', '', '2025-11-04 11:46:17', '2025-11-04 11:46:41'),
(128, 1, '2025-11-20', '24 Kasım Öğretmenler Günü Ramazan Hoca\'nın Provası Atatürk AL', '09.00-00.00', '', '', 'confirmed', '', '2025-11-05 08:19:46', '2025-11-05 08:19:53'),
(129, 7, '2025-11-25', 'İnsanca-Mavi Düşler', 'sergiyle beraber', '', 'Yetişkin Oyunu', 'confirmed', '', '2025-11-05 14:21:33', '2025-11-05 14:21:39'),
(130, 1, '2025-12-23', 'Esnaf Toplantısı', '09.00-00.00', '', '', 'confirmed', '', '2025-11-06 12:20:03', '2025-11-06 12:20:03'),
(132, 11, '2025-11-29', 'Kına', '17.00', '05374289289 Sehim Sırça', '', 'confirmed', 'paid', '2025-11-11 08:04:30', '2025-11-11 14:17:22'),
(135, 1, '2025-11-24', 'Kokteyl', '15.00', '', '24 Kasım Öğretmenler Günü', 'confirmed', '', '2025-11-18 11:41:14', '2025-11-18 11:41:28');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `event_statuses`
--

CREATE TABLE `event_statuses` (
  `status_key` varchar(20) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `event_statuses`
--

INSERT INTO `event_statuses` (`status_key`, `display_name`, `color`) VALUES
('confirmed', 'Onaylandı', '#14d73b'),
('option', 'Opsiyonlu', '#f1af3b'),
('cancelled', 'İptal', '#e63946'),
('free', 'Ücretsiz', '#3a86ff');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `holiday_date` date NOT NULL,
  `holiday_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `status_key` varchar(20) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `color` varchar(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `payment_statuses`
--

INSERT INTO `payment_statuses` (`status_key`, `display_name`, `color`) VALUES
('paid', 'Ödendi', '#2a970c'),
('not_paid', 'Ödenmedi', '#766f6f'),
('to_be_paid', 'Ödeme Bekleniyor', '#7c3aed');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(7) DEFAULT '#3498db',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `units`
--

INSERT INTO `units` (`id`, `unit_name`, `description`, `color`, `is_active`, `created_at`) VALUES
(1, 'ÇAKABEY KÜLTÜR MERKEZİ Tiyatro Salonu', 'Ana kültür merkezi binası', '#db9e33', 1, '2025-10-13 17:39:05'),
(3, 'ÇEŞME Amfi Açık Hava Tiyatrosu', 'Açık hava tiyatro ve konserler', '#2e80cc', 1, '2025-10-13 17:39:05'),
(11, 'ILICA Düğün Salonu', NULL, '#ec18e5', 1, '2025-10-16 07:45:24'),
(5, 'ALAÇATI Ek Hizmet Binası Sergi Salonu', 'Sanat sergileri ve fuarlar', '#f39c12', 1, '2025-10-13 17:39:05'),
(13, 'SAHA ETKİNLİKLERİ', NULL, '#db3355', 1, '2025-10-21 11:34:27'),
(7, 'AYİOS HARALAMBOS Kilisesi', NULL, '#9b59b6', 1, '2025-10-15 17:49:52'),
(12, 'ALAÇATI Amfi Açık Hava Tiyatrosu', NULL, '#3498db', 1, '2025-10-21 10:58:35'),
(14, 'FESTİVALLER 2026 (OT,ÇEŞME,GERMİYAN,OVACIK)', NULL, '#33db4f', 1, '2025-10-21 11:34:38');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_user_id` (`admin_user_id`);

--
-- Tablo için indeksler `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Tablo için indeksler `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Tablo için indeksler `event_statuses`
--
ALTER TABLE `event_statuses`
  ADD PRIMARY KEY (`status_key`);

--
-- Tablo için indeksler `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`status_key`);

--
-- Tablo için indeksler `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- Tablo için AUTO_INCREMENT değeri `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
