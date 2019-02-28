-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema azmrmubimysqldbdev1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema azmrmubimysqldbdev1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table  `wp_commentmeta`
-- -----------------------------------------------------

DROP TABLE IF EXISTS  `wp_commentmeta` ;

CREATE TABLE IF NOT EXISTS  `wp_commentmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `comment_id` ON  `wp_commentmeta` (`comment_id` ASC) VISIBLE;

CREATE INDEX `meta_key` ON  `wp_commentmeta` (`meta_key`(191) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_comments` ;

CREATE TABLE IF NOT EXISTS  `wp_comments` (
  `comment_ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` TINYTEXT NOT NULL,
  `comment_author_email` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_author_url` VARCHAR(200) NOT NULL DEFAULT '',
  `comment_author_IP` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` TEXT NOT NULL,
  `comment_karma` INT(11) NOT NULL DEFAULT '0',
  `comment_approved` VARCHAR(20) NOT NULL DEFAULT '1',
  `comment_agent` VARCHAR(255) NOT NULL DEFAULT '',
  `comment_type` VARCHAR(20) NOT NULL DEFAULT '',
  `comment_parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `comment_post_ID` ON  `wp_comments` (`comment_post_ID` ASC) VISIBLE;

CREATE INDEX `comment_approved_date_gmt` ON  `wp_comments` (`comment_approved` ASC, `comment_date_gmt` ASC) VISIBLE;

CREATE INDEX `comment_date_gmt` ON  `wp_comments` (`comment_date_gmt` ASC) VISIBLE;

CREATE INDEX `comment_parent` ON  `wp_comments` (`comment_parent` ASC) VISIBLE;

CREATE INDEX `comment_author_email` ON  `wp_comments` (`comment_author_email`(10) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_links`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_links` ;

CREATE TABLE IF NOT EXISTS  `wp_links` (
  `link_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` VARCHAR(255) NOT NULL DEFAULT '',
  `link_name` VARCHAR(255) NOT NULL DEFAULT '',
  `link_image` VARCHAR(255) NOT NULL DEFAULT '',
  `link_target` VARCHAR(25) NOT NULL DEFAULT '',
  `link_description` VARCHAR(255) NOT NULL DEFAULT '',
  `link_visible` VARCHAR(20) NOT NULL DEFAULT 'Y',
  `link_owner` BIGINT(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` INT(11) NOT NULL DEFAULT '0',
  `link_updated` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` VARCHAR(255) NOT NULL DEFAULT '',
  `link_notes` MEDIUMTEXT NOT NULL,
  `link_rss` VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `link_visible` ON  `wp_links` (`link_visible` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_options` ;

CREATE TABLE IF NOT EXISTS  `wp_options` (
  `option_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` VARCHAR(191) NOT NULL DEFAULT '',
  `option_value` LONGTEXT NOT NULL,
  `autoload` VARCHAR(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 142
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE UNIQUE INDEX `option_name` ON  `wp_options` (`option_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_postmeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_postmeta` ;

CREATE TABLE IF NOT EXISTS  `wp_postmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `post_id` ON  `wp_postmeta` (`post_id` ASC) VISIBLE;

CREATE INDEX `meta_key` ON  `wp_postmeta` (`meta_key`(191) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_posts` ;

CREATE TABLE IF NOT EXISTS  `wp_posts` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` LONGTEXT NOT NULL,
  `post_title` TEXT NOT NULL,
  `post_excerpt` TEXT NOT NULL,
  `post_status` VARCHAR(20) NOT NULL DEFAULT 'publish',
  `comment_status` VARCHAR(20) NOT NULL DEFAULT 'open',
  `ping_status` VARCHAR(20) NOT NULL DEFAULT 'open',
  `post_password` VARCHAR(255) NOT NULL DEFAULT '',
  `post_name` VARCHAR(200) NOT NULL DEFAULT '',
  `to_ping` TEXT NOT NULL,
  `pinged` TEXT NOT NULL,
  `post_modified` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` LONGTEXT NOT NULL,
  `post_parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` VARCHAR(255) NOT NULL DEFAULT '',
  `menu_order` INT(11) NOT NULL DEFAULT '0',
  `post_type` VARCHAR(20) NOT NULL DEFAULT 'post',
  `post_mime_type` VARCHAR(100) NOT NULL DEFAULT '',
  `comment_count` BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `post_name` ON  `wp_posts` (`post_name`(191) ASC) VISIBLE;

CREATE INDEX `type_status_date` ON  `wp_posts` (`post_type` ASC, `post_status` ASC, `post_date` ASC, `ID` ASC) VISIBLE;

CREATE INDEX `post_parent` ON  `wp_posts` (`post_parent` ASC) VISIBLE;

CREATE INDEX `post_author` ON  `wp_posts` (`post_author` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_term_relationships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_term_relationships` ;

CREATE TABLE IF NOT EXISTS  `wp_term_relationships` (
  `object_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`, `term_taxonomy_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `term_taxonomy_id` ON  `wp_term_relationships` (`term_taxonomy_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_term_taxonomy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_term_taxonomy` ;

CREATE TABLE IF NOT EXISTS  `wp_term_taxonomy` (
  `term_taxonomy_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` VARCHAR(32) NOT NULL DEFAULT '',
  `description` LONGTEXT NOT NULL,
  `parent` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` BIGINT(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE UNIQUE INDEX `term_id_taxonomy` ON  `wp_term_taxonomy` (`term_id` ASC, `taxonomy` ASC) VISIBLE;

CREATE INDEX `taxonomy` ON  `wp_term_taxonomy` (`taxonomy` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_termmeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_termmeta` ;

CREATE TABLE IF NOT EXISTS  `wp_termmeta` (
  `meta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`meta_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `term_id` ON  `wp_termmeta` (`term_id` ASC) VISIBLE;

CREATE INDEX `meta_key` ON  `wp_termmeta` (`meta_key`(191) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_terms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_terms` ;

CREATE TABLE IF NOT EXISTS  `wp_terms` (
  `term_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL DEFAULT '',
  `slug` VARCHAR(200) NOT NULL DEFAULT '',
  `term_group` BIGINT(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `slug` ON  `wp_terms` (`slug`(191) ASC) VISIBLE;

CREATE INDEX `name` ON  `wp_terms` (`name`(191) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_usermeta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_usermeta` ;

CREATE TABLE IF NOT EXISTS  `wp_usermeta` (
  `umeta_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` VARCHAR(255) NULL DEFAULT NULL,
  `meta_value` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`umeta_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `user_id` ON  `wp_usermeta` (`user_id` ASC) VISIBLE;

CREATE INDEX `meta_key` ON  `wp_usermeta` (`meta_key`(191) ASC) VISIBLE;


-- -----------------------------------------------------
-- Table  `wp_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS  `wp_users` ;

CREATE TABLE IF NOT EXISTS  `wp_users` (
  `ID` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` VARCHAR(60) NOT NULL DEFAULT '',
  `user_pass` VARCHAR(255) NOT NULL DEFAULT '',
  `user_nicename` VARCHAR(50) NOT NULL DEFAULT '',
  `user_email` VARCHAR(100) NOT NULL DEFAULT '',
  `user_url` VARCHAR(100) NOT NULL DEFAULT '',
  `user_registered` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` VARCHAR(255) NOT NULL DEFAULT '',
  `user_status` INT(11) NOT NULL DEFAULT '0',
  `display_name` VARCHAR(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_520_ci;

CREATE INDEX `user_login_key` ON  `wp_users` (`user_login` ASC) VISIBLE;

CREATE INDEX `user_nicename` ON  `wp_users` (`user_nicename` ASC) VISIBLE;

CREATE INDEX `user_email` ON  `wp_users` (`user_email` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
