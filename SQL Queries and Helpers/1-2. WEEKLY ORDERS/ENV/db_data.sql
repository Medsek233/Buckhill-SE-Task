-- Dumping database structure for petshop
CREATE DATABASE IF NOT EXISTS `petshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `petshop`;

-- Dumping structure for table petshop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_status_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `products` json DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `order_status_id_idx` (`order_status_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `orders_status` (
  `id` int NOT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping structure for table petshop.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `details` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping structure for table petshop.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `price` float DEFAULT NULL,
  `description` text,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping structure for table petshop.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `uuid` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

REPLACE INTO `orders` (`id`, `user_id`, `order_status_id`, `payment_id`, `uuid`, `products`, `amount`, `created_at`) VALUES
	(1, 4, 1, 1, '43f8575d-9e27-312b-ad54-662026a462f7', '[{"product": "acaa9cc3-e1ad-3c2a-841c-4046e850c24e", "quantity": 1}]', 98.84, '2023-09-29 15:30:05'),
	(2, 6, 4, 1, '421e4221-75db-3562-8b35-ed95fe8dadec', '[{"product": "8060a5e3-dc17-3941-b023-06dc60521b43", "quantity": 5}, {"product": "6fd29c9f-8c10-358a-8b0d-18835cebcac4", "quantity": 3}, {"product": "e04e51c1-65db-3bbc-80bd-3ef16647ca03", "quantity": 5}, {"product": "b6cdca8c-8b1c-320d-ab49-733d8ad36a07", "quantity": 3}]', 39.88, '2023-09-28 15:30:05'),
	(3, 2, 3, 4, 'be517331-5ada-3b74-acfd-14ffe7f1c720', '[{"product": "9b73cc71-3239-3de3-a51a-9f1898eff08c", "quantity": 1}, {"product": "05643de2-7062-34e0-bc6c-ea4f0bcf60c8", "quantity": 2}, {"product": "9b9611a6-e629-3cba-9c0b-6e9bbcd38528", "quantity": 5}, {"product": "53ed5b7d-1e06-3d4f-93bc-52ad743f6660", "quantity": 5}]', 95.35, '2023-09-27 15:30:05'),
	(4, 8, 4, 2, '5a84af3b-0c8d-3db0-8a09-88695e359d9f', '[{"product": "31477cfb-66d4-3edf-8952-314a7bb1b6a6", "quantity": 3}, {"product": "f0ced687-42b6-3fcf-bcfe-482266ce24b4", "quantity": 5}, {"product": "430b1269-b73d-31f4-92ab-8cf1d1798330", "quantity": 4}]', 26.03, '2023-09-26 15:30:05'),
	(5, 1, 3, 4, '25952f3b-afc6-3f21-a669-4d77ebeb4146', '[{"product": "9c9012db-09fe-3d84-8095-f2717f8132b6", "quantity": 2}, {"product": "659e7924-3495-381e-a24d-672b7011b919", "quantity": 1}]', 1.37, '2023-09-25 15:30:05'),
	(6, 4, 4, 5, '351d44b5-de2a-3ea5-b5cf-f7d1b0fe3ba4', '[{"product": "30ba9150-63f5-3913-994f-9373415c5230", "quantity": 2}, {"product": "f9e28842-5407-3b22-927e-f0463d13a65d", "quantity": 2}]', 62.09, '2023-09-24 15:30:05'),
	(7, 1, 4, 3, 'beb16f61-8f29-31d1-aa25-3c37a16706b7', '[{"product": "f918468f-1876-322c-b204-82c61ca62df6", "quantity": 5}, {"product": "4dadb402-1373-3493-96b1-64fcee44c98a", "quantity": 5}]', 67.99, '2023-09-23 15:30:05'),
	(8, 5, 5, 2, 'affbb1bd-73c3-3d9d-92e9-dcaef7d636b3', '[{"product": "2a24dc09-3b9b-3f6e-9928-46a770b6144d", "quantity": 3}, {"product": "4d6c270b-2fe0-3d50-923f-1541afd2e8ff", "quantity": 5}, {"product": "d3e0f4fc-e7f8-33a4-a055-ac43242b5277", "quantity": 1}, {"product": "92f738f6-eba2-320c-80b1-84381b426413", "quantity": 4}]', 32.38, '2023-09-22 15:30:05'),
	(9, 1, 3, 1, 'b01338d5-5450-3897-87f8-46195ee6dfe5', '[{"product": "8df93884-e817-3398-9b06-3cbb4ba96127", "quantity": 4}]', 39.71, '2023-09-21 15:30:05'),
	(10, 8, 2, 1, '580ed115-0237-3ce6-a997-3f98c95b66e8', '[{"product": "476e078e-112e-30a4-a651-45c872d0bed6", "quantity": 4}, {"product": "ce5fc7fa-0b75-33ba-a048-4f9f54fcf1ca", "quantity": 3}, {"product": "a14696f4-e803-3def-b834-a4c747902105", "quantity": 4}]', 96.63, '2023-09-20 15:30:06'),
	(11, 6, 1, 3, '1039003d-0fa3-36dd-94a6-36c78a7407dd', '[{"product": "3fa28820-731b-3d23-a1af-f8d12014367f", "quantity": 5}, {"product": "fe89136c-db6e-3da7-beb1-7ce6e6346dea", "quantity": 1}, {"product": "9879d1c8-6c32-3b16-a0ca-f1b84c67ff95", "quantity": 5}, {"product": "f2d4807c-f882-3686-b82f-5ed08ec7f8c5", "quantity": 4}, {"product": "546abb82-0d08-304a-be9b-22f9d95cfa6d", "quantity": 4}]', 4.95, '2023-09-29 15:30:06'),
	(12, 6, 1, 3, '15f1302f-9415-3073-994f-3aba20b16dfe', '[{"product": "99ba53f6-9f22-32cb-bdca-902558b3671f", "quantity": 3}, {"product": "07e1d2eb-4b0f-3baa-a6b6-b01fdc252dec", "quantity": 2}]', 33.35, '2023-09-28 15:30:06'),
	(13, 7, 3, 1, 'b6880190-6815-3ea0-8caa-e966ecc5beb5', '[{"product": "c2b41677-626e-3706-8a72-c601a47298c3", "quantity": 1}, {"product": "0b88484d-9712-31b0-801c-7114596a808f", "quantity": 5}, {"product": "34e3b97f-8464-3de1-825b-f467c3e4f885", "quantity": 5}, {"product": "3f74e28c-4e42-36f1-873b-1b63430c4e90", "quantity": 1}, {"product": "437e5a4c-39e1-32e8-8098-1f4efc27bf99", "quantity": 5}]', 45.53, '2023-09-27 15:30:06'),
	(14, 6, 4, 3, 'fbdaf549-70ed-3be2-a98d-e4e9b0b1e186', '[{"product": "325ce6b9-3e07-3006-9240-9fb6400f7e0b", "quantity": 4}]', 42.45, '2023-09-26 15:30:06'),
	(15, 5, 2, 5, '2fc18edf-c122-3005-b700-57cf994448e9', '[{"product": "c3d21231-ca29-3ff8-9ffa-79334cb184f2", "quantity": 1}, {"product": "c19b8f16-3211-32e0-96a8-1cfb3170a85b", "quantity": 4}, {"product": "16347dfc-9d7f-3ca0-8044-4eec75098dd4", "quantity": 2}, {"product": "21acd97d-3368-33f3-980c-8c17fd590fcc", "quantity": 5}]', 36.99, '2023-09-25 15:30:06'),
	(16, 4, 4, 2, 'ff9dcf93-c237-3576-864e-3be4c2f5c184', '[{"product": "4f49f5c1-bf42-33db-96dc-a67c748294d2", "quantity": 4}, {"product": "6f1fe0b7-068e-302e-825e-98141946c603", "quantity": 2}]', 45.92, '2023-09-24 15:30:06'),
	(17, 9, 3, 3, '807d458f-2ca2-39b1-a420-99e1cb680218', '[{"product": "9f8ed6a8-61fe-3895-a231-e35ae671ede2", "quantity": 1}, {"product": "c9d0403d-341a-37b1-9321-bc4e67c3d4e5", "quantity": 4}, {"product": "332bce5c-bc5c-3378-aa18-07fbb668f458", "quantity": 5}, {"product": "762129b8-58bf-3c3b-87f4-763b305443e7", "quantity": 1}, {"product": "7115c42d-c24c-3765-a186-be51da15be01", "quantity": 3}]', 32.42, '2023-09-23 15:30:06'),
	(18, 9, 5, 1, '2f9ae174-2ad1-3f83-8f93-cf18a8de9b20', '[{"product": "6dada5df-a7f9-3dfb-b19a-8ed67b17296f", "quantity": 2}]', 16.6, '2023-09-22 15:30:06'),
	(19, 6, 3, 4, '0bab4c5e-9c0a-3c56-9867-4bcced8a21e4', '[{"product": "d6e92a54-e0de-38d3-be57-3708df045c8f", "quantity": 3}, {"product": "77469693-e4c4-3f2d-8a1b-7758270508ce", "quantity": 2}, {"product": "efbad58d-b3a8-3aae-9d04-155bf8ede430", "quantity": 5}]', 18.41, '2023-09-21 15:30:06'),
	(20, 1, 3, 5, 'f2675b53-14f1-3f45-84ec-07dd4328a64c', '[{"product": "cacee85d-efd8-3996-8b1b-2b9f24da2b90", "quantity": 1}, {"product": "5af6a636-3eb5-3c88-ac83-c291c358efe6", "quantity": 5}]', 44.34, '2023-09-20 15:30:06'),
	(21, 10, 3, 4, '93718332-8458-3c52-98b0-f985ea78b349', '[{"product": "29da9d0b-80ab-3b6e-b6a7-8e8903eca7e9", "quantity": 1}, {"product": "58cde585-510f-3086-8815-6a726dd51178", "quantity": 3}]', 98.72, '2023-09-29 15:30:06'),
	(22, 9, 2, 3, 'f558b71e-413e-3fc1-a4b2-b301c211f8db', '[{"product": "bd3f47e7-3a24-355b-8886-dd44dcecbe17", "quantity": 4}, {"product": "d4184c35-8edd-3fc9-b1f3-2bb3310e3d55", "quantity": 2}]', 75.26, '2023-09-28 15:30:06'),
	(23, 6, 2, 4, '806ef36c-7990-3f9b-bb84-09849278278e', '[{"product": "5dd28566-9d1e-317a-9134-b5b1d45cb257", "quantity": 2}, {"product": "c7642cb4-ead2-37d0-b693-fd10055dabdc", "quantity": 2}, {"product": "b6b61867-36e4-371e-9cdb-15023cac0e4d", "quantity": 2}, {"product": "589f1bd7-3d5b-33c0-98f9-b97452ad9e09", "quantity": 4}]', 11.17, '2023-09-27 15:30:06'),
	(24, 9, 2, 3, 'bc10fb2e-bf17-3b6c-8bc3-c1e1dd174fb1', '[{"product": "0fb95715-7308-33a8-864a-c5e6ca2e7010", "quantity": 1}, {"product": "18b0f779-3700-3ba8-86f7-ffc79400f02f", "quantity": 3}, {"product": "fc27eabf-5e6a-3bb8-a14b-4aebedb640d7", "quantity": 5}, {"product": "d2e01a76-2e66-3612-b07d-6bd57a8d80de", "quantity": 2}, {"product": "afd31a15-c13b-3803-ae0a-325e1dcc4269", "quantity": 3}]', 59.2, '2023-09-26 15:30:06'),
	(25, 3, 2, 3, '2a3e1b7e-ded5-369b-9b8f-3da6900af0c2', '[{"product": "ea71c1c5-f12b-3fb5-843f-8cb080d2f90e", "quantity": 5}, {"product": "e1f377d9-4b82-331f-9545-f13872a0fe9c", "quantity": 4}, {"product": "293a8d22-7013-3ae5-a9dd-a2aa0200dc7f", "quantity": 5}, {"product": "22b25097-d744-3645-8774-d918f1fb7735", "quantity": 1}]', 3.26, '2023-09-25 15:30:06'),
	(26, 9, 2, 4, '5bac95d3-25d3-3270-9a4a-93fbdcb1fe00', '[{"product": "218dd5ee-bc4d-3631-9edf-97e175385734", "quantity": 2}, {"product": "336207f2-5d3e-399e-8308-e95f8fe6bc3a", "quantity": 1}, {"product": "a2313b4c-bcdd-380b-9fd5-e4923597b880", "quantity": 2}]', 97.24, '2023-09-24 15:30:06'),
	(27, 10, 2, 4, '5a10d89f-a25c-30a8-a186-596c6f4bc7f5', '[{"product": "5de5043d-ab68-379d-921b-cb03358649a6", "quantity": 1}, {"product": "941051f9-ab37-3472-a2c6-22398031cc4b", "quantity": 2}]', 36.85, '2023-09-23 15:30:06'),
	(28, 4, 5, 2, '61b43a58-89fe-3bf2-865c-9bd470852077', '[{"product": "a2b0a4ea-71b4-3563-be91-2000fa6cb9d6", "quantity": 1}]', 51.3, '2023-09-22 15:30:06'),
	(29, 4, 5, 3, '22b2ce5d-1349-3584-9848-03074c90736e', '[{"product": "2819720f-d5d7-375c-ad23-c128839de73e", "quantity": 2}, {"product": "fb5bed82-5be8-332f-a188-40e0c45323cb", "quantity": 3}, {"product": "4a0c7677-3adf-3c07-a21b-d590d26d7912", "quantity": 5}, {"product": "0ab73456-a867-39a0-9d9e-f4812c578f44", "quantity": 4}]', 7.84, '2023-09-21 15:30:06'),
	(30, 10, 3, 5, '175187b5-bb0e-3b8e-8e19-a4217337e0a0', '[{"product": "982d3603-51dd-33ff-9a38-1ebb7d1250ae", "quantity": 2}, {"product": "006b86bc-4664-3ef1-810e-fef0746d741a", "quantity": 2}, {"product": "76c42200-7988-38ae-bed7-2a0e34cd32d8", "quantity": 3}, {"product": "ec643309-9aa9-3511-bd75-790fc31accfe", "quantity": 2}, {"product": "739cf711-533e-3f9f-8173-d88f85535ba3", "quantity": 3}]', 57.62, '2023-09-20 15:30:06'),
	(31, 9, 5, 1, '68b94270-6e0f-38eb-9d66-131848acc303', '[{"product": "cf519c3a-058a-3f98-a875-7d054a18cec6", "quantity": 5}]', 8.52, '2023-09-29 15:30:06'),
	(32, 5, 2, 2, '56097baf-0104-35a8-bf23-65e098e05560', '[{"product": "6497d176-5632-395a-83d0-0fb15178fdb0", "quantity": 2}, {"product": "1038c5fc-f90f-3f92-972e-806e238eeea5", "quantity": 3}]', 16.27, '2023-09-28 15:30:06'),
	(33, 3, 5, 2, '45494a88-b08b-378d-ad9f-c12397bc5a9a', '[{"product": "a7f542eb-3b00-3805-9735-0bbf2d9e20e2", "quantity": 3}]', 63.68, '2023-09-27 15:30:06'),
	(34, 10, 1, 1, '8ce62c9a-9eb4-35f6-bae6-73ade6cb4b53', '[{"product": "d654e9dd-9eac-3ad5-bada-c540f951fe69", "quantity": 3}, {"product": "bb2d33eb-a49b-329c-9f72-2b049c961294", "quantity": 3}, {"product": "a201aeff-5b3e-3d9e-ac57-ae3110b88fee", "quantity": 5}]', 78.95, '2023-09-26 15:30:06'),
	(35, 10, 1, 2, 'd4632ecd-62f2-319d-89ac-c4459b04686f', '[{"product": "99b52e01-cf61-38c6-85a7-038aa98aef03", "quantity": 1}, {"product": "4bd60e66-c87f-36e5-86b6-7e4b5afc1c1a", "quantity": 5}, {"product": "fbc1c853-fc14-3fae-9afb-580ca89f7119", "quantity": 5}, {"product": "f47483d0-fc29-34ce-b13a-7ffaddd1f4bf", "quantity": 1}, {"product": "588275d6-b6c0-39db-aeaa-71bf68499385", "quantity": 5}]', 31.26, '2023-09-25 15:30:06'),
	(36, 9, 2, 4, '0257dd09-c75b-34f5-ae6f-79292970fc93', '[{"product": "e6eb48db-239f-3be9-92ec-1dfc8f8563d8", "quantity": 2}, {"product": "813a2311-1fc8-3042-8c24-b4b7bf17915c", "quantity": 5}, {"product": "d99f9065-f74c-3f3d-97fc-e8e776fced88", "quantity": 4}, {"product": "9467c693-3ac4-3359-bc4d-52a3bebeabbf", "quantity": 3}]', 6.51, '2023-09-24 15:30:06'),
	(37, 2, 5, 1, '544ed407-677c-3ffa-a724-a9f22b61999f', '[{"product": "a1523794-dd74-39bf-90a2-c456a187349a", "quantity": 1}]', 1.5, '2023-09-23 15:30:06'),
	(38, 6, 1, 3, '7aa14b7a-b811-376b-bef1-15614b8acbb8', '[{"product": "47934253-ea3b-36fd-b5d9-c9b9870e3db6", "quantity": 4}, {"product": "d9cd27c6-479b-319a-a4ff-9846cc6ec285", "quantity": 2}]', 9.23, '2023-09-22 15:30:06'),
	(39, 4, 1, 2, 'ece996ee-2298-3878-82e5-b89a5fab3a63', '[{"product": "99b08234-1454-3956-803b-472ea03748f3", "quantity": 5}]', 29.51, '2023-09-21 15:30:06'),
	(40, 7, 5, 1, 'fb77cf40-5b02-3d07-805f-8b26408356fc', '[{"product": "677d9aff-2cbb-3273-a7ab-dcbf31d554e0", "quantity": 5}, {"product": "48836055-2b23-3f90-9423-34af6047c5bc", "quantity": 5}, {"product": "40176a38-3e41-3e93-9875-e542275d0b7e", "quantity": 4}]', 3.5, '2023-09-20 15:30:06');

-- Dumping data for table petshop.orders_status: ~5 rows (approximately)
REPLACE INTO `orders_status` (`id`, `uuid`, `title`) VALUES
	(1, 'c0d006b8-ad62-3ad3-8eda-d1c7ad1dab5e', 'pending_payment'),
	(2, 'e2becd57-53c8-34b0-a65d-72d84371008a', 'shipped'),
	(3, '53842aec-5104-33f9-988a-e6463d7b0078', 'open'),
	(4, '6562af9a-86b0-38d8-a7c5-bc6de6b1d0b5', 'cancelled'),
	(5, 'fd4051d7-0f23-3d04-a3d5-4b3dc167d7a4', 'paid');

-- Dumping data for table petshop.payments: ~5 rows (approximately)
REPLACE INTO `payments` (`id`, `uuid`, `type`, `details`) VALUES
	(1, 'a471369b-2c2b-3f2b-b3ad-d594558e1701', 'bank transfer', '{"cvv": 1139.160104792174, "iban": "IS135611001176085729351915", "swift_code": "WRUWLJM90OB", "card_number": "2491067246251046", "holder_name": "Dejah Rempel", "expiration_date": {"date": "2024-09-25 11:43:46.000000", "timezone": "UTC", "timezone_type": 3}}'),
	(2, '68115fe6-61d9-3118-aec5-77e411022411', 'bank transfer', '{"cvv": 2186.176358700346, "iban": "IL312895220969438966864", "swift_code": "UCLVRW9X8JS", "card_number": "6011976253825942", "holder_name": "Fanny Franecki", "expiration_date": {"date": "2023-11-17 19:58:32.000000", "timezone": "UTC", "timezone_type": 3}}'),
	(3, 'afaf2345-3929-3c76-82f5-bd5158b11931', 'paypal', '{"cvv": 999, "iban": "AT629586568131030656", "swift_code": "LBYLRTKK", "card_number": "5430213483021315", "holder_name": "Prof. Zachariah Christiansen DVM", "expiration_date": {"date": "2025-08-24 03:43:29.000000", "timezone": "UTC", "timezone_type": 3}}'),
	(4, '8249cc6e-4ab2-3777-9d0b-9d47a666fe8a', 'cash', '{"cvv": 999, "iban": "CR14681438421682847723", "swift_code": "MKMPFER289X", "card_number": "5501418287840299", "holder_name": "Carmella Labadie", "expiration_date": {"date": "2026-06-10 18:49:34.000000", "timezone": "UTC", "timezone_type": 3}}'),
	(5, '299027d1-33df-3e9d-9209-7d043bc90e37', 'paypal', '{"cvv": 58504.08695714413, "iban": "GB33PIKY08216329780958", "swift_code": "ODUPUAPT", "card_number": "4929861945096407", "holder_name": "Dr. Ellsworth Bergstrom DVM", "expiration_date": {"date": "2026-04-11 16:59:01.000000", "timezone": "UTC", "timezone_type": 3}}');

-- Dumping data for table petshop.products: ~40 rows (approximately)
REPLACE INTO `products` (`id`, `uuid`, `title`, `price`, `description`, `metadata`) VALUES
	(1, 'ea2c6c79-4958-365b-8980-ffb7ac833338', 'Qui voluptas sed quos aliquid reiciendis aperiam.', 58.78, 'Deleniti at vitae quia. Omnis excepturi qui qui expedita ipsa voluptatem. Laborum aspernatur sunt accusamus harum possimus.', NULL),
	(2, '6738f522-1461-3fb9-8bb3-12ab65d997a0', 'Aut doloremque consequatur mollitia perspiciatis possimus.', 37.85, 'Similique dolorem adipisci reprehenderit vel. Velit est omnis natus dolor ducimus pariatur delectus. Sed asperiores vero ad magni excepturi.', NULL),
	(3, 'f5339612-7864-3512-9620-cb5156d9a4d2', 'Nihil quibusdam est aut rem facilis labore.', 96.45, 'Voluptatem at corporis dolorum temporibus sed ducimus dolorem corrupti. Commodi ex quia architecto libero explicabo consequatur. Laudantium corrupti ab nulla.', NULL),
	(4, '8dcc9bdd-5205-3593-80f4-afde1dcfbe49', 'Eligendi nesciunt et porro fugiat eos aliquid sed.', 7.23, 'Explicabo labore sunt saepe accusantium. Nihil quo aut est ullam eos. Tempora sint atque mollitia aut quasi tempora. In quia ea perferendis. Et quis possimus consectetur enim eveniet.', NULL),
	(5, '484f96c4-3c78-3447-93c0-9b7f8b9d4821', 'Sit non reprehenderit velit qui.', 55.9, 'Eum et minus molestiae explicabo provident culpa. Sint iure odit quia nostrum. Autem enim optio occaecati labore. Necessitatibus quia aperiam necessitatibus nihil et.', NULL),
	(6, 'e510be31-dc3f-36db-8c6a-60173511ce43', 'Dicta consequuntur rerum nihil et inventore.', 88.88, 'Voluptatibus enim ratione facere officia consequatur ut. Ab dolore cum provident quo. Sint aut quasi hic. Et qui eum amet qui aut.', NULL),
	(7, '42d368e1-d45b-3575-a088-9349c90a45a5', 'Ea quis rerum et nulla.', 48.8, 'Ad qui nostrum illo odit enim. Aut eaque totam repellendus excepturi aut facilis. Qui at veniam accusantium sint.', NULL),
	(8, 'f732637a-fd94-3cd7-b346-9a39578ccd8d', 'Eligendi quis possimus recusandae eos animi.', 62.62, 'Eos ducimus eum pariatur et sit qui. Sed minima magni quos assumenda voluptas earum temporibus. Id voluptates ratione rerum rerum.', NULL),
	(9, '56df1d0a-f4d1-3602-a8d9-fe39f2a7f4bf', 'Saepe perferendis accusantium non est quisquam.', 48.72, 'Unde quis quas doloribus autem. Enim dolorem repellendus autem quia. Maxime rerum beatae quasi aut corrupti.', NULL),
	(10, '3e78e7a9-7412-3965-84eb-77ead2aff9c9', 'Id quia laborum placeat natus consequatur rerum pariatur voluptate.', 52.04, 'Consectetur at neque autem ullam officiis. Mollitia saepe minima delectus quibusdam. Eligendi aliquid qui nam perspiciatis quam illo. Aut illo dicta quaerat officia tenetur vel voluptatum.', NULL),
	(11, 'c3a31867-b562-3f51-baa1-6a2af0774635', 'Necessitatibus ut minima dolorem minima tempore ipsum enim.', 42.85, 'Consectetur fugiat dolorem quibusdam dolorum in. Molestiae accusantium et fugiat enim. Eveniet fugiat rerum sit id ratione. Esse officia ut in non iusto et aut debitis.', NULL),
	(12, '0be84289-3284-3738-82f4-09d58cec0e36', 'Omnis sunt asperiores itaque aliquid.', 60.73, 'Et ratione placeat perferendis eius. Qui vitae deleniti laudantium explicabo. Assumenda maiores iste eligendi fuga ex id natus. Reiciendis et nobis veritatis culpa beatae.', NULL),
	(13, 'ea7cc7b5-14af-3e12-8041-4258dcef45ba', 'Optio facilis fugiat est ipsum aut voluptas et.', 39.43, 'Aut earum autem voluptatum. Consequatur repellat sit rem fugit est et quisquam recusandae. Laborum molestias dolore magnam dolores enim tempora.', NULL),
	(14, 'f98ae11a-2ac0-3a41-84c7-ac6da5f35a27', 'Occaecati qui dolores architecto non ullam exercitationem sunt.', 47.43, 'Tempora corporis sint et voluptas facilis aut. Numquam repudiandae culpa voluptatem quod enim. Sequi aut assumenda dolorem sapiente.', NULL),
	(15, '424de8c4-22b2-3680-bcd1-4684b20ec9ec', 'Ipsam officia eius nihil ea inventore aliquam voluptas.', 58.02, 'Assumenda culpa occaecati sed ullam hic odio mollitia. Aut aut commodi consequatur fuga velit ipsum amet. Ab et impedit quia nulla veritatis odit aut.', NULL),
	(16, 'a7b9794a-25db-3aab-9bd2-d7e9f450ee82', 'Ut dolores veniam quo fuga perferendis.', 5.63, 'Accusamus rerum dignissimos molestiae aspernatur eaque id. Hic est mollitia adipisci quibusdam commodi. Quia aut suscipit voluptatem culpa. Consectetur omnis ut at repudiandae ad molestias quae nihil.', NULL),
	(17, '546a675b-f69b-32f9-87f8-c009700a71f4', 'Pariatur qui perspiciatis consequatur porro sed beatae.', 93.96, 'Impedit velit aut aliquam. Nam deserunt earum ad ipsum alias eos qui. Autem dolorem assumenda vel hic id et aut.', NULL),
	(18, 'efa22182-7dc2-3ae6-996a-3d9e232e6ad9', 'Eaque tempora praesentium numquam sunt alias consequuntur voluptas mollitia.', 34.46, 'Labore ut tenetur autem et. Fugiat nihil saepe quas debitis consectetur. Doloremque pariatur dicta non vel. Recusandae ratione id ut dolorum optio.', NULL),
	(19, 'd25ca425-01b3-3e58-a623-ee65e01ba84b', 'Ducimus non in et mollitia quod reiciendis possimus quo.', 46.9, 'Excepturi eum soluta quia. Veritatis qui occaecati doloribus molestiae. Odit quia tempore labore.', NULL),
	(20, 'cd1bb59b-0553-3ae2-b409-440be3e75603', 'Quis sint dicta vel consequatur velit repellat eaque.', 80.34, 'Illo vel qui dolor dolor omnis accusantium. Quia dolores sint labore sequi sit facere. Eum molestiae in harum deleniti culpa doloribus. Distinctio in ut deserunt ullam.', NULL),
	(21, '09a9ac33-71e3-30ef-9d32-fb2a41df95e8', 'In voluptate doloribus ab aperiam.', 12.21, 'Voluptatem eveniet est velit ut. Ut vitae sunt ut quis. Et temporibus magnam ea sit suscipit.', NULL),
	(22, '7091e6b2-196a-3b04-9908-237fdd6d78c7', 'Exercitationem quos reiciendis dolores occaecati aut ducimus.', 69.82, 'Unde modi quibusdam repellendus sapiente beatae. Molestias voluptatibus at laboriosam dolore amet. Qui omnis et similique delectus dolorum.', NULL),
	(23, 'c47891de-95ed-3bda-a927-b95346326543', 'Fugit eum hic placeat ipsa sed excepturi.', 1.82, 'Deserunt omnis illum quis porro iusto et. Quisquam veritatis voluptates consequuntur in illo incidunt. Similique eum temporibus et autem.', NULL),
	(24, '7de0f34f-810b-333a-accc-39db0d40dac2', 'Corrupti ut nobis quia sed nulla.', 43.33, 'Quis eos quisquam vel natus sequi sit. Alias aspernatur illum et vitae autem. Nihil quae quia dignissimos ratione ipsum.', NULL),
	(25, '6fb5c31a-f1ab-3659-baf8-ceb1408ea9aa', 'Consequatur qui vel delectus provident.', 65.95, 'Cumque voluptatem molestias quae animi aliquam enim dicta. Voluptas omnis illo sequi cumque. Repellat suscipit sed laborum non a dolores suscipit.', NULL),
	(26, '1b3fb98b-1040-3957-8d3c-d078fa8e6f9d', 'Nihil similique minima totam quam est.', 7.38, 'Nisi et beatae autem sed. Cum iusto corporis sit laboriosam. Reprehenderit maxime quis dolorum ut error.', NULL),
	(27, '99ed0b01-7003-3c4c-9df7-85e1ce617a7a', 'Officia et et sint eum impedit sequi est et.', 87.08, 'Corporis aspernatur pariatur non quia nisi nisi eum. Voluptatem quia consequuntur quidem quas sunt non vitae.', NULL),
	(28, '4f5ed107-998f-3e37-ab66-6a2dea1425a6', 'Est quod commodi iure laudantium ipsam.', 93.48, 'Vero ullam suscipit sed. Minus dolore nisi quia magnam.', NULL),
	(29, 'bb682928-a494-3425-886e-ba4d89067482', 'Quod quis et enim voluptatibus velit excepturi.', 14.46, 'Cum eos dolorem consectetur dolorum sunt libero. Sapiente aut sed ut. Earum minus accusamus maiores eum. Optio quia et blanditiis magnam.', NULL),
	(30, 'ba301871-fdf7-39cc-893e-bd9346380f91', 'Est deleniti optio quisquam quia.', 76.66, 'Veniam unde enim a quibusdam et enim aut. Ad dolorum omnis natus accusantium quos possimus quisquam. Porro odio et eum nostrum quibusdam dolorem.', NULL),
	(31, '881bfacc-a67d-3c58-8baa-5157ba44d99a', 'Illo enim enim corporis possimus voluptatem.', 36.72, 'Sunt et totam consequatur officiis quaerat architecto. Est natus aliquid quia culpa aut. Est quidem qui atque aliquam voluptates laudantium mollitia.', NULL),
	(32, 'a73356ad-4687-3fd8-88cd-ae81b411e104', 'Blanditiis sit qui ullam sed.', 43.26, 'Est aut distinctio ut est. Sunt molestiae ullam amet sint. Mollitia ab vel illo consequuntur.', NULL),
	(33, '890e04e8-3ed1-3289-bfe5-d6ba5fa564d2', 'Rem ipsam molestiae aperiam veniam animi.', 83.24, 'Quas excepturi ducimus voluptatem pariatur commodi. Sed aspernatur debitis cum illum. Quod magni nesciunt non incidunt deserunt odio harum. Labore placeat est vel minima ut.', NULL),
	(34, 'd2bd742d-60ae-3ac0-8293-d04017870cff', 'Velit ut sint architecto et nisi.', 98.96, 'Officia sit nemo assumenda voluptate sunt quasi velit. Impedit deserunt fuga et reprehenderit et quisquam. Enim debitis sit aut quaerat quia vel illo molestiae.', NULL),
	(35, 'b5999775-f370-34d0-b7d3-1751549f4530', 'Necessitatibus fugiat explicabo distinctio voluptate placeat cupiditate iste eaque.', 97.47, 'Dolores ut sit consequatur sunt porro pariatur labore aut. Ut expedita fugit voluptatem.', NULL),
	(36, 'b91ae611-bbe2-36d3-b7ed-55e5a29d08d0', 'Omnis est illum autem aperiam qui laudantium.', 78.67, 'Voluptatem perferendis laboriosam consequatur quaerat quam molestiae quis dolorem. Sint dolor aut et sunt. Non fuga eaque autem aperiam quia omnis. Ut architecto culpa delectus accusantium quibusdam.', NULL),
	(37, 'bc74b33e-88e3-33b2-ad42-dc737ba8dacd', 'Debitis hic debitis repellat aut.', 15.58, 'Delectus deleniti autem repellendus. Quis beatae incidunt aut deleniti molestiae iusto. Et illo qui qui sint harum nihil reiciendis.', NULL),
	(38, 'c6d97fb4-1e57-35a6-878d-c23608ee98f0', 'Et quia sapiente fuga aut hic.', 2.44, 'Quasi quod nemo eum provident ut sunt iste. Fugit sed corporis consectetur praesentium. Est rerum esse tempora architecto odit facilis et.', NULL),
	(39, '6e32f44a-574c-3556-a5d2-6c4eb128121d', 'Voluptatem quia sed id officia animi eum ut.', 13.24, 'Asperiores blanditiis ullam magnam rerum sed deserunt. Totam nam dolores consectetur accusantium. Accusamus culpa illo est quasi ipsa dolores iusto.', NULL),
	(40, '7ca9e63b-b4bb-3c7f-b24f-744402b00bf4', 'Neque hic a magnam veniam sapiente.', 66.02, 'Consectetur blanditiis et sed sequi recusandae facere. Et architecto maiores ducimus commodi. Doloribus voluptatibus praesentium incidunt fuga animi. Tenetur dolorem ducimus voluptas nisi omnis.', NULL);

-- Dumping data for table petshop.users: ~10 rows (approximately)
REPLACE INTO `users` (`id`, `uuid`, `first_name`, `last_name`) VALUES
	(1, 'ed5d3001-6acc-3a2c-a3d6-8ee7cddddc95', 'Willy', 'Stokes'),
	(2, '224de9fe-4e21-3f86-9345-b35f38a9ac76', 'Shanie', 'Jakubowski'),
	(3, 'c0017368-7543-3ae6-8888-072624638081', 'Emmett', 'Kutch'),
	(4, '4e3175dc-6703-31c8-a827-9b70ba2c64d0', 'Coleman', 'Rosenbaum'),
	(5, 'f4806858-2cd6-32b7-8507-12e5bd313da9', 'Donny', 'Gusikowski'),
	(6, '29c36a5b-f2a1-342b-9c03-cd7e0dc7cbb8', 'Liam', 'Mann'),
	(7, '389fd1de-839c-3b54-a824-f19b1e7caea2', 'Citlalli', 'Rodriguez'),
	(8, 'fd1341e6-2ad4-363d-87c1-d9cf069ff355', 'Jesse', 'Schimmel'),
	(9, 'a5ac361f-2a0a-3190-959b-46e314596d72', 'America', 'Little'),
	(10, '8014bcab-738f-3d17-8546-288cec8ee1b3', 'Rae', 'Pagac');
