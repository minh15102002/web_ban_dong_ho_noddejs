-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 03, 2024 lúc 04:27 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_ban_dong_ho`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Casio', '2023-11-25 23:16:15', '2023-11-25 23:16:15'),
(2, 'Citizen', '2023-11-25 23:16:15', '2023-11-25 23:16:15'),
(3, 'Doxa', '2023-11-25 23:17:08', '2023-11-25 23:17:08'),
(4, 'KOI', '2023-11-25 23:17:19', '2023-11-25 23:17:19'),
(5, 'Tissot', '2023-11-25 23:17:46', '2023-11-25 23:17:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Nam', '2023-11-25 23:12:03', '2023-11-25 23:12:03'),
(2, 'Nữ', '2023-11-25 23:12:03', '2023-11-25 23:12:03'),
(3, 'Cặp Đôi', '2023-11-25 23:12:23', '2023-11-25 23:12:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `phone`, `total`, `status`, `UserId`, `createdAt`, `updatedAt`) VALUES
(3, 'Phan Tiến Huy', 'Hà Nội', '0986538387', 648000, 2, 2, '2023-12-12 06:24:34', '2023-12-12 07:09:02'),
(6, 'Nguyen Kien Duy', 'Ha Noi', '0967792857', 1363000, 2, 3, '2023-12-16 19:20:31', '2023-12-16 19:22:27'),
(7, 'Nguyen Kien Duy', 'Ha Noi', '0967792857', 4354000, 0, 3, '2023-12-16 19:27:38', '2023-12-16 19:27:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `id` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`id`, `OrderId`, `ProductId`, `quantity`, `createdAt`, `updatedAt`) VALUES
(4, 3, 2, 1, '2023-12-12 06:24:34', '2023-12-12 06:24:34'),
(7, 6, 1, 1, '2023-12-16 19:20:31', '2023-12-16 19:20:31'),
(8, 7, 53, 1, '2023-12-16 19:27:38', '2023-12-16 19:27:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `BrandId` int(11) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `description`, `BrandId`, `CategoryId`, `createdAt`, `updatedAt`) VALUES
(1, 'Casio World Time AE-1200WHD-1AVDF – Nam – Quartz (Pin) – Mặt Số 45 mm, Bộ Bấm Giờ, Chống Nước 10 ATM', '/images/products/casio1.png', 1363000, 'Đồng hồ nam Casio AE1200WHD có mặt đồng hồ vuông to với phong cách thể thao, mặt số điện tử với những tính năng hiện đại tiện dụng, kết hợp với dây đeo bằng kim loại đem lại vẻ mạnh mẽ cá tính dành cho phái nam.', 1, 1, '2023-11-25 23:19:05', '2023-11-26 15:38:49'),
(2, 'Casio MTP-V001L-1BUDF – Nam – Quartz (Pin) – Mặt Số 38mm, Kính Cứng, Chống Nước 3ATM', '/images/products/casio2.png', 648000, 'Mẫu Casio MTP-V001L-1BUDF phiên bản dây da đen có vân lịch lãm, thiết kế đơn giản 3 kim trên mặt số size 38mm, nền cọc số học trò kiểu dáng mỏng trẻ trung.', 1, 1, '2023-11-25 23:19:05', '2023-11-25 23:19:05'),
(3, 'Casio MTP-V004GL-9AUDF – Nam – Quartz (Pin) – Mặt Số 41.5mm, Kính Cứng, Chống Nước 3ATM', '/images/products/casio3.png', 856000, 'Đồng hồ Casio MTP-V004GL-9AUDF với mặt đồng hồ tròn truyền thống, vỏ máy mạ vàng sang trọng, gạch số được phủ đen nổi bật trên nền số, dây đeo da nâu nam tính lịch lãm.', 1, 1, '2023-11-25 23:22:23', '2023-11-25 23:22:23'),
(4, 'Casio LTP-V007L-9BUDF – Nữ – Quartz (Pin) – Mặt Số 25mm, Kính Cứng, Chống Nước 3ATM', '/images/products/casio4.png', 752000, 'Mẫu Casio LTP-V007L-9BUDF thiết kế đơn giản chức năng 3 kim, phiên bản mặt số nhỏ chữ nhật hoài cổ kết hợp nền cọc số la mã phù hợp cho các phái đẹp có phần cổ tay nhỏ.', 1, 2, '2023-11-25 23:22:23', '2023-11-25 23:22:23'),
(5, 'Casio MTP-1381L-9AVDF – Nam – Quartz (Pin) – Mặt Số 40mm, Kính Cứng, Chống Nước 5ATM', '/images/products/casio5.png', 1607000, 'Đồng hồ nam Casio MTP-1381L-9AVDF với kiểu dáng thời trang dành cho nam, kim chỉ và vạch số to rõ nổi bật trên mặt đồng hồ tròn to nam tính, phối cùng với dây đeo bằng da nâu lịch lãm.', 1, 1, '2023-11-25 23:26:28', '2023-11-25 23:26:28'),
(6, 'Casio MTP-1308L-1AVDF – Nam – Quartz (Pin) – Mặt Số 43.5mm, Kính Cứng, Chống Nước 5ATM', '/images/products/casio6.png', 1243000, 'Đồng hồ Casio MTP-1308L-1AVDF có vỏ kim loại được mạ bạc tinh xảo quanh nền đen mặt số, kim chỉ và vạch số được phủ phản quang nổi bật, lịch ngày ở vị trí 3h tinh tế, dây đeo da vân đen nam tính lịch lãm.', 1, 1, '2023-11-25 23:26:28', '2023-11-25 23:26:28'),
(7, 'Casio F-201WA-9ADF – Nam – Kính Nhựa – Quartz (Pin) – Mặt Số 34mm, Bộ Bấm Giờ, Chống Nước 3ATM', '/images/products/casio7.png', 466000, 'Mẫu Casio F-201WA-9ADF dây đeo phiên bản dây cao su kiểu dáng năng động kết hợp với thiết kế nền mặt số lớn điện tử hiện thị đa chức năng giúp người dùng dễ quan sát', 1, 1, '2023-11-25 23:28:50', '2023-11-25 23:28:50'),
(8, 'Casio MTP-1302D-1A1VDF – Nam – Quartz (Pin) – Mặt Số 38.5 mm, Kính Cứng, Chống Nước 5ATM', '/images/products/casio8.png', 1347000, 'Đồng hồ Casio MTP-1302D-1A1VDF với mặt số tròn lớn nam tính, viền được tạo khía độc đáo, kim chỉ và vạch số được mạ bạc và phủ phản quang tinh tế nổi bật trên nền số màu đen mạnh mẽ.', 1, 1, '2023-11-25 23:28:50', '2023-11-25 23:28:50'),
(11, 'Daniel Wellington Quadro DW00100438 – Nữ – Quartz (Pin) – Mặt Số 26mm, Kính Cứng, Chống Nước 3ATM', '/images/products/citizen_nu1.png', 4940000, 'Mẫu Daniel Wellington DW00100438 mặt số vuông kiểu dáng nhỏ nhắn trẻ trung cho phái đẹp, điểm nhấn nổi bật cùng với thiết kế siêu mỏng với phần vỏ máy pin chỉ dày 6mm.', 2, 2, '2023-11-28 08:57:18', '2023-11-28 08:57:18'),
(12, 'Daniel Wellington Quadro DW00100434 – Nữ – Quartz (Pin) – Mặt Số 20mm, Kính Cứng, Chống Nước 3ATM', '/images/products/citizen_nu2.png', 4728000, 'Mẫu Daniel Wellington DW00100434 mặt số vuông trắng kiểu dáng nhỏ nhắn thời trang cho phái đẹp, cùng với thiết kế siêu mỏng với phần vỏ máy pin chỉ dày 6mm', 2, 2, '2023-11-28 08:58:32', '2023-11-28 08:58:32'),
(13, 'Citizen EM0493-85P – Nữ – Eco-Drive (Năng Lượng Ánh Sáng) – Mặt Số 23.5mm, Kính Cứng, Chống Nước 3ATM', '/images/products/citizen_nu3.png', 6285000, 'Mẫu Citizen EM0493-85P sang trọng với thiết kế đính 2 viên pha lê tại vị trí 12 giờ trên nền mặt số vuông được phối tone màu trắng ngà.', 2, 2, '2023-11-28 09:00:13', '2023-11-28 09:00:13'),
(14, 'Citizen EM0509-87E – Nữ – Eco-Drive (Năng Lượng Ánh Sáng) – Kính Mineral Crystal, Chống Nước 5ATM', '/images/products/citizen_nu4.png', 6685000, 'Citizen EM0509-87E sở hữu bộ máy Eco-drive (năng lượng ánh sáng) độc quyền của hãng với thiết kế phần vỏ máy mỏng chỉ dày 7mm, phối cùng mẫu dây đeo kim loại dạng dây lưới. Đặc biệt với sự kết hợp sắc đen vàng, làm tôn lên nét quý phái và sang trọng.', 2, 2, '2023-11-28 09:31:51', '2023-11-28 09:31:51'),
(15, 'Citizen EM0509-87E – Nữ – Eco-Drive (Năng Lượng Ánh Sáng) – Kính Mineral Crystal, Chống Nước 5ATM', '/images/products/citizen_nu4.png', 6285000, 'Citizen EM0509-87E sở hữu bộ máy Eco-drive (năng lượng ánh sáng) độc quyền của hãng với thiết kế phần vỏ máy mỏng chỉ dày 7mm, phối cùng mẫu dây đeo kim loại dạng dây lưới. Đặc biệt với sự kết hợp sắc đen vàng, làm tôn lên nét quý phái và sang trọng.', 2, 2, '2023-11-28 09:33:43', '2023-11-28 09:33:43'),
(16, 'Casio SHE-4505SG-7ADR – Nữ – Kính Sapphire – Quartz (Pin) – Dây Kim Loại', '/images/products/casio_nu1.png', 7205000, 'Đồng hồ Casio SHE-4505SG-7ADR thiết kế dành cho nữ, kim chỉ và vạch số thiết kế thời trang kết hợp với dây đeo kim loại mạ bạc như 1 phụ kiện thời trang cho các bạn nữ.', 1, 2, '2023-11-28 09:35:30', '2023-11-28 09:35:30'),
(17, 'Casio SHN-3011SG-7ADR – Nữ – Quartz (Pin) – Dây Kim Loại', '/images/products/casio_nu2.png', 5898000, 'Đồng hồ Casio SHN-3011SG-7ADR thuộc dòng SHEEN cao cấp dành cho phái nữ, khi viền được đính những viên pha lê Swarovski, nền trắng cùng kim chỉ phản quang và con số La Mã vàng hồng thời trang.', 1, 2, '2023-11-28 09:36:13', '2023-11-28 09:36:13'),
(18, 'Casio MSG-S500-7ADR – Nữ – Kính Nhựa – Solar (Năng lượng ánh sáng) – Dây Cao Su – Mặt Số 38.8mm', '/images/products/casio_nu3.png', 5626000, 'Mẫu Casio MSG-S500-7ADR kiểu máy pin phiên bản Solar (Năng lượng ánh sáng), dây đeo cao su phối tone màu hồng nhạt thời trang cho các bạn nữ năng động.', 1, 2, '2023-11-28 09:36:49', '2023-11-28 09:36:49'),
(19, 'Casio SHE-3054SPG-4AUDR – Nữ – Quartz (Pin) – Dây Kim Loại – Mặt Số 33.2mm', '/images/products/casio_nu4.png', 5454000, 'Mẫu Casio SHE-3054SPG-4AUDR mặt số size 33mm tone vàng hồng thời trang cùng với thiết kế sang trọng đính 3 viên pha lê tại vị trí 12 giờ.', 1, 2, '2023-11-28 09:37:23', '2023-11-28 09:37:23'),
(20, 'Casio SHE-4546PG-4AUDF – Nữ – Kính Sapphire – Quartz (Pin) – Dây Kim Loại – Mặt Số 30mm', '/images/products/casio_nu5.png', 5108000, 'Mẫu Casio SHE-4546PG-4AUDF thiết kế đơn giản 3 kim trên nền mặt số nhỏ 30mm tone màu xà cừ thời trang, điểm nổi bật phần vỏ máy pin thiết kế siêu mỏng chỉ dày 5.9mm.', 1, 2, '2023-11-28 09:38:16', '2023-11-28 09:38:16'),
(21, 'Doxa Noble Super Deluxe D106SMW – Nữ – Automatic (Tự Động) – Mặt Số 27mm, Đính Kim Cương, Trữ Cót 38 Giờ', '/images/products/doxa_nu1.png', 148850000, 'Mẫu Doxa D106SMW phiên bản đính kim cương trên chi tiết dây vỏ lẫn mặt số, mặt số size 27mm thiết kế đơn giản chức năng 3 kim.', 3, 2, '2023-11-28 09:40:09', '2023-11-28 09:40:09'),
(22, 'Doxa Calex Spiral Rose D215SBU – Nữ – Kính Sapphire – Automatic (Tự Động) – Mặt Số 35mm, Trữ Cót 38 Giờ, Chống Nước 5ATM', '/images/products/doxa_nu2.png', 46970000, 'Mẫu Doxa D215SBU với thiết kế độc đáo cơ lộ tim tạo hình đóa hoa trên nền mặt số xà cừ size 35mm, kiểu dáng 3 kim thời trang với phiên bản kim chỉ xanh.', 3, 2, '2023-11-28 09:40:52', '2023-11-28 09:40:52'),
(23, 'Doxa x Dorian Ho D223SSV – Nữ – Kính Sapphire – Automatic (Tự Động) – Mặt Số 35mm, Đính 8 Viên Kim Cương, Trữ Cót 38 Giờ', '/images/products/doxa_nu3.png', 45640000, 'Mẫu Doxa D223SSV phiên bản máy cơ lộ tim tạo hình tim đôi thời trang độc đáo trên mặt số size 35mm, thiết kế đơn giản 3 kim mạ vàng hồng.', 3, 2, '2023-11-28 09:41:33', '2023-11-28 09:41:33'),
(24, 'Doxa DOXA X Dorian Ho – Tie the Knot D225SWH – Nữ – Kính Sapphire – Automatic (Tự Động) – Mặt Số 32mm, Trữ Cót 38 Giờ, Chống Nước 5ATM', '/images/products/doxa_nu4.png', 44950000, 'Mẫu Doxa D225SWH phiên bản đính 12 viên kim cương sang trọng tương ứng với 12 múi giờ trên mặt số size 32mm họa tiết tim đôi phong cách thời trang thanh lịch cho phái đẹp.', 3, 2, '2023-11-28 09:42:31', '2023-11-28 09:42:31'),
(25, 'Doxa Precious D190RCM – Nữ – Automatic (Tự Động) – Mặt Số 31mm, Đính Kim Cương, Trữ Cót 38 Giờ', '/images/products/doxa_nu5.png', 43330000, 'Mẫu Doxa D190RCM với 8 viên kim cương được đính trên nền mặt số size 31mm tone màu Champagne tạo nên vẻ ngoài thời trang quyến rũ cho phái đẹp.', 3, 2, '2023-11-28 09:43:06', '2023-11-28 09:43:06'),
(26, 'Koi K001.150.641.50.03.01 – Nữ – Kính Sapphire – Quartz (Pin) – Dây Kim Loại – Mặt Số 28mm', '/images/products/koi_nu1.png', 3390000, 'Mẫu Koi K001.150.641.50.03.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số nhỏ 28mm.', 4, 2, '2023-11-28 09:44:15', '2023-11-28 09:44:15'),
(27, 'Koi K001.103.641.03.03.01 – Nữ – Kính Sapphire – Quartz (Pin) – Dây Kim Loại – Mặt Số 28mm', '/images/products/koi_nu2.png', 2850000, 'Mẫu Koi K001.103.641.03.03.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, thiết kế đơn giản chức năng 3 kim và 1 lịch trên nền mặt số 28mm phù hợp cho phái đẹp có phần cổ tay nhỏ.', 4, 2, '2023-11-28 09:45:34', '2023-11-28 09:45:34'),
(28, 'Koi K001.136.642.29.01.01 – Nữ – Kính Sapphire – Quartz (Pin) – Dây Da – Mặt Số 28mm', '/images/products/koi_nu3.png', 2320000, 'Mẫu Koi K001.136.642.29.01.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số mỏng mạ vàng trên nền mặt số 28mm phù hợp cho phái đẹp có phần cổ tay nhỏ.', 4, 2, '2023-11-28 09:49:17', '2023-11-28 09:49:17'),
(29, 'Koi K001.136.642.29.01.04 – Nữ – Kính Sapphire – Quartz (Pin) – Mặt Số 28mm, Đính Đá Pha Lê, Chống Nước 5ATM', '/images/products/koi_nu4.png', 2320000, 'Mẫu Koi K001.136.642.29.01.04 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, thiết kế sang trọng 11 viên pha lê đính tương ứng với các múi giờ trên nền mặt số 28mm.', 4, 2, '2023-11-28 09:50:14', '2023-11-28 09:50:14'),
(30, 'Koi K001.103.642.05.01.01 – Nữ – Quartz (Pin) – Mặt Số 28mm, Kính Sapphire, Chống Nước 5ATM', '/images/products/koi_nu5.png', 1980000, 'Mẫu Koi K001.103.642.05.01.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, thiết kế đơn giản chức năng 3 kim và 1 lịch trên nền mặt số 28mm phù hợp cho phái đẹp có phần cổ tay nhỏ.', 4, 2, '2023-11-28 09:51:28', '2023-11-28 09:51:28'),
(31, 'Koi K001.450.641.50.03.01 – Nam – Quartz (Pin) – Mặt Số 38.5mm, Chống Nước 5ATM, Kính Sapphire', '/images/products/koi_nam1.png', 3450000, 'Mẫu Koi K001.450.641.50.03.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số kích thước 38.5mm.', 4, 1, '2023-11-28 09:52:28', '2023-11-28 09:52:28'),
(32, 'Koi K001.403.641.03.03.01 – Nam – Kính Sapphire – Quartz (Pin) – Dây Kim Loại – Mặt Số 38.5mm', '/images/products/koi_nam2.png', 2910000, 'Mẫu Koi K001.403.641.03.03.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ bạc trên nền mặt số 38.5mm.', 4, 1, '2023-11-28 09:53:04', '2023-11-28 09:53:04'),
(33, 'Koi K001.436.642.29.36.01 – Nam – Kính Sapphire – Quartz (Pin) – Dây Da – Mặt Số 38.5mm', '/images/products/koi_nam3.png', 2380000, 'Mẫu Koi K001.436.642.29.36.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình trên nền mặt số vàng kích thước 38.5mm.', 4, 1, '2023-11-28 09:53:46', '2023-11-28 09:53:46'),
(34, 'Koi K001.436.642.29.01.01 – Nam – Kính Sapphire – Quartz (Pin) – Dây Da – Mặt Số 38.5mm', '/images/products/koi_nam4.png', 2380000, 'Mẫu Koi K001.436.642.29.01.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số kích thước 38.5mm.', 4, 1, '2023-11-28 09:55:03', '2023-11-28 09:55:03'),
(35, 'Koi K001.403.642.05.01.01 – Nam – Quartz (Pin) – Mặt Số 38.5mm, Kính Sapphire, Chống Nước 5ATM', '/images/products/koi_nam5.png', 2040000, 'Mẫu Koi K001.403.642.05.01.01 thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ bạc trên nền mặt số kích thước 38.5mm.', 4, 1, '2023-11-28 09:55:45', '2023-11-28 09:55:45'),
(36, 'Tissot T926.407.16.263.00 – Nam – Kính Sapphire – Automatic (Tự Động) – Mặt Số 39mm, Vàng 18K, Trữ Cót 42 Giờ', '/images/products/tissot_nam1.png', 108500000, 'Mẫu Tissot T926.407.16.263.00 phiên bản vỏ máy vàng 18K sang trọng, thiết kế thời trang với phần vỏ máy cơ kiểu dáng mỏng chỉ 7mm.', 5, 1, '2023-11-28 09:57:08', '2023-11-28 09:57:08'),
(37, 'Tissot T137.427.11.041.00 – Nam – Kính Sapphire – Automatic (Tự Động) – Dây Kim Loại – Mặt Số 42mm', '/images/products/tissot_nam2.png', 56000000, 'Mẫu Tissot T137.427.11.041.00 phiên bản PRX với khả năng trữ cót lên đến 60 giờ, thiết kế 3 núm điều chỉnh các tính năng Chronograph (đo thời gian) tạo nên vẻ độc đáo kiểu dáng đồng hồ 6 kim.', 5, 1, '2023-11-28 09:57:50', '2023-11-28 09:57:50'),
(38, 'Tissot PRX T137.427.11.011.00 – Nam – Kính Sapphire – Automatic (Tự Động) – Mặt Số 42mm, Trữ Cót 60 Giờ, Chống Nước 10ATM', '/images/products/tissot_nam3.png', 56000000, 'Mẫu Tissot T137.427.11.011.00 phiên bản PRX với khả năng trữ cót lên đến 60 giờ, thiết kế 3 núm điều chỉnh các tính năng Chronograph (đo thời gian) tạo nên vẻ độc đáo kiểu dáng đồng hồ 6 kim.', 5, 1, '2023-11-28 10:06:14', '2023-11-28 10:06:14'),
(39, 'Tissot Couturier T035.627.11.051.00 – Nam – Kính Sapphire – Automatic (Tự Động) – Mặt Số 43mm, Trữ Cót 45 Giờ, Chống Nước 10ATM', '/images/products/tissot_nam4.png', 29050000, 'Đồng hồ Tissot T035.627.11.051.00 có mặt số tròn lớn với vỏ và dây đeo kim loại màu bạc sáng bóng, kim chỉ và vạch số được thiết kế chi tiết rõ nét, các mặt số phụ được sắp xếp tinh tế, còn có ô lịch ngày vị trí 3h nổi bật.', 5, 1, '2023-11-28 10:07:01', '2023-11-28 10:07:01'),
(40, 'Tissot Couturier T035.627.11.031.00 – Nam – Kính Sapphire – Automatic (Tự Động) – Mặt Số 43mm, Trữ Cót 45 Giờ, Chống Nước 10ATM', '/images/products/tissot_nam5.png', 29050000, 'Đồng hồ Tissot T035.627.11.031.00 là đồng hồ thời trang đẹp nhất thế giới với những chi tiết sắc sảo, hoàn hảo, mang đến cho phái mạnh nét sang trọng, thời trang lịch lãm.', 5, 1, '2023-11-28 10:07:35', '2023-11-28 10:07:35'),
(41, 'Tissot T099.407.22.038.02 – Nam – Kính Sapphire – Automatic (Tự Động) – Dây Kim Loại', '/images/products/tissot_nam6.png', 28700000, 'Mẫu Tissot T099.407.22.038.02 kiểu dáng đơn giản 3 kim cùng cọc vạch số tạo hình mỏng mạ vàng hồng tone màu thời trang trên mặt số size 42mm với họa tiết Guilloche.', 5, 1, '2023-11-28 10:08:33', '2023-11-28 10:08:33'),
(42, 'Tissot Le Locle T006.407.22.036.01 – Nam – Automatic (Tự Động) – Mặt Số 39.3mm, Trữ Cót 80 Giờ, Họa Tiết Guilloche', '/images/products/tissot_nam7.png', 28000000, 'Mẫu Tissot T006.407.22.036.01 phiên bản sang trọng đính 12 viên kim cương tương ứng với 12 múi giờ trên nền mặt số kích thước 39mm thiết kế họa tiết Guilloche.', 5, 1, '2023-11-28 10:09:13', '2023-11-28 10:09:13'),
(43, 'Tissot T099.407.36.037.00 – Nam – Automatic – Trữ Cót 80 Giờ, Kính Sapphire, Mặt Số 42mm', '/images/products/tissot_nam8.png', 26950000, 'Đồng hồ Tissot Chemin Des Tourelles powermatic 80 T099.407.36.037.00 có mặt số to, kim chỉ và vạch số được mạ đồng nổi bật trên nền số màu trắng trang nhã, dây đeo bằng chất liệu da cao cấp màu nâu có vân lịch lãm.', 5, 1, '2023-11-28 10:09:56', '2023-11-28 10:09:56'),
(44, 'Tissot Le Locle T006.407.22.036.00 – Nam – Kính Sapphire – Máy Caliber Automatic (Tự Động) – Mặt số đính kim cương – Trữ Cót 80 Giờ – Chống Nước 3ATM', '/images/products/tissot_nam9.png', 25550000, 'Đồng hồ Tissot T006.407.22.036.00 phiên bản thiết kế sang trọng với 8 viên kim cương đính nổi bật trên nền mặt số size 39mm cùng với thiết kế họa tiết Guilloche phong cách thời trang.', 5, 1, '2023-11-28 10:10:34', '2023-11-28 10:10:34'),
(45, 'Tissot Tradition T063.907.22.038.00 – Nam – Automatic (Tự Động) – Mặt Số 40mm, Trữ Cót 80 Giờ, Kính Sapphire', '/images/products/tissot_nam10.png', 25550000, 'Mẫu Tissot T063.907.22.038.00 với thiết kế nền ô số chân kính phô diễn ra 1 phần trải nghiệm của bộ máy cơ nam tính, khoác lên vẻ độc đáo và sang trọng khi kết hợp cùng mẫu dây đeo demi sọc vàng.', 5, 1, '2023-11-28 10:11:06', '2023-11-28 10:11:06'),
(46, 'Tissot T127.407.11.061.01 – Nam – Automatic – Trữ Cót 80 Giờ, Kính Sapphire, Mặt Số 40mm', '/images/products/tissot_nam11.png', 25200000, 'Mẫu Tissot T127.407.11.061.01 phiên bản powermatic 80 với khả năng trữ cót lên đến 80 giờ, nền mặt số tone màu đen xám kích thước 40mm cùng với thiết kế họa tiết trải tia nhẹ.', 5, 1, '2023-11-28 10:11:55', '2023-11-28 10:11:55'),
(47, 'Tissot T099.407.11.058.00 – Nam – Automatic – Trữ Cót 80 Giờ, Kính Sapphire, Mặt Số 42mm', '/images/products/tissot_nam12.png', 25200000, 'Mẫu Tissot T099.407.11.058.00 với kích thước mặt số tròn to đầy nam tính, dưới mặt kính Sapphire các vạch số cùng chữ số được gia công kiểu dáng mỏng đầy tinh tế, kết hợp cùng bộ dây đeo thép không gỉ màu bạc đầy sang trọng.', 5, 1, '2023-11-28 10:12:29', '2023-11-28 10:12:29'),
(48, 'Tissot T099.207.36.118.00 – Nữ – Automatic – Trữ Cót 80 Giờ, Kính Sapphire, Mặt Số 32mm', '/images/products/tissot_nu1.png', 26950000, 'Mẫu Tissot T099.207.36.118.00 các chi tiết kim chỉ cùng cọc vạch số tạo hình mỏng phối tone màu vàng hồng thời trang nổi bật trên nền mặt số kích thước 32mm.', 5, 2, '2023-11-28 10:55:51', '2023-11-28 10:55:51'),
(49, 'Tissot T086.207.11.111.00 – Nữ – Kính Sapphire – Automatic (Tự Động) – Dây Kim Loại', '/images/products/tissot_nu2.png', 24800000, 'Mẫu Tissot T086.207.11.111.00 vỏ máy kim loại mạ bạc thiết kế dày dặn bên trong bộ máy cơ với thiết kế nổi bật cùng khả năng trữ cót 80 giờ.', 5, 2, '2023-11-28 10:59:23', '2023-11-28 10:59:23'),
(50, 'Tissot T086.207.16.261.00 – Nữ – Automatic – Trữ Cót 80 Giờ, Kính Sapphire, Mặt Số 33mm', '/images/products/tissot_nu3.png', 23130000, 'Với mặt đồng hồ Tissot T086.207.16.261.00 có 2 màu: màu trắng trung tâm và màu nâu của viền. Mặt số tròn tinh tế cùng kim chỉ và gạch số mạ bạc sang trọng, dây đeo da nâu bóng lịch lãm.', 5, 2, '2023-11-28 10:59:58', '2023-11-28 10:59:58'),
(51, 'Tissot T050.207.16.117.00 – Nữ – Kính Sapphire – Automatic (Tự Động) – Dây Da – Mặt Số 35mm', '/images/products/tissot_nu4.png', 22400000, 'Mẫu Tissot T050.207.16.117.00 dây da trơn phiên bản tone màu hồng nhạt thời trang, thiết kế độc đáo họa tiết hình đóa hoa trên nền mặt số trắng xà cừ size 35mm.', 5, 2, '2023-11-28 11:00:36', '2023-11-28 11:00:36'),
(52, 'Tissot Carson T085.207.11.011.00 – Nữ – Kính Sapphire – Automatic (Tự Động) – Mặt Số 29.5mm, Trữ Cót 38 Giờ, Chống Nước 3ATM', '/images/products/tissot_nu6.png', 19250000, 'Đồng hồ Tissot T085.207.11.011.00 kiểu dáng cổ điển với mặt số nền trắng , kim chỉ và gạch số được mạ bạc, dây đeo thanh mảnh mang cảm giác sang trọng, quý phái cho phái nữ.', 5, 2, '2023-11-28 11:02:21', '2023-11-28 11:02:21'),
(53, 'Casio Đôi – Quartz (Pin) – Dây Kim Loại (MTP-V300G-1AUDF – LTP-V300G-1AUDF) – Mặt Số 38mm – 33mm', '/images/products/casio_doi1.png', 4354000, 'Mẫu Casio đôi mạ vàng sang trọng trên phần dây vỏ đồng hồ, thiết kế độc đáo với các ô lịch tạo nên kiểu dáng 6 kim trên nền mặt số.', 1, 3, '2023-11-28 11:07:21', '2023-11-28 11:07:21'),
(54, 'Casio Đôi – Quartz (Pin) – Dây Kim Loại (MTP-V300G-7AUDF – LTP-V300G-7AUDF) – Mặt Số 38mm – 33mm', '/images/products/casio_doi2.png', 4354000, 'Mẫu Casio đôi mạ vàng sang trọng trên chi tiết dây vỏ đồng hồ, kiểu dáng 6 kim với thiết kế nổi bật trên nền mặt số trắng.', 1, 3, '2023-11-28 11:13:08', '2023-11-28 11:13:08'),
(55, 'Casio Đôi – Quartz (Pin) – Dây Kim Loại (MTP-1303SG-7AVDF – LTP-1303SG-7AVDF) – Mặt Số 40mm – 30mm', '/images/products/casio_doi3.png', 3626000, 'Mẫu Casio đôi phiên bản dây đeo vàng demi thời trang, thiết kế đơn giản 3 kim với chi tiết vạch số mạ vàng sang trọng trên mặt số.', 1, 3, '2023-11-28 11:13:46', '2023-11-28 11:13:46'),
(56, 'Casio Đôi – Quartz (Pin) – Dây Da (MTP-V300L-7A2UDF – LTP-V300L-7A2UDF) – Mặt Số 41mm – 33mm', '/images/products/casio_doi4.png', 3214000, 'Mẫu Casio đôi dây da nâu phiên bản da trơn thời trang, 3 ô sô gồm chức năng lịch tạo nên thiết kế 6 kim độc đáo trên nền mặt số.', 1, 3, '2023-11-28 11:14:18', '2023-11-28 11:14:18'),
(57, 'Casio Đôi – Quartz (Pin) – Dây Kim Loại (MTP-1183G-7ADF – LTP-1183G-7ADF) – Mặt Số 38mm – 28mm', '/images/products/casio_doi5.png', 3110000, 'Mẫu Casio đôi dây đeo vàng demi phiên bản thời trang cùng với thiết kế mỏng vỏ máy pin chỉ dày 8mm.', 1, 3, '2023-11-28 11:14:48', '2023-11-28 11:14:48'),
(58, 'Citizen Đôi – Eco-Drive (Năng Lượng Ánh Sáng) – Dây Da (AW1211-12A – FE6011-14A) – Mặt Số 42mm – 33mm', '/images/products/citizen_doi1.png', 9485000, 'Mẫu Citizen đôi với nền cọc số học trò tạo hình mỏng trên nền mặt số trắng trẻ trung lịch lãm phối cùng bộ dây da nâu có vân.', 2, 3, '2023-11-28 11:16:08', '2023-11-28 11:21:59'),
(59, 'Citizen Đôi – Quartz (Pin) – Dây Kim Loại (BI5074-56A – EU6094-53A) – Mặt Số 40mm – 28mm', '/images/products/citizen_doi2.png', 8385000, 'Mẫu Citizen đôi phiên bản trẻ trung với chi tiết kim chỉ cùng cọc vạch số mỏng mạ vàng nổi bật trên nền mặt số kiểu dáng sang trọng.', 2, 3, '2023-11-28 11:17:53', '2023-11-28 11:17:53'),
(60, 'Citizen Đôi – Kính Sapphire – Eco-Drive (Năng Lượng Ánh Sáng) – Dây Kim Loại (BJ6481-58A – EM0401-59A)', '/images/products/citizen_doi3.png', 7800000, 'Đồng hồ đôi Citizen với lối phong cách giản dị, nổi bật cùng Pin sử dụng công nghệ hiện đại Eco-Drive (Năng Lượng Ánh Sáng), vỏ máy cùng dây đeo kim loại màu bạc đem lại vẻ sang trọng.', 2, 3, '2023-11-28 11:18:35', '2023-11-28 11:18:35'),
(62, 'Citizen Đôi – Quartz (Pin) – Dây Da (BI5072-01A – EU6092-08A) – Mặt Số 40mm – 28mm', '/images/products/citizen_doi4.png', 7370000, 'Mẫu Citizen đôi vỏ máy pin mạ vàng tone màu sang trọng không kém cạnh trẻ trung với cọc vạch số lẫn kim chỉ tạo hình mỏng.', 2, 3, '2023-11-28 11:23:36', '2023-11-28 11:23:36'),
(63, 'Doxa Đôi – Kính Sapphire – Automatic (Tự Động) – Dây Kim Loại (D183TSV – D184TSV) – Mặt Số 41mm – 35mm', '/images/products/doxa_doi1.png', 75860000, 'Mẫu Doxa đôi với chi tiết núm vặn cùng kim chỉ mạ vàng nổi bật, nền mặt số trắng với thiết kế họa tiết trải tia tạo nên vẻ trẻ trung.', 3, 3, '2023-11-28 11:30:25', '2023-11-28 11:30:25'),
(75, 'Doxa Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (D220SSV – D221SSV) – Mặt Số 41mm – 31mm', '/images/products/doxa_doi2.png', 75120000, 'Mẫu Doxa đôi điểm nhấn sang trọng thiết kế đính kim cương trên nền mặt số trắng.', 3, 3, '2023-11-28 12:29:39', '2023-11-28 12:29:39'),
(76, 'Doxa Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (D155SST – D156SST) – Mặt Số 39mm – 26mm', '/images/products/doxa_doi3.png', 39460000, 'Mẫu Doxa đôi thiết kế mỏng thời trang với bộ máy pin chỉ dày 6mm, cọc vạch số mạ vàng sang trọng trên nền mặt số có họa tiết Guilloche.', 3, 3, '2023-11-28 12:30:18', '2023-11-28 12:30:18'),
(77, 'Doxa Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (D155SSV – D156SSV) – Mặt Số 39mm – 29mm', '/images/products/doxa_doi4.png', 39190000, 'Mẫu Doxa đôi phiên bản kim giây với thiết kế không đồng trục tạo nên vẻ độc đáo trên mặt số, vỏ máy mạ bạc sang trọng kiểu máy pin mỏng chỉ 6mm.', 3, 3, '2023-11-28 12:31:02', '2023-11-28 12:31:02'),
(78, 'Doxa Đôi – Kính Sapphire – Quartz (Pin) – Dây Da (D155RBL – D156RBL) – Mặt Số 39mm – 29mm', '/images/products/doxa_doi5.png', 38760000, 'Mẫu Doxa đôi phiên bản vỏ máy pin mạ vàng hồng tone màu thời trang cùng với thiết kế siêu mỏng chỉ 6mm', 3, 3, '2023-11-28 12:31:39', '2023-11-28 12:31:39'),
(79, 'Koi Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (K001.450.641.50.03.01 – K001.150.641.50.03.01) – Mặt Số 38.5mm – 28mm', '/images/products/koi_doi1.png', 6840000, 'Mẫu Koi đôi thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số trắng.', 4, 3, '2023-11-28 12:32:46', '2023-11-28 12:32:46'),
(80, 'Koi Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (K001.403.641.03.03.01 – K001.103.641.03.03.01) – Mặt Số 38.5mm – 28mm', '/images/products/koi_doi2.png', 5760000, 'Mẫu Koi đôi thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ bạc trên nền mặt số trắng.', 4, 3, '2023-11-28 12:33:29', '2023-11-28 12:33:29'),
(81, 'Koi Đôi – Kính Sapphire – Quartz (Pin) – Dây Da (K001.436.642.29.36.01 – K001.136.642.29.36.01) – Mặt Số 38.5mm – 28mm', '/images/products/koi_doi3.png', 4700000, 'Mẫu Koi đôi thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số', 4, 3, '2023-11-28 12:34:11', '2023-11-28 12:34:11'),
(82, 'Koi Đôi – Kính Sapphire – Quartz (Pin) – Dây Da (K001.403.642.05.01.01 – K001.103.642.05.01.01) – Mặt Số 38.5mm – 28mm', '/images/products/koi_doi4.png', 4020000, 'Mẫu Koi đôi thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ bạc trên nền mặt số trắng.', 4, 3, '2023-11-28 12:34:55', '2023-11-28 12:34:55'),
(83, 'Koi Đôi – Kính Sapphire – Quartz (Pin) – Dây Da (K001.436.642.29.01.01 – K001.136.642.29.01.01) – Mặt Số 38.5mm – 28mm', '/images/products/koi_doi5.png', 4700000, 'Mẫu Koi đôi thiết kế nổi bật phần mặt kính chất liệu kính Sapphire, kim chỉ cùng cọc vạch số tạo hình mỏng mạ vàng trên nền mặt số trắng.', 4, 3, '2023-11-28 12:35:43', '2023-11-28 12:35:43'),
(84, 'Tissot Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (T097.410.22.038.00 – T097.010.22.118.00) – Mặt Số 40mm – 29mm', '/images/products/tissot_doi2.png', 27300000, 'Mẫu Tissot đôi phiên bản dây đeo vàng demi kiểu dáng thời trang kết hợp cùng thiết kế đơn giản chức năng 3 kim.', 5, 3, '2023-11-28 12:37:48', '2023-11-28 12:37:48'),
(85, 'Tissot Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (T063.610.22.037.00 – T063.210.22.037.00)', '/images/products/tissot_doi3.png', 25200000, 'Đồng hồ đôi Tissot mặt đồng hồ có kiểu dáng tròn với kim chỉ cùng vạch số thiết kế mỏng tinh tế mạ vàng trên nền trắng trang trọng, kết hợp cùng dây đeo demi kim loại sọc vàng tạo nên vẻ thời trang sang trọng.', 5, 3, '2023-11-28 12:42:00', '2023-11-28 12:42:00'),
(86, 'Tissot Đôi – Kính Sapphire – Quartz (Pin) – Dây Da (T063.409.36.018.00 – T063.009.36.018.00) – Mặt Số 39mm – 25mm', '/images/products/tissot_doi4.png', 24500000, 'Mẫu Tissot đôi vỏ máy pin mạ vàng hồng tone màu thời trang cùng với thiết kế mỏng phần vỏ máy chỉ dày 5mm.', 5, 3, '2023-11-28 12:42:40', '2023-11-28 12:42:40'),
(87, 'Tissot Đôi – Kính Sapphire – Quartz (Pin) – Dây Kim Loại (T097.410.11.038.00 – T097.010.11.038.00)', '/images/products/tissot_doi5.png', 23100000, 'Đồng hồ đôi Tissot theo xu hướng thời trang, với vạch số được thiết kế mỏng trên nền số màu bạc thời trang, vỏ máy cùng với dây đeo bằng thép không gỉ màu bạc đem lại sự trẻ trung thời trang cho cặp đôi.', 5, 3, '2023-11-28 12:43:15', '2023-11-28 12:43:15'),
(88, 'sanpham1', '/images/products/casio_doi5.png', 2000000, 'Mẫu Doxa đôi với chi tiết núm vặn cùng kim chỉ mạ vàng nổi bật, nền mặt số trắng với thiết kế họa tiết trải tia tạo nên vẻ trẻ trung.', 1, 3, '2023-12-17 05:03:11', '2023-12-17 05:03:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2023-12-12 02:43:08', '2023-12-12 02:43:08'),
(2, 'Khách Hàng', '2023-12-12 02:43:08', '2023-12-12 02:43:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20231211075852-create-user.js'),
('20231211075906-create-role.js'),
('20231211080230-create-brand.js'),
('20231211080241-create-product.js'),
('20231211080254-create-category.js'),
('20231211080308-create-order.js'),
('20231211080319-create-order-product.js');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `RoleId`, `createdAt`, `updatedAt`) VALUES
(2, 'Phan Tiến Huy', 'huyphan1232002@gmail.com', 'phantienhuy', '$2b$10$nuqdTho3ILf.0tXiLaCx/utHZY.ROgW8EV/PIyFvJgPxiXixHNELu', 2, '2023-12-11 13:33:59', '2023-12-12 06:57:47'),
(3, 'Admin', 'admin@gmail.com', 'admin', '$2b$10$lOsofzy.t8fiBYVXh.h.TeM1vHmWX8lxcRf10CDqR.KSueK2eSlke', 1, '2023-12-12 01:48:53', '2023-12-12 06:57:51'),
(5, 'kien duy', 'duy123@gmail.com', 'duy123', '$2b$10$YR1yLfSxgixXjabU2JGi9eABMwAMLx573seT3e.5UjBqEI5gvAAnG', 2, '2023-12-16 19:28:33', '2023-12-16 19:28:33'),
(6, 'kienduy', 'duy1234@gmail.com', 'duy1', '$2b$10$4iX14CUGumgYt22VKZ40K.SLdhyvX5SYbiuvZ8Mt779ScZptE/sPS', 2, '2023-12-17 03:45:27', '2023-12-17 03:45:27');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
