-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_api_project_movil_ii
CREATE DATABASE IF NOT EXISTS `db_api_project_movil_ii` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_api_project_movil_ii`;

-- Volcando estructura para tabla db_api_project_movil_ii.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.cache: ~0 rows (aproximadamente)
DELETE FROM `cache`;

-- Volcando estructura para tabla db_api_project_movil_ii.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.cache_locks: ~0 rows (aproximadamente)
DELETE FROM `cache_locks`;

-- Volcando estructura para tabla db_api_project_movil_ii.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;

-- Volcando estructura para tabla db_api_project_movil_ii.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.jobs: ~0 rows (aproximadamente)
DELETE FROM `jobs`;

-- Volcando estructura para tabla db_api_project_movil_ii.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.job_batches: ~0 rows (aproximadamente)
DELETE FROM `job_batches`;

-- Volcando estructura para tabla db_api_project_movil_ii.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.migrations: ~1 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_04_04_051610_create_personal_access_tokens_table', 1),
	(5, '2025_04_04_053410_create_projects_table', 2),
	(6, '2025_04_04_053411_create_tasks_table', 2),
	(7, '2025_04_04_053555_create_project_assignments_table', 3);

-- Volcando estructura para tabla db_api_project_movil_ii.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.password_reset_tokens: ~0 rows (aproximadamente)
DELETE FROM `password_reset_tokens`;

-- Volcando estructura para tabla db_api_project_movil_ii.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.personal_access_tokens: ~1 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'api-token', 'bbed79629bdaa08356c34bd008fb8265febd7eb20b492c8854fec1496836c08b', '["*"]', NULL, NULL, '2025-04-04 11:27:47', '2025-04-04 11:27:47'),
	(2, 'App\\Models\\User', 1, 'api-token', '2b1b3b56501f7c3febc11552be58addd267cadd1ba7277e0806a80d1c49e37be', '["*"]', NULL, NULL, '2025-04-04 11:32:06', '2025-04-04 11:32:06'),
	(3, 'App\\Models\\User', 1, 'api-token', '63bdaac449dc0af18e142d27166e925586414973d6c6f7bebd60c733bbb14fb5', '["*"]', '2025-04-04 13:46:07', NULL, '2025-04-04 12:34:23', '2025-04-04 13:46:07'),
	(4, 'App\\Models\\User', 2, 'api-token', '5b47239fd404cc7f260357080603eb07f66e8e4eae4d2d02302176b78944921f', '["*"]', '2025-04-04 13:14:40', NULL, '2025-04-04 13:14:06', '2025-04-04 13:14:40'),
	(5, 'App\\Models\\User', 2, 'api-token', 'e30a46dc2e1edd3b1dc3c44af567a33aed109f7ea2877996928fb3c352ee9028', '["*"]', '2025-04-04 13:44:20', NULL, '2025-04-04 13:42:14', '2025-04-04 13:44:20');

-- Volcando estructura para tabla db_api_project_movil_ii.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.projects: ~1 rows (aproximadamente)
DELETE FROM `projects`;
INSERT INTO `projects` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(2, 'Mi Segundo Proyecto', 'Descripción del proyecto Secundario', '2025-04-04 12:43:21', '2025-04-04 12:43:21'),
	(3, 'Mi Primer Proyecto', 'Descripción del proyecto Secundario', '2025-04-04 13:19:38', '2025-04-04 13:19:38'),
	(4, 'Mi Tercer Proyecto', 'Descripción del proyecto Secundario', '2025-04-04 13:19:49', '2025-04-04 13:19:49');

-- Volcando estructura para tabla db_api_project_movil_ii.project_assignments
CREATE TABLE IF NOT EXISTS `project_assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT '2025-04-04 11:36:27',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_assignments_project_id_user_id_unique` (`project_id`,`user_id`),
  KEY `project_assignments_user_id_foreign` (`user_id`),
  CONSTRAINT `project_assignments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.project_assignments: ~3 rows (aproximadamente)
DELETE FROM `project_assignments`;
INSERT INTO `project_assignments` (`id`, `project_id`, `user_id`, `assigned_at`, `created_at`, `updated_at`) VALUES
	(2, 2, 1, '2025-04-04 11:36:27', '2025-04-04 12:43:21', '2025-04-04 12:43:21'),
	(3, 3, 1, '2025-04-04 11:36:27', NULL, NULL),
	(4, 4, 1, '2025-04-04 11:36:27', NULL, NULL);

-- Volcando estructura para tabla db_api_project_movil_ii.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.sessions: ~1 rows (aproximadamente)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('GwAGeAEgXhWcO3JTyPjL6PYrUSj7Ffnmqz2FUgPO', NULL, '127.0.0.1', 'PostmanRuntime/7.43.3', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0JIZkh1WFo0R0RHeGx4MzA0YW05OGNNSDJURnhnNTVyYkhVVThxZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1743744319);

-- Volcando estructura para tabla db_api_project_movil_ii.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','In Progress','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.tasks: ~3 rows (aproximadamente)
DELETE FROM `tasks`;
INSERT INTO `tasks` (`id`, `project_id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 'Tarea actualizada 1', 'Descripción modificada', 'In Progress', '2025-04-04 13:32:14', '2025-04-04 13:33:35'),
	(2, 2, 'Nueva tarea de ejemplo 2', 'Esta es una tarea de prueba', 'Pending', '2025-04-04 13:32:21', '2025-04-04 13:32:21'),
	(4, 3, 'Nueva tarea de ejemplo 1', 'Esta es una tarea de prueba', 'Pending', '2025-04-04 13:32:34', '2025-04-04 13:32:34');

-- Volcando estructura para tabla db_api_project_movil_ii.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla db_api_project_movil_ii.users: ~2 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Usuario de prueba', 'test@example.com', NULL, '$2y$12$BIc2boued8OcnoVBWokO0esO761LULA1nWklcgFZ/9UEO3PTV1tMS', NULL, '2025-04-04 11:27:47', '2025-04-04 11:27:47'),
	(2, 'Usuario de prueba', 'test2@example.com', NULL, '$2y$12$Cavl2Kq8hWEW7xh5iT0KxuexbAoFGJtmPxh5Cx0yNOmDRfjUGMI1u', NULL, '2025-04-04 13:14:06', '2025-04-04 13:14:06');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
