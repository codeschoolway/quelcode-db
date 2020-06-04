CREATE TABLE `users` (
      `user_id` int(11) NOT NULL AUTO_INCREMENT,
      `email` varchar(100) NOT NULL,
      `password` varchar(100) NOT NULL,
      `user_name` varchar(100) NOT NULL,
      `description` varchar(1000),
      `work_phone` varchar(13),
      `cell_phone` varchar(13),
      `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
      `created_at` datetime NOT NULL,
      `updated_at` datetime NOT NULL,
      PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `join_table` (
      `user_id` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      `join_date` datetime NOT NULL,
      PRIMARY KEY (`user_id`, `chat_room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `chat_rooms` (
      `chat_room_id` int(11) NOT NULL AUTO_INCREMENT,
      `chat_name` varchar(100) NOT NULL,
      `chat_description` varchar(1000),
      `allowed_to_send` tinyint(1) DEFAULT 1,
      `is_diret_chat` tinyint(1) DEFAULT 1,
      `is_deleted` tinyint(1) DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_user_id` int(11) NOT NULL,
      `updated_at` datetime NOT NULL,
      `update_user_id` int(11) NOT NULL,
      PRIMARY KEY (`chat_room_id`),
      FOREIGN KEY (`create_user_id`) REFERENCES users(`user_id`),
      FOREIGN KEY (`update_user_id`) REFERENCES users(`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `posts` (
      `post_id` int(11) NOT NULL AUTO_INCREMENT,
      `post_content` varchar(1000) NOT NULL,
      `attachment_file` varchar(100),
      `is_deleted` tinyint(1) DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_user_id` int(11) NOT NULL,
      `updated_at` datetime NOT NULL,
      `update_user_id` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      PRIMARY KEY (`post_id`),
      FOREIGN KEY (`chat_room_id`) REFERENCES chat_rooms(`chat_room_id`),
      FOREIGN KEY (`create_user_id`) REFERENCES users(`user_id`),
      FOREIGN KEY (`update_user_id`) REFERENCES users(`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE `tasks` (
      `task_id` int(11) NOT NULL AUTO_INCREMENT,
      `task_content` varchar(1000) NOT NULL,
      `admin` int(11) NOT NULL,
      `deadline` datetime,
      `is_done` tinyint(1) DEFAULT 0,
      `is_deleted` tinyint(1) DEFAULT 0,
      `created_at` datetime NOT NULL,
      `create_user_id` int(11) NOT NULL,
      `updated_at` datetime NOT NULL,
      `update_user_id` int(11) NOT NULL,
      `chat_room_id` int(11) NOT NULL,
      PRIMARY KEY (`task_id`),
      FOREIGN KEY (`chat_room_id`) REFERENCES chat_rooms(`chat_room_id`),
      FOREIGN KEY (`create_user_id`) REFERENCES users(`user_id`),
      FOREIGN KEY (`update_user_id`) REFERENCES users(`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
