CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`category_id`)
);

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `display_name` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
);

CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `host_id` int NOT NULL,
  `location` varchar(200) NOT NULL,
  `longtiude` decimal(11,8) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `location_details` varchar(255) DEFAULT NULL,
  `private_event` bit(1) DEFAULT NULL,
  `registration_link` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `virtaul_event` bit(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `host_id` (`host_id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`)
);

CREATE TABLE `event_attendee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `attendee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendee_id` (`attendee_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_attendee_ibfk_1` FOREIGN KEY (`attendee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `event_attendee_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
);

CREATE TABLE `event_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `category_id` int NOT NULL,
  `MAIN` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_category_ibfk_2` (`event_id`),
  KEY `event_category_ibfk_1` (`category_id`),
  CONSTRAINT `event_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `event_category_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
);

CREATE TABLE `event_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `selected` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_image_ibfk_1` (`event_id`),
  CONSTRAINT `event_image_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
);

CREATE TABLE `event_invitee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `invitee_id` int DEFAULT NULL,
   PRIMARY KEY (`id`),
  KEY `invitee_id` (`invitee_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `event_invitee_ibfk_1` FOREIGN KEY (`invitee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `event_invitee_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
);

CREATE TABLE `event_update` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_update_ibfk_1` (`event_id`),
  CONSTRAINT `event_update_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`)
);
