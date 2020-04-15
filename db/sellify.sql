/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100129
 Source Host           : localhost:3306
 Source Schema         : sellify

 Target Server Type    : MySQL
 Target Server Version : 100129
 File Encoding         : 65001

 Date: 02/09/2019 21:35:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (15, 'Electronics', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (16, 'Clothes', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (17, 'Perfumes', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (18, 'Software', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (19, 'Automobiles', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (20, 'Health & Beauty', '', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `categories` VALUES (21, 'Home & Garden', '', '0', '2019-06-23 08:19:05', NULL);

-- ----------------------------
-- Table structure for category_type
-- ----------------------------
DROP TABLE IF EXISTS `category_type`;
CREATE TABLE `category_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category_type
-- ----------------------------
INSERT INTO `category_type` VALUES (1, 'MEN\'S', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `category_type` VALUES (2, 'WOMEN\'S', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `category_type` VALUES (3, 'CHILDREN\'S', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `category_type` VALUES (4, 'NONE', '0', '2019-06-23 08:19:05', NULL);
INSERT INTO `category_type` VALUES (5, 'ALL', '0', '2019-06-23 08:19:05', NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_06_16_210501_create_orders_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_06_22_194219_create_category_type_table', 2);
INSERT INTO `migrations` VALUES (7, '2019_06_22_170919_create_categories_table', 3);
INSERT INTO `migrations` VALUES (8, '2019_06_16_210319_create_products_table', 4);
INSERT INTO `migrations` VALUES (9, '2016_06_01_000001_create_oauth_auth_codes_table', 5);
INSERT INTO `migrations` VALUES (10, '2016_06_01_000002_create_oauth_access_tokens_table', 5);
INSERT INTO `migrations` VALUES (11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5);
INSERT INTO `migrations` VALUES (12, '2016_06_01_000004_create_oauth_clients_table', 5);
INSERT INTO `migrations` VALUES (13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5);

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('2959e18aa78aa32edc2ee1df2c90336718fd4937d708646afc1358f94a01be4e5bb5c246183b49b0', 22, 1, 'sellify', '[]', 0, '2019-09-01 14:54:00', '2019-09-01 14:54:00', '2020-09-01 14:54:00');
INSERT INTO `oauth_access_tokens` VALUES ('34fffbe58c4c3b5e1763c393cc808379cd13b70cb350edea68acfdf857f8f3daaf9272d1bbdb7a83', 21, 1, 'sellify', '[]', 0, '2019-09-01 14:56:35', '2019-09-01 14:56:35', '2020-09-01 14:56:35');
INSERT INTO `oauth_access_tokens` VALUES ('37408a6c2f2cf58616a56ac3f8dbaa5977643da8bb9267d3e91b03f0df22a5108e9acf2f5e95ff6f', 22, 1, 'sellify', '[]', 0, '2019-08-24 21:18:18', '2019-08-24 21:18:18', '2020-08-24 21:18:18');
INSERT INTO `oauth_access_tokens` VALUES ('5dab99de442725497811233c19ea96514385b3d24186a064b7726b3518722e095a148bf9a9e29e94', 22, 1, 'sellify', '[]', 0, '2019-08-24 21:17:41', '2019-08-24 21:17:41', '2020-08-24 21:17:41');
INSERT INTO `oauth_access_tokens` VALUES ('650e6c2ad7c61ba2535e7c37760997b8bc7e7feeb6902f962632fa55146b7c81ca08c888ac7e9261', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:51:05', '2019-09-01 15:51:05', '2020-09-01 15:51:05');
INSERT INTO `oauth_access_tokens` VALUES ('69db1d8a3fa1556c081d4648453efc5f7f9a22db75d4604de3c77987d0166fd7db794944acb3f1b3', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:44:12', '2019-09-01 15:44:12', '2020-09-01 15:44:12');
INSERT INTO `oauth_access_tokens` VALUES ('81958d8ec249871b19e0b61044fcdde6f46f1c10c9d6f2732d114a6817bfc1e7d39f9c38ff9ee9e7', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:44:26', '2019-09-01 15:44:26', '2020-09-01 15:44:26');
INSERT INTO `oauth_access_tokens` VALUES ('867cb26db6553b22e99a112c82d88e5aa540162158ecbe2df61606670271cd16944c148ae7836097', 22, 1, 'sellify', '[]', 0, '2019-08-24 20:38:33', '2019-08-24 20:38:33', '2020-08-24 20:38:33');
INSERT INTO `oauth_access_tokens` VALUES ('8db439bc2733d59a1df972e23a158b52a4e8a85104ffb56e9dd67cc21a8ba56996d1e5ee97601313', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:44:00', '2019-09-01 15:44:00', '2020-09-01 15:44:00');
INSERT INTO `oauth_access_tokens` VALUES ('a2ffaaf713d6ce23a4645768c9b17b1c55a509416070a91724f5651d7dbe3f860a27067f5a59151f', 22, 1, 'sellify', '[]', 0, '2019-08-24 21:14:05', '2019-08-24 21:14:05', '2020-08-24 21:14:05');
INSERT INTO `oauth_access_tokens` VALUES ('b2e7f0d5176b3381ed323a6726c3f3989f9bb9ffbfa59492a6c58d32e369310ee44f43a6938ad8af', 22, 1, 'bigStore', '[]', 0, '2019-07-15 21:09:29', '2019-07-15 21:09:29', '2020-07-15 21:09:29');
INSERT INTO `oauth_access_tokens` VALUES ('c3d15bdaebba28f2739b3fb24950b85ee67913c71f993c900d05624af119365d4f39e929f7849616', 23, 1, 'sellify', '[]', 0, '2019-08-28 19:59:44', '2019-08-28 19:59:44', '2020-08-28 19:59:44');
INSERT INTO `oauth_access_tokens` VALUES ('dfcd96a192469140c49aea518298810c6bace8a11d2346e6edaea9982d9bdfef1bc57deb4baa7997', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:04:33', '2019-09-01 15:04:33', '2020-09-01 15:04:33');
INSERT INTO `oauth_access_tokens` VALUES ('e8a3120f4627cb56a813a7a043156b31f8456f83a1feb96f8e561c391a43b6b2d668994a5c009ebe', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:49:44', '2019-09-01 15:49:44', '2020-09-01 15:49:44');
INSERT INTO `oauth_access_tokens` VALUES ('ea110f686cc769930a9a67768109ca0571619fec7fd5f17f2d4a0e26a2f1a2e7cc2b947faca81dcb', 22, 1, 'sellify', '[]', 0, '2019-07-27 18:50:52', '2019-07-27 18:50:52', '2020-07-27 18:50:52');
INSERT INTO `oauth_access_tokens` VALUES ('f756f652bc61d4ec2cb631a5fbd4b5bc7f2e7703f22bdfef214566a96ef72e68994f74cd2b5af46c', 22, 1, 'sellify', '[]', 0, '2019-08-24 21:16:43', '2019-08-24 21:16:43', '2020-08-24 21:16:43');
INSERT INTO `oauth_access_tokens` VALUES ('fb76ce4fd7b00745cc0f0da339f81aeb638eca1026b876a94e90bb2759fc49b6144b070e16dac7b0', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:46:55', '2019-09-01 15:46:55', '2020-09-01 15:46:55');
INSERT INTO `oauth_access_tokens` VALUES ('fccc7cc9ff473f60b723e3dde30cab48886a1ac8e42154aa5b3777a18c44985ae89ade0901fe2ce5', 21, 1, 'sellify', '[]', 0, '2019-09-01 15:44:40', '2019-09-01 15:44:40', '2020-09-01 15:44:40');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', '5EBjd7b79XdrURFwKwsEHCnZHBu0MP2oms0Tlgms', 'http://localhost', 1, 0, 0, '2019-06-23 08:35:23', '2019-06-23 08:35:23');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'YKMnhDWN3mrO3jgrn5SLRaZlBrax4quG7v1UzHPh', 'http://localhost', 0, 1, 0, '2019-06-23 08:35:23', '2019-06-23 08:35:23');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_personal_access_clients_client_id_index`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2019-06-23 08:35:23', '2019-06-23 08:35:23');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_delivered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 25, 22, 1, 'P.O.Box 403, Accra-Adenta', 0, '2019-07-27 06:18:14', '2019-07-27 06:18:14', NULL);
INSERT INTO `orders` VALUES (2, 27, 22, 1, 'No. 5 privette drive road', 0, '2019-08-25 22:38:14', '2019-08-25 22:38:14', NULL);
INSERT INTO `orders` VALUES (3, 28, 23, 1, 'larry Page road, 405 Street, Adenta', 0, '2019-08-28 20:00:37', '2019-08-28 20:00:37', NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `units` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` double(10, 2) NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cate_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_cate_id_foreign`(`cate_id`) USING BTREE,
  CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (25, 'Vintage Khaki Shorts with GapFlex', 'Featuring GapFlex technology for extra flexibility, total comfort, and a perfect fit.', 21, 200.10, 'https://www.gap.com/webcontent/0017/029/441/cn17029441.jpg', 16, '2019-06-23 08:27:35', '2019-06-23 08:27:35', NULL);
INSERT INTO `products` VALUES (26, 'Vintage Khaki Shorts with GapFlex(Pink)', 'These colors come from special garment-dyed method that gives the fabric a unique, vintage look which may fade over time or rub-off. Wash inside-out in cold water to minimize color transfer.', 400, 1600.21, 'https://www.gap.com/webcontent/0017/029/441/cn17029441.jpg', 16, '2019-06-23 08:27:35', '2019-06-23 08:27:35', NULL);
INSERT INTO `products` VALUES (27, 'All Day Pique Polo Shirt', 'Everyday performance meets all day comfort. Win win.', 37, 378.00, 'https://www.gap.com/webcontent/0017/045/934/cn17045934.jpg', 16, '2019-06-23 08:27:35', '2019-06-23 08:27:35', NULL);
INSERT INTO `products` VALUES (28, 'Modern Khakis in Slim Fit with GapFlex', 'Smooth stain-resistant weave with GapFlex stretch technology', 10, 21.10, 'https://www.gap.com/webcontent/0017/029/796/cn17029796.jpg', 16, '2019-06-23 08:27:35', '2019-06-23 08:27:35', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (21, 'Admin', 'admin@devtest.com', 1, NULL, '$2y$10$Kivu9k0gU9vY874QjUaST.BVNWsX1q2ceaprGE9smu1snq8AjG3T2', NULL, '2019-06-23 08:19:05', '2019-06-23 08:19:05', NULL);
INSERT INTO `users` VALUES (22, 'sadat kollan', 'emodatt08@gmail.com', 0, NULL, '$2y$10$Kivu9k0gU9vY874QjUaST.BVNWsX1q2ceaprGE9smu1snq8AjG3T2', NULL, '2019-07-15 21:09:29', '2019-07-15 21:09:29', NULL);
INSERT INTO `users` VALUES (23, 'Larry Page', 'sergiebrin@gmail.com', 0, NULL, '$2y$10$coqYE7fm9iICyaYhitvjYub4dSewdzYocj6tgH7RrhMT820nF7qIa', NULL, '2019-08-28 19:59:44', '2019-08-28 19:59:44', NULL);

SET FOREIGN_KEY_CHECKS = 1;
