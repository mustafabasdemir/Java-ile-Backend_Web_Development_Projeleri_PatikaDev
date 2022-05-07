-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 May 2022, 20:20:12
-- Sunucu sürümü: 10.1.21-MariaDB
-- PHP Sürümü: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mcbus`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kirada_arac`
--

CREATE TABLE `kirada_arac` (
  `id` int(11) NOT NULL,
  `durum` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ad` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `soyad` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `tel` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `adres` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `mail` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `marka` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `model` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `plaka` varchar(500) COLLATE utf8_turkish_ci DEFAULT NULL,
  `kgun` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `ucret` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `dgun` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `tucret` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kirada_arac`
--

INSERT INTO `kirada_arac` (`id`, `durum`, `ad`, `soyad`, `tel`, `adres`, `mail`, `marka`, `model`, `plaka`, `kgun`, `ucret`, `dgun`, `tucret`) VALUES
(3, 'K?RALAND?', 'memet', 'kalaba', '33333', 'asb', 'm123@gmail.com', 'k?a', 'sorento', '06 aa 296', '5', '80', '5', '400'),
(4, 'K?RALAND?', 'memet', 'kalaba', '33333', 'asb', 'm123@gmail.com', 'k?a', 'sorento', '06 aa 296', '5', '80', '5', '400'),
(5, 'K?RALAND?', 'yasemin', 'çal?k', '5453222222', 'belsin', 'yasemin42@gmail.com', 'opel', 'astra', '42 ys 999', '4', '75', '03.06.2016', '300'),
(6, 'KIRALANDI', 'emre', 'arn?k', '535443322', 'merkez', 'emre06@gmail.com', 'bmv', 'x6', '06 cd 2016', '5', '120', '07.06.2016', '600'),
(7, 'KIRALANDI', 'emre', 'kaçak', '5444434444', 'yeni?ehir', 'emree45@gmail.com', 'AUDi', 'A7', '06 AT2060', '6', '100', '07.06.2016', '600'),
(8, 'K?RALAND?', 'ahmet', 'altunn', '5456545213', 'fatih mah', 'ahmet38', 'mercedes', 'doblo', '06 aa 296', '4', '80', '06-07.2016', '320'),
(9, 'KIRALANDI', 'dsa', 'c<z', 'fdssd', 'fds', '', 'opel', 'astra', '42 ys 999', '4', '80', '', '320'),
(10, 'KIRALANDI', 'dsa', 'c<z', 'fdssd', 'fds', '', 'opel', 'astra', '42 ys 999', '4', '80', '', '320');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kiralik_arac`
--

CREATE TABLE `kiralik_arac` (
  `id` int(11) NOT NULL,
  `marka` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `model` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `plaka` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `ucret` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kiralik_arac`
--

INSERT INTO `kiralik_arac` (`id`, `marka`, `model`, `plaka`, `ucret`) VALUES
(14, 'mercedes', 'c180', '06 aa 296', '80'),
(19, 'mercedes', 'doblo', '06 aa 296', '80');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

CREATE TABLE `uyeler` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `soyad` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `kadi` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `sifre` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `yetki` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`id`, `ad`, `soyad`, `kadi`, `sifre`, `yetki`) VALUES
(1, 'Mehmet', 'SEVİNÇ', 'mehmet', '1', 'yetkili'),
(2, 'furkan', 'ta?demir', 'furkan', '2', 'kullanici'),
(3, 'mehmet', 'sevinç', 'ahmet', '123', 'yetkili'),
(4, 'kus', 'ay?', 'kkü', '2', 'kullanici'),
(5, 'fatih', 'seven', 'fatih', '4', 'kullanici'),
(6, 'ilhan', '?enocak', 'ilhan', '4', 'yetkili'),
(7, 'furkan', 'ta?demir', 'furkan', '2', 'kullanici'),
(8, '', '', '', '', 'kullanici');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kirada_arac`
--
ALTER TABLE `kirada_arac`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kiralik_arac`
--
ALTER TABLE `kiralik_arac`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `uyeler`
--
ALTER TABLE `uyeler`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kirada_arac`
--
ALTER TABLE `kirada_arac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tablo için AUTO_INCREMENT değeri `kiralik_arac`
--
ALTER TABLE `kiralik_arac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Tablo için AUTO_INCREMENT değeri `uyeler`
--
ALTER TABLE `uyeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
