-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Okt 2025 pada 19.36
-- Versi server: 10.6.23-MariaDB-cll-lve
-- Versi PHP: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nrrskfvk_situneo_digital`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `analytics_events`
--

CREATE TABLE `analytics_events` (
  `id` int(11) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_category` varchar(100) DEFAULT NULL,
  `event_label` varchar(255) DEFAULT NULL,
  `event_value` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `case_studies`
--

CREATE TABLE `case_studies` (
  `id` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_id` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `challenge_en` text NOT NULL,
  `challenge_id` text NOT NULL,
  `solution_en` text NOT NULL,
  `solution_id` text NOT NULL,
  `results_en` text NOT NULL,
  `results_id` text NOT NULL,
  `metrics` text DEFAULT NULL,
  `testimonial_en` text DEFAULT NULL,
  `testimonial_id` text DEFAULT NULL,
  `testimonial_author` varchar(255) DEFAULT NULL,
  `testimonial_position` varchar(255) DEFAULT NULL,
  `image_header` varchar(255) DEFAULT NULL,
  `images_gallery` text DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 1,
  `view_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT 'Indonesia',
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_logs`
--

CREATE TABLE `email_logs` (
  `id` int(11) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `template` varchar(100) DEFAULT NULL,
  `status` enum('pending','sent','failed') DEFAULT 'pending',
  `error_message` text DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `freelancers`
--

CREATE TABLE `freelancers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `portfolio_url` varchar(255) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT 0.00,
  `total_projects` int(11) DEFAULT 0,
  `total_earnings` decimal(15,2) DEFAULT 0.00,
  `rating` decimal(3,2) DEFAULT 0.00,
  `avatar` varchar(255) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `bank_holder` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `tax_amount` decimal(15,2) DEFAULT 0.00,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('draft','sent','paid','overdue','cancelled') DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_id` varchar(255) NOT NULL,
  `message_en` text NOT NULL,
  `message_id` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_type` enum('service','package') NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `discount_amount` decimal(15,2) DEFAULT 0.00,
  `promo_code` varchar(50) DEFAULT NULL,
  `final_amount` decimal(15,2) NOT NULL,
  `status` enum('pending','payment_pending','paid','in_progress','revision','completed','cancelled') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_id` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description_en` text NOT NULL,
  `description_id` text NOT NULL,
  `features_en` text NOT NULL,
  `features_id` text NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `discount_percentage` int(11) DEFAULT 0,
  `delivery_days` int(11) DEFAULT 30,
  `is_popular` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `badge_en` varchar(50) DEFAULT NULL,
  `badge_id` varchar(50) DEFAULT NULL,
  `total_orders` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `packages`
--

INSERT INTO `packages` (`id`, `name_en`, `name_id`, `slug`, `description_en`, `description_id`, `features_en`, `features_id`, `original_price`, `discount_price`, `discount_percentage`, `delivery_days`, `is_popular`, `is_active`, `badge_en`, `badge_id`, `total_orders`, `created_at`, `updated_at`) VALUES
(1, 'Starter Package', 'Paket Pemula', 'starter-package', 'Perfect for new businesses just starting their digital journey. Get essential tools to establish your online presence.', 'Sempurna buat bisnis baru yang baru mulai perjalanan digitalnya. Dapetin tools penting buat bangun kehadiran online.', 'Landing Page Website (1 page)|Logo Design Professional|Social Media Setup (Instagram, Facebook, TikTok)|Google My Business Setup|SEO Basic (10 keywords)|Free 1 month support', 'Landing Page Website (1 halaman)|Desain Logo Profesional|Setup Media Sosial (Instagram, Facebook, TikTok)|Setup Google My Business|SEO Basic (10 keyword)|Gratis support 1 bulan', 12500000.00, 8900000.00, 29, 21, 1, 1, 'Most Popular', 'Paling Populer', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48'),
(2, 'Business Package', 'Paket Bisnis', 'business-package', 'Comprehensive package for growing businesses ready to scale. Everything you need to compete online.', 'Paket lengkap buat bisnis yang lagi berkembang dan siap scale up. Semua yang kamu butuhkan buat kompetisi online.', 'E-Commerce Website (full features)|Brand Identity Design (logo, business card, letterhead)|SEO Premium (50 keywords)|Social Media Management (3 months)|Google Ads Setup & Management (1 month)|Meta Ads Setup & Management (1 month)|Google Analytics 4 Setup|Payment Gateway Integration|Free 3 months support', 'Website E-Commerce (fitur lengkap)|Desain Identitas Brand (logo, kartu nama, kop surat)|SEO Premium (50 keyword)|Manajemen Media Sosial (3 bulan)|Setup & Manajemen Google Ads (1 bulan)|Setup & Manajemen Meta Ads (1 bulan)|Setup Google Analytics 4|Integrasi Payment Gateway|Gratis support 3 bulan', 55000000.00, 39900000.00, 27, 45, 1, 1, 'Best Value', 'Paling Worth It', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48'),
(3, 'Professional Package', 'Paket Profesional', 'professional-package', 'Advanced package for established businesses wanting premium digital presence and automation.', 'Paket advanced buat bisnis established yang mau kehadiran digital premium dan otomasi.', 'Custom Web Application|Custom Dashboard Development|AI Chatbot Integration|CRM System Implementation|Brand Identity Complete|SEO Premium (6 months)|Social Media Management (6 months)|Google Ads (3 months)|Meta Ads (3 months)|Content Creator (1 session)|Free 6 months support', 'Aplikasi Web Custom|Pengembangan Dashboard Custom|Integrasi Chatbot AI|Implementasi Sistem CRM|Identitas Brand Lengkap|SEO Premium (6 bulan)|Manajemen Media Sosial (6 bulan)|Google Ads (3 bulan)|Meta Ads (3 bulan)|Content Creator (1 sesi)|Gratis support 6 bulan', 99999999.99, 89900000.00, 25, 90, 0, 1, 'Premium', 'Premium', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48'),
(4, 'Enterprise Package', 'Paket Enterprise', 'enterprise-package', 'Ultimate solution for large businesses and corporations. Complete digital transformation with dedicated support.', 'Solusi ultimate buat bisnis besar dan korporasi. Transformasi digital lengkap dengan dedicated support.', 'Custom Web Application (advanced features)|Custom Dashboard (multiple modules)|AI Chatbot + WhatsApp Blast Integration|CRM System (enterprise level)|Full Brand Identity + Guidelines|SEO Premium (12 months)|Social Media Management (12 months)|Google Ads (6 months)|Meta Ads (6 months)|TikTok Ads (6 months)|Content Creator (monthly)|Website Maintenance (12 months)|Conversion Tracking Complete|Dedicated Account Manager|Free 12 months priority support', 'Aplikasi Web Custom (fitur advanced)|Dashboard Custom (multiple modul)|Chatbot AI + Integrasi WhatsApp Blast|Sistem CRM (level enterprise)|Identitas Brand Full + Panduan|SEO Premium (12 bulan)|Manajemen Media Sosial (12 bulan)|Google Ads (6 bulan)|Meta Ads (6 bulan)|TikTok Ads (6 bulan)|Content Creator (bulanan)|Website Maintenance (12 bulan)|Tracking Konversi Lengkap|Dedicated Account Manager|Gratis support prioritas 12 bulan', 99999999.99, 99999999.99, 24, 120, 0, 1, 'Enterprise', 'Enterprise', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48'),
(5, 'E-Commerce Complete', 'E-Commerce Lengkap', 'ecommerce-complete', 'Everything needed to launch and grow a successful online store. From setup to marketing automation.', 'Semua yang dibutuhin buat launch dan kembangkan toko online sukses. Dari setup sampai otomasi marketing.', 'E-Commerce Website (unlimited products)|Payment Gateway Integration (Midtrans + Xendit)|Product Photography (50 products)|Logo & Brand Identity Design|SEO Premium (6 months)|Social Media Management (6 months)|Google Ads (3 months)|Meta Ads (3 months)|WhatsApp Blast Setup|Email Marketing Automation|Google Analytics 4 + Conversion Tracking|Free 6 months support', 'Website E-Commerce (produk unlimited)|Integrasi Payment Gateway (Midtrans + Xendit)|Fotografi Produk (50 produk)|Desain Logo & Identitas Brand|SEO Premium (6 bulan)|Manajemen Media Sosial (6 bulan)|Google Ads (3 bulan)|Meta Ads (3 bulan)|Setup WhatsApp Blast|Otomasi Email Marketing|Google Analytics 4 + Tracking Konversi|Gratis support 6 bulan', 85000000.00, 64900000.00, 24, 60, 1, 1, 'Best Seller', 'Paling Laku', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48'),
(6, 'Custom Package', 'Paket Custom', 'custom-package', 'Build your own package tailored to your specific needs. Mix and match services for the perfect solution.', 'Bangun paket sendiri yang disesuaikan dengan kebutuhan spesifik kamu. Mix and match layanan buat solusi yang sempurna.', 'Choose any services you need|Flexible budget allocation|Priority support|Dedicated project manager|Custom timeline|Special discount for bulk orders|Free consultation session', 'Pilih layanan apapun yang kamu butuhin|Alokasi budget fleksibel|Support prioritas|Dedicated project manager|Timeline custom|Diskon spesial untuk bulk order|Sesi konsultasi gratis', 0.00, 0.00, 0, 30, 0, 1, 'Flexible', 'Fleksibel', 0, '2025-10-14 09:11:48', '2025-10-14 09:11:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `specialization_en` varchar(255) DEFAULT NULL,
  `specialization_id` varchar(255) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_id` text DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `partners`
--

INSERT INTO `partners` (`id`, `name`, `logo`, `website`, `specialization_en`, `specialization_id`, `description_en`, `description_id`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PixelCraft Studios', 'pixelcraft-logo.png', 'https://pixelcraft-studio.example.com', 'Web Development Specialist', 'Spesialis Pengembangan Web', 'Leading web development agency specializing in custom enterprise solutions, complex web applications, and scalable e-commerce platforms. With over 10 years of experience, PixelCraft has delivered 500+ successful projects for clients across Indonesia and Asia.', 'Agensi pengembangan web terkemuka yang mengkhususkan diri dalam solusi enterprise custom, aplikasi web kompleks, dan platform e-commerce scalable. Dengan pengalaman lebih dari 10 tahun, PixelCraft telah menyelesaikan 500+ proyek sukses untuk klien di Indonesia dan Asia.', 1, 1, '2025-10-14 09:13:42', '2025-10-14 09:13:42'),
(2, 'BrandForge Agency', 'brandforge-logo.png', 'https://brandforge.example.com', 'Branding & Identity Design', 'Branding & Desain Identitas', 'Creative branding agency helping businesses build strong brand identities and market positioning. BrandForge combines strategic thinking with creative execution to create memorable brands that resonate with target audiences and drive business growth.', 'Agensi branding kreatif membantu bisnis membangun identitas merek yang kuat dan positioning pasar. BrandForge menggabungkan pemikiran strategis dengan eksekusi kreatif untuk menciptakan brand memorable yang resonan dengan target audiens dan mendorong pertumbuhan bisnis.', 2, 1, '2025-10-14 09:13:42', '2025-10-14 09:13:42'),
(3, 'ContentWorks', 'contentworks-logo.png', 'https://contentworks.example.com', 'Content Marketing & SEO', 'Content Marketing & SEO', 'Content creation and SEO experts driving organic growth through strategic content marketing. ContentWorks specializes in SEO-optimized content, link building strategies, and comprehensive digital marketing campaigns that deliver measurable results and long-term sustainable growth.', 'Ahli pembuatan konten dan SEO yang mendorong pertumbuhan organik melalui marketing konten strategis. ContentWorks mengkhususkan diri dalam konten SEO-optimized, strategi link building, dan kampanye digital marketing komprehensif yang memberikan hasil terukur dan pertumbuhan sustainable jangka panjang.', 3, 1, '2025-10-14 09:13:42', '2025-10-14 09:13:42'),
(4, 'SocialSphere', 'socialsphere-logo.png', 'https://socialsphere.example.com', 'Social Media Management', 'Manajemen Media Sosial', 'Social media marketing agency creating engaging campaigns and building online communities. SocialSphere manages 200+ social media accounts across all platforms, delivering creative content, community engagement, and data-driven strategies that convert followers into customers.', 'Agensi marketing media sosial yang menciptakan kampanye menarik dan membangun komunitas online. SocialSphere mengelola 200+ akun media sosial di semua platform, memberikan konten kreatif, engagement komunitas, dan strategi berbasis data yang mengubah followers jadi customers.', 4, 1, '2025-10-14 09:13:42', '2025-10-14 09:13:42'),
(5, 'TechBoost Solutions', 'techboost-logo.png', 'https://techboost.example.com', 'Software Development & AI', 'Pengembangan Software & AI', 'Technology partner specializing in custom software development, AI integration, and digital transformation. TechBoost helps businesses leverage cutting-edge technology including AI chatbots, automation systems, and custom enterprise applications to stay competitive in the digital age.', 'Partner teknologi yang mengkhususkan diri dalam pengembangan software custom, integrasi AI, dan transformasi digital. TechBoost membantu bisnis memanfaatkan teknologi terkini termasuk chatbot AI, sistem otomasi, dan aplikasi enterprise custom untuk tetap kompetitif di era digital.', 5, 1, '2025-10-14 09:13:42', '2025-10-14 09:13:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` enum('bank_transfer','e_wallet','credit_card','other') DEFAULT 'bank_transfer',
  `amount` decimal(15,2) NOT NULL,
  `payment_proof` varchar(255) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` enum('pending','verified','rejected') DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `portfolio_items`
--

CREATE TABLE `portfolio_items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_id` text DEFAULT NULL,
  `services_used` text DEFAULT NULL,
  `results_en` text DEFAULT NULL,
  `results_id` text DEFAULT NULL,
  `image_thumbnail` varchar(255) DEFAULT NULL,
  `image_full` varchar(255) DEFAULT NULL,
  `project_url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_published` tinyint(1) DEFAULT 1,
  `view_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `portfolio_items`
--

INSERT INTO `portfolio_items` (`id`, `title`, `slug`, `client_name`, `category`, `industry`, `description_en`, `description_id`, `services_used`, `results_en`, `results_id`, `image_thumbnail`, `image_full`, `project_url`, `is_featured`, `is_published`, `view_count`, `created_at`, `updated_at`) VALUES
(1, 'FashionHub Online Store', 'fashionhub-online-store', 'FashionHub Indonesia', 'E-Commerce', 'Fashion & Retail', 'Complete e-commerce platform for fashion retailer with 1000+ products, secure payment gateway, and inventory management system.', 'Platform e-commerce lengkap untuk retailer fashion dengan 1000+ produk, payment gateway aman, dan sistem manajemen inventory.', 'E-Commerce Website, Payment Gateway Integration, SEO Premium', '300% increase in online sales | 5000+ monthly visitors | 95% customer satisfaction', 'Peningkatan penjualan online 300% | 5000+ pengunjung bulanan | 95% kepuasan customer', 'portfolio-fashion-thumb.jpg', 'portfolio-fashion-full.jpg', 'https://demo.fashionhub.example.com', 1, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(2, 'TasteHub Restaurant Booking', 'tastehub-restaurant-booking', 'TasteHub Jakarta', 'Web Application', 'Food & Beverage', 'Custom booking system for restaurant chain with real-time table availability, menu display, and customer reviews.', 'Sistem booking custom untuk chain restaurant dengan ketersediaan meja real-time, tampilan menu, dan review customer.', 'Custom Web Application, Online Booking System, Google Analytics Setup', '80% reduction in phone bookings | 200+ daily reservations | 4.8/5 customer rating', 'Pengurangan 80% booking via telepon | 200+ reservasi harian | Rating customer 4.8/5', 'portfolio-restaurant-thumb.jpg', 'portfolio-restaurant-full.jpg', 'https://demo.tastehub.example.com', 1, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(3, 'TechCorp Corporate Website', 'techcorp-corporate-website', 'TechCorp Solutions', 'Company Profile', 'Technology', 'Professional corporate website showcasing company services, team, and portfolio with modern design and smooth animations.', 'Website corporate profesional yang showcase layanan perusahaan, tim, dan portfolio dengan desain modern dan animasi smooth.', 'Company Profile Website, Brand Identity Design, SEO Basic', '500+ monthly leads | 70% bounce rate reduction | 40+ partnership inquiries', '500+ leads bulanan | Pengurangan bounce rate 70% | 40+ inquiry partnership', 'portfolio-corporate-thumb.jpg', 'portfolio-corporate-full.jpg', 'https://demo.techcorp.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(4, 'HealthCare Plus Clinic', 'healthcare-plus-clinic', 'HealthCare Plus', 'Medical Website', 'Healthcare', 'Healthcare website with online appointment booking, doctor profiles, and patient testimonials.', 'Website healthcare dengan booking appointment online, profil dokter, dan testimonial pasien.', 'Landing Page Website, Online Booking System, Google My Business Setup', '150+ weekly appointments | 90% online booking rate | 4.9/5 patient satisfaction', '150+ appointment mingguan | 90% tingkat booking online | 4.9/5 kepuasan pasien', 'portfolio-medical-thumb.jpg', 'portfolio-medical-full.jpg', 'https://demo.healthcareplus.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(5, 'PropEstate Listings', 'propestate-listings', 'PropEstate Agency', 'Real Estate Platform', 'Real Estate', 'Property listing platform with advanced search filters, virtual tours, and agent dashboard.', 'Platform listing properti dengan filter pencarian advanced, virtual tour, dan dashboard agent.', 'Custom Web Application, Custom Dashboard, SEO Premium', '1000+ property listings | 300+ monthly inquiries | 50+ successful transactions', '1000+ listing properti | 300+ inquiry bulanan | 50+ transaksi sukses', 'portfolio-property-thumb.jpg', 'portfolio-property-full.jpg', 'https://demo.propestate.example.com', 1, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(6, 'EduLearn Online Platform', 'edulearn-online-platform', 'EduLearn Academy', 'E-Learning', 'Education', 'Online learning platform with course management, video streaming, and student progress tracking.', 'Platform pembelajaran online dengan manajemen kursus, streaming video, dan tracking progress siswa.', 'Custom Web Application, Payment Gateway Integration, Content Management', '5000+ enrolled students | 100+ courses | 4.7/5 average course rating', '5000+ siswa terdaftar | 100+ kursus | Rating rata-rata kursus 4.7/5', 'portfolio-education-thumb.jpg', 'portfolio-education-full.jpg', 'https://demo.edulearn.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(7, 'FitZone Gym & Fitness', 'fitzone-gym-fitness', 'FitZone Indonesia', 'Fitness Website', 'Health & Fitness', 'Dynamic fitness center website with membership plans, class schedules, and trainer profiles.', 'Website fitness center dinamis dengan paket membership, jadwal kelas, dan profil trainer.', 'Website Development, Online Booking System, Social Media Management', '200+ new memberships | 90% class occupancy rate | 80% retention rate', '200+ membership baru | 90% tingkat okupansi kelas | 80% tingkat retensi', 'portfolio-fitness-thumb.jpg', 'portfolio-fitness-full.jpg', 'https://demo.fitzone.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(8, 'GlowUp Beauty Salon', 'glowup-beauty-salon', 'GlowUp Beauty', 'Salon Website', 'Beauty & Wellness', 'Beauty salon website with online appointment booking, service catalog, and before-after gallery.', 'Website salon kecantikan dengan booking appointment online, katalog layanan, dan galeri before-after.', 'Landing Page Website, Online Booking System, Instagram Integration', '100+ weekly bookings | 85% online conversion | 300+ Instagram followers growth', '100+ booking mingguan | 85% konversi online | Pertumbuhan 300+ follower Instagram', 'portfolio-beauty-thumb.jpg', 'portfolio-beauty-full.jpg', 'https://demo.glowup.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(9, 'AutoPrime Car Dealer', 'autoprime-car-dealer', 'AutoPrime Motors', 'Automotive Website', 'Automotive', 'Car dealership website with inventory management, test drive booking, and financing calculator.', 'Website dealer mobil dengan manajemen inventory, booking test drive, dan kalkulator financing.', 'E-Commerce Website, Custom Calculator, CRM System Integration', '50+ monthly sales | 500+ test drive requests | 40% financing conversion', '50+ penjualan bulanan | 500+ request test drive | 40% konversi financing', 'portfolio-automotive-thumb.jpg', 'portfolio-automotive-full.jpg', 'https://demo.autoprime.example.com', 1, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51'),
(10, 'LegalPro Law Firm', 'legalpro-law-firm', 'LegalPro Associates', 'Law Firm Website', 'Legal Services', 'Professional law firm website with attorney profiles, case studies, and free consultation booking.', 'Website firma hukum profesional dengan profil attorney, case studies, dan booking konsultasi gratis.', 'Company Profile Website, Online Booking System, SEO Basic', '100+ monthly consultations | 70% client conversion | 20+ partnership referrals', '100+ konsultasi bulanan | 70% konversi klien | 20+ referral partnership', 'portfolio-legal-thumb.jpg', 'portfolio-legal-full.jpg', 'https://demo.legalpro.example.com', 0, 1, 0, '2025-10-14 12:25:51', '2025-10-14 12:25:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `freelancer_id` int(11) DEFAULT NULL,
  `project_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('assigned','in_progress','review','revision','completed','cancelled') DEFAULT 'assigned',
  `progress_percentage` int(11) DEFAULT 0,
  `admin_commission` decimal(15,2) DEFAULT 0.00,
  `freelancer_earning` decimal(15,2) DEFAULT 0.00,
  `is_paid_to_freelancer` tinyint(1) DEFAULT 0,
  `paid_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_files`
--

CREATE TABLE `project_files` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` bigint(20) DEFAULT 0,
  `file_type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_milestones`
--

CREATE TABLE `project_milestones` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description_en` varchar(255) DEFAULT NULL,
  `description_id` varchar(255) DEFAULT NULL,
  `discount_type` enum('percentage','fixed') DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `code`, `description_en`, `description_id`, `discount_type`, `discount_value`, `min_order_amount`, `max_discount_amount`, `usage_limit`, `used_count`, `valid_from`, `valid_until`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(9, 'WELCOME10', 'Welcome discount for new clients - Get 10% off on your first order!', 'Diskon selamat datang untuk klien baru - Dapetin diskon 10% untuk order pertama!', 'percentage', 10.00, 3000000.00, 2000000.00, 100, 0, '2025-10-14 16:15:57', '2026-04-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(10, 'BUNDLE20', 'Special discount for bundling packages - Save 20% when you choose any bundling package!', 'Diskon spesial untuk paket bundling - Hemat 20% kalau kamu pilih paket bundling apapun!', 'percentage', 20.00, 10000000.00, 10000000.00, 50, 0, '2025-10-14 16:15:57', '2026-04-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(11, 'LOYAL25', 'Loyalty reward for returning clients - Thank you for trusting us again! Get 25% off!', 'Reward loyalitas untuk klien yang kembali - Terima kasih sudah percaya lagi! Dapetin diskon 25%!', 'percentage', 25.00, 15000000.00, 12000000.00, 30, 0, '2025-10-14 16:15:57', '2026-10-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(12, 'LAUNCH50', 'LIMITED TIME! Grand launch special - Massive 50% discount for early adopters!', 'WAKTU TERBATAS! Promo peluncuran spesial - Diskon GEDE 50% untuk early adopters!', 'percentage', 50.00, 25000000.00, 20000000.00, 20, 0, '2025-10-14 16:15:57', '2025-11-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(13, 'REFERRAL15', 'Referral program discount - Get 15% off when you refer a friend or get referred!', 'Diskon program referral - Dapetin diskon 15% kalau kamu refer temen atau direferensiin!', 'percentage', 15.00, 5000000.00, 5000000.00, NULL, 0, '2025-10-14 16:15:57', '2026-10-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(14, 'NEWYEAR2025', 'New Year Special 2025 - Start your digital journey with 30% discount!', 'Spesial Tahun Baru 2025 - Mulai perjalanan digital kamu dengan diskon 30%!', 'percentage', 30.00, 10000000.00, 15000000.00, 50, 0, '2025-01-01 00:00:00', '2025-01-31 00:00:00', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(15, 'ECOMMERCE35', 'E-Commerce Package Special - Exclusive 35% off for all e-commerce services!', 'Spesial Paket E-Commerce - Diskon eksklusif 35% untuk semua layanan e-commerce!', 'percentage', 35.00, 20000000.00, 15000000.00, 25, 0, '2025-10-14 16:15:57', '2026-01-14 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57'),
(16, 'FLASH5M', 'FLASH DEAL! Flat Rp 5.000.000 off for orders above Rp 50 million - Limited to 10 users only!', 'FLASH DEAL! Potongan flat Rp 5.000.000 untuk order di atas 50 juta - Terbatas 10 user aja!', 'fixed', 5000000.00, 50000000.00, 5000000.00, 10, 0, '2025-10-14 16:15:57', '2025-10-28 16:15:57', 1, NULL, '2025-10-14 09:15:57', '2025-10-14 09:15:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `freelancer_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `is_featured` tinyint(1) DEFAULT 0,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_id` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description_en` text NOT NULL,
  `description_id` text NOT NULL,
  `features_en` text DEFAULT NULL,
  `features_id` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `delivery_days` int(11) DEFAULT 7,
  `revision_count` int(11) DEFAULT 3,
  `icon` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_popular` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `total_orders` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT INTO `services` (`id`, `category_id`, `name_en`, `name_id`, `slug`, `description_en`, `description_id`, `features_en`, `features_id`, `base_price`, `delivery_days`, `revision_count`, `icon`, `image`, `is_popular`, `is_active`, `total_orders`, `created_at`, `updated_at`) VALUES
(1, 1, 'Landing Page Website', 'Landing Page Website', 'landing-page-website', 'Simple one-page website perfect for product launch or campaign. Clean, fast, and optimized for conversion.', 'Website satu halaman yang cocok buat launching produk atau campaign. Simpel, cepat, dan dioptimasi buat konversi.', 'Responsive design (mobile & desktop)|SEO friendly|Fast loading|Contact form integrated|Free 1 month support', 'Desain responsive (HP & laptop)|SEO friendly|Loading cepat|Form kontak terintegrasi|Gratis support 1 bulan', 3500000.00, 7, 3, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(2, 1, 'E-Commerce Website', 'Website Toko Online', 'ecommerce-website', 'Complete online store with shopping cart, payment gateway, and order management. Start selling online today!', 'Toko online lengkap dengan keranjang belanja, payment gateway, dan manajemen pesanan. Mulai jualan online sekarang!', 'Product catalog unlimited|Shopping cart|Payment gateway (Midtrans/Xendit)|Order management|Customer dashboard|Admin panel|Mobile responsive', 'Katalog produk unlimited|Keranjang belanja|Payment gateway (Midtrans/Xendit)|Manajemen pesanan|Dashboard customer|Panel admin|Mobile responsive', 15000000.00, 21, 5, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(3, 1, 'Custom Web Application', 'Aplikasi Web Custom', 'custom-web-app', 'Tailor-made web application built specifically for your business needs. Scalable and secure.', 'Aplikasi web yang dibuat khusus sesuai kebutuhan bisnis kamu. Bisa dikembangin dan aman.', 'Custom features as needed|Database design|User authentication|Role-based access|API integration|Scalable architecture|Free 3 months support', 'Fitur custom sesuai kebutuhan|Desain database|Autentikasi user|Akses berbasis role|Integrasi API|Arsitektur scalable|Gratis support 3 bulan', 25000000.00, 30, 10, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(4, 1, 'Website Maintenance Package', 'Paket Pemeliharaan Website', 'website-maintenance', 'Monthly website maintenance to keep your site running smooth, secure, and up-to-date.', 'Pemeliharaan website bulanan supaya website kamu tetap lancar, aman, dan update.', 'Regular backup|Security monitoring|Bug fixes|Content updates|Performance optimization|Monthly report', 'Backup rutin|Monitoring keamanan|Perbaikan bug|Update konten|Optimasi performa|Laporan bulanan', 1500000.00, 30, 0, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(5, 1, 'Website Audit & Review', 'Audit & Review Website', 'website-audit', 'Complete website audit covering SEO, performance, security, and user experience with actionable recommendations.', 'Audit website lengkap mencakup SEO, performa, keamanan, dan user experience dengan rekomendasi yang bisa langsung dijalanin.', 'SEO analysis|Performance testing|Security check|UX/UI review|Competitor analysis|Detailed report with recommendations', 'Analisis SEO|Testing performa|Cek keamanan|Review UX/UI|Analisis kompetitor|Laporan detail dengan rekomendasi', 2500000.00, 5, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(6, 2, 'SEO Basic Package', 'Paket SEO Basic', 'seo-basic', 'Essential SEO optimization to get your website found on Google. Perfect for small businesses starting out.', 'Optimasi SEO dasar supaya website kamu ketemu di Google. Cocok buat bisnis kecil yang baru mulai.', 'Keyword research (10 keywords)|On-page SEO optimization|Meta tags optimization|Sitemap & robots.txt setup|Google Search Console setup|Monthly report', 'Riset keyword (10 kata kunci)|Optimasi SEO on-page|Optimasi meta tags|Setup sitemap & robots.txt|Setup Google Search Console|Laporan bulanan', 3500000.00, 14, 2, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(7, 2, 'SEO Premium Package', 'Paket SEO Premium', 'seo-premium', 'Comprehensive SEO strategy with link building, content optimization, and ongoing monitoring for serious growth.', 'Strategi SEO lengkap dengan link building, optimasi konten, dan monitoring berkelanjutan buat pertumbuhan serius.', 'Keyword research (50 keywords)|Complete on-page SEO|Technical SEO audit|Link building strategy|Content optimization|Competitor analysis|Google My Business optimization|Monthly performance report', 'Riset keyword (50 kata kunci)|SEO on-page lengkap|Audit SEO teknis|Strategi link building|Optimasi konten|Analisis kompetitor|Optimasi Google My Business|Laporan performa bulanan', 8500000.00, 30, 5, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(8, 2, 'SEO Article Writing', 'Penulisan Artikel SEO', 'seo-article', 'High-quality SEO-optimized articles written by professionals. Each article 800-1000 words, original, and Google-friendly.', 'Artikel SEO berkualitas tinggi ditulis oleh profesional. Setiap artikel 800-1000 kata, original, dan Google-friendly.', '800-1000 words per article|Keyword optimization|Catchy title & meta description|Internal linking|Image suggestions|100% original (plagiarism-free)|SEO-friendly formatting', '800-1000 kata per artikel|Optimasi keyword|Judul & meta description menarik|Internal linking|Saran gambar|100% original (bebas plagiarisme)|Format SEO-friendly', 500000.00, 3, 2, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(9, 2, 'Google My Business Setup', 'Setup Google My Business', 'google-my-business', 'Complete Google My Business setup and optimization to increase local visibility and attract nearby customers.', 'Setup dan optimasi Google My Business lengkap supaya bisnis kamu muncul di pencarian lokal dan dapet customer terdekat.', 'GMB account creation|Business info optimization|Photos & videos upload|Posts scheduling|Review management setup|Local SEO optimization', 'Pembuatan akun GMB|Optimasi info bisnis|Upload foto & video|Penjadwalan postingan|Setup manajemen review|Optimasi SEO lokal', 1500000.00, 5, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(10, 2, 'Professional Copywriting', 'Copywriting Profesional', 'copywriting', 'Persuasive copywriting for sales pages, email campaigns, and ads that convert visitors into customers.', 'Copywriting persuasif buat sales page, email campaign, dan iklan yang mengubah pengunjung jadi customer.', 'Sales page copy|Email sequence (5 emails)|Ad copy (Google & Meta)|Landing page copy|Call-to-action optimization|A/B testing suggestions', 'Copy sales page|Sequence email (5 email)|Copy iklan (Google & Meta)|Copy landing page|Optimasi call-to-action|Saran A/B testing', 2500000.00, 7, 3, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(11, 3, 'Google Ads Management', 'Manajemen Google Ads', 'google-ads', 'Professional Google Ads campaign setup and management to drive targeted traffic and increase sales.', 'Setup dan manajemen kampanye Google Ads profesional buat dapetin traffic tertarget dan ningkatin penjualan.', 'Campaign strategy & setup|Keyword research & selection|Ad copywriting|Budget optimization|Daily monitoring|Conversion tracking setup|Monthly performance report', 'Strategi & setup kampanye|Riset & seleksi keyword|Copywriting iklan|Optimasi budget|Monitoring harian|Setup tracking konversi|Laporan performa bulanan', 5000000.00, 14, 3, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(12, 3, 'Meta Ads Management', 'Manajemen Meta Ads', 'meta-ads', 'Facebook and Instagram advertising campaigns with precise targeting to reach your ideal customers.', 'Kampanye iklan Facebook dan Instagram dengan targeting presisi buat nyampein ke customer ideal kamu.', 'Campaign strategy & setup|Audience research & targeting|Ad creative design|A/B testing|Daily monitoring & optimization|Pixel setup|Monthly performance report', 'Strategi & setup kampanye|Riset & targeting audiens|Desain creative iklan|A/B testing|Monitoring & optimasi harian|Setup pixel|Laporan performa bulanan', 5000000.00, 14, 3, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(13, 3, 'TikTok Ads Management', 'Manajemen TikTok Ads', 'tiktok-ads', 'TikTok advertising campaigns designed to go viral and reach younger audience effectively.', 'Kampanye iklan TikTok yang dirancang supaya viral dan nyampein ke audiens muda dengan efektif.', 'Campaign strategy & setup|Trending content analysis|Video ad creative|Audience targeting|Hashtag strategy|Daily monitoring|Monthly performance report', 'Strategi & setup kampanye|Analisis konten trending|Creative video iklan|Targeting audiens|Strategi hashtag|Monitoring harian|Laporan performa bulanan', 4500000.00, 14, 3, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(14, 3, 'Ads Report & Analysis', 'Laporan & Analisis Iklan', 'ads-report-analysis', 'Comprehensive monthly advertising report with insights and recommendations to improve campaign performance.', 'Laporan iklan bulanan lengkap dengan insight dan rekomendasi buat ningkatin performa kampanye.', 'All platforms analysis (Google, Meta, TikTok)|Performance metrics|ROI calculation|Audience insights|Competitor benchmarking|Optimization recommendations|Visual dashboard', 'Analisis semua platform (Google, Meta, TikTok)|Metrik performa|Kalkulasi ROI|Insight audiens|Benchmarking kompetitor|Rekomendasi optimasi|Dashboard visual', 2000000.00, 7, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(15, 4, 'AI Chatbot Integration', 'Integrasi Chatbot AI', 'chatbot-ai', 'Smart AI chatbot for your website to answer customer questions 24/7 automatically.', 'Chatbot AI pintar buat website kamu yang bisa jawab pertanyaan customer 24/7 otomatis.', 'Custom AI training with your data|Natural conversation flow|Multi-language support|Integration with website|WhatsApp integration (optional)|Analytics dashboard|Unlimited messages', 'Training AI custom dengan data kamu|Alur percakapan natural|Support multi-bahasa|Integrasi dengan website|Integrasi WhatsApp (opsional)|Dashboard analytics|Pesan unlimited', 8500000.00, 14, 5, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(16, 4, 'WhatsApp Blast Service', 'Layanan WhatsApp Blast', 'whatsapp-blast', 'Bulk WhatsApp messaging service to reach thousands of customers instantly with personalized messages.', 'Layanan kirim pesan WhatsApp massal buat nyampein ke ribuan customer sekaligus dengan pesan yang dipersonalisasi.', 'Up to 10,000 messages|Contact management|Message personalization|Image & document support|Schedule sending|Delivery report|Anti-banned system', 'Hingga 10.000 pesan|Manajemen kontak|Personalisasi pesan|Support gambar & dokumen|Jadwal pengiriman|Laporan pengiriman|Sistem anti-banned', 3500000.00, 7, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(17, 4, 'CRM System Implementation', 'Implementasi Sistem CRM', 'crm-system', 'Complete Customer Relationship Management system to organize contacts, track sales, and manage customer interactions.', 'Sistem Customer Relationship Management lengkap buat ngatur kontak, tracking penjualan, dan kelola interaksi customer.', 'Contact management|Sales pipeline tracking|Task & reminder automation|Email integration|WhatsApp integration|Reporting & analytics|Mobile app access|Free training', 'Manajemen kontak|Tracking pipeline penjualan|Otomasi task & reminder|Integrasi email|Integrasi WhatsApp|Reporting & analytics|Akses mobile app|Training gratis', 15000000.00, 30, 10, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(18, 5, 'Professional Logo Design', 'Desain Logo Profesional', 'logo-design', 'Unique and memorable logo design that represents your brand identity perfectly.', 'Desain logo unik dan memorable yang merepresentasikan identitas brand kamu dengan sempurna.', '3 initial concepts|Unlimited revisions|Vector files (AI, EPS, SVG)|High-res PNG & JPG|Black & white version|Social media sizes|Brand guideline basics', '3 konsep awal|Revisi unlimited|File vektor (AI, EPS, SVG)|PNG & JPG resolusi tinggi|Versi hitam putih|Ukuran media sosial|Panduan brand dasar', 2500000.00, 7, 999, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(19, 5, 'Brochure Design', 'Desain Brosur', 'brochure-design', 'Professional brochure design for print or digital use. Perfect for showcasing your products and services.', 'Desain brosur profesional buat cetak atau digital. Sempurna buat showcase produk dan layanan kamu.', 'Up to 6 pages (tri-fold)|2 design concepts|Print-ready files|Editable source file|Free stock images|2 revisions', 'Hingga 6 halaman (tri-fold)|2 konsep desain|File siap cetak|File source editable|Gambar stock gratis|2 revisi', 1500000.00, 7, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(20, 6, 'Google Analytics 4 Setup', 'Setup Google Analytics 4', 'google-analytics-4', 'Complete Google Analytics 4 setup and configuration to track your website performance accurately.', 'Setup dan konfigurasi Google Analytics 4 lengkap buat tracking performa website kamu dengan akurat.', 'GA4 account creation|Property & stream setup|Event tracking configuration|Conversion tracking|E-commerce tracking (if applicable)|Custom dashboard|Training session', 'Pembuatan akun GA4|Setup property & stream|Konfigurasi event tracking|Tracking konversi|Tracking e-commerce (jika ada)|Dashboard custom|Sesi training', 2500000.00, 5, 2, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(21, 6, 'Conversion Tracking Setup', 'Setup Tracking Konversi', 'conversion-tracking', 'Complete conversion tracking setup for all your marketing campaigns to measure ROI accurately.', 'Setup tracking konversi lengkap buat semua kampanye marketing kamu supaya bisa ukur ROI dengan akurat.', 'Google Ads conversion tracking|Meta Pixel setup|TikTok Pixel setup|GA4 conversion events|Thank you page setup|Testing & verification|Documentation', 'Tracking konversi Google Ads|Setup Meta Pixel|Setup TikTok Pixel|Event konversi GA4|Setup halaman thank you|Testing & verifikasi|Dokumentasi', 2000000.00, 5, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(22, 7, 'Domain & Hosting Package', 'Paket Domain & Hosting', 'domain-hosting', 'Complete domain registration and reliable hosting package to keep your website running 24/7.', 'Paket registrasi domain dan hosting handal buat jaga website kamu tetap online 24/7.', 'Domain registration (.com, .id, .my.id)|SSL certificate (HTTPS)|10GB SSD storage|Unlimited bandwidth|Email accounts|cPanel access|Daily backup|99.9% uptime guarantee', 'Registrasi domain (.com, .id, .my.id)|Sertifikat SSL (HTTPS)|Storage SSD 10GB|Bandwidth unlimited|Akun email|Akses cPanel|Backup harian|Garansi uptime 99.9%', 1200000.00, 2, 0, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(23, 8, 'Custom Dashboard Development', 'Pengembangan Dashboard Custom', 'custom-dashboard', 'Tailor-made business dashboard to monitor your KPIs, analytics, and operations in real-time.', 'Dashboard bisnis yang dibuat khusus buat monitor KPI, analytics, dan operasional kamu secara real-time.', 'Custom metrics & KPIs|Real-time data visualization|User role management|Data export (Excel, PDF)|Mobile responsive|API integration|Free training', 'Metrik & KPI custom|Visualisasi data real-time|Manajemen role user|Export data (Excel, PDF)|Mobile responsive|Integrasi API|Training gratis', 12000000.00, 21, 5, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(24, 8, 'Payment Gateway Integration', 'Integrasi Payment Gateway', 'payment-gateway', 'Seamless payment gateway integration for your website to accept online payments securely.', 'Integrasi payment gateway mulus buat website kamu supaya bisa terima pembayaran online dengan aman.', 'Midtrans or Xendit integration|Multiple payment methods (Bank Transfer, E-Wallet, Credit Card)|Payment confirmation automation|Invoice generation|Refund system|Transaction report|Testing & go-live support', 'Integrasi Midtrans atau Xendit|Metode pembayaran multiple (Transfer Bank, E-Wallet, Kartu Kredit)|Otomasi konfirmasi pembayaran|Generasi invoice|Sistem refund|Laporan transaksi|Testing & support go-live', 5000000.00, 10, 3, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(25, 8, 'Online Booking System', 'Sistem Booking Online', 'booking-system', 'Complete online booking system for appointments, reservations, or schedule management.', 'Sistem booking online lengkap buat appointment, reservasi, atau manajemen jadwal.', 'Calendar integration|Availability management|Email & WhatsApp notifications|Customer management|Payment integration|Admin dashboard|SMS reminder (optional)', 'Integrasi kalender|Manajemen ketersediaan|Notifikasi email & WhatsApp|Manajemen customer|Integrasi pembayaran|Dashboard admin|Reminder SMS (opsional)', 8500000.00, 14, 5, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(26, 9, 'Privacy Policy & Terms Creation', 'Pembuatan Privacy Policy & Terms', 'privacy-policy-creation', 'Professional privacy policy and terms of service documents for your website, fully compliant with regulations.', 'Dokumen privacy policy dan terms of service profesional buat website kamu, sesuai regulasi yang berlaku.', 'Privacy Policy document|Terms & Conditions document|Cookie Policy (if needed)|GDPR compliant|Customized for your business|Editable format|Legal consultation', 'Dokumen Privacy Policy|Dokumen Terms & Conditions|Cookie Policy (jika perlu)|Sesuai GDPR|Disesuaikan dengan bisnis kamu|Format editable|Konsultasi legal', 2500000.00, 7, 2, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(27, 9, 'NIB Business Registration', 'Pendaftaran NIB Usaha', 'nib-registration', 'Complete NIB (Nomor Induk Berusaha) registration service for your business legalization in Indonesia.', 'Layanan pendaftaran NIB (Nomor Induk Berusaha) lengkap buat legalisasi bisnis kamu di Indonesia.', 'NIB registration process|Document preparation|OSS system handling|Certificate acquisition|Follow-up support|Digital certificate|Consultation included', 'Proses pendaftaran NIB|Persiapan dokumen|Pengurusan sistem OSS|Perolehan sertifikat|Support follow-up|Sertifikat digital|Konsultasi included', 3500000.00, 14, 0, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(28, 10, 'Social Media Management', 'Manajemen Media Sosial', 'social-media-management', 'Complete social media management for Instagram, Facebook, TikTok, and Twitter to grow your online presence.', 'Manajemen media sosial lengkap buat Instagram, Facebook, TikTok, dan Twitter supaya kehadiran online kamu makin berkembang.', '20 posts per month|Content planning & calendar|Graphic design|Caption writing|Hashtag research|Posting schedule|Community management|Monthly report', '20 postingan per bulan|Perencanaan konten & kalender|Desain grafis|Penulisan caption|Riset hashtag|Jadwal posting|Manajemen komunitas|Laporan bulanan', 4500000.00, 30, 5, NULL, NULL, 1, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29'),
(29, 10, 'Content Creator Service', 'Layanan Content Creator', 'content-creator', 'Professional content creation service including photography, videography, and editing for your social media.', 'Layanan pembuatan konten profesional termasuk fotografi, videografi, dan editing buat media sosial kamu.', '1 day shooting session|20 photos (edited)|3 short videos (15-60 seconds)|Professional equipment|Location flexibility|Raw files included|Social media ready format', '1 hari sesi shooting|20 foto (edited)|3 video pendek (15-60 detik)|Equipment profesional|Fleksibilitas lokasi|File raw included|Format siap media sosial', 5000000.00, 7, 3, NULL, NULL, 0, 1, 0, '2025-10-14 09:09:29', '2025-10-14 09:09:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_id` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_id` text DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `service_categories`
--

INSERT INTO `service_categories` (`id`, `name_en`, `name_id`, `slug`, `icon`, `description_en`, `description_id`, `display_order`, `is_active`, `created_at`) VALUES
(1, 'Website Development', 'Pengembangan Website', 'website', 'fa-laptop-code', 'Professional website development services from landing page to complex web applications', 'Layanan pengembangan website profesional dari landing page hingga aplikasi web kompleks', 1, 1, '2025-10-14 09:09:29'),
(2, 'SEO & Marketing', 'SEO & Pemasaran', 'seo-marketing', 'fa-search', 'Search engine optimization and digital marketing services to boost your online presence', 'Layanan optimasi mesin pencari dan pemasaran digital untuk meningkatkan kehadiran online Anda', 2, 1, '2025-10-14 09:09:29'),
(3, 'Digital Advertising', 'Iklan Digital', 'digital-ads', 'fa-bullhorn', 'Effective digital advertising campaigns on Google, Facebook, Instagram, and TikTok', 'Kampanye iklan digital efektif di Google, Facebook, Instagram, dan TikTok', 3, 1, '2025-10-14 09:09:29'),
(4, 'Automation & AI', 'Otomasi & AI', 'automation-ai', 'fa-robot', 'Business automation and AI-powered solutions to streamline your operations', 'Otomasi bisnis dan solusi berbasis AI untuk efisienkan operasional Anda', 4, 1, '2025-10-14 09:09:29'),
(5, 'Design Services', 'Layanan Desain', 'design', 'fa-palette', 'Creative design services for branding, logo, and marketing materials', 'Layanan desain kreatif untuk branding, logo, dan materi marketing', 5, 1, '2025-10-14 09:09:29'),
(6, 'Analytics & Tracking', 'Analytics & Tracking', 'analytics', 'fa-chart-line', 'Website analytics and conversion tracking to measure your success', 'Analytics website dan tracking konversi untuk mengukur kesuksesan Anda', 6, 1, '2025-10-14 09:09:29'),
(7, 'Hosting & Maintenance', 'Hosting & Pemeliharaan', 'hosting', 'fa-server', 'Reliable hosting and website maintenance services', 'Layanan hosting dan pemeliharaan website yang handal', 7, 1, '2025-10-14 09:09:29'),
(8, 'Dashboard & Systems', 'Dashboard & Sistem', 'dashboard-systems', 'fa-tachometer-alt', 'Custom dashboard and business management systems', 'Dashboard custom dan sistem manajemen bisnis', 8, 1, '2025-10-14 09:09:29'),
(9, 'Legal Services', 'Layanan Legal', 'legal', 'fa-gavel', 'Legal documentation and business registration services', 'Layanan dokumentasi legal dan pendaftaran bisnis', 9, 1, '2025-10-14 09:09:29'),
(10, 'Social Media', 'Media Sosial', 'social-media', 'fa-share-alt', 'Social media management and content creation services', 'Layanan manajemen media sosial dan pembuatan konten', 10, 1, '2025-10-14 09:09:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_type` varchar(50) DEFAULT 'text',
  `description` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `site_settings`
--

INSERT INTO `site_settings` (`id`, `setting_key`, `setting_value`, `setting_type`, `description`, `updated_at`) VALUES
(1, 'site_name', 'Situneo Digital', 'text', 'Website name', '2025-10-14 09:18:03'),
(2, 'site_tagline', 'Digital Harmony', 'text', 'Website tagline', '2025-10-14 09:18:03'),
(3, 'site_description', 'Professional digital agency providing web development, SEO, digital marketing, and creative solutions to help your business grow in the digital era.', 'text', 'Website description for SEO', '2025-10-14 09:18:03'),
(4, 'company_email', 'vins@situneo.my.id', 'email', 'Primary company email', '2025-10-14 09:18:03'),
(5, 'support_email', 'support@situneo.my.id', 'email', 'Support email', '2025-10-14 09:18:03'),
(6, 'company_phone', '+62 831-7386-8915', 'text', 'Company phone number (formatted)', '2025-10-14 09:18:03'),
(7, 'company_phone_raw', '6283173868915', 'text', 'Company phone number (no formatting)', '2025-10-14 09:18:03'),
(8, 'company_whatsapp', '6283173868915', 'text', 'WhatsApp number (without + or -)', '2025-10-14 09:18:03'),
(9, 'company_address', 'Jl. Raya Situneo No. 123, Jakarta Selatan', 'text', 'Company street address', '2025-10-14 09:18:03'),
(10, 'company_city', 'Jakarta Selatan', 'text', 'City', '2025-10-14 09:18:03'),
(11, 'company_province', 'DKI Jakarta', 'text', 'Province/State', '2025-10-14 09:18:03'),
(12, 'company_postal_code', '12345', 'text', 'Postal code', '2025-10-14 09:18:03'),
(13, 'company_country', 'Indonesia', 'text', 'Country', '2025-10-14 09:18:03'),
(14, 'company_nib', '20250-9261-4570-4515-5453', 'text', 'NIB (Nomor Induk Berusaha)', '2025-10-14 09:18:03'),
(15, 'company_legal_name', 'PT Situneo Digital Indonesia', 'text', 'Legal company name', '2025-10-14 09:18:03'),
(16, 'company_founded_year', '2024', 'number', 'Year company was founded', '2025-10-14 09:18:03'),
(17, 'facebook_url', 'https://facebook.com/situneodigital', 'url', 'Facebook page URL', '2025-10-14 09:18:03'),
(18, 'instagram_url', 'https://instagram.com/situneodigital', 'url', 'Instagram profile URL', '2025-10-14 09:18:03'),
(19, 'linkedin_url', 'https://linkedin.com/company/situneo-digital', 'url', 'LinkedIn company URL', '2025-10-14 09:18:03'),
(20, 'twitter_url', 'https://twitter.com/situneodigital', 'url', 'Twitter profile URL', '2025-10-14 09:18:03'),
(21, 'tiktok_url', 'https://tiktok.com/@situneodigital', 'url', 'TikTok profile URL', '2025-10-14 09:18:03'),
(22, 'youtube_url', 'https://youtube.com/@situneodigital', 'url', 'YouTube channel URL', '2025-10-14 09:18:03'),
(23, 'working_hours_weekday', 'Monday - Friday: 09:00 - 18:00', 'text', 'Working hours on weekdays', '2025-10-14 09:18:03'),
(24, 'working_hours_saturday', 'Saturday: 09:00 - 15:00', 'text', 'Working hours on Saturday', '2025-10-14 09:18:03'),
(25, 'working_hours_sunday', 'Sunday: Closed', 'text', 'Working hours on Sunday', '2025-10-14 09:18:03'),
(26, 'default_language', 'id', 'text', 'Default website language (id/en)', '2025-10-14 09:18:03'),
(27, 'dark_mode_enabled', '1', 'boolean', 'Enable dark mode toggle (1=yes, 0=no)', '2025-10-14 09:18:03'),
(28, 'maintenance_mode', '0', 'boolean', 'Maintenance mode status (1=on, 0=off)', '2025-10-14 09:18:03'),
(29, 'registration_enabled', '1', 'boolean', 'Allow user registration (1=yes, 0=no)', '2025-10-14 09:18:03'),
(30, 'ga4_measurement_id', 'G-XXXXXXXXXX', 'text', 'Google Analytics 4 Measurement ID (update nanti)', '2025-10-14 09:18:03'),
(31, 'gtm_id', 'GTM-XXXXXXX', 'text', 'Google Tag Manager ID (update nanti)', '2025-10-14 09:18:03'),
(32, 'admin_commission_percentage', '30', 'number', 'Admin commission percentage', '2025-10-14 09:18:03'),
(33, 'freelancer_commission_percentage', '70', 'number', 'Freelancer commission percentage', '2025-10-14 09:18:03'),
(34, 'payment_methods', 'bank_transfer,e_wallet,credit_card', 'text', 'Available payment methods (comma separated)', '2025-10-14 09:18:03'),
(35, 'bank_name_1', 'Bank BCA', 'text', 'Bank name 1', '2025-10-14 09:18:03'),
(36, 'bank_account_1', '1234567890', 'text', 'Bank account number 1', '2025-10-14 09:18:03'),
(37, 'bank_holder_1', 'PT Situneo Digital Indonesia', 'text', 'Bank account holder name 1', '2025-10-14 09:18:03'),
(38, 'bank_name_2', 'Bank Mandiri', 'text', 'Bank name 2', '2025-10-14 09:18:03'),
(39, 'bank_account_2', '0987654321', 'text', 'Bank account number 2', '2025-10-14 09:18:03'),
(40, 'bank_holder_2', 'PT Situneo Digital Indonesia', 'text', 'Bank account holder name 2', '2025-10-14 09:18:03'),
(41, 'smtp_host', 'mail.situneo.my.id', 'text', 'SMTP host (update sesuai hosting)', '2025-10-14 09:18:03'),
(42, 'smtp_port', '465', 'number', 'SMTP port (465 for SSL, 587 for TLS)', '2025-10-14 09:18:03'),
(43, 'smtp_encryption', 'ssl', 'text', 'SMTP encryption (ssl/tls)', '2025-10-14 09:18:03'),
(44, 'smtp_username', 'noreply@situneo.my.id', 'email', 'SMTP username', '2025-10-14 09:18:03'),
(45, 'smtp_password', '', 'password', 'SMTP password (leave empty for now)', '2025-10-14 09:18:03'),
(46, 'email_from_name', 'Situneo Digital', 'text', 'Email sender name', '2025-10-14 09:18:03'),
(47, 'meta_title', 'Situneo Digital - Professional Digital Agency Indonesia', 'text', 'Default meta title', '2025-10-14 09:18:03'),
(48, 'meta_description', 'Professional digital agency providing web development, mobile apps, SEO, digital marketing, and creative design services. Trusted by 500+ businesses in Indonesia.', 'text', 'Default meta description', '2025-10-14 09:18:03'),
(49, 'meta_keywords', 'digital agency, web development, SEO, digital marketing, Indonesia, Jakarta', 'text', 'Default meta keywords', '2025-10-14 09:18:03'),
(50, 'min_order_amount', '1000000', 'number', 'Minimum order amount (Rp)', '2025-10-14 09:18:03'),
(51, 'free_consultation', '1', 'boolean', 'Offer free consultation (1=yes, 0=no)', '2025-10-14 09:18:03'),
(52, 'project_estimate_hours', '24', 'number', 'Hours to provide project estimate', '2025-10-14 09:18:03'),
(53, 'response_time_hours', '2', 'number', 'Average response time in hours', '2025-10-14 09:18:03'),
(54, 'total_projects_completed', '500', 'number', 'Total projects completed (update manually)', '2025-10-14 09:18:03'),
(55, 'total_happy_clients', '300', 'number', 'Total happy clients (update manually)', '2025-10-14 09:18:03'),
(56, 'total_team_members', '25', 'number', 'Total team members', '2025-10-14 09:18:03'),
(57, 'years_of_experience', '5', 'number', 'Years of experience', '2025-10-14 09:18:03'),
(58, 'enable_chatbot', '1', 'boolean', 'Enable AI chatbot widget', '2025-10-14 09:18:03'),
(59, 'enable_whatsapp_widget', '1', 'boolean', 'Enable WhatsApp floating widget', '2025-10-14 09:18:03'),
(60, 'enable_newsletter', '1', 'boolean', 'Enable newsletter subscription', '2025-10-14 09:18:03'),
(61, 'enable_live_chat', '0', 'boolean', 'Enable live chat (Tawk.to, etc)', '2025-10-14 09:18:03'),
(62, 'privacy_policy_updated', '2025-10-14', 'date', 'Privacy policy last updated date', '2025-10-14 09:18:03'),
(63, 'terms_updated', '2025-10-14', 'date', 'Terms & conditions last updated date', '2025-10-14 09:18:03'),
(64, 'google_maps_latitude', '-6.200000', 'text', 'Latitude for Google Maps', '2025-10-14 09:18:03'),
(65, 'google_maps_longitude', '106.816666', 'text', 'Longitude for Google Maps', '2025-10-14 09:18:03'),
(66, 'google_maps_embed_url', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d253840.65788754277!2d106.68942999999999!3d-6.229386999999999', 'text', 'Google Maps embed URL', '2025-10-14 09:18:03'),
(67, 'currency_code', 'IDR', 'text', 'Currency code (IDR)', '2025-10-14 09:18:03'),
(68, 'currency_symbol', 'Rp', 'text', 'Currency symbol', '2025-10-14 09:18:03'),
(69, 'timezone', 'Asia/Jakarta', 'text', 'Server timezone', '2025-10-14 09:18:03'),
(70, 'last_backup_date', '2025-10-14 16:18:03', 'datetime', 'Last database backup date', '2025-10-14 09:18:03'),
(71, 'ssl_enabled', '1', 'boolean', 'SSL/HTTPS enabled', '2025-10-14 09:18:03'),
(72, 'two_factor_auth', '0', 'boolean', 'Two-factor authentication enabled (for future)', '2025-10-14 09:18:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `team_members`
--

CREATE TABLE `team_members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position_en` varchar(255) NOT NULL,
  `position_id` varchar(255) NOT NULL,
  `bio_en` text DEFAULT NULL,
  `bio_id` text DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `team_members`
--

INSERT INTO `team_members` (`id`, `name`, `position_en`, `position_id`, `bio_en`, `bio_id`, `photo`, `email`, `linkedin`, `instagram`, `twitter`, `specialization`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Vincent Setiawan', 'Founder & CEO', 'Pendiri & CEO', 'Visionary entrepreneur with 10+ years of experience in digital technology and business development. Founded Situneo Digital with a mission to help Indonesian businesses thrive in the digital era through innovative solutions and exceptional service.', 'Entrepreneur visioner dengan pengalaman 10+ tahun di bidang teknologi digital dan pengembangan bisnis. Mendirikan Situneo Digital dengan misi membantu bisnis Indonesia berkembang di era digital melalui solusi inovatif dan layanan exceptional.', 'team-vincent.jpg', 'vincent@situneo.my.id', 'https://linkedin.com/in/vincentsetiawan', 'https://instagram.com/vincentsetiawan', NULL, 'Leadership, Business Strategy, Digital Transformation', 1, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12'),
(2, 'Alexandra Chen', 'Chief Technology Officer', 'Chief Technology Officer', 'Technology leader with expertise in web development, cloud architecture, and AI integration. Alexandra leads our technical team to deliver cutting-edge solutions that exceed client expectations. Previously worked at leading tech companies in Singapore and Jakarta.', 'Pemimpin teknologi dengan keahlian dalam pengembangan web, arsitektur cloud, dan integrasi AI. Alexandra memimpin tim teknis kami untuk menghasilkan solusi terkini yang melebihi ekspektasi klien. Sebelumnya bekerja di perusahaan teknologi terkemuka di Singapura dan Jakarta.', 'team-alexandra.jpg', 'alexandra@situneo.my.id', 'https://linkedin.com/in/alexandrachen', 'https://instagram.com/alexchen', NULL, 'Full-Stack Development, Cloud Architecture, AI/ML', 2, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12'),
(3, 'Michael Rodriguez', 'Creative Director', 'Creative Director', 'Award-winning designer with a passion for creating memorable brand experiences. Michael brings 8 years of international design experience from New York and London, specializing in UI/UX design, branding, and visual storytelling that captivates audiences.', 'Designer pemenang award dengan passion menciptakan pengalaman brand yang memorable. Michael membawa pengalaman desain internasional 8 tahun dari New York dan London, spesialisasi dalam desain UI/UX, branding, dan visual storytelling yang memikat audiens.', 'team-michael.jpg', 'michael@situneo.my.id', 'https://linkedin.com/in/michaelrodriguez', 'https://instagram.com/mikerodriguez', NULL, 'UI/UX Design, Branding, Visual Design', 3, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12'),
(4, 'Sarah Williams', 'Head of Marketing', 'Head of Marketing', 'Digital marketing strategist with proven track record of growing businesses through data-driven campaigns. Sarah specializes in SEO, content marketing, and social media strategy. Her campaigns have generated millions in revenue for clients across various industries.', 'Ahli strategi digital marketing dengan track record terbukti mengembangkan bisnis melalui kampanye berbasis data. Sarah spesialisasi dalam SEO, content marketing, dan strategi media sosial. Kampanye-nya telah menghasilkan jutaan revenue untuk klien di berbagai industri.', 'team-sarah.jpg', 'sarah@situneo.my.id', 'https://linkedin.com/in/sarahwilliams', 'https://instagram.com/sarahwilliams', NULL, 'SEO, Content Marketing, Social Media Strategy', 4, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12'),
(5, 'David Kusuma', 'Project Manager', 'Manajer Proyek', 'Experienced project manager ensuring smooth delivery of projects on time and within budget. David excels at coordinating between clients, designers, and developers to bring visions to life. His attention to detail and communication skills keep projects running seamlessly.', 'Manajer proyek berpengalaman yang memastikan kelancaran penyampaian proyek tepat waktu dan sesuai budget. David unggul dalam koordinasi antara klien, designer, dan developer untuk mewujudkan visi. Perhatian detailnya dan skill komunikasi menjaga proyek berjalan seamless.', 'team-david.jpg', 'david@situneo.my.id', 'https://linkedin.com/in/davidkusuma', 'https://instagram.com/davidkusuma', NULL, 'Project Management, Agile, Client Relations', 5, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12'),
(6, 'Rina Wijaya', 'Lead Developer', 'Lead Developer', 'Full-stack developer with expertise in modern web technologies and frameworks. Rina leads our development team in building robust, scalable, and secure applications. She is passionate about clean code, best practices, and mentoring junior developers.', 'Full-stack developer dengan keahlian dalam teknologi dan framework web modern. Rina memimpin tim development kami dalam membangun aplikasi yang robust, scalable, dan secure. Dia passionate tentang clean code, best practices, dan mentoring developer junior.', 'team-rina.jpg', 'rina@situneo.my.id', 'https://linkedin.com/in/rinawijaya', 'https://instagram.com/rinawijaya', NULL, 'PHP, JavaScript, React, Node.js, Database Design', 6, 1, '2025-10-14 09:20:12', '2025-10-14 09:20:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','client','freelancer') NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expires` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `is_verified`, `verification_token`, `reset_token`, `reset_token_expires`, `is_active`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin@situneo.my.id', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, NULL, NULL, NULL, 1, NULL, '2025-10-14 09:27:08', '2025-10-14 09:27:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `analytics_events`
--
ALTER TABLE `analytics_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_name` (`event_name`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `case_studies`
--
ALTER TABLE `case_studies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_is_published` (`is_published`);

--
-- Indeks untuk tabel `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indeks untuk tabel `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_recipient_email` (`recipient_email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `freelancers`
--
ALTER TABLE `freelancers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_approved` (`is_approved`);

--
-- Indeks untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sender_id` (`sender_id`),
  ADD KEY `idx_receiver_id` (`receiver_id`),
  ADD KEY `idx_is_read` (`is_read`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `idx_order_number` (`order_number`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indeks untuk tabel `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_is_popular` (`is_popular`);

--
-- Indeks untuk tabel `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verified_by` (`verified_by`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `portfolio_items`
--
ALTER TABLE `portfolio_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_is_featured` (`is_featured`),
  ADD KEY `idx_is_published` (`is_published`);

--
-- Indeks untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_freelancer_id` (`freelancer_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`),
  ADD KEY `idx_project_id` (`project_id`);

--
-- Indeks untuk tabel `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_project_id` (`project_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indeks untuk tabel `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `idx_project_id` (`project_id`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_freelancer_id` (`freelancer_id`),
  ADD KEY `idx_is_approved` (`is_approved`),
  ADD KEY `idx_rating` (`rating`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_is_popular` (`is_popular`);

--
-- Indeks untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`);

--
-- Indeks untuk tabel `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `idx_setting_key` (`setting_key`);

--
-- Indeks untuk tabel `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_display_order` (`display_order`),
  ADD KEY `idx_is_active` (`is_active`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `analytics_events`
--
ALTER TABLE `analytics_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `case_studies`
--
ALTER TABLE `case_studies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `freelancers`
--
ALTER TABLE `freelancers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `portfolio_items`
--
ALTER TABLE `portfolio_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `analytics_events`
--
ALTER TABLE `analytics_events`
  ADD CONSTRAINT `analytics_events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `freelancers`
--
ALTER TABLE `freelancers`
  ADD CONSTRAINT `freelancers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_files_ibfk_2` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD CONSTRAINT `promo_codes_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`freelancer_id`) REFERENCES `freelancers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
