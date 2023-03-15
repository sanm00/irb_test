-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: gitlabhq_production
-- ------------------------------------------------------
-- Server version	5.6.47-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_logs`
--

DROP TABLE IF EXISTS `access_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip',
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `day` int(11) NOT NULL COMMENT '日',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `stat_type` int(11) DEFAULT '0' COMMENT '统计类型',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业id',
  PRIMARY KEY (`id`),
  KEY `index_p_s_c_u` (`project_id`,`stat_type`,`created_at`,`user_id`),
  KEY `index_p_s_y_m_d_u_ip` (`project_id`,`stat_type`,`year`,`month`,`day`,`user_id`,`ip`),
  KEY `index_created` (`created_at`),
  KEY `index_access_logs_on_eid` (`enterprise_id`,`created_at`,`stat_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库访问统计日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `access_secret_keys`
--

DROP TABLE IF EXISTS `access_secret_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_secret_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'APP KEY',
  `private_key` text COLLATE utf8mb4_unicode_ci COMMENT '秘钥',
  `public_key` text COLLATE utf8mb4_unicode_ci COMMENT '私钥',
  `succeed_count` int(11) DEFAULT '0' COMMENT '成功次数',
  `failed_count` int(11) DEFAULT '0' COMMENT '失败次数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_access_secret_keys_on_app_key` (`app_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='鉴权秘钥匙表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `day` int(11) DEFAULT NULL COMMENT '日',
  `date_type` int(11) NOT NULL COMMENT '时间类型',
  `date` datetime DEFAULT NULL COMMENT '时间',
  `new_user_count` int(11) DEFAULT NULL COMMENT '新增用户数量',
  `new_project_count` int(11) DEFAULT NULL COMMENT '新增仓库数量',
  `new_private_project_count` int(11) DEFAULT NULL COMMENT '新增私有仓库数量',
  `new_enterprise_count` int(11) DEFAULT NULL COMMENT '新增企业数量',
  `new_enterprise_user_count` int(11) DEFAULT NULL COMMENT '新增企业用户数量',
  `new_group_count` int(11) DEFAULT NULL COMMENT '新增组织数量',
  `new_pr_count` int(11) DEFAULT NULL COMMENT '新增 PR 数量',
  `new_issue_count` int(11) DEFAULT NULL COMMENT '新增 Issue 数量',
  `new_push_count` int(11) DEFAULT NULL COMMENT '新增 Push 数量',
  `active_user_count` int(11) DEFAULT NULL COMMENT '活跃用户数量',
  `active_project_count` int(11) DEFAULT NULL COMMENT '活跃仓库数量',
  `active_private_project_count` int(11) DEFAULT NULL COMMENT '活跃私有仓库数量',
  `active_enterprise_count` int(11) DEFAULT NULL COMMENT '活跃企业数量',
  `active_enterprise_user_count` int(11) DEFAULT NULL COMMENT '活跃企业用户数量',
  `active_group_count` int(11) DEFAULT NULL COMMENT '活跃组织数量',
  `active_pr_count` int(11) DEFAULT NULL COMMENT '活跃 PR 数量',
  `active_issue_count` int(11) DEFAULT NULL COMMENT '活跃 Issue 数量',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `new_star_count` int(11) DEFAULT NULL COMMENT '新增 Star 数量',
  `new_watch_count` int(11) DEFAULT NULL COMMENT '新增 Watch 数量',
  `new_follow_count` int(11) DEFAULT NULL COMMENT '新增 Follow 数量',
  `new_fork_count` int(11) DEFAULT NULL COMMENT '新增 Fork 数量',
  `new_code_count` int(11) DEFAULT NULL COMMENT '新增 Code 数量',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '续费数量',
  `users_count` int(11) DEFAULT NULL COMMENT '个人用户总数',
  `enterprises_count` int(11) DEFAULT NULL COMMENT '企业用户总数',
  `created_by_direct_count` int(11) DEFAULT NULL COMMENT '企业用户（通过直接新建）数量',
  `created_by_person_count` int(11) DEFAULT NULL COMMENT '企业用户（通过个人创建）数量',
  `created_by_gitosc_upgrade_count` int(11) DEFAULT NULL COMMENT '企业用户（通过个人升级）数量',
  `created_by_group_upgrade_count` int(11) DEFAULT NULL COMMENT '企业用户（通过组织升级）数量',
  `paid_enterprise_count` int(11) DEFAULT NULL COMMENT '付费企业用户总数',
  `paid_enterprise_new_count` int(11) DEFAULT NULL COMMENT '付费企业用户净新增',
  `paid_enterprise_base_count` int(11) DEFAULT NULL COMMENT '付费企业（标准版）用户数量',
  `paid_enterprise_high_count` int(11) DEFAULT NULL COMMENT '付费企业（高级版）用户数量',
  `paid_enterprise_unlimited_count` int(11) DEFAULT NULL COMMENT '付费企业（尊享版）用户数量',
  `active_active_user_count` int(11) DEFAULT NULL COMMENT '个人用户（活跃）数量',
  `active_common_user_count` int(11) DEFAULT NULL COMMENT '个人用户（一般）数量',
  `active_out_user_count` int(11) DEFAULT NULL COMMENT '个人用户（流失）数量',
  `active_back_user_count` int(11) DEFAULT NULL COMMENT '个人用户（回流）数量',
  `active_active_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（活跃）数量',
  `active_common_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（一般）数量',
  `active_out_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（流失）数量',
  `active_back_enterprise_count` int(11) DEFAULT NULL COMMENT '企业用户（回流）数量',
  `enterprise_charge_title_count` int(11) DEFAULT NULL COMMENT '付费企业用户（变更套餐）数量',
  `enterprise_on_title_count` int(11) DEFAULT NULL COMMENT '付费企业用户（续费）数量',
  `new_education_count` int(11) DEFAULT NULL COMMENT '新增高校版数量',
  `enterprise_new_order_count` int(11) DEFAULT NULL COMMENT '新购企业版数量',
  `enterprise_upgrade_order_count` int(11) DEFAULT NULL COMMENT '企业升级订单数量',
  `enterprise_upgrade_quota_order_count` int(11) DEFAULT NULL COMMENT '增加订单配额数量',
  `enterprise_order_renew_count` int(11) DEFAULT NULL COMMENT '续费(含升级/降级续费)数量',
  `order_total_count` int(11) DEFAULT NULL COMMENT '订单总数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_accounts_on_y_m_d_dt` (`year`,`month`,`day`,`date_type`),
  KEY `index_accounts_on_date_and_date_type` (`date`,`date_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='数据统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_wallets`
--

DROP TABLE IF EXISTS `activity_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（可提现/申请中/已提现/已兑换/已失效）',
  `mark` int(11) NOT NULL DEFAULT '0' COMMENT '标识位',
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `applied_at` datetime DEFAULT NULL COMMENT '申请提现时间',
  `completed_at` datetime DEFAULT NULL COMMENT '提现|兑换|失效 时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_wallets_on_user_id` (`user_id`),
  KEY `index_activity_wallets_on_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='活动红包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` text COLLATE utf8_unicode_ci COMMENT '广告位名称',
  `path` text COLLATE utf8_unicode_ci COMMENT '广告位唯一标识符',
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '尺寸',
  `activity` tinyint(1) DEFAULT NULL COMMENT '状态',
  `ad_type` text COLLATE utf8_unicode_ci COMMENT '类型',
  `link` text COLLATE utf8_unicode_ci COMMENT '链接地址',
  `address` text COLLATE utf8_unicode_ci COMMENT '加载地址',
  `end_time` datetime DEFAULT NULL COMMENT '到期时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `traceid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告追踪标识符',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='广告管理表\n#废弃';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alipay_auths`
--

DROP TABLE IF EXISTS `alipay_auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `cert_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `cert_type` int(11) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `certify_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '认证订单标识符',
  `order_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求唯一标识',
  `passed` tinyint(1) DEFAULT '0' COMMENT '验证是否通过',
  `checked` tinyint(1) DEFAULT '0' COMMENT '是否扫脸完成并回调',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_alipay_auths_on_order_no` (`order_no`),
  KEY `index_alipay_auths_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apk_build`
--

DROP TABLE IF EXISTS `apk_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apk_build` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `commit_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'commit id',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'git 引用',
  `build_tool` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建工具',
  `build_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建类型',
  `keystore_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '别名',
  `keystore_keypass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'keypass',
  `keystore_storepass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'storepass',
  `keystore_keystore` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'keystore',
  `repo_keystore` int(11) DEFAULT '0' COMMENT 'keystore相对路径或者仓库地址',
  `state` int(11) DEFAULT '0' COMMENT '构建状态',
  `log` mediumtext COLLATE utf8_unicode_ci COMMENT '日志',
  `apks_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'apk下载链接',
  `progress` int(11) DEFAULT '0' COMMENT '构建进度',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_apk_build_on_commit_id` (`commit_id`),
  KEY `index_apk_build_on_project_id_and_created_at` (`project_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='安卓构建表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_mb_loggers`
--

DROP TABLE IF EXISTS `app_mb_loggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_mb_loggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_type` int(11) DEFAULT NULL COMMENT 'APP类型',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `error` int(11) DEFAULT NULL COMMENT '错误',
  `post_content` text COLLATE utf8_unicode_ci COMMENT '详情',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_shakes`
--

DROP TABLE IF EXISTS `app_shakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_shakes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `result` tinyint(1) DEFAULT '0' COMMENT '结果',
  `prize_id` int(11) DEFAULT NULL COMMENT '奖品 id',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖品名称',
  `delivered` tinyint(1) DEFAULT '0' COMMENT '标记是否发货',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_app_shakes_on_user_id` (`user_id`),
  KEY `index_app_shakes_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP摇一摇抽奖表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_versions`
--

DROP TABLE IF EXISTS `app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本号',
  `num_version` int(11) DEFAULT NULL COMMENT '数字版本号',
  `download_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载地址',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `version_type` int(11) DEFAULT NULL COMMENT '类型',
  `relevance_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关 URL',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='APP版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_type_reasons`
--

DROP TABLE IF EXISTS `appeal_type_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal_type_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '理由',
  `position` int(11) DEFAULT '0' COMMENT '排序',
  `appeal_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_appeal_type_reasons_on_appeal_type_id` (`appeal_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='举报用户理由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeal_types`
--

DROP TABLE IF EXISTS `appeal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `complaint_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属举报类型(Project、 Comment)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appeals`
--

DROP TABLE IF EXISTS `appeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appeals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appealable_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `appeal_type_id` int(11) DEFAULT NULL COMMENT '举报类型 id',
  `status` int(11) DEFAULT '0' COMMENT '举报状态（未处理/已处理/无效举报/驳回举报）',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '举报内容',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `appealable_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属类型（Project, Note）',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `addition` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '附言',
  PRIMARY KEY (`id`),
  KEY `index_appeals_on_a_appeal_type_s_u` (`appealable_type`,`appealable_id`,`appeal_type_id`,`status`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_actions`
--

DROP TABLE IF EXISTS `article_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `article_id` int(11) NOT NULL COMMENT '文章 id',
  `useful` tinyint(1) DEFAULT NULL COMMENT '文章是否有用',
  `collection` tinyint(1) DEFAULT NULL COMMENT '是否收藏',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_article_actions_on_user_id_and_article_id` (`user_id`,`article_id`),
  KEY `index_article_actions_on_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_categories`
--

DROP TABLE IF EXISTS `article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int(11) DEFAULT NULL COMMENT '文章 id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_article_categories_on_category_id_and_article_id` (`category_id`,`article_id`),
  KEY `index_article_categories_on_article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_labels`
--

DROP TABLE IF EXISTS `article_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签名字',
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色',
  `popular` tinyint(1) DEFAULT '0' COMMENT '是否是热门标签',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_article_labels_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `author_id` int(11) NOT NULL DEFAULT '0' COMMENT '作者 id',
  `author_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作者名字',
  `catalog_type` int(11) NOT NULL DEFAULT '0' COMMENT '种类',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `section_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属',
  `section_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `public` tinyint(1) DEFAULT '1' COMMENT '是否公开',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '是否推荐',
  `blocked` tinyint(1) DEFAULT '0' COMMENT '是否屏蔽',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文章链接',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT '图片地址',
  `top` int(11) DEFAULT '0' COMMENT '排序',
  `view_count` int(11) DEFAULT '0' COMMENT '浏览数',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `recommend_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '概述',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据库标识（社区那边返回）',
  PRIMARY KEY (`id`),
  KEY `index_articles_on_author_id` (`author_id`),
  KEY `index_articles_on_public_and_blocked_and_catalog_type` (`public`,`blocked`,`catalog_type`),
  KEY `index_articles_on_section_id_and_section_type_and_catalog_type` (`section_id`,`section_type`,`catalog_type`),
  KEY `index_articles_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attach_files`
--

DROP TABLE IF EXISTS `attach_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attach_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '格式',
  `download_count` int(11) DEFAULT NULL COMMENT '下载次数',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版本',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `remote_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'storage 的存储路径',
  `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '组名',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `attachable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `attachable_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `program_id` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0' COMMENT '文档节点ID',
  PRIMARY KEY (`id`),
  KEY `index_attach_files_on_project_id` (`project_id`),
  KEY `index_attach_on_attachable` (`attachable_id`,`attachable_type`),
  KEY `index_attach_files_on_enterprise_id` (`enterprise_id`),
  KEY `index_attach_files_on_program_id` (`program_id`),
  KEY `index_attach_files_on_node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL COMMENT '被操作对象',
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被操作对象类型',
  `associated_id` int(11) DEFAULT NULL COMMENT '相关对象 id',
  `associated_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相关对象类型',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户类型',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作',
  `audited_changes` text COLLATE utf8_unicode_ci COMMENT '变更内容',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `remote_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip 地址',
  `operate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户具体操作',
  `created_at` datetime DEFAULT NULL,
  `useragent_id` int(11) DEFAULT NULL COMMENT 'user agent id',
  `request_uuid` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'request uuid',
  PRIMARY KEY (`id`),
  KEY `index_audits_on_associated` (`associated_id`,`associated_type`),
  KEY `index_audits_on_user` (`user_id`,`user_type`),
  KEY `index_audits_on_user_id_and_operate` (`user_id`,`operate`),
  KEY `index_audits_on_created_at` (`created_at`),
  KEY `index_audits_on_request_uuid` (`request_uuid`),
  KEY `index_audits_on_auditable_version` (`auditable_id`,`auditable_type`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='审计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_actions`
--

DROP TABLE IF EXISTS `automation_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_rule_id` int(11) NOT NULL COMMENT '自动化规则ID',
  `kind` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识符',
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段名',
  `field_action_kind` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段操作类型',
  `field_action_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段操作值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_actions_on_automation_rule_id` (`automation_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_conditions`
--

DROP TABLE IF EXISTS `automation_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_rule_id` int(11) NOT NULL COMMENT '自动化规则ID',
  `kind` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '条件标识符',
  `compare_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '源值或源字段',
  `compare_kind` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '比较类型',
  `compare_target` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标比较值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_conditions_on_automation_rule_id` (`automation_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_event_logs`
--

DROP TABLE IF EXISTS `automation_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_event_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_kind` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '事件类型',
  `trigger_user_id` int(11) NOT NULL COMMENT '触发用户ID',
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `event_source_id` int(11) NOT NULL COMMENT '事件来源ID',
  `event_source_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '事件来源类型',
  `event_source_changes` text COLLATE utf8mb4_unicode_ci COMMENT '事件有关的来源数据变化',
  `event_params` text COLLATE utf8mb4_unicode_ci COMMENT '事件其他参数',
  `state` int(11) NOT NULL COMMENT '处理状态（未处理、完成等）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_event_logs_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_events`
--

DROP TABLE IF EXISTS `automation_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `automation_rule_id` int(11) NOT NULL COMMENT '自动化规则ID',
  `kind` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '事件标识符',
  `field_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '影响字段',
  `field_action_kind` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段操作类型（标签添加、删除等）',
  `field_action_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段操作值',
  `field_from_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段变前值',
  `field_to_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段变后值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_events_on_ari_kind` (`automation_rule_id`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_logs`
--

DROP TABLE IF EXISTS `automation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
  `trigger_user_id` int(11) DEFAULT NULL COMMENT '触发用户id',
  `automation_rule_id` int(11) NOT NULL COMMENT '自动化规则id',
  `automation_event_log_id` int(11) NOT NULL COMMENT '执行日志对应的事件日志',
  `number` int(11) DEFAULT NULL COMMENT '执行日志编号',
  `success` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否成功',
  `execution_log` text COLLATE utf8mb4_unicode_ci COMMENT '执行过程日志',
  `state` int(11) NOT NULL COMMENT '执行状态',
  `started_at` datetime(6) DEFAULT NULL COMMENT '自动化规则开始执行时间',
  `finished_at` datetime(6) DEFAULT NULL COMMENT '自动化规则结束执行时间',
  `duration` int(11) DEFAULT NULL COMMENT '运行时间（ms）',
  `reduced_duration` int(11) DEFAULT NULL COMMENT '节约时间（ms）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_logs_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_rule_groups`
--

DROP TABLE IF EXISTS `automation_rule_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_rule_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL COMMENT '关联企业',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `position` int(11) DEFAULT NULL COMMENT '排序位置',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_rule_groups_on_enterprise_id_and_position` (`enterprise_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `automation_rules`
--

DROP TABLE IF EXISTS `automation_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业ID',
  `automation_rule_group_id` int(11) DEFAULT NULL COMMENT '自动化规则分组ID',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人ID(User)',
  `position` int(11) DEFAULT NULL COMMENT '排序位置',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_automation_rules_on_eid_pos_ari` (`enterprise_id`,`position`,`automation_rule_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backups`
--

DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `backtime` int(11) NOT NULL COMMENT '备份时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_backups_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='备份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_blobs`
--

DROP TABLE IF EXISTS `block_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_blobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '所属仓库 id',
  `blob_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽文件 id',
  `blob_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽文件名称',
  `commit_sha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件 commit',
  `action` int(11) DEFAULT NULL COMMENT '屏蔽文件名称',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `request_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_block_blobs_on_project_id` (`project_id`),
  KEY `index_block_blobs_on_blob_path_pid` (`blob_id`(40),`blob_path`(25),`project_id`),
  KEY `index_block_blobs_on_project_id_and_blob_id` (`project_id`,`blob_id`(64)),
  KEY `index_block_blobs_on_project_id_and_action` (`project_id`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_logs`
--

DROP TABLE IF EXISTS `block_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作用户',
  `action` int(11) DEFAULT NULL COMMENT '动作',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '屏蔽原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `source` int(11) DEFAULT '0' COMMENT '区分屏蔽操作者是管理员还是系统自动屏蔽（0: 管理员, 1: 系统）',
  PRIMARY KEY (`id`),
  KEY `index_block_logs_on_target_id_and_created_at` (`target_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='屏蔽日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `blocked_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '被封的IP地址／段',
  `admin_id` int(11) DEFAULT NULL COMMENT '操作者 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `forbidden_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'all' COMMENT '禁止的模块',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_block_ip` (`blocked_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='屏蔽ip表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `board_templates`
--

DROP TABLE IF EXISTS `board_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板唯一标示',
  `area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属区块',
  `public` int(11) DEFAULT '0' COMMENT '公开/私有属性',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  `system` tinyint(1) DEFAULT NULL COMMENT '是否由系统提供的模板',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Logo 的 url',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_board_templates_on_area_and_ident` (`area`,`ident`),
  KEY `index_board_templates_on_enterprise_id_and_area_and_ident` (`enterprise_id`,`area`,`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分支表',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名字',
  `commit_sha` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提交 SHA',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `committed_date` datetime NOT NULL COMMENT '提交时间',
  `commit_author_id` int(11) DEFAULT NULL COMMENT '提交用户 ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_project_id_name_commit_sha_uindex` (`project_id`,`name`(191),`commit_sha`),
  KEY `index_branches_on_project_id_and_deleted_at` (`project_id`,`deleted_at`),
  KEY `index_branches_on_project_id_and_updated_at` (`project_id`,`updated_at`),
  KEY `index_branches_on_project_id_and_committed_date` (`project_id`,`committed_date`),
  KEY `index_branches_on_project_id_and_user_id` (`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分支表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司',
  `call_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `contacts_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'privatization' COMMENT '咨询类型',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '咨询内容',
  PRIMARY KEY (`id`),
  KEY `index_businesses_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='私有化/企业版 购买咨询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `case_modules`
--

DROP TABLE IF EXISTS `case_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父模块 ID',
  `enterprise_id` int(11) NOT NULL COMMENT '模块所属企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块所属项目 ID',
  `lft` int(11) NOT NULL COMMENT '模块左值',
  `rgt` int(11) NOT NULL COMMENT '模块右值',
  `depth` int(11) NOT NULL DEFAULT '0' COMMENT '模块深度',
  `children_count` int(11) NOT NULL DEFAULT '0' COMMENT '子模块数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_case_modules_on_enterprise_id` (`enterprise_id`),
  KEY `index_case_modules_on_program_id` (`program_id`),
  KEY `index_case_modules_on_lft` (`lft`),
  KEY `index_case_modules_on_rgt` (`rgt`),
  KEY `index_case_modules_on_parent_id` (`parent_id`),
  KEY `index_case_modules_on_depth` (`depth`),
  KEY `index_case_modules_on_enterprise_id_and_program_id_and_name` (`enterprise_id`,`program_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `case_steps`
--

DROP TABLE IF EXISTS `case_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL COMMENT '所属测试用例 ID',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用例步骤描述',
  `expected_result` text COLLATE utf8mb4_unicode_ci COMMENT '预期结果',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `enterprise_id` int(11) NOT NULL COMMENT '所属企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属项目 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_case_steps_on_case_id` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级 id',
  `top` int(11) DEFAULT '0' COMMENT '分类排序',
  `kind` int(11) DEFAULT '0' COMMENT '类型（是否显示在首页）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `portrait` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '层级',
  `position` int(11) DEFAULT '0' COMMENT '首页排序',
  PRIMARY KEY (`id`),
  KEY `index_categories_on_ancestry` (`ancestry`),
  KEY `index_categories_on_parent_id_and_top` (`parent_id`,`top`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_annotations`
--

DROP TABLE IF EXISTS `check_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_annotations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查的代码注释',
  `check_run_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件路径',
  `start_line` int(11) NOT NULL COMMENT '开始行',
  `end_line` int(11) NOT NULL COMMENT '结束行',
  `start_column` int(11) DEFAULT NULL COMMENT '开始列',
  `end_column` int(11) DEFAULT NULL COMMENT '结束列',
  `annotation_level` int(11) NOT NULL COMMENT '注释级别',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '信息',
  `raw_details` text COLLATE utf8mb4_unicode_ci COMMENT '详情',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_check_annotations_on_check_run_id` (`check_run_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='检查的代码注释';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `check_runs`
--

DROP TABLE IF EXISTS `check_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提交的检查项',
  `creator_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '检查名',
  `head_sha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提交 sha',
  `details_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情链接',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `started_at` datetime DEFAULT NULL COMMENT '结束时间',
  `conclusion` int(11) DEFAULT NULL COMMENT '结论',
  `completed_at` datetime DEFAULT NULL COMMENT '完成时间',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `summary` text COLLATE utf8mb4_unicode_ci COMMENT '概论',
  `text` text COLLATE utf8mb4_unicode_ci COMMENT '详细信息',
  `images` text COLLATE utf8mb4_unicode_ci COMMENT 'UI 图像',
  `actions` text COLLATE utf8mb4_unicode_ci COMMENT '功能按钮',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_check_runs_on_project_id` (`project_id`),
  KEY `index_check_runs_on_head_pid_name` (`head_sha`,`project_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提交的检查项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_build_logs`
--

DROP TABLE IF EXISTS `ci_build_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_build_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `total_time` int(11) DEFAULT NULL COMMENT '总时间',
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编译结果',
  `log` longtext COLLATE utf8_unicode_ci COMMENT '编译日志',
  `ci_job_id` int(11) DEFAULT NULL COMMENT '构建工作 id',
  `jenkins_log_id` int(11) DEFAULT NULL COMMENT 'jenkins 日志 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `sequence` int(11) DEFAULT NULL COMMENT '排序',
  `download_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '编译详情',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ci_build_logs_on_ci_job_id` (`ci_job_id`),
  KEY `index_ci_build_logs_on_user_id` (`user_id`),
  KEY `index_ci_build_logs_on_enterprise_id` (`enterprise_id`),
  KEY `index_ci_build_logs_on_jenkins_log_id` (`jenkins_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_jobs`
--

DROP TABLE IF EXISTS `ci_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '任务名',
  `build_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '构建工具',
  `branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '分支',
  `build_frequency` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'week' COMMENT '频率',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'JDK版本',
  `notify_by_email` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邮件接收',
  `notify_by_letter` tinyint(1) NOT NULL DEFAULT '0' COMMENT '私信接收',
  `notified_users` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通知给哪些人',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `jenkins_job_id` int(11) DEFAULT NULL COMMENT 'jenkins job 的 id',
  `web_hook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '构建成功回调',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_ci_jobs_on_project_id` (`project_id`),
  KEY `index_ci_jobs_on_user_id` (`user_id`),
  KEY `index_ci_jobs_on_enterprise_id` (`enterprise_id`),
  KEY `index_ci_jobs_on_jenkins_job_id` (`jenkins_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='持续集成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cla_confirms`
--

DROP TABLE IF EXISTS `cla_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cla_confirms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CLA 确认表',
  `pull_request_id` int(11) NOT NULL COMMENT 'PR id',
  `commit_sha` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提交SHA',
  `can_merge` tinyint(1) DEFAULT '0' COMMENT '可以合并',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cla_confirms_on_pull_request_id_and_commit_sha` (`pull_request_id`,`commit_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CLA 确认表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_check_cpp_parameters`
--

DROP TABLE IF EXISTS `code_check_cpp_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_check_cpp_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_check_task_id` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `check_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '检查工具ID',
  `ruleset_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则集ID',
  `cppcheck_command` text COLLATE utf8mb4_unicode_ci COMMENT 'cppcheck检查参数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code_check_cpp_parameters_on_code_check_task_id` (`code_check_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_check_csharp_parameters`
--

DROP TABLE IF EXISTS `code_check_csharp_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_check_csharp_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_check_task_id` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `check_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '检查工具ID',
  `ruleset_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则集ID',
  `compile_tool` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编译工具',
  `msbuild_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'msbuild版本',
  `dotnet_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dotnet版本',
  `msbuild_compile_command` text COLLATE utf8mb4_unicode_ci COMMENT 'msbuild编译命令',
  `dotnet_compile_command` text COLLATE utf8mb4_unicode_ci COMMENT 'dotnet编译命令',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code_check_csharp_parameters_on_code_check_task_id` (`code_check_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_check_java_parameters`
--

DROP TABLE IF EXISTS `code_check_java_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_check_java_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_check_task_id` int(11) DEFAULT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `check_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '检查工具ID',
  `ruleset_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则集ID',
  `compile_tool` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '编译工具',
  `maven_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'maven版本',
  `gradle_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'gradle版本',
  `maven_compile_command` text COLLATE utf8mb4_unicode_ci COMMENT 'maven编译命令',
  `gradle_compile_command` text COLLATE utf8mb4_unicode_ci COMMENT 'gradle编译命令',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code_check_java_parameters_on_code_check_task_id` (`code_check_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_check_rules`
--

DROP TABLE IF EXISTS `code_check_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_check_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CodeCheck检查规则（数据由接口导入）',
  `rule_id` int(11) DEFAULT NULL COMMENT '规则id',
  `rule_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则所属语言',
  `rule_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则名称',
  `rule_severity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则问题级别',
  `rule_tages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则标签',
  `right_example` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '正确示例',
  `error_example` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '错误示例',
  `revise_opinion` mediumtext COLLATE utf8mb4_unicode_ci COMMENT '修改建议',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code_check_rules_on_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='CodeCheck检查规则（数据由接口导入）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_check_tasks`
--

DROP TABLE IF EXISTS `code_check_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_check_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'DevCloud检查任务编号',
  `project_id` int(11) DEFAULT NULL COMMENT '所属项目',
  `user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '检测的分支',
  `last_check_at` datetime DEFAULT NULL COMMENT '上次请求检查时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `path_with_namespace` text COLLATE utf8mb4_unicode_ci COMMENT '仓库路径',
  PRIMARY KEY (`id`),
  KEY `index_code_check_tasks_on_project_id_and_branch_name` (`project_id`,`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_owner_duties`
--

DROP TABLE IF EXISTS `code_owner_duties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_owner_duties` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Code Owner职责',
  `assign_id` int(11) DEFAULT NULL,
  `rule_regex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '命中规则的正则表达式',
  `line_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则所在的行号',
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CODEOWNERS文件地址',
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code_owner_duties_on_assign_id` (`assign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Code Owner职责';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_pieces`
--

DROP TABLE IF EXISTS `code_pieces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piece_type` int(11) DEFAULT '0',
  `code_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_code_pieces_on_code_id_and_title` (`code_id`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '1',
  `description` text COLLATE utf8_unicode_ci,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `root_id` int(11) NOT NULL DEFAULT '0',
  `stars_count` int(11) DEFAULT '0',
  `noteable_count` int(11) DEFAULT '0',
  `forks_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `in_square` tinyint(1) NOT NULL DEFAULT '1',
  `pieces_count` int(11) DEFAULT '0',
  `storages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_path` varchar(540) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_codes_on_key` (`key`),
  KEY `index_codes_on_user_id` (`user_id`),
  KEY `index_codes_on_created_at` (`created_at`),
  KEY `index_codes_lang_category_square_created_at` (`lang_id`,`category_id`,`in_square`,`created_at`),
  KEY `index_codes_on_lang_id_and_in_square_and_created_at` (`lang_id`,`in_square`,`created_at`),
  KEY `index_codes_on_category_id_and_in_square_and_created_at` (`category_id`,`in_square`,`created_at`),
  KEY `index_codes_on_root_id_and_created_at` (`root_id`,`created_at`),
  KEY `index_codes_on_in_square_and_created_at` (`in_square`,`created_at`),
  KEY `index_codes_on_in_square_and_root_id` (`in_square`,`root_id`),
  KEY `index_codes_on_disk_path` (`disk_path`(78))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coin_logs`
--

DROP TABLE IF EXISTS `coin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `reason_type` int(11) NOT NULL COMMENT '获得途径',
  `coin_count` int(11) NOT NULL COMMENT '数量',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_coin_logs_on_user` (`user_id`,`reason_type`,`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='G币流水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_order_details`
--

DROP TABLE IF EXISTS `commerce_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commerce_order_id` int(11) NOT NULL COMMENT '订单ID',
  `source_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '资源类型',
  `change_action` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `before_value` int(11) DEFAULT NULL COMMENT '变更之前的量',
  `change_value` int(11) DEFAULT NULL COMMENT '变更量',
  `after_value` int(11) DEFAULT NULL COMMENT '变更之后的量',
  `original_price` decimal(10,2) DEFAULT '0.00' COMMENT '原价',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '其他信息',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_commerce_order_details_on_commerce_order_id` (`commerce_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1',
  `paid_by_id` int(11) DEFAULT '0',
  `order_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `period` int(11) DEFAULT '1',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `renew_period` int(11) DEFAULT '0',
  `paid_at` datetime DEFAULT NULL,
  `payment_channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `order_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NEW',
  `shift_price` int(11) DEFAULT '0',
  `commerce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'EnterpriseCommerce',
  `user_id` int(11) DEFAULT '0',
  `sys_promotion_id` int(11) DEFAULT '0',
  `original_price` int(11) DEFAULT '0',
  `expire_at` datetime DEFAULT NULL COMMENT '订单过期时间',
  `account_at` datetime DEFAULT NULL COMMENT '到账时间',
  `strategy_version` int(11) NOT NULL DEFAULT '1' COMMENT '收费策略版本',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '订单来源(1: 用户裂变)',
  PRIMARY KEY (`id`),
  KEY `index_commerce_order_on_target` (`target_id`,`target_type`,`state`,`created_at`),
  KEY `index_on_state_target_channel` (`state`,`target_type`,`payment_channel`),
  KEY `index_commerce_orders_on_source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_packages`
--

DROP TABLE IF EXISTS `commerce_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerce_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '套餐名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `month_num` int(11) NOT NULL DEFAULT '12' COMMENT '月数',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '套餐级别',
  `all_project_quota` int(11) NOT NULL DEFAULT '10' COMMENT '仓库总容量配额（单位G）',
  `single_project_quota` int(11) NOT NULL DEFAULT '1' COMMENT '单仓库容量配额（单位G）',
  `single_file_quota` int(11) NOT NULL DEFAULT '100' COMMENT '单文件大小配额（单位M）',
  `all_attach_quota` int(11) NOT NULL DEFAULT '5' COMMENT '总附件配额（单位G）',
  `all_lfs_quota` int(11) NOT NULL DEFAULT '1' COMMENT 'LFS配额（单位G）',
  `tag_type` int(11) NOT NULL DEFAULT '0' COMMENT '标签类型（热门）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_commerce_packages_on_level_and_state` (`level`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerces`
--

DROP TABLE IF EXISTS `commerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commerces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `member_quota` int(11) DEFAULT '50',
  `space_quota` int(11) DEFAULT '10',
  `level` int(11) DEFAULT '1',
  `single_project_quota` int(11) DEFAULT '1',
  `single_file_quota` int(11) DEFAULT '100',
  `state` int(11) DEFAULT '1',
  `attach_quota` int(11) DEFAULT '0',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'EnterpriseCommerce',
  `ob_key` int(11) DEFAULT '0',
  `month_num` int(11) DEFAULT '12',
  `concurrence_quota` int(11) DEFAULT '5',
  `lfs_space_quota` int(11) DEFAULT '1' COMMENT 'LFS 配额',
  `member_changes_progress` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '套餐成员变更记录',
  PRIMARY KEY (`id`),
  KEY `index_commerces_on_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commit_reviews`
--

DROP TABLE IF EXISTS `commit_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commit_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `commit_sha` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit sha',
  `commit_message` text COLLATE utf8mb4_unicode_ci COMMENT 'commit message',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `sensitive_word` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '屏蔽触发关键字',
  `result` tinyint(4) DEFAULT '0' COMMENT '结果(0：没问题，1：有问题)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_commit_reviews_on_project_id_and_commit_sha` (`project_id`,`commit_sha`),
  KEY `index_commit_reviews_on_commit_sha` (`commit_sha`),
  KEY `index_commit_reviews_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compensation_infos`
--

DROP TABLE IF EXISTS `compensation_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compensation_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '受影响企业 ID',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '补偿申请状态',
  `applicant_id` int(11) NOT NULL DEFAULT '0' COMMENT '申请人 ID',
  `apply_at` datetime DEFAULT NULL COMMENT '申请时间',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '补偿申请备注',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_compensation_infos_on_enterprise_id` (`enterprise_id`),
  KEY `index_compensation_infos_on_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_check_whole_issues`
--

DROP TABLE IF EXISTS `content_check_whole_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_check_whole_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT 'issue_id',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态(1:已处理，0:未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `risk_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险结论(pass/review/reject)',
  `risk_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险描述',
  `judgment` tinyint(4) DEFAULT '0' COMMENT '1:误判',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_check_whole_issues_on_issue_id` (`issue_id`),
  KEY `index_content_check_whole_issues_on_state` (`state`),
  KEY `index_content_check_whole_issues_on_risk_level` (`risk_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_checks`
--

DROP TABLE IF EXISTS `content_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属的表',
  `target_id` int(11) DEFAULT NULL COMMENT '归属id',
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '请求数美的唯一标识',
  `state` tinyint(4) DEFAULT '0' COMMENT '状态(1:已处理，0:未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `risk_level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险结论(pass/review/reject)',
  `risk_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '风险描述',
  `judgment` tinyint(4) DEFAULT '0' COMMENT '1:误判',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_checks_on_target_type_and_target_id` (`target_type`,`target_id`),
  KEY `index_content_checks_on_state` (`state`),
  KEY `index_content_checks_on_risk_level` (`risk_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_reviews`
--

DROP TABLE IF EXISTS `content_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '归属的表',
  `reviewable_id` int(11) DEFAULT NULL COMMENT '归属id',
  `sensitive_word` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '敏感词的上下文',
  `state` smallint(6) DEFAULT NULL COMMENT '状态(已处理，未处理)',
  `handle_time` datetime DEFAULT NULL COMMENT '处理人时间',
  `handler_id` int(11) DEFAULT NULL COMMENT '处理人的id',
  `handler` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理人',
  `scan_type` int(11) DEFAULT NULL COMMENT '扫描类型(百度/gitee)',
  `conclusion_type` smallint(6) DEFAULT NULL COMMENT '结论类型(违规/疑似/审核失败)',
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容类型(低质灌水/暴恐违禁/文本色情/政治敏感/恶意推广/低俗辱骂)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `log_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '日志 id',
  `result` tinyint(4) DEFAULT '0' COMMENT '结果(0：没问题，1：有问题)',
  PRIMARY KEY (`id`),
  KEY `index_content_reviews_on_reviewable_id_and_reviewable_type` (`reviewable_id`,`reviewable_type`),
  KEY `index_content_reviews_on_result` (`result`),
  KEY `index_content_reviews_on_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contests` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `description` text COLLATE utf8_unicode_ci COMMENT '简介',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '短地址',
  `identity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '短标识',
  `project_public` tinyint(1) DEFAULT NULL COMMENT '仓库是否公开',
  `before_at` datetime DEFAULT NULL COMMENT '截止时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `home_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '大赛官网',
  `judges` text COLLATE utf8_unicode_ci COMMENT '活动评委',
  `contest_id` int(11) DEFAULT NULL COMMENT '父活动 id',
  `manager_id` int(11) DEFAULT NULL COMMENT '负责人 id',
  PRIMARY KEY (`id`),
  KEY `index_contests_on_path_and_identity` (`path`,`identity`),
  KEY `index_contests_on_identity` (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='活动管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contributions`
--

DROP TABLE IF EXISTS `contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '日期（类型: 字符串）',
  `contribution` text COLLATE utf8_unicode_ci COMMENT '贡献',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `date_time` date DEFAULT NULL COMMENT '日期（类型: 时间）',
  `count` int(11) DEFAULT '0' COMMENT '一天的贡献度',
  PRIMARY KEY (`id`),
  KEY `index_contributions_on_user_id_and_created_at` (`user_id`,`created_at`),
  KEY `index_contributions_on_user_id_and_date_time_and_count` (`user_id`,`date_time`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='贡献度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_aliyuns`
--

DROP TABLE IF EXISTS `credential_aliyuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_aliyuns` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '阿里云凭证',
  `access_key_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeyId',
  `access_key_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeySecret',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='阿里云凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_ding_talks`
--

DROP TABLE IF EXISTS `credential_ding_talks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_ding_talks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钉钉 凭证',
  `web_hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WebHook 地址',
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加签密钥',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='钉钉 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_dockers`
--

DROP TABLE IF EXISTS `credential_dockers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_dockers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Docker 凭证',
  `server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库地址',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Docker 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_fei_shus`
--

DROP TABLE IF EXISTS `credential_fei_shus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_fei_shus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '飞书 凭证',
  `web_hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WebHook 地址',
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加签密钥',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='飞书 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_huaweis`
--

DROP TABLE IF EXISTS `credential_huaweis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_huaweis` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '华为云凭证',
  `access_key_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeyId',
  `access_key_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeySecret',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='华为云凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_jenkins`
--

DROP TABLE IF EXISTS `credential_jenkins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_jenkins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Jenkins 凭证',
  `server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务地址',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Jenkins 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_kubernetes`
--

DROP TABLE IF EXISTS `credential_kubernetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_kubernetes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'K8s 凭证',
  `kube_config` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'KubeConfig',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='K8s 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_mavens`
--

DROP TABLE IF EXISTS `credential_mavens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_mavens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Maven 凭证',
  `server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '服务地址',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maven 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_program_refs`
--

DROP TABLE IF EXISTS `credential_program_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_program_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `credential_id` int(11) NOT NULL COMMENT '凭证ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_credential_program_refs_on_credential_id_and_program_id` (`credential_id`,`program_id`),
  KEY `index_credential_program_refs_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_projects`
--

DROP TABLE IF EXISTS `credential_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '凭证关联仓库',
  `credential_id` int(11) NOT NULL COMMENT '凭据ID',
  `project_id` int(11) NOT NULL COMMENT '项目ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_credential_projects_on_credential_id_and_project_id` (`credential_id`,`project_id`),
  KEY `index_credential_projects_on_credential_id` (`credential_id`),
  KEY `index_credential_projects_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='凭证关联仓库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_tencents`
--

DROP TABLE IF EXISTS `credential_tencents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_tencents` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '腾讯云凭证',
  `access_key_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeyId',
  `access_key_secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AccessKeySecret',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='腾讯云凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_username_passwords`
--

DROP TABLE IF EXISTS `credential_username_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_username_passwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户名密码 凭证',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户名密码 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credential_wei_xins`
--

DROP TABLE IF EXISTS `credential_wei_xins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_wei_xins` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信 凭证',
  `web_hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WebHook 地址',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='微信 凭证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '凭证 表',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '归属的表',
  `target_id` int(11) NOT NULL COMMENT '归属id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证名称',
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户定义的凭证id',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '凭证类型',
  `model_id` int(11) NOT NULL COMMENT '凭证类型子表id',
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all' COMMENT '凭证作用域 all,project',
  `project_count` int(11) NOT NULL DEFAULT '0' COMMENT '关联 Project 数量',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_credentials_on_uid_and_target_id_and_target_type` (`uid`,`target_id`,`target_type`),
  KEY `index_credentials_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_credentials_on_model_id_and_model_type` (`model_id`,`model_type`),
  KEY `index_credentials_on_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='凭证 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csdn_emails`
--

DROP TABLE IF EXISTS `csdn_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csdn_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_csdn_emails_on_user_id` (`user_id`),
  KEY `index_csdn_emails_on_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='CSDN 邮箱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deploy_keys_projects`
--

DROP TABLE IF EXISTS `deploy_keys_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deploy_keys_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `deploy_key_id` int(11) NOT NULL COMMENT '公钥 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用公钥',
  PRIMARY KEY (`id`),
  KEY `index_deploy_key` (`project_id`,`deploy_key_id`),
  KEY `index_deploy_keys_projects_on_key` (`deploy_key_id`,`enabled`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部署公钥表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diff_positions`
--

DROP TABLE IF EXISTS `diff_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diff_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PR diff 评论的位置信息表',
  `author_id` int(11) NOT NULL,
  `pull_request_id` int(11) NOT NULL,
  `head_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_sha` char(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '新文件路径',
  `old_path` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '老文件路径',
  `start_new_line` int(11) DEFAULT NULL COMMENT '起始新行',
  `start_old_line` int(11) DEFAULT NULL COMMENT '起始老行',
  `start_line_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起始行标识码',
  `new_line` int(11) DEFAULT NULL COMMENT '新行',
  `old_line` int(11) DEFAULT NULL COMMENT '老行',
  `line_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '行标识码',
  `original_backup` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原始位置的数据备份',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `diff_hunk` text COLLATE utf8mb4_unicode_ci,
  `resolved_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '解决状态',
  `resolved_user_id` int(11) DEFAULT NULL COMMENT '解决人',
  `resolved_at` datetime DEFAULT NULL COMMENT '解决时间',
  PRIMARY KEY (`id`),
  KEY `index_diff_positions_on_author_id` (`author_id`),
  KEY `index_diff_positions_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='PR diff 评论的位置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_authorities`
--

DROP TABLE IF EXISTS `doc_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL COMMENT '文件节点 id',
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT '0' COMMENT '权限值',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_authorities_on_enterprise_id_and_node_id` (`enterprise_id`,`node_id`),
  KEY `index_doc_authorities_on_node_id_and_target_type_and_target_id` (`node_id`,`target_type`,`target_id`),
  KEY `index_doc_authorities_on_target_type_and_target_id` (`target_type`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文件权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_directories`
--

DROP TABLE IF EXISTS `doc_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_directories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT '0' COMMENT '项目 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_directories_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文档的文件夹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_nodes`
--

DROP TABLE IF EXISTS `doc_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件标题',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级id',
  `file_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件多态表',
  `file_id` int(11) DEFAULT '0' COMMENT '文件关联表 id',
  `public` int(11) DEFAULT '0' COMMENT '文件的公开属性',
  `program_id` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业id',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者id',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问密码',
  `is_top` tinyint(1) DEFAULT '0' COMMENT '是否置顶',
  `project_id` int(11) DEFAULT '0' COMMENT '所属仓库 id',
  `scrum_sprint_id` int(11) NOT NULL DEFAULT '0' COMMENT '迭代ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_doc_nodes_on_enterprise_and_file_type_and_parent_id_and_name` (`parent_id`,`enterprise_id`,`file_type`,`program_id`,`name`),
  KEY `index_doc_nodes_on_file_type_and_file_id` (`file_type`,`file_id`),
  KEY `index_doc_nodes_on_enterprise_id_and_file_type_and_file_id` (`enterprise_id`,`file_type`,`file_id`),
  KEY `index_doc_nodes_on_enterprise_id_and_scrum_sprint_id` (`enterprise_id`,`scrum_sprint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文件(包含文件夹、文档、附件)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_versions`
--

DROP TABLE IF EXISTS `doc_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_sort_id` int(11) DEFAULT NULL COMMENT 'wiki_sort 的关联 id',
  `sha` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit_id',
  `description` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'commit 描述',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `commit_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_doc_versions_on_sort_id_commit` (`wiki_sort_id`,`commit_at`),
  KEY `index_doc_versions_on_wiki_sort_id_and_sha` (`wiki_sort_id`,`sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `host` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'host',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属类型',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密钥',
  `verified` tinyint(1) DEFAULT '0' COMMENT '是否验证',
  `token_generated_at` datetime DEFAULT NULL COMMENT '密钥生成时间',
  PRIMARY KEY (`id`),
  KEY `idx_domain_host` (`host`),
  KEY `index_domains_on_target_type_and_target_id_and_host_and_verified` (`target_type`,`target_id`,`host`,`verified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='域名表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donates`
--

DROP TABLE IF EXISTS `donates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donates` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '留言',
  `donator_id` int(11) DEFAULT NULL COMMENT '捐赠者 id',
  `receiver_id` int(11) NOT NULL COMMENT '接收者 id',
  `money_in_cent` int(11) NOT NULL COMMENT '金额',
  `status` int(11) NOT NULL COMMENT '状态',
  `donator_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '捐赠人名字',
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易编号',
  PRIMARY KEY (`id`),
  KEY `index_donates_on_project_id_and_status` (`project_id`,`status`),
  KEY `index_donates_on_receiver_id_and_status` (`receiver_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='捐赠表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edu_applications`
--

DROP TABLE IF EXISTS `edu_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edu_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `school_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学校名称',
  `teacher_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师名称',
  `teacher_certification` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师证',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'pending' COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `refuse_reason` text COLLATE utf8_unicode_ci COMMENT '拒绝原因',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_edu_applications_on_user_id` (`user_id`),
  KEY `index_edu_applications_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='高校版申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱状态（0: 未确认 / 1: 已确认 / 2: 占用中）',
  `scope` int(11) NOT NULL DEFAULT '0' COMMENT '邮箱作用域（主邮箱、提交邮箱、安全邮箱、通知邮箱、公开邮箱）',
  `confirmation_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '确认令牌',
  `confirmed_at` datetime DEFAULT NULL COMMENT '邮箱确认时间',
  `confirmation_sent_at` datetime DEFAULT NULL COMMENT '邮箱确认发送时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_emails_on_confirmation_token` (`confirmation_token`),
  KEY `index_emails_on_user_id` (`user_id`),
  KEY `index_emails_on_email_and_state` (`email`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emergencies`
--

DROP TABLE IF EXISTS `emergencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emergencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip 地址（英文逗号分割的多个 IP 地址）',
  `level` int(11) DEFAULT '1' COMMENT '告警级别',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警描述',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `state` int(11) DEFAULT '0' COMMENT '状态（0: 未读，1: 已读）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `security_id` int(11) DEFAULT NULL COMMENT '安全策略 id',
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '地区（英文逗号分割的 国家，省，市）',
  `target_path` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警的仓库地址',
  `member_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作者的备注名',
  PRIMARY KEY (`id`),
  KEY `index_emergencies_on_enterprise_id_and_state` (`enterprise_id`,`state`),
  KEY `index_emergencies_on_user_id` (`user_id`),
  KEY `index_emergencies_on_enterprise_id_and_updated_at` (`enterprise_id`,`updated_at`),
  KEY `index_emergencies_on_security_user_update` (`security_id`,`user_id`,`updated_at`),
  KEY `index_emergencies_on_enterprise_id_and_user_id` (`enterprise_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='告警表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_boards`
--

DROP TABLE IF EXISTS `enterprise_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联用户',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `board_template_id` int(11) NOT NULL DEFAULT '0' COMMENT '数据表 board_template 的 id',
  `position_x` float NOT NULL DEFAULT '0' COMMENT 'x轴位置',
  `position_y` float NOT NULL DEFAULT '0' COMMENT 'y轴位置',
  `width` float NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` float NOT NULL DEFAULT '0' COMMENT '高度',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件边框颜色',
  `custom_config` text COLLATE utf8mb4_unicode_ci COMMENT '组件个性化配置',
  PRIMARY KEY (`id`),
  KEY `idx_enterprise_id_and_user_id` (`enterprise_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_changelogs`
--

DROP TABLE IF EXISTS `enterprise_changelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drawer_image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '抽屉封面图片链接',
  `modal_image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '弹窗封面图片链接',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新日志标题',
  `overview_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新内容',
  `detail_content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新详细内容',
  `article_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '更新详情链接',
  `publish_at` datetime NOT NULL COMMENT '发布时间',
  `scope` int(11) NOT NULL COMMENT '可见范围',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_infos`
--

DROP TABLE IF EXISTS `enterprise_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `default_passwd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '初始密码',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '告警信息接收者',
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `notice` text COLLATE utf8_unicode_ci COMMENT '企业公告',
  `scale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发团队规模',
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属行业',
  `inviter_id` int(11) DEFAULT '0' COMMENT '邀请者 id',
  `open_application` tinyint(1) DEFAULT '0' COMMENT '是否开启申请加入',
  `space_quota_percent` int(11) DEFAULT '0' COMMENT '容量使用百分比',
  `hidden_commerce` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '隐藏套餐的 id 串(,分割)',
  `expected_ips` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'IP 限制',
  `message_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新成员加入时，欢迎私信内容',
  `oauth_scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业第三方应用授权权限',
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `default_role_id` int(11) DEFAULT '0' COMMENT '默认的角色权限，对应角色表的id',
  `lastest_ident` int(11) DEFAULT '1000' COMMENT '记录 ident 的最新值',
  `manual_scan` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'GiteeScan 手动扫描开关',
  `pr_scan` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Gitee Scan PR 自动扫描',
  `last_event_date` datetime DEFAULT NULL COMMENT '企业最近event日期',
  `force_verify_apply` int(11) DEFAULT '0',
  `version` tinyint(1) DEFAULT '0',
  `webhooks_count` int(11) DEFAULT '50' COMMENT 'Webhook 数量上限',
  `watermark` tinyint(1) DEFAULT '1',
  `kooder_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `trial_status` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '体验套餐使用状态：未体验、拒绝、已体验',
  `fun_module_int` int(11) NOT NULL DEFAULT '0' COMMENT '企业高级功能特殊配置',
  `priority_template` int(11) NOT NULL DEFAULT '1' COMMENT '企业使用的模版',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_infos_on_enterprise_id` (`enterprise_id`),
  KEY `index_enterprise_infos_on_inviter_id` (`inviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_interviews`
--

DROP TABLE IF EXISTS `enterprise_interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_interviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '要回访的企业',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人',
  `assignee_id` int(11) DEFAULT NULL COMMENT '指派人',
  `update_by_id` int(11) DEFAULT NULL COMMENT '更新人',
  `times` int(11) DEFAULT '1' COMMENT '回访次数',
  `state` int(11) DEFAULT '0' COMMENT '状态',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回访要求',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `message_type` int(11) NOT NULL DEFAULT '0' COMMENT '回访类型',
  `last_event_date` datetime DEFAULT NULL COMMENT '企业最近event日期',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_interviews_on_state_and_created_at` (`state`,`created_at`),
  KEY `index_enterprise_interviews_on_enter_id_state_created` (`enterprise_id`,`state`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_logs`
--

DROP TABLE IF EXISTS `enterprise_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ip',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stat_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联对象ID',
  `related_type` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联对象类型',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_logs_on_user_id_and_stat_type` (`user_id`,`stat_type`),
  KEY `index_log_on_enterprise_and_target` (`enterprise_id`,`target_id`,`target_type`),
  KEY `index_enterprise_logs_on_enterprise_id_and_stat_type` (`enterprise_id`,`stat_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='企业操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_member_histories`
--

DROP TABLE IF EXISTS `enterprise_member_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_member_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '关联企业 id',
  `user_id` int(11) NOT NULL COMMENT '关联用户 id',
  `member_remark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '离职时的成员备注',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enterprise_member_histories_on_eid` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_navigates`
--

DROP TABLE IF EXISTS `enterprise_navigates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_navigates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `program_id` int(11) DEFAULT '0' COMMENT '项目 id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '导航栏选项名称',
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '导航栏选项图标',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `active` tinyint(1) DEFAULT '1' COMMENT '激活状态',
  `fixed` tinyint(1) DEFAULT '0' COMMENT '禁止隐藏',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enterprise_navigates_on_enterprise_id` (`enterprise_id`),
  KEY `index_enterprise_navigates_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_recipients`
--

DROP TABLE IF EXISTS `enterprise_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `recipient_type` int(11) NOT NULL COMMENT '通知方式',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '通知目标',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_enterprise_recipients_on_enterprise_id_and_content` (`enterprise_id`,`content`),
  KEY `enterprise_recipients_index` (`enterprise_id`,`recipient_type`,`content`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enterprise_roles`
--

DROP TABLE IF EXISTS `enterprise_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enterprise_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `description` text COLLATE utf8_unicode_ci COMMENT '角色描述',
  `issue_rule` int(11) DEFAULT '0' COMMENT '任务权限规则',
  `message_rule` int(11) DEFAULT '0' COMMENT '群发私信权限规则',
  `notice_rule` int(11) DEFAULT '0' COMMENT '企业公告权限规则',
  `emergency_rule` int(11) DEFAULT '0' COMMENT '企业告警权限规则',
  `label_manage_rule` int(11) DEFAULT '0' COMMENT '任务标签权限规则',
  `issue_type_status_rule` int(11) DEFAULT '0' COMMENT '任务类型和状态权限规则',
  `git_lfs_rule` int(11) DEFAULT '0' COMMENT 'gitlfs权限规则',
  `emergency_log_rule` int(11) DEFAULT '0' COMMENT '企业告警权限规则',
  `pull_request_rule` int(11) DEFAULT '0' COMMENT 'PR权限规则',
  `week_report_rule` int(11) DEFAULT '0' COMMENT '周报权限规则',
  `event_rule` int(11) DEFAULT '0' COMMENT '动态权限规则',
  `program_rule` int(11) DEFAULT '0' COMMENT '项目权限规则',
  `project_rule` int(11) DEFAULT '0' COMMENT '仓库权限规则',
  `group_rule` int(11) DEFAULT '0' COMMENT '团队权限规则',
  `doc_rule` int(11) DEFAULT '0' COMMENT '文档权限规则',
  `member_rule` int(11) DEFAULT '0' COMMENT '成员管理权限规则',
  `info_rule` int(11) DEFAULT '0' COMMENT '企业信息权限规则',
  `role_rule` int(11) DEFAULT '0' COMMENT '角色设置权限规则',
  `security_rule` int(11) DEFAULT '0' COMMENT '安全设置权限规则',
  `log_rule` int(11) DEFAULT '0' COMMENT '操作日志权限规则',
  `order_rule` int(11) DEFAULT '0' COMMENT '订单管理权限规则',
  `key_rule` int(11) DEFAULT '0' COMMENT '部署公钥权限规则',
  `hook_rule` int(11) DEFAULT '0' COMMENT 'webhook权限规则',
  `statistic_rule` int(11) DEFAULT '0' COMMENT '企业统计权限规则',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `system_default` tinyint(1) DEFAULT '0' COMMENT '系统默认类型',
  `enterprise_rule` int(11) DEFAULT '0' COMMENT '企业管理权限规则',
  `access_rule` int(11) DEFAULT '1' COMMENT '企业访问权限',
  `ident` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'custom_role' COMMENT '企业内置角色的标识符',
  `test_repository_rule` int(11) DEFAULT '0' COMMENT '测试用例库相关权限',
  `test_plan_rule` int(11) DEFAULT '0' COMMENT '测试用例计划相关权限',
  `giteego_pipeline_rule` int(11) DEFAULT '0' COMMENT '流水线权限',
  `automation_rule` int(11) DEFAULT '0' COMMENT '自动化权限规则',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_roles_on_id_name` (`enterprise_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_data`
--

DROP TABLE IF EXISTS `event_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `event_id` int(11) DEFAULT NULL COMMENT '动态 id',
  `data` text COLLATE utf8_unicode_ci COMMENT '数据',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_event_data_on_event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '动态标题',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `action` int(11) DEFAULT NULL COMMENT '动态行为',
  `author_id` int(11) DEFAULT NULL COMMENT '动态创建者 id',
  `public` tinyint(1) DEFAULT '1' COMMENT '标示动态是否公开',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  PRIMARY KEY (`id`),
  KEY `index_events_on_created_at` (`created_at`),
  KEY `index_events_on_project_id_and_public` (`project_id`,`public`),
  KEY `index_projects_on_pid_c_action` (`project_id`,`created_at`,`action`),
  KEY `index_events_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_events_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_events_on_author_id_and_created_at_and_public` (`author_id`,`created_at`,`public`),
  KEY `index_events_on_author_id_and_public_and_created_at` (`author_id`,`public`,`created_at`),
  KEY `index_events_on_action_and_created_at` (`created_at`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_projects`
--

DROP TABLE IF EXISTS `explore_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stars_count` int(11) DEFAULT NULL COMMENT 'star数量',
  `recomm_at` datetime DEFAULT NULL COMMENT '推荐时间',
  `last_push_at` datetime DEFAULT NULL COMMENT '最近推送时间',
  `recomm` tinyint(1) DEFAULT NULL COMMENT '推荐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_explore_projects_on_project_id_and_category_id` (`project_id`,`category_id`),
  KEY `index_explore_projects_on_category_id` (`category_id`),
  KEY `index_explore_projects_on_language_id` (`language_id`),
  KEY `index_explore_projects_on_license` (`license`),
  KEY `index_explore_projects_on_stars_count` (`stars_count`),
  KEY `index_explore_projects_on_recomm_at` (`recomm_at`),
  KEY `index_explore_projects_on_last_push_at` (`last_push_at`),
  KEY `index_explore_projects_on_recomm` (`recomm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feature_update_logs`
--

DROP TABLE IF EXISTS `feature_update_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_update_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noti_level` int(11) NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '功能更新描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_conditions`
--

DROP TABLE IF EXISTS `filter_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL COMMENT '筛选器ID',
  `logic` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'and' COMMENT '条件逻辑关系，默认与',
  `comparator` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '条件比较运算符',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '查询对象类型',
  `property` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '查询属性',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查询匹配的值',
  `issue_field_id` int(11) NOT NULL DEFAULT '0' COMMENT '自定义字段id',
  `issue_field_type` int(11) NOT NULL DEFAULT '0' COMMENT '自定义字段值类型',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_filter_conditions_on_filter_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_infos`
--

DROP TABLE IF EXISTS `filter_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL,
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模式',
  `display_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '展示类型',
  `sort` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '排序',
  `direction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'desc or asc',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_filter_infos_on_filter_id` (`filter_id`),
  KEY `index_filter_infos_on_sort_and_direction` (`sort`,`direction`),
  KEY `index_filter_infos_on_filter_id_and_mode_and_display_type` (`filter_id`,`mode`,`display_type`),
  KEY `index_filter_infos_on_filter_id_and_display_type` (`filter_id`,`display_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `filter_id` int(11) NOT NULL COMMENT '筛选器ID',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `issue_type_category` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型属性对应int值',
  PRIMARY KEY (`id`),
  KEY `index_on_eid_pid_uid_hidden` (`enterprise_id`,`program_id`,`user_id`,`hidden`),
  KEY `index_filter_settings_on_filter_id` (`filter_id`),
  KEY `index_on_eid_pid_itc_uid` (`enterprise_id`,`program_id`,`issue_type_category`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
  `public` int(11) NOT NULL DEFAULT '1' COMMENT '公开2/私有1',
  `creator_id` int(11) NOT NULL COMMENT '创建者',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `issue_type_category` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型属性对应int值',
  PRIMARY KEY (`id`),
  KEY `index_filters_on_type` (`type`),
  KEY `index_filters_on_creator_id` (`creator_id`),
  KEY `index_on_eid_pid_public_type` (`enterprise_id`,`program_id`,`public`,`type`),
  KEY `index_filters_on_program_id` (`program_id`),
  KEY `index_on_eid_pid_itc` (`enterprise_id`,`program_id`,`issue_type_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follows` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `self_id` int(11) DEFAULT NULL COMMENT 'follow 用户 id',
  `follow_id` int(11) DEFAULT NULL COMMENT '被 follow 用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `follow_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'User',
  PRIMARY KEY (`id`),
  KEY `index_follows_on_self_id` (`self_id`),
  KEY `index_follows_on_follow_id` (`follow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Follows 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `forced_synchronizations`
--

DROP TABLE IF EXISTS `forced_synchronizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forced_synchronizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `sync_type` int(11) DEFAULT '0' COMMENT '同步类型',
  `sync_count` int(11) DEFAULT '0' COMMENT '同步次数',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forced_synchronizations_on_project_id` (`project_id`),
  KEY `index_forced_synchronizations_on_sync_type` (`sync_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_cve_libs`
--

DROP TABLE IF EXISTS `fosseye_cve_libs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_cve_libs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fosseye_cve_task_id` int(11) NOT NULL COMMENT '任务 id',
  `lib_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件名',
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件位置',
  `lib_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组件版本',
  `clean_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐修复版本（无漏洞无数据）',
  `is_vul` tinyint(1) NOT NULL COMMENT '是否有漏洞',
  `max_level` int(11) NOT NULL DEFAULT '-1' COMMENT '风险等级',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fosseye_cve_libs_on_fosseye_cve_task_id` (`fosseye_cve_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_cve_tasks`
--

DROP TABLE IF EXISTS `fosseye_cve_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_cve_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `user_id` int(11) NOT NULL COMMENT '任务创建者id',
  `status` int(11) DEFAULT '0' COMMENT '检测任务状态(1：进行中，3：成功，4：失败，5：未处理)',
  `vul_count` int(11) DEFAULT '0' COMMENT '检测漏洞总数',
  `uuid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识符',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `commit_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '本次commit id',
  `res_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求返回的message',
  `scan_start_at` datetime DEFAULT NULL COMMENT '检测开始时间',
  `scan_end_at` datetime DEFAULT NULL COMMENT '检测结束时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fosseye_cve_tasks_on_uuid` (`uuid`),
  KEY `index_fosseye_cve_tasks_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_cve_vuls`
--

DROP TABLE IF EXISTS `fosseye_cve_vuls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_cve_vuls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fosseye_cve_task_id` int(11) NOT NULL COMMENT '任务 id',
  `fosseye_cve_lib_id` int(11) NOT NULL COMMENT '组件 id',
  `cve_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '漏洞 id',
  `level` int(11) DEFAULT NULL COMMENT '漏洞等级（1-4 低中高严重）',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '漏洞名字',
  `lj_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci COMMENT '漏洞描述',
  `refs` text COLLATE utf8mb4_unicode_ci COMMENT '漏洞参考链接',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fosseye_cve_vuls_on_fosseye_cve_lib_id` (`fosseye_cve_lib_id`),
  KEY `index_fosseye_cve_vuls_on_fosseye_cve_task_id` (`fosseye_cve_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_data`
--

DROP TABLE IF EXISTS `fosseye_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fosseye_task_id` int(11) NOT NULL COMMENT '检测任务id',
  `lib_license_conflicts` longtext COLLATE utf8mb4_unicode_ci COMMENT '组件间许可证冲突列表',
  `project_license_conflicts` longtext COLLATE utf8mb4_unicode_ci COMMENT '项目与组件许可证冲突列表',
  `license` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '扫描时的仓库license',
  `scan_start_at` datetime DEFAULT NULL COMMENT '检测开始的时间',
  `scan_end_at` datetime DEFAULT NULL COMMENT '检测开始的时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_fosseye_data_on_fosseye_task_id` (`fosseye_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fosseye_tasks`
--

DROP TABLE IF EXISTS `fosseye_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fosseye_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `user_id` int(11) NOT NULL COMMENT '任务创建者id',
  `status` int(11) DEFAULT '0' COMMENT '检测任务状态',
  `uuid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识符',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `commit_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '本次commit id',
  `res_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '请求返回的message',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_fosseye_tasks_on_uuid` (`uuid`),
  KEY `index_fosseye_tasks_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `friendly_links`
--

DROP TABLE IF EXISTS `friendly_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendly_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `img_url` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `link_to` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'links' COMMENT '分类',
  `status` int(11) DEFAULT '1' COMMENT '状态',
  `location` int(11) DEFAULT '0' COMMENT '摆放位置（值越小越靠前）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `page_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'links' COMMENT '所属页面',
  `change_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交换链接地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友链管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fxiaoke_operation_sync_records`
--

DROP TABLE IF EXISTS `fxiaoke_operation_sync_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fxiaoke_operation_sync_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业id',
  `fxiaoke_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享销客id',
  `webhook_count` int(11) DEFAULT '0' COMMENT '企业webhook总数',
  `fx_webhook_count` int(11) DEFAULT '0' COMMENT '纷享webhook总数',
  `issue_count` int(11) DEFAULT '0' COMMENT '企业issue总数',
  `fx_issue_count` int(11) DEFAULT '0' COMMENT '纷享任务数',
  `member_count` int(11) DEFAULT '0' COMMENT '企业用户总数',
  `fx_member_count` int(11) DEFAULT '0' COMMENT '纷享企业成员数',
  `standard_program_count` int(11) DEFAULT '0' COMMENT '企业标准项目数',
  `fx_standard_program_count` int(11) DEFAULT '0' COMMENT '纷享标准项目数',
  `scrum_program_count` int(11) DEFAULT '0' COMMENT '企业scrum项目数',
  `fx_scrum_program_count` int(11) DEFAULT '0' COMMENT '纷享scrum项目数',
  `kanban_program_count` int(11) DEFAULT '0' COMMENT '企业看板项目数',
  `fx_kanban_program_count` int(11) DEFAULT '0' COMMENT '纷享看板项目数',
  `project_count` int(11) DEFAULT '0' COMMENT '企业仓库数',
  `fx_project_count` int(11) DEFAULT '0' COMMENT '纷享创建仓库数',
  `push_count` int(11) DEFAULT '0' COMMENT '代码推送数',
  `fx_push_count` int(11) DEFAULT '0' COMMENT '纷享代码直推数',
  `pr_merged_count` int(11) DEFAULT '0' COMMENT '企业PR已合并总数',
  `fx_pr_merged_count` int(11) DEFAULT '0' COMMENT '纷享PR已合并总数',
  `doc_count` int(11) DEFAULT '0' COMMENT '企业知识库中的文档数',
  `fx_doc_count` int(11) DEFAULT '0' COMMENT '纷享知识库中的文档数',
  `enterprise_quota_is_trial` tinyint(1) DEFAULT '0' COMMENT '企业试用政策是否是体验版',
  `fx_enterprise_quota_is_trial` tinyint(1) DEFAULT '0' COMMENT '纷享试用政策是否是体验版',
  `project_last_updated_at` datetime DEFAULT NULL COMMENT '企业仓库最近更新时间',
  `fx_project_last_updated_at` datetime DEFAULT NULL COMMENT '纷享销客企业仓库最近更新时间',
  `order_state` tinyint(1) DEFAULT '0' COMMENT '企业订单状态(已支付/未支付)',
  `fx_order_state` tinyint(1) DEFAULT '0' COMMENT '纷享订单状态(已支付/未支付)',
  `order_start_at` datetime DEFAULT NULL COMMENT '企业订单生效时间',
  `fx_order_start_at` datetime DEFAULT NULL COMMENT '纷享订单生效时间',
  `order_admin_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业使用版本',
  `fx_order_admin_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享使用版本',
  `order_paid_at` datetime DEFAULT NULL COMMENT '企业订单付费时间',
  `fx_order_paid_at` datetime DEFAULT NULL COMMENT '纷享订单付费时间',
  `stop_at` datetime DEFAULT NULL COMMENT '企业到期时间',
  `fx_stop_at` datetime DEFAULT NULL COMMENT '纷享到期时间',
  `order_renew_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业采购类型',
  `fx_order_renew_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享采购类型',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Gitee注册域名',
  `fx_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享Gitee注册域名',
  `enterprise_created_at` datetime DEFAULT NULL COMMENT '企业创建时间',
  `fx_enterprise_created_at` datetime DEFAULT NULL COMMENT '纷享创建时间',
  `admin_user_nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业创建者',
  `fx_admin_user_nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享创建者',
  `admin_user_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业创建者联系方式',
  `fx_admin_user_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享创建者联系方式',
  `admin_user_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业创建者邮箱',
  `fx_admin_user_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享企业创建者邮箱',
  `test_plan_count` int(11) DEFAULT '0' COMMENT '企业测试计划数',
  `fx_test_plan_count` int(11) DEFAULT '0' COMMENT '纷享企业测试计划数',
  `test_case_count` int(11) DEFAULT '0' COMMENT '企业测试用例数',
  `fx_test_case_count` int(11) DEFAULT '0' COMMENT '纷享测试用例数',
  `order_paid_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业已支付订单ids',
  `fx_order_paid_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纷享企业已支付订单ids',
  `synced_at` datetime DEFAULT NULL COMMENT '上次同步时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `enterprise_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_fxiaoke_operation_sync_records_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift_infos`
--

DROP TABLE IF EXISTS `gift_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品名称',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '礼品数量',
  `price` float DEFAULT NULL COMMENT '礼品价格',
  `img_type` int(11) DEFAULT '1' COMMENT '图片类型',
  `coin` int(11) NOT NULL COMMENT 'G 币',
  `status` int(11) DEFAULT '1' COMMENT '礼品状态',
  `img_url` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品图片',
  `link_to` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `link_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接标签',
  `location` int(11) DEFAULT '0' COMMENT '摆放顺序（数值越小越靠前）',
  `show_info` int(11) DEFAULT '1' COMMENT '是否显示礼品信息',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gift_orders`
--

DROP TABLE IF EXISTS `gift_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gift_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `addressee` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品状态',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `present_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `present_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `gift_express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品邮寄单号',
  `prize_express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '奖杯邮寄单号',
  PRIMARY KEY (`id`),
  KEY `index_gift_orders_on_user_id_and_created_at` (`user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `gift` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '礼品',
  `status` int(11) DEFAULT NULL COMMENT '状态（已邮件/待审核）',
  `price` int(11) DEFAULT NULL COMMENT '礼品所需 GB',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_gifts_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='礼品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_enterprise_statistics`
--

DROP TABLE IF EXISTS `gitee_enterprise_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_enterprise_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `enterprise_all_count` int(11) DEFAULT NULL COMMENT '企业总量',
  `enterprise_free_count` int(11) DEFAULT NULL COMMENT '免费企业总量',
  `enterprise_paid_count` int(11) DEFAULT NULL COMMENT '付费企业总量',
  `enterprise_paid_valid_count` int(11) DEFAULT NULL COMMENT '有效付费企业总量',
  `order_paid_count` int(11) DEFAULT NULL COMMENT '付款订单总量',
  `order_paid_price_count` int(11) DEFAULT NULL COMMENT '订单金额总量',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `issue_count` int(11) DEFAULT NULL COMMENT '任务总量',
  `pull_request_count` int(11) DEFAULT NULL COMMENT 'PR总量',
  `push_count` int(11) DEFAULT NULL COMMENT 'push 总量',
  `enterprise_all_new_count` int(11) DEFAULT NULL COMMENT '企业增量',
  `enterprise_free_new_count` int(11) DEFAULT NULL COMMENT '免费企业增量',
  `enterprise_paid_new_count` int(11) DEFAULT NULL COMMENT '付费企业增量',
  `order_paid_new_count` int(11) DEFAULT NULL COMMENT '付款订单增量',
  `order_paid_price_new_count` int(11) DEFAULT NULL COMMENT '订单金额增量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `issue_new_count` int(11) DEFAULT NULL COMMENT '任务增量',
  `pull_request_new_count` int(11) DEFAULT NULL COMMENT 'PR增量',
  `push_new_count` int(11) DEFAULT NULL COMMENT 'push 增量',
  `downgrade_to_free_new_count` int(11) DEFAULT NULL COMMENT '当天付费降级为免费增量',
  `enterprise_delete_new_count` int(11) DEFAULT NULL COMMENT '当天删除企业增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_overdue_new_count` int(11) DEFAULT NULL COMMENT '过期企业增量',
  `enterprise_renew_new_count` int(11) DEFAULT NULL COMMENT '过期企业增量',
  `enterprise_overdue_count` int(11) DEFAULT NULL COMMENT '续费企业总量',
  `enterprise_renew_count` int(11) DEFAULT NULL COMMENT '续费企业总量',
  PRIMARY KEY (`id`),
  KEY `index_gitee_enterprise_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_enterprise_statistics_on_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_artifact_repositories`
--

DROP TABLE IF EXISTS `gitee_go_artifact_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_artifact_repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '制品库唯一标识',
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '制品库名称',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类别',
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `ipipe_repo_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe 制品库id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '最后一次更新者id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projct_id_name` (`project_id`,`name`),
  KEY `index_gitee_go_artifact_repositories_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_batch_jobs`
--

DROP TABLE IF EXISTS `gitee_go_batch_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_batch_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum` int(11) NOT NULL DEFAULT '1',
  `success_num` int(11) NOT NULL DEFAULT '0' COMMENT '成功数量',
  `failure_num` int(11) NOT NULL DEFAULT '0' COMMENT '失败数量',
  `send_num` int(11) NOT NULL DEFAULT '0' COMMENT '下发数量',
  `report_state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '上报状态',
  `report_result` text COLLATE utf8mb4_unicode_ci COMMENT '上报结果',
  `report_time` datetime DEFAULT NULL,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_batch_jobs_on_gitee_go_host_group_id` (`gitee_go_host_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_builds`
--

DROP TABLE IF EXISTS `gitee_go_builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_builds` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gitee Go 构建记录表',
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库ID',
  `ipipe_pipeline_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe流水线ID',
  `ipipe_build_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ipipe构建ID',
  `ipipe_build_number` int(11) NOT NULL COMMENT '构建序号',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建状态',
  `branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发分支',
  `trigger_user_id` int(11) NOT NULL COMMENT '触发人ID',
  `ci_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发类型(push/...)',
  `commit` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发的commit',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建开始时间(时间戳)',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '构建结束时间(时间戳)',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '构建花费时间(seconds)',
  `source` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记录来源api/list',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gitee_go_pipeline_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go 流水线ID',
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态，UNBLOCK/BLOCK',
  `ipipe_trigger_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '触发时间',
  `ipipe_trigger_id` int(11) DEFAULT NULL COMMENT 'ipipe 触发实体ID',
  `charge_time` int(11) NOT NULL DEFAULT '0' COMMENT '收费时长',
  `job_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Job数量',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  `commit_message` text COLLATE utf8mb4_unicode_ci COMMENT '提交消息',
  `config_id` int(11) DEFAULT NULL COMMENT '配置 id',
  `pull_request_id` int(11) DEFAULT NULL COMMENT 'PR id',
  `trigger_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'GERRIT' COMMENT '触发模式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_builds_on_is_new_and_ipipe_build_id` (`is_new`,`ipipe_build_id`),
  KEY `index_gitee_go_builds_on_project_id_and_ipipe_build_id` (`project_id`,`ipipe_build_id`),
  KEY `index_gitee_go_builds_on_gitee_go_pipeline_id` (`gitee_go_pipeline_id`),
  KEY `index_gitee_go_builds_on_commit` (`commit`),
  KEY `index_gitee_go_builds_on_ipipe_build_id` (`ipipe_build_id`),
  KEY `index_gitee_go_builds_on_trigger_user_id_and_created_at` (`trigger_user_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gitee Go 构建记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_configs`
--

DROP TABLE IF EXISTS `gitee_go_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gitee GO 构建配置',
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `blob_id` char(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'blob id',
  `blob_data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配置内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_configs_on_project_id_and_blob_id` (`project_id`,`blob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gitee GO 构建配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_environment_variables`
--

DROP TABLE IF EXISTS `gitee_go_environment_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_environment_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '仓库ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '环境变量名称',
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '环境变量值',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '编辑者ID',
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `read_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读',
  `admin_level` int(11) NOT NULL DEFAULT '0' COMMENT '管理级别（仅管理员可见、仓库成员可见）',
  `is_secret` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是密钥',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_go_env_variables_on_pro_id_and_name` (`project_id`,`name`),
  KEY `index_go_env_variables_on_pro_id_and_r_o` (`project_id`,`read_only`),
  KEY `index_go_env_variables_on_pro_id_and_i_s` (`project_id`,`is_secret`),
  KEY `index_go_env_variables_on_pro_id_and_a_l` (`project_id`,`admin_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_host_groups`
--

DROP TABLE IF EXISTS `gitee_go_host_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_host_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '对应效率云的name',
  `display_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示给用户的id',
  `display_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '显示给用户的name',
  `host_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'self' COMMENT '自有主机或者第三方服务商提供的主机',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true/false',
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Enterprise',
  `resource_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xly_label_id` int(11) DEFAULT NULL,
  `hosts_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_host_groups_on_name` (`name`),
  UNIQUE KEY `index_gitee_go_host_groups_on_resource_and_dp_id` (`resource_type`,`resource_id`,`display_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_host_groups_projects`
--

DROP TABLE IF EXISTS `gitee_go_host_groups_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_host_groups_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gitee_go_hg_projects_on_hg_id_and_project_id` (`gitee_go_host_group_id`,`project_id`),
  KEY `index_gitee_go_host_groups_projects_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_hosts`
--

DROP TABLE IF EXISTS `gitee_go_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'online' COMMENT 'online/offline',
  `occupied` tinyint(1) NOT NULL DEFAULT '0',
  `gitee_go_host_group_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_hosts_on_gitee_go_host_group_id_and_active` (`gitee_go_host_group_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_job_logs`
--

DROP TABLE IF EXISTS `gitee_go_job_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_job_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `log_uuid` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `token` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CREATED',
  `info` text COLLATE utf8mb4_unicode_ci,
  `gitee_go_host_group_id` int(11) NOT NULL,
  `gitee_go_batch_job_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `gitee_go_job_id` int(11) DEFAULT NULL,
  `gitee_go_host_id` int(11) DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_job_logs_on_token` (`token`),
  KEY `index_gitee_go_job_logs_on_job_uuid` (`job_uuid`),
  KEY `index_gitee_go_job_logs_on_log_uuid` (`log_uuid`),
  KEY `index_gitee_go_job_logs_on_gitee_go_host_group_id` (`gitee_go_host_group_id`),
  KEY `index_gitee_go_job_logs_on_gitee_go_batch_job_id` (`gitee_go_batch_job_id`),
  KEY `index_gitee_go_job_logs_on_gitee_go_job_id` (`gitee_go_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_jobs`
--

DROP TABLE IF EXISTS `gitee_go_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipipe_job_id` int(11) NOT NULL COMMENT 'Ipipe Job ID',
  `gitee_go_stage_id` int(11) NOT NULL COMMENT '阶段ID',
  `ipipe_stage_id` int(11) NOT NULL COMMENT 'Ipipe 阶段ID',
  `ipipe_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游Job ID,第一个Job则为0(来自ipipe)',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Job 名称',
  `job_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结束时间',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '花费时间(start_time - end_time)(seconds)',
  `duration` bigint(20) DEFAULT NULL COMMENT 'Job执行时间(来自ipipe)',
  `error_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误类型（DEFAULT/SYSTEM,当状态为CANCEL和FAIL时才需要关注）',
  `error_message` text COLLATE utf8mb4_unicode_ci COMMENT 'Job执行错误信息',
  `log_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '实时日志参数',
  `full_log_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全量日志url',
  `artifact_url` varchar(764) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '制品url',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `real_start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'realJob开始时间',
  `real_end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'realJob结束时间',
  `real_spend_time` int(11) NOT NULL DEFAULT '0' COMMENT 'readJob花费时间',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_jobs_on_is_new_and_ipipe_job_id` (`is_new`,`ipipe_job_id`),
  KEY `index_gitee_go_jobs_on_gitee_go_stage_id` (`gitee_go_stage_id`),
  KEY `index_gitee_go_jobs_on_status` (`status`),
  KEY `index_gitee_go_jobs_on_ipipe_parent_id` (`ipipe_parent_id`),
  KEY `index_gitee_go_jobs_on_job_type` (`job_type`),
  KEY `index_gitee_go_jobs_on_ipipe_job_id` (`ipipe_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_operation_logs`
--

DROP TABLE IF EXISTS `gitee_go_operation_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_operation_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作者ID',
  `action` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动作',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更之前的值',
  `after_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更之后的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_order_items`
--

DROP TABLE IF EXISTS `gitee_go_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_order_id` int(11) NOT NULL,
  `unit_price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '单价, 单位: 元',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_orders`
--

DROP TABLE IF EXISTS `gitee_go_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '交易流水号',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid' COMMENT '订单状态',
  `order_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'buy' COMMENT 'buy/free',
  `payment_channel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付渠道',
  `price` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT '总价, 单位: 元',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '时长, 单位: 分钟',
  `paid_at` datetime DEFAULT NULL COMMENT '支付成功时间',
  `paid_by_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `namespace_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `package_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'MINUTE',
  `project_id` int(11) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_orders_on_order_id` (`order_id`),
  KEY `index_gitee_go_orders_on_namespace_id_and_state_and_created_at` (`namespace_id`,`state`,`created_at`),
  KEY `index_gitee_go_orders_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_pipelines`
--

DROP TABLE IF EXISTS `gitee_go_pipelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_pipelines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipipe_pipeline_id` int(11) NOT NULL COMMENT 'ipipe流水线id',
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水线名称,对应yaml中displayName',
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对应yaml中name',
  `project_id` int(11) NOT NULL COMMENT '仓库ID',
  `yaml_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml 文件名',
  `yaml_branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml 所在分支',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水线状态【正常、已归档、已删除】',
  `last_build_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最新构建状态',
  `last_trigger_user_id` int(11) DEFAULT NULL COMMENT '最新触发人ID',
  `last_trigger_branch` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最新触发分支',
  `last_modified_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '流水线最新更新时间(时间戳)',
  `last_modified_user_id` int(11) DEFAULT NULL COMMENT '最后一次更新的人',
  `created_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `created_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态，UNBLOCK/BLOCK',
  `archive_at` datetime DEFAULT NULL COMMENT '归档时间',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_pipelines_on_is_new_and_ipipe_pipeline_id` (`is_new`,`ipipe_pipeline_id`),
  KEY `index_gitee_go_pipelines_on_project_id_and_yaml_branch` (`project_id`,`yaml_branch`),
  KEY `index_gitee_go_pipelines_on_ipipe_pipeline_id` (`ipipe_pipeline_id`),
  KEY `index_gitee_go_pipelines_on_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_resource_change_refs`
--

DROP TABLE IF EXISTS `gitee_go_resource_change_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_resource_change_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_change_log_id` int(11) NOT NULL,
  `gitee_go_rescue_id` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_rescue_id_log_id` (`gitee_go_rescue_id`,`quota_change_log_id`),
  KEY `index_refs_quota_change_log_id` (`quota_change_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_resources`
--

DROP TABLE IF EXISTS `gitee_go_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL COMMENT '拥有者ID',
  `owner_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '拥有者类型',
  `target_id` int(11) NOT NULL COMMENT '来源ID',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '来源源类型',
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源总量',
  `resource_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '资源类型',
  `surplus` int(11) NOT NULL DEFAULT '0' COMMENT '资源剩余量',
  `expiry_time` datetime DEFAULT NULL COMMENT '资源过期时间',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_resources_on_target_type_and_target_id` (`target_type`,`target_id`),
  KEY `index_gitee_go_resources_on_owner_type_and_owner_id` (`owner_type`,`owner_id`),
  KEY `index_gitee_go_resources_on_is_expired` (`is_expired`),
  KEY `index_gitee_go_resources_on_resource_type` (`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_settings`
--

DROP TABLE IF EXISTS `gitee_go_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL COMMENT '命名空间ID',
  `surplus_time` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go剩余构建时常，可为负数',
  `is_award_received` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领取过红包',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_settings_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_stages`
--

DROP TABLE IF EXISTS `gitee_go_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitee_go_build_id` int(11) NOT NULL COMMENT 'GiteeGo构建ID',
  `ipipe_build_id` int(11) NOT NULL COMMENT 'Ipipe 构建ID',
  `ipipe_stage_id` int(11) NOT NULL COMMENT 'Ipipe Stage ID',
  `ipipe_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游Stage ID,头Stage则为0(来自ipipe)',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Stage 名称',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Stage状态',
  `start_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阶段执行开始时间',
  `end_time` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阶段执行结束时间',
  `spend_time` int(11) NOT NULL DEFAULT '0' COMMENT '花费时间(start_time - end_time)(seconds)',
  `duration` bigint(20) DEFAULT NULL COMMENT '阶段执行所需时间段(来自ipipe)',
  `block_status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '阻塞状态',
  `fail_fast` tinyint(1) DEFAULT NULL COMMENT '是否为快速失败',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trigger_user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Stage 触发人ID',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新 pipe',
  `stage_conf_id` int(11) DEFAULT NULL COMMENT 'Stage Conf Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_go_stages_on_is_new_and_ipipe_stage_id` (`is_new`,`ipipe_stage_id`),
  KEY `index_gitee_go_stages_on_gitee_go_build_id_and_status` (`gitee_go_build_id`,`status`),
  KEY `index_gitee_go_stages_on_ipipe_parent_id` (`ipipe_parent_id`),
  KEY `index_gitee_go_stages_on_ipipe_stage_id` (`ipipe_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_go_yaml_errors`
--

DROP TABLE IF EXISTS `gitee_go_yaml_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_go_yaml_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT 'yaml所在仓库ID',
  `branch` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml所在分支',
  `commit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'commit',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'yaml文件名',
  `message` text COLLATE utf8mb4_unicode_ci COMMENT '错误信息',
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发人ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_go_yaml_errors_on_project_id_and_branch` (`project_id`,`branch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_order_statistics`
--

DROP TABLE IF EXISTS `gitee_order_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_order_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL COMMENT '套餐id',
  `commerce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '套餐类型',
  `all_count` int(11) DEFAULT NULL COMMENT '订单总量',
  `paid_count` int(11) DEFAULT NULL COMMENT '付款订单总量',
  `paid_price_count` int(11) DEFAULT NULL COMMENT '付费金额总量',
  `space_count` int(11) DEFAULT NULL COMMENT '扩容订单总量',
  `space_paid_count` int(11) DEFAULT NULL COMMENT '扩容付款订单总量',
  `new_count` int(11) DEFAULT NULL COMMENT '新购订单总量',
  `new_paid_count` int(11) DEFAULT NULL COMMENT '新购付款订单总量',
  `renewal_count` int(11) DEFAULT NULL COMMENT '仅续费订单总量',
  `renewal_paid_count` int(11) DEFAULT NULL COMMENT '仅续费付款订单总量',
  `upgrade_count` int(11) DEFAULT NULL COMMENT '仅升级订单总量',
  `upgrade_paid_count` int(11) DEFAULT NULL COMMENT '仅升级付款订单总量',
  `upgrade_renewal_count` int(11) DEFAULT NULL COMMENT '升级续费订单总量',
  `upgrade_renewal_paid_count` int(11) DEFAULT NULL COMMENT '升级续费付款订单总量',
  `downgrade_renewal_count` int(11) DEFAULT NULL COMMENT '降级续费订单总量',
  `downgrade_renewal_paid_count` int(11) DEFAULT NULL COMMENT '降级续费付款订单总量',
  `all_new_count` int(11) DEFAULT NULL COMMENT '订单增量',
  `paid_new_count` int(11) DEFAULT NULL COMMENT '付款订单增量',
  `paid_price_new_count` int(11) DEFAULT NULL COMMENT '付费金额增量',
  `space_new_count` int(11) DEFAULT NULL COMMENT '扩容订单增量',
  `space_paid_new_count` int(11) DEFAULT NULL COMMENT '扩容付款订单增量',
  `new_new_count` int(11) DEFAULT NULL COMMENT '新购订单增量',
  `new_paid_new_count` int(11) DEFAULT NULL COMMENT '新购付款订单增量',
  `renewal_new_count` int(11) DEFAULT NULL COMMENT '仅续费订单增量',
  `renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '仅续费付款订单增量',
  `upgrade_new_count` int(11) DEFAULT NULL COMMENT '仅升级订单增量',
  `upgrade_paid_new_count` int(11) DEFAULT NULL COMMENT '仅升级付款订单增量',
  `upgrade_renewal_new_count` int(11) DEFAULT NULL COMMENT '升级续费订单增量',
  `upgrade_renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '升级续费付款订单增量',
  `downgrade_renewal_new_count` int(11) DEFAULT NULL COMMENT '降级续费订单增量',
  `downgrade_renewal_paid_new_count` int(11) DEFAULT NULL COMMENT '降级续费付款订单增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `member_new_count` int(11) DEFAULT '0' COMMENT '扩员订单增量',
  `member_paid_new_count` int(11) DEFAULT '0' COMMENT '扩员订单付款增量',
  `member_count` int(11) DEFAULT '0' COMMENT '扩员订单总量',
  `member_paid_count` int(11) DEFAULT '0' COMMENT '扩员订单付款总量',
  `new_paid_price_new_count` int(11) DEFAULT NULL COMMENT '新购付款金额增量',
  `new_paid_price_count` int(11) DEFAULT NULL COMMENT '新购付款金额总量',
  PRIMARY KEY (`id`),
  KEY `index_gitee_order_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_order_statistics_on_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_project_statistics`
--

DROP TABLE IF EXISTS `gitee_project_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_project_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `project_public_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目类型(公开，私有，内部公开)',
  `project_outsorce_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外包类型(外包，内部)',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_project_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_project_statistics_on_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_recomms`
--

DROP TABLE IF EXISTS `gitee_recomms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_recomms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `repo_list` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐项目的 id 列表',
  `author_list` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐用户的 id 列表',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_recomms_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_reward_developers`
--

DROP TABLE IF EXISTS `gitee_reward_developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_reward_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `osc_id` int(11) NOT NULL COMMENT 'Oschina账号 id',
  `issue_id` int(11) NOT NULL COMMENT '任务 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `pull_request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '交付PR id',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '信息(验收未通过的原因)',
  `can_check` tinyint(1) DEFAULT '0' COMMENT '能否验收',
  `upload_time` datetime DEFAULT NULL COMMENT '交付时间',
  `check_start_time` datetime DEFAULT NULL COMMENT '验收开始时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_reward_developers_on_issue_id` (`issue_id`),
  KEY `index_gitee_reward_developers_on_uid_iid` (`user_id`,`issue_id`),
  KEY `index_gitee_reward_developers_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_reward_water_bills`
--

DROP TABLE IF EXISTS `gitee_reward_water_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_reward_water_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `osc_id` int(11) NOT NULL COMMENT 'Oschina账号 id',
  `peer_user_id` int(11) DEFAULT '0' COMMENT '对端user id，对端不是用户时为0',
  `peer_osc_id` int(11) DEFAULT '0' COMMENT '对端Oschina id，对端不是用户时为0',
  `gitee_reward_id` int(11) NOT NULL COMMENT 'GiteeReward id',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '众包流水号',
  `transaction_id` int(11) NOT NULL COMMENT '众包流水记录id',
  `money_in_cent` int(11) DEFAULT '0' COMMENT '金额',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `trade_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '交易类型',
  `capital_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '流水描述',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_reward_water_bills_on_user_id` (`user_id`),
  KEY `index_gitee_reward_water_bills_on_state_and_capital_name` (`state`,`capital_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_rewards`
--

DROP TABLE IF EXISTS `gitee_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '悬赏发起人 id',
  `osc_id` int(11) NOT NULL COMMENT '发起人发布悬赏时的osc账号id',
  `issue_id` int(11) NOT NULL COMMENT 'issue id',
  `project_id` int(11) DEFAULT '0' COMMENT 'project id',
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `main` tinyint(1) DEFAULT '0' COMMENT '是否是主要悬赏',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `money_in_cent` int(11) DEFAULT '0' COMMENT '金额',
  `paid` tinyint(1) DEFAULT '0' COMMENT '是否付款',
  `dongjie` tinyint(1) DEFAULT '0' COMMENT '是否冻结',
  `donate_percent` int(11) DEFAULT '0' COMMENT '开源仓库捐赠百分比',
  `reward_percent` int(11) DEFAULT '0' COMMENT '报酬百分比',
  `service_charge_percent` int(11) DEFAULT '0' COMMENT '平台手续费百分比',
  `pay_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '支付类型:微信、支付宝、银联',
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '众包流水号',
  `donate_id` int(11) DEFAULT '0' COMMENT '捐赠 id',
  `protection_time` int(11) DEFAULT '0' COMMENT '作者优先保护时间',
  `expired_at` datetime DEFAULT NULL COMMENT '悬赏过期时间',
  `activated_at` datetime DEFAULT NULL COMMENT '激活(付款成功)时间',
  `closed_at` datetime DEFAULT NULL COMMENT '悬赏完成/关闭时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_rewards_on_issue_id` (`issue_id`),
  KEY `index_gitee_rewards_on_user_id_and_issue_id` (`user_id`,`issue_id`),
  KEY `index_gitee_rewards_on_project_id_and_paid_and_state` (`project_id`,`paid`,`state`),
  KEY `index_gitee_rewards_on_issue_id_and_user_id_and_paid` (`issue_id`,`user_id`,`paid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_scan_feedbacks`
--

DROP TABLE IF EXISTS `gitee_scan_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_scan_feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT 'Gitee Scan任务id',
  `project_id` int(11) NOT NULL COMMENT '关联仓库 id',
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `state` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '处理状态',
  `active` tinyint(1) DEFAULT '0' COMMENT '误报标记状态',
  `types` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型，bug、style、cve',
  `attitude` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '表态，useful、useless',
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户反馈意见',
  `bug_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '缺陷扫描es id',
  `bug_rule_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '缺陷扫描规则id',
  `bug_rule_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缺陷扫描规则名称',
  `style_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '规范扫描es id',
  `style_rule_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规范扫描规则名称',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_types` (`task_id`,`user_id`,`types`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_bug_id` (`task_id`,`user_id`,`bug_id`),
  KEY `index_gitee_scan_feedbacks_on_task_id_and_user_id_and_style_id` (`task_id`,`user_id`,`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_scan_tasks`
--

DROP TABLE IF EXISTS `gitee_scan_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_scan_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_status` int(11) DEFAULT '0' COMMENT '缺陷扫描任务状态',
  `bug_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '缺陷扫描任务状态名',
  `style_status` int(11) DEFAULT '0' COMMENT '规范扫描任务状态',
  `style_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规范扫描任务状态名',
  `cve_status` int(11) DEFAULT '0' COMMENT 'CVE扫描任务状态',
  `cve_status_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'CVE扫描任务状态名',
  `active_type` int(11) DEFAULT '0' COMMENT '扫描类型,手动、PR自动等',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `pull_request_id` int(11) DEFAULT '0' COMMENT 'PR id',
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '本次commit id',
  `commit_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'commit title',
  `scan_path` text COLLATE utf8mb4_unicode_ci COMMENT '扫描路径',
  `filter_path` text COLLATE utf8mb4_unicode_ci COMMENT '过滤路径',
  `languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '语言类型',
  `iscan_bug_id` int(11) DEFAULT '0' COMMENT 'iScan缺陷扫描任务id',
  `iscan_style_id` int(11) DEFAULT '0' COMMENT 'iScan规则扫描任务id',
  `bug_count` int(11) DEFAULT '0' COMMENT '缺陷总数',
  `bug_fix` int(11) DEFAULT '0' COMMENT '缺陷修复数',
  `bug_inc` int(11) DEFAULT '0' COMMENT '缺陷新增数',
  `style_count` int(11) DEFAULT '0' COMMENT '规则总数',
  `style_fix` int(11) DEFAULT '0' COMMENT '规则修复数',
  `style_inc` int(11) DEFAULT '0' COMMENT '规则新增数',
  `cve_count` int(11) DEFAULT '0' COMMENT 'CVE总数',
  `bug_result` text COLLATE utf8mb4_unicode_ci COMMENT '缺陷扫描结果',
  `style_result` text COLLATE utf8mb4_unicode_ci COMMENT '规范扫描结果',
  `read_count` int(11) DEFAULT '0' COMMENT '任务报告阅读次数',
  `bug_score` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bug评分',
  `bug_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bug描述',
  `style_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规范描述',
  `cve_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'CVE描述',
  `user_id` int(11) NOT NULL COMMENT '操作者、触发者id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `retry_count` int(11) DEFAULT '0' COMMENT 'retry times',
  `retry_time` datetime DEFAULT NULL COMMENT 'last retry time',
  `bug_read_count` int(11) DEFAULT '0' COMMENT 'bug read count',
  `style_read_count` int(11) DEFAULT '0' COMMENT 'style read count',
  `cve_read_count` int(11) DEFAULT '0' COMMENT 'CVE read count',
  `bug_rollback_time` datetime DEFAULT NULL COMMENT 'iscan rollback time',
  `style_rollback_time` datetime DEFAULT NULL COMMENT 'iscan rollback time',
  `cve_rollback_time` datetime DEFAULT NULL COMMENT 'CVE回调时间',
  PRIMARY KEY (`id`),
  KEY `index_gitee_scan_tasks_on_commit_id_and_branch_and_active_type` (`commit_id`,`branch`,`active_type`),
  KEY `index_gitee_scan_tasks_on_project_id_and_created_at` (`project_id`,`created_at`),
  KEY `index_gitee_scan_tasks_on_pull_request_id_and_created_at` (`pull_request_id`,`created_at`),
  KEY `index_gitee_scan_tasks_on_project_id_and_bug_status_name` (`project_id`,`bug_status_name`),
  KEY `index_gitee_scan_tasks_on_project_id_and_style_status_name` (`project_id`,`style_status_name`),
  KEY `index_gitee_scan_tasks_on_project_id_and_cve_status_name` (`project_id`,`cve_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_stars`
--

DROP TABLE IF EXISTS `gitee_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '刊号',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '期刊 URL 标识',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '期刊标题',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '期刊摘要',
  `content` text COLLATE utf8_unicode_ci COMMENT '期刊正文',
  `boost` int(11) DEFAULT '0' COMMENT '期刊权重',
  `note_count` int(11) DEFAULT '0' COMMENT '评论数量',
  `author_id` int(11) DEFAULT NULL COMMENT '期刊作者',
  `interviewee_id` int(11) DEFAULT NULL COMMENT '期刊受访者',
  `published` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `published_at` datetime DEFAULT NULL COMMENT '发布时间',
  `options` text COLLATE utf8_unicode_ci COMMENT '额外设置',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gitee_stars_on_path` (`path`),
  KEY `index_gitee_stars_on_published_and_path` (`published`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='封面人物';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gitee_statistics`
--

DROP TABLE IF EXISTS `gitee_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gitee_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `user_count` int(11) DEFAULT NULL COMMENT '用户总量',
  `project_count` int(11) DEFAULT NULL COMMENT '项目总量',
  `group_count` int(11) DEFAULT NULL COMMENT '组织总量',
  `issue_count` int(11) DEFAULT NULL COMMENT '任务总量',
  `pull_request_count` int(11) DEFAULT NULL COMMENT 'PR总量',
  `code_count` int(11) DEFAULT NULL COMMENT '代码片段总量',
  `education_count` int(11) DEFAULT NULL COMMENT '高校通过总量',
  `enterprise_all_count` int(11) DEFAULT NULL COMMENT '企业总量',
  `push_count` int(11) DEFAULT NULL COMMENT 'push 总量',
  `star_count` int(11) DEFAULT NULL COMMENT 'star 总量',
  `watch_count` int(11) DEFAULT NULL COMMENT 'watch 总量',
  `attach_file_count` int(11) DEFAULT NULL COMMENT '附件总量',
  `page_count` int(11) DEFAULT NULL COMMENT 'pages 总量',
  `user_new_count` int(11) DEFAULT NULL COMMENT '用户增量',
  `project_new_count` int(11) DEFAULT NULL COMMENT '项目增量',
  `group_new_count` int(11) DEFAULT NULL COMMENT '组织增量',
  `issue_new_count` int(11) DEFAULT NULL COMMENT '任务增量',
  `pull_request_new_count` int(11) DEFAULT NULL COMMENT 'PR 增量',
  `code_new_count` int(11) DEFAULT NULL COMMENT '代码片段增量',
  `education_new_count` int(11) DEFAULT NULL COMMENT '高校通过增量',
  `enterprise_all_new_count` int(11) DEFAULT NULL COMMENT '企业增量',
  `push_new_count` int(11) DEFAULT NULL COMMENT 'push 增量',
  `star_new_count` int(11) DEFAULT NULL COMMENT 'star 增量',
  `watch_new_count` int(11) DEFAULT NULL COMMENT 'watch 增量',
  `attach_file_new_count` int(11) DEFAULT NULL COMMENT '附件增量',
  `page_new_count` int(11) DEFAULT NULL COMMENT 'pages 增量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `program_count` int(11) DEFAULT '0',
  `program_new_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gitee_statistics_on_year_and_month_and_day` (`year`,`month`,`day`),
  KEY `index_gitee_statistics_on_date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `google_captchas`
--

DROP TABLE IF EXISTS `google_captchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_captchas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `score` float DEFAULT NULL COMMENT '分数',
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作名称',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_google_captchas_on_user_id` (`user_id`),
  KEY `index_google_captchas_on_action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_enterprises`
--

DROP TABLE IF EXISTS `gp_enterprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_enterprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业邮箱',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `industry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业行业',
  `company_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业规模',
  `applicant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请人姓名',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `position` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位',
  `warehouse_size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用仓库大小',
  `reject_message` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '拒绝理由',
  `user_id` int(11) DEFAULT NULL COMMENT '拥有者id',
  PRIMARY KEY (`id`),
  KEY `index_gp_enterprises_on_enterprise_name_and_phone_and_email` (`enterprise_name`,`phone`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='码云私有云版企业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_licenses`
--

DROP TABLE IF EXISTS `gp_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '许可证 id',
  `encrypted_license` text COLLATE utf8_unicode_ci COMMENT '许可证',
  `activated_at` datetime DEFAULT NULL COMMENT '被激活时间',
  `expired_at` datetime DEFAULT NULL COMMENT '过期时间',
  `gp_enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT 'GP 企业 ID',
  `version` int(11) DEFAULT NULL COMMENT '许可证版本号',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `max_member` int(11) DEFAULT NULL COMMENT '成员人数配额',
  `max_enterprise` int(11) DEFAULT NULL COMMENT '企业个数配额',
  `base_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解密密钥',
  `base_public_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '解密公钥',
  `box_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'box密钥',
  `verify_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签名密钥',
  `additional_services` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '额外服务',
  `device_ids` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mac地址',
  `machine_configuration` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机器配置',
  `sign_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '签名密钥',
  `poc` int(11) DEFAULT NULL COMMENT '是否 POC 阶段的 License',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gp_licenses_on_license_id` (`license_id`),
  KEY `index_gp_licenses_on_activated_at` (`activated_at`),
  KEY `index_gp_licenses_on_expired_at` (`expired_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='码云私有云版许可证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_key_subkeys`
--

DROP TABLE IF EXISTS `gpg_key_subkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_key_subkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gpg_key_id` int(11) DEFAULT NULL,
  `keyid` text COLLATE utf8_unicode_ci COMMENT '子密钥 key id',
  `fingerprint` text COLLATE utf8_unicode_ci COMMENT '子密钥指纹',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_key_subkeys_on_keyid` (`keyid`(16)),
  UNIQUE KEY `index_gpg_key_subkeys_on_fingerprint` (`fingerprint`(40)),
  KEY `index_gpg_key_subkeys_on_gpg_key_id` (`gpg_key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_keys`
--

DROP TABLE IF EXISTS `gpg_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `primary_keyid` text COLLATE utf8_unicode_ci COMMENT '主密钥 key id',
  `fingerprint` text COLLATE utf8_unicode_ci COMMENT '主密钥指纹',
  `key` mediumtext COLLATE utf8_unicode_ci COMMENT 'key 文本',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_keys_on_primary_keyid` (`primary_keyid`(16)),
  UNIQUE KEY `index_gpg_keys_on_fingerprint` (`fingerprint`(40)),
  KEY `index_gpg_keys_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gpg_signatures`
--

DROP TABLE IF EXISTS `gpg_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpg_signatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 ID',
  `gpg_key_id` int(11) DEFAULT NULL COMMENT '签名关联的 GPG key',
  `commit_sha` text COLLATE utf8_unicode_ci COMMENT '被签名的 commit id',
  `gpg_key_primary_keyid` text COLLATE utf8_unicode_ci COMMENT '签名使用的 key id',
  `gpg_key_user_name` text COLLATE utf8_unicode_ci COMMENT '签名的 name',
  `gpg_key_user_email` text COLLATE utf8_unicode_ci COMMENT '签名的 email',
  `verification_status` int(11) NOT NULL DEFAULT '0' COMMENT '签名状态',
  `gpg_key_subkey_id` int(11) DEFAULT NULL COMMENT '子密钥',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'GpgSignatures::Commit',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gpg_signatures_on_commit_sha` (`commit_sha`(40)),
  KEY `index_gpg_signatures_on_project_id` (`project_id`),
  KEY `index_gpg_signatures_on_gpg_key_id` (`gpg_key_id`),
  KEY `index_gpg_signatures_on_gpg_key_primary_keyid` (`gpg_key_primary_keyid`(16)),
  KEY `index_gpg_signatures_on_gpg_key_subkey_id` (`gpg_key_subkey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_infos`
--

DROP TABLE IF EXISTS `group_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `group_id` int(11) DEFAULT NULL COMMENT '组织 id',
  `open_application` tinyint(1) DEFAULT '0' COMMENT '是否开启申请加入',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `notice` text COLLATE utf8_unicode_ci COMMENT '组织公告',
  `force_verify_apply` int(11) DEFAULT '0' COMMENT '是否开启强制审核',
  `can_overview` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用概览',
  `overview_source` int(11) NOT NULL DEFAULT '1' COMMENT '概览来源',
  `can_sync` tinyint(1) DEFAULT '0',
  `mirror_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_infos_on_group_id` (`group_id`),
  KEY `index_group_infos_on_updated_user_id` (`updated_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='组织信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `high_stars`
--

DROP TABLE IF EXISTS `high_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `high_stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `fetch_time` datetime DEFAULT NULL COMMENT '达到 1k star 时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_high_stars_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='1K Star 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `introductions`
--

DROP TABLE IF EXISTS `introductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `introductions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL DEFAULT '0' COMMENT '组织 id',
  `language` int(11) NOT NULL DEFAULT '0' COMMENT '语言版本',
  `project` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目路径',
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '项目分支',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '介绍文本内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_introductions_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='介绍表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请者 id',
  `invitee_id` int(11) DEFAULT NULL COMMENT '受邀者 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '种类',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_of_invitation` (`invitee_id`,`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业邀请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_infos`
--

DROP TABLE IF EXISTS `invoice_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型（个人/企业）',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `invoice_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户银行',
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行帐号',
  `enterprise_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照上的登记地址',
  `enterprise_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司有效电话',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `tax_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照扫描件',
  `taxpayer_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一般纳税人证明扫描件',
  `invoice_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接收电子发票的邮箱地址',
  PRIMARY KEY (`id`),
  KEY `index_invoice_infos_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_operate_logs`
--

DROP TABLE IF EXISTS `invoice_operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_order_id` int(11) DEFAULT NULL COMMENT '发票订单的 id',
  `operator_id` int(11) DEFAULT NULL COMMENT '操作者 id',
  `action` int(11) DEFAULT NULL COMMENT '操作类型',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作前的值',
  `after_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作后的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoice_operate_logs_on_invoice_order_id` (`invoice_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_orders`
--

DROP TABLE IF EXISTS `invoice_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `invoice_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `invoice_price` int(11) DEFAULT NULL COMMENT '开票金额',
  `commerce_order_id` int(11) DEFAULT NULL COMMENT '商业订单表 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票状态',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `invoice_type` int(11) DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `tax_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户银行',
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行帐号',
  `enterprise_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照上的登记地址',
  `enterprise_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司有效电话',
  `express_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递公司',
  `express_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '市',
  `detailed_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人姓名',
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `tax_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业执照扫描件',
  `taxpayer_scan_asset_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一般纳税人证明扫描件',
  `remark` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `open_at` datetime DEFAULT NULL COMMENT '开票时间',
  `invoice_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接收电子发票的邮箱地址',
  `admin_remark` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoice_orders_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发票详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_change_records`
--

DROP TABLE IF EXISTS `issue_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_change_records_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_collaborators`
--

DROP TABLE IF EXISTS `issue_collaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_collaborators` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `issue_id` int(11) NOT NULL COMMENT '任务 id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_collaborators_on_issue_id_and_user_id` (`issue_id`,`user_id`),
  KEY `index_issue_collaborators_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务协作者表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_collections`
--

DROP TABLE IF EXISTS `issue_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT '0' COMMENT 'issue id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_collections_on_issue_id_and_user_id` (`issue_id`,`user_id`),
  KEY `index_issue_collections_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_custom_header_refs`
--

DROP TABLE IF EXISTS `issue_custom_header_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_custom_header_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目 ID',
  `view_id` int(11) NOT NULL DEFAULT '0' COMMENT '视图 ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户 ID',
  `issue_field_id` int(11) NOT NULL COMMENT '自定义字段 ID',
  `sort` int(11) NOT NULL COMMENT '排序值',
  `fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为固定表头',
  `function_module` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表头所属模块（记录无视图的资源表头配置）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_on_eid_vid_pid_fixed` (`enterprise_id`,`view_id`,`program_id`,`fixed`),
  KEY `index_on_eid_uid_fm_fixed` (`enterprise_id`,`user_id`,`function_module`,`fixed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_dependences`
--

DROP TABLE IF EXISTS `issue_dependences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_dependences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '主体ID',
  `author_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `pre_issue_id` int(11) DEFAULT NULL COMMENT '前一个任务ID',
  `latter_issue_id` int(11) DEFAULT NULL COMMENT '后一个任务ID',
  `ref_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '依赖关系类型',
  `level` int(11) DEFAULT NULL COMMENT '依赖级别',
  `offset` int(11) DEFAULT NULL COMMENT '延迟时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `target_id` int(11) DEFAULT NULL COMMENT '关联任务ID',
  PRIMARY KEY (`id`),
  KEY `index_issue_dependences_on_issue_id` (`issue_id`),
  KEY `index_issue_dependences_on_latter_issue_id` (`latter_issue_id`),
  KEY `index_issue_dependences_on_pre_issue_id` (`pre_issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务紧前紧后依赖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_doc_node_refs`
--

DROP TABLE IF EXISTS `issue_doc_node_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_doc_node_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL COMMENT '工作项 ID',
  `doc_node_id` int(11) NOT NULL COMMENT '文档 ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_doc_node_refs_on_issue_id_and_doc_node_id` (`issue_id`,`doc_node_id`),
  KEY `index_issue_doc_node_refs_on_doc_node_id` (`doc_node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_extra`
--

DROP TABLE IF EXISTS `issue_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '任务 id',
  `issue_field_id` int(11) DEFAULT NULL COMMENT '任务字段 id',
  `value_int` int(11) DEFAULT NULL COMMENT '数值类型所对应的值（包括单选、多选框）',
  `value_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文本框类型所对应的值',
  `value_text` text COLLATE utf8mb4_unicode_ci COMMENT '多行文本所对应的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `value_float` decimal(13,5) DEFAULT NULL,
  `value_date` date DEFAULT NULL COMMENT '记录日期选择字段的值',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '自定义字段值所属企业 ID',
  PRIMARY KEY (`id`),
  KEY `index_issue_extra_on_issue_id` (`issue_id`),
  KEY `index_issue_extra_on_issue_field_id` (`issue_field_id`),
  KEY `index_on_eid_iid_fid_int` (`enterprise_id`,`issue_id`,`issue_field_id`,`value_int`),
  KEY `index_on_eid_iid_fid_float` (`enterprise_id`,`issue_id`,`issue_field_id`,`value_float`),
  KEY `index_on_eid_iid_fid_date` (`enterprise_id`,`issue_id`,`issue_field_id`,`value_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_fields`
--

DROP TABLE IF EXISTS `issue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段名称',
  `field_type` int(11) DEFAULT NULL COMMENT '字段类型',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '字段描述',
  `options` text COLLATE utf8mb4_unicode_ci COMMENT '字段配置项',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '是否为系统字段',
  `length` int(11) DEFAULT NULL COMMENT '字段长度',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_fields_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_fields_types_refs`
--

DROP TABLE IF EXISTS `issue_fields_types_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_fields_types_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_field_id` int(11) DEFAULT NULL COMMENT '任务字段id',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型id',
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认值',
  `is_null` tinyint(1) DEFAULT '0' COMMENT '是否为空字段',
  `is_hidden` tinyint(1) DEFAULT '0' COMMENT '是否为隐藏字段',
  `is_required` tinyint(1) DEFAULT '0' COMMENT '是否为必填字段',
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '提示文字',
  `group_index` int(11) DEFAULT '0' COMMENT '分组id',
  `sort` int(11) DEFAULT '0' COMMENT '排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_fields_types_refs_on_issue_type_id` (`issue_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_infos`
--

DROP TABLE IF EXISTS `issue_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL COMMENT '任务 id',
  `issue_extra` text COLLATE utf8mb4_unicode_ci COMMENT '任务自定义字段值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `from_enterprise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_infos_on_issue_id` (`issue_id`),
  KEY `index_issue_infos_on_from_enterprise_id` (`from_enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_states`
--

DROP TABLE IF EXISTS `issue_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) DEFAULT NULL COMMENT '企业 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '颜色',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `command` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '指令',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_states_on_title_and_enterprise_id` (`title`,`enterprise_id`),
  KEY `index_issue_states_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_statistics`
--

DROP TABLE IF EXISTS `issue_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `milestone_id` int(11) NOT NULL DEFAULT '0' COMMENT '里程碑ID',
  `date` date NOT NULL COMMENT '日期',
  `created_count` int(11) NOT NULL DEFAULT '0' COMMENT '新建任务数',
  `closed_count` int(11) NOT NULL DEFAULT '0' COMMENT '完成的任务数量',
  `rejected_count` int(11) NOT NULL DEFAULT '0' COMMENT '拒绝的任务数量',
  `type_category` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务类型属性【bug缺陷, feature需求, task任务】',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '优先级',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `scrum_sprint_id` int(11) NOT NULL COMMENT '迭代ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_e_id_pg_id_sc_id_m_id_u_id_type_pri_d` (`enterprise_id`,`program_id`,`scrum_sprint_id`,`milestone_id`,`user_id`,`type_category`,`priority`,`date`),
  KEY `index_p_id_sc_id_u_id_type_d` (`program_id`,`scrum_sprint_id`,`user_id`,`type_category`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type_program_settings`
--

DROP TABLE IF EXISTS `issue_type_program_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type_program_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type_id` int(11) NOT NULL COMMENT '任务类型ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `is_defaulted` tinyint(1) DEFAULT '0' COMMENT '是否默认类型',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_type_program_settings_on_e_p_i` (`enterprise_id`,`program_id`,`issue_type_id`),
  KEY `index_issue_type_program_settings_on_issue_type_id` (`issue_type_id`),
  KEY `index_on_p_i` (`program_id`,`issue_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type_settings`
--

DROP TABLE IF EXISTS `issue_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type_id` int(11) NOT NULL COMMENT '任务类型ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_type_settings_on_e_u_p` (`enterprise_id`,`program_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_type_state_refs`
--

DROP TABLE IF EXISTS `issue_type_state_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_type_state_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型 id',
  `issue_state_id` int(11) DEFAULT NULL COMMENT '任务状态 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'open' COMMENT '属性',
  `state_to_any` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_type_state_refs_on_issue_type_id_and_issue_state_id` (`issue_type_id`,`issue_state_id`),
  KEY `index_issue_type_state_refs_on_state` (`issue_state_id`),
  KEY `index_issue_type_state_refs_on_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务类型状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issue_types`
--

DROP TABLE IF EXISTS `issue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名字',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `serial` int(11) DEFAULT NULL COMMENT '排序',
  `template` text COLLATE utf8_unicode_ci COMMENT '模版',
  `ident` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标识符（系统内置 task、bug、requirement）',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统默认',
  `color` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#00BE2D' COMMENT '颜色(eg: #00BE2D)',
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'task' COMMENT '任务类型属性[task, bug, feature]',
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '任务类型描述',
  `builtin_fields` text COLLATE utf8_unicode_ci COMMENT '工作项字段配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_types_on_enterprise_id_and_category_and_title` (`enterprise_id`,`category`,`title`),
  KEY `index_issue_types_on_enterprise_id` (`enterprise_id`),
  KEY `index_issue_types_on_category` (`category`),
  KEY `index_issue_types_on_enterprise_id_and_category` (`enterprise_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assignee_id` int(11) DEFAULT '0' COMMENT '指派者 id',
  `author_id` int(11) DEFAULT NULL COMMENT '创建者 id',
  `project_id` int(11) DEFAULT '0' COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `position` int(11) DEFAULT '0' COMMENT '排序',
  `description` text COLLATE utf8mb4_unicode_ci,
  `milestone_id` int(11) DEFAULT '0' COMMENT '里程碑 id',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_int` int(11) DEFAULT NULL COMMENT 'issue 状态int值',
  `iid` int(11) DEFAULT NULL COMMENT '仓库任务流水号',
  `source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_level` int(11) DEFAULT '0' COMMENT '置顶选项',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '更新者 id',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weights` int(11) DEFAULT '0' COMMENT '权重',
  `deadline` datetime DEFAULT NULL COMMENT '结束时间',
  `started_at` datetime DEFAULT NULL COMMENT '开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '完成时间',
  `plan_started_at` datetime DEFAULT NULL COMMENT '计划开始时间',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `priority` int(11) DEFAULT '0' COMMENT '优先级',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级任务 id',
  `duration` int(11) DEFAULT '0' COMMENT '预计工期',
  `ident` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_type_id` int(11) DEFAULT '1' COMMENT '任务类型 id',
  `issue_state_id` int(11) DEFAULT '1' COMMENT '任务状态 id',
  `program_id` int(11) DEFAULT '0',
  `root_id` int(11) NOT NULL DEFAULT '0' COMMENT '根节点ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '相同项目相同根节点下的排序值',
  `depth` int(11) NOT NULL DEFAULT '0' COMMENT '节点深度',
  `security_hole` tinyint(1) NOT NULL DEFAULT '0',
  `scrum_sprint_id` int(11) NOT NULL DEFAULT '0' COMMENT '迭代ID',
  `scrum_version_id` int(11) NOT NULL DEFAULT '0' COMMENT '版本ID',
  `issue_type_category` int(11) NOT NULL DEFAULT '0' COMMENT '任务类型属性',
  PRIMARY KEY (`id`),
  KEY `index_issues_on_assignee_id` (`assignee_id`),
  KEY `index_issues_on_created_at` (`created_at`),
  KEY `index_issues_on_title` (`title`),
  KEY `index_issues_on_ident` (`ident`),
  KEY `index_issues_on_project_id_and_iid` (`project_id`,`iid`),
  KEY `index_issues_on_parent_id` (`parent_id`),
  KEY `index_issues_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_issue_on_e_p_state` (`enterprise_id`,`project_id`,`issue_type_id`,`issue_state_id`),
  KEY `index_issues_on_e_state_p_c` (`enterprise_id`,`issue_state_id`,`project_id`,`created_at`),
  KEY `index_issues_on_e_p_c` (`enterprise_id`,`project_id`,`created_at`),
  KEY `index_issues_on_milestone_id_and_issue_state_id` (`milestone_id`,`issue_state_id`),
  KEY `index_issues_on_pid_aid_type_id` (`project_id`,`author_id`,`issue_type_id`),
  KEY `index_issues_on_project_id_and_state_and_created_at` (`project_id`,`state`,`created_at`),
  KEY `index_issues_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_issues_on_root_id_and_sort` (`root_id`,`sort`),
  KEY `index_issues_on_program_id_and_parent_id` (`program_id`,`parent_id`),
  KEY `index_issues_on_enterprise_id_and_program_id_and_state` (`enterprise_id`,`program_id`,`state`),
  KEY `index_issues_on_state_type` (`issue_state_id`,`issue_type_id`),
  KEY `index_issues_on_issue_type_id` (`issue_type_id`),
  KEY `index_issues_on_en_id_and_id_and_c_at` (`enterprise_id`,`id`,`created_at`),
  KEY `index_issues_on_source` (`source`(15)),
  KEY `index_issues_on_enterprise_id_and_deadline` (`enterprise_id`,`deadline`),
  KEY `index_issues_on_enterprise_id_and_project_id_and_state` (`enterprise_id`,`project_id`,`state`),
  KEY `index_issues_on_enterprise_id_and_issue_type_id` (`enterprise_id`,`issue_type_id`),
  KEY `index_issues_on_enterprise_id_and_issue_type_id_and_parent_id` (`enterprise_id`,`issue_type_id`,`parent_id`),
  KEY `index_issues_on_scrum_sprint_id` (`scrum_sprint_id`),
  KEY `index_issues_on_scrum_version_id` (`scrum_version_id`),
  KEY `index_on_issues_eid_sint_priority_created_at` (`enterprise_id`,`state_int`,`priority`,`created_at`),
  KEY `index_on_issues_eid_pgid_sint_priority_created_at` (`enterprise_id`,`program_id`,`state_int`,`priority`,`created_at`),
  KEY `index_on_issues_pjid_sint_priority_created_at` (`project_id`,`state_int`,`priority`,`created_at`),
  KEY `index_issues_on_author_id_and_updated_at` (`author_id`,`updated_at`),
  KEY `index_on_eid_cate_mid` (`enterprise_id`,`issue_type_category`,`milestone_id`),
  KEY `index_on_pid_cate_mid` (`program_id`,`issue_type_category`,`milestone_id`),
  KEY `index_issues_on_project_id_and_created_at` (`project_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanban_column_issue_refs`
--

DROP TABLE IF EXISTS `kanban_column_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kanban_column_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kanban_id` int(11) NOT NULL COMMENT '看板ID',
  `kanban_column_id` int(11) NOT NULL COMMENT '看板栏ID',
  `issue_id` int(11) NOT NULL COMMENT 'issue ID',
  `sort` int(11) DEFAULT '0' COMMENT '任务排序值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kanban_column_issue_refs_on_kanban_column_id_and_issue_id` (`kanban_column_id`,`issue_id`),
  UNIQUE KEY `index_kanban_column_issue_refs_on_kanban_id_and_issue_id` (`kanban_id`,`issue_id`),
  KEY `index_kanban_column_issue_refs_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanban_columns`
--

DROP TABLE IF EXISTS `kanban_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kanban_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `kanban_id` int(11) NOT NULL COMMENT '看板ID',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认栏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `threshold` int(11) DEFAULT NULL COMMENT 'issue数阀值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kanban_columns_on_kanban_id_and_title` (`kanban_id`,`title`),
  KEY `index_kanban_columns_on_e_p_k_t` (`enterprise_id`,`program_id`,`kanban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kanbans`
--

DROP TABLE IF EXISTS `kanbans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kanbans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否展示',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kanbans_on_program_id_and_title` (`program_id`,`title`),
  KEY `index_kanbans_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `key` text COLLATE utf8mb4_unicode_ci COMMENT '公钥内容（包含: key_type, key_content, key_salt）',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公钥标题',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '指纹',
  `key_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公钥类型',
  `key_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '公钥内容',
  `key_salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密钥',
  `key_owner` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '标示用于 ci 部署的',
  `sha256_fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sha256 指纹',
  `last_visited_at` datetime DEFAULT NULL,
  `used_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_keys_on_sha256_fingerprint` (`sha256_fingerprint`),
  KEY `index_keys_on_user_id` (`user_id`),
  KEY `index_keys_on_fingerprint` (`fingerprint`),
  KEY `index_keys_on_key_content` (`key_content`(255)),
  KEY `index_keys_on_key` (`key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公钥表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_article_refs`
--

DROP TABLE IF EXISTS `label_article_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_article_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_label_article_refs_on_article_id_and_label_id` (`article_id`,`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_issue_refs`
--

DROP TABLE IF EXISTS `label_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `label_id` int(11) NOT NULL COMMENT '标签 id',
  `issue_id` int(11) NOT NULL COMMENT '任务 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_label_issue_id` (`issue_id`),
  KEY `idx_label_issue_labelid` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='任务标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `label_pull_request_refs`
--

DROP TABLE IF EXISTS `label_pull_request_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `label_pull_request_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `pull_request_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_label_pull_request_refs_on_pull_request_id_and_label_id` (`pull_request_id`,`label_id`),
  KEY `index_label_pull_request_refs_on_label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `serial` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_labels_on_enterprise_id_and_name` (`enterprise_id`,`name`),
  KEY `index_labels_on_project_id_and_name` (`project_id`,`name`),
  KEY `index_labels_on_enterprise_id_and_description` (`enterprise_id`,`description`),
  KEY `index_labels_on_project_id_and_description` (`project_id`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_binds`
--

DROP TABLE IF EXISTS `login_binds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_binds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `way` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_login_binds_on_user_id` (`user_id`),
  KEY `index_login_binds_on_account_and_provider` (`account`,`provider`),
  KEY `index_login_binds_on_parent_id_and_provider` (`parent_id`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_logs`
--

DROP TABLE IF EXISTS `login_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录帐号',
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录来源',
  `useragent_id` int(11) DEFAULT NULL COMMENT 'user agent id',
  `state` int(11) DEFAULT '0',
  `error_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_port` int(11) DEFAULT NULL COMMENT '端口',
  PRIMARY KEY (`id`),
  KEY `index_login_logs_on_user_id_and_updated_at` (`user_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `luck_draws`
--

DROP TABLE IF EXISTS `luck_draws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luck_draws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `roll` int(11) DEFAULT NULL,
  `draw_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_luck_draws_on_user_id` (`user_id`),
  KEY `index_luck_draws_on_reason` (`reason`),
  KEY `index_luck_draws_on_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `map_search_blocks`
--

DROP TABLE IF EXISTS `map_search_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_search_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `block_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `begin_at` datetime DEFAULT NULL COMMENT '开始日期',
  `end_at` datetime DEFAULT NULL COMMENT '结束日期',
  `block_word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '敏感词',
  `published` tinyint(1) DEFAULT '0' COMMENT '发布状态',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_map_search_blocks_on_published` (`published`),
  KEY `index_map_search_blocks_on_begin_at_and_end_at` (`begin_at`,`end_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_applications`
--

DROP TABLE IF EXISTS `member_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) DEFAULT NULL,
  `destination_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicant_id` int(11) DEFAULT '0',
  `inviter_id` int(11) DEFAULT '0',
  `access` int(11) DEFAULT '0',
  `applicant_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `need_check` tinyint(1) DEFAULT '1',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operated_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `outsourced` int(11) DEFAULT '0',
  `program_id` int(11) DEFAULT '0' COMMENT '企业的某项目id',
  `role_id` int(11) DEFAULT NULL COMMENT '成员角色 id',
  PRIMARY KEY (`id`),
  KEY `index_member_applications_on_destination` (`destination_id`,`destination_type`,`applicant_id`),
  KEY `index_member_applications_on_inviter_id` (`inviter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member_intros`
--

DROP TABLE IF EXISTS `member_intros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_intros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'user id',
  `module_name` int(11) NOT NULL COMMENT '功能模块名称',
  `intro` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '引导信息',
  `user_guide_closed` tinyint(1) DEFAULT '0' COMMENT '是否已关闭新手引导',
  `is_guided` tinyint(1) DEFAULT '0' COMMENT '是否已完成引导',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_member_intros_on_user_id_and_module_name` (`user_id`,`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT NULL,
  `invite_user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `outsourced` tinyint(1) DEFAULT '0',
  `block_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `block_status` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职位',
  `remark_pinyin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注的拼音',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_g_u_t1` (`group_id`,`user_id`,`type`),
  KEY `index_members_on_user_id_and_type` (`user_id`,`type`),
  KEY `index_members_on_group_id_and_role_id` (`group_id`,`role_id`),
  KEY `role_id_user_id` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_sessions`
--

DROP TABLE IF EXISTS `message_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `read` tinyint(1) DEFAULT '0',
  `noticed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_message_sessions_on_user_id_and_contact_id` (`user_id`,`contact_id`),
  KEY `index_message_sessions_on_user_id_and_message_id` (`user_id`,`message_id`),
  KEY `index_message_sessions_on_user_id_and_read_and_noticed_at` (`user_id`,`read`,`noticed_at`),
  KEY `index_message_sessions_on_message_id` (`message_id`),
  KEY `index_message_sessions_on_contact_id` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrate_issue_refs`
--

DROP TABLE IF EXISTS `migrate_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migrate_issue_setting_id` int(11) NOT NULL COMMENT '迁移配置表的 id',
  `issue_id` int(11) NOT NULL COMMENT 'issue id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '迁移状态(0:成功 1:失败)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_migrate_issue_refs_on_issue_id_and_status` (`issue_id`,`status`),
  KEY `index_migrate_issue_refs_on_migrate_issue_setting_id_and_status` (`migrate_issue_setting_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrate_issue_setting_refs`
--

DROP TABLE IF EXISTS `migrate_issue_setting_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_issue_setting_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migrate_issue_setting_id` int(11) NOT NULL COMMENT '迁移设置 id',
  `source_state_id` int(11) NOT NULL COMMENT '原工作项状态 id',
  `target_state_id` int(11) NOT NULL COMMENT '目标工作项状态 id',
  `source_state_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '原工作项状态 title',
  `target_state_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '目标工作项状态 title',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_migrate_issue_setting_refs_on_migrate_issue_setting_id` (`migrate_issue_setting_id`),
  KEY `index_migrate_issue_setting_refs_on_source_state_id` (`source_state_id`),
  KEY `index_migrate_issue_setting_refs_on_target_state_id` (`target_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrate_issue_settings`
--

DROP TABLE IF EXISTS `migrate_issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrate_issue_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL COMMENT '操作用户 id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `program_id` int(11) DEFAULT '0' COMMENT '项目 id',
  `source_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '原工作类型 id',
  `target_type_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标工作类型 id',
  `source_type_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原工作类型 title',
  `target_type_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标工作类型 title',
  `hierarchy` tinyint(4) DEFAULT '0' COMMENT '选择的层级结构(0: 已满足条件,无需选择 1:调整为关联关系 2:取消父子关系)',
  `success_count` int(11) DEFAULT '0' COMMENT '成功数量',
  `failure_count` int(11) DEFAULT '0' COMMENT '失败数量',
  `state` tinyint(4) DEFAULT '0' COMMENT '迁移状态(0: 迁移中 1: 已完成迁移)',
  `finish_date` datetime DEFAULT NULL COMMENT '完成时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_label_id` int(11) NOT NULL DEFAULT '0' COMMENT '原标签 id',
  `target_label_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标标签 id',
  `source_label_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原标签名',
  `target_label_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标标签名',
  PRIMARY KEY (`id`),
  KEY `index_migrate_issue_settings_on_eid_tid_sid` (`enterprise_id`,`target_type_id`,`source_type_id`),
  KEY `index_migrate_issue_settings_on_program_id` (`program_id`),
  KEY `index_migrate_issue_settings_on_operator_id` (`operator_id`),
  KEY `index_migrate_issue_settings_on_eid_state` (`enterprise_id`,`state`),
  KEY `index_migrate_issue_settings_on_sid_state` (`source_type_id`,`state`),
  KEY `index_migrate_issue_settings_on_source_label_id_and_state` (`source_label_id`,`state`),
  KEY `index_migrate_issue_settings_on_target_label_id_and_state` (`target_label_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `description` text COLLATE utf8_unicode_ci COMMENT '描述',
  `due_date` date DEFAULT NULL COMMENT '结束日期',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态（开启/关闭）',
  `iid` int(11) DEFAULT NULL COMMENT '仓库流水号',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '更新者 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `assignee_id` int(11) DEFAULT '0' COMMENT '负责人 id',
  `author_id` int(11) DEFAULT '0' COMMENT '创建者 id',
  `program_id` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0' COMMENT '置顶排序',
  PRIMARY KEY (`id`),
  KEY `index_milestones_on_due_date` (`due_date`),
  KEY `index_milestones_on_project_id` (`project_id`),
  KEY `index_milestones_on_enterprise_id` (`enterprise_id`),
  KEY `index_milestones_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='里程碑表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_infos`
--

DROP TABLE IF EXISTS `namespace_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL COMMENT '命名空间ID',
  `giteego_surplus_time` int(11) NOT NULL DEFAULT '0' COMMENT 'Gitee Go剩余构建时常，可为负数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_gitee_go_received` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领取过Gitee Go 免费时长',
  `trial_enterprise` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有过企业体验套餐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_namespace_infos_on_namespace_id` (`namespace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_path_histories`
--

DROP TABLE IF EXISTS `namespace_path_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_path_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace_id` int(11) NOT NULL DEFAULT '0' COMMENT 'namespace表id',
  `used_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '企业、组织、用户名使用过的地址',
  `applied_time` datetime(6) NOT NULL COMMENT '此地址记录被应用的时间',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-禁用，false-可用，默认false',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-所属资源被删除，false-所属资源存在，默认false',
  `created_at` datetime(6) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(6) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nph_on_used_path_and_namespace_id` (`used_path`,`namespace_id`),
  KEY `idx_nph_on_used_path_and_time` (`used_path`,`applied_time`),
  KEY `idx_nph_on_space_id_and_time` (`namespace_id`,`applied_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_project_public_confirmations`
--

DROP TABLE IF EXISTS `namespace_project_public_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_project_public_confirmations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Namespace所属仓库批量公开申请',
  `namespace_id` int(11) NOT NULL COMMENT '申请的命名空间',
  `apply_user_id` int(11) NOT NULL COMMENT '申请人',
  `handle_state` int(11) NOT NULL DEFAULT '0' COMMENT '处理状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_namespace_public_confirmation_in_handling` (`namespace_id`,`handle_state`),
  KEY `index_namespace_project_public_confirmations_on_apply_user_id` (`apply_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Namespace所属仓库批量公开申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_quota`
--

DROP TABLE IF EXISTS `namespace_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `commerce_order_id` int(11) DEFAULT '0',
  `member_quota` int(11) DEFAULT '0',
  `space_quota` int(11) DEFAULT '0',
  `single_project_quota` int(11) DEFAULT '0',
  `single_file_quota` int(11) DEFAULT '0',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `attach_quota` int(11) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `commerce_id` int(11) DEFAULT '0',
  `lfs_space_quota` int(11) NOT NULL DEFAULT '1',
  `used_space_quota` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '记录 Namespace 状态(超额,企业过期等).使用二进制值来记录',
  `project_count_quota` int(11) NOT NULL DEFAULT '1000',
  `concurrence_quota` int(11) DEFAULT '5',
  `lfs_single_file_quota` int(11) DEFAULT '1024' COMMENT 'Lfs single file quota (MB)',
  PRIMARY KEY (`id`),
  KEY `index_enterprise_quota_on_owner_type_and_created_at` (`type`,`created_at`),
  KEY `index_enterprise_quota_on_owner_type_and_stop_at` (`type`,`stop_at`),
  KEY `index_enterprise_quota_on_level_and_start_at` (`level`,`start_at`),
  KEY `index_namespace_quota_on_owner_id_and_type_and_level` (`owner_id`,`type`,`level`),
  KEY `tt` (`type`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespace_quota_logs`
--

DROP TABLE IF EXISTS `namespace_quota_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespace_quota_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `commerce_order_id` int(11) DEFAULT '0',
  `member_quota` int(11) DEFAULT '0',
  `space_quota` int(11) DEFAULT '0',
  `single_project_quota` int(11) DEFAULT '0',
  `single_file_quota` int(11) DEFAULT '0',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `alter_mode` int(11) DEFAULT NULL,
  `attach_quota` int(11) DEFAULT '0',
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `viewer_quota` int(11) DEFAULT '0',
  `lfs_space_quota` int(11) DEFAULT '1',
  `remark` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '改动备注',
  `concurrence_quota` int(11) DEFAULT '5',
  `lfs_single_file_quota` int(11) DEFAULT '1024' COMMENT 'Lfs single file quota (MB)',
  PRIMARY KEY (`id`),
  KEY `index_namespace_quota_logs_on_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `namespaces`
--

DROP TABLE IF EXISTS `namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `outsourced` tinyint(1) DEFAULT '0',
  `initial_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'master',
  `complete_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_namespaces_on_complete_path` (`complete_path`),
  KEY `index_namespaces_on_name` (`name`),
  KEY `index_namespaces_on_enterprise_id` (`enterprise_id`),
  KEY `index_namespaces_on_owner_id_and_ent_id` (`owner_id`,`enterprise_id`),
  KEY `index_namespaces_on_path_new` (`path`),
  KEY `index_namespaces_on_parent_id` (`parent_id`),
  KEY `index_namespaces_on_parent_id_and_updated_at` (`parent_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_user_powers`
--

DROP TABLE IF EXISTS `new_user_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_user_powers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL COMMENT '年份',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `maintain_star_count` int(11) DEFAULT NULL COMMENT '仓库获得 star 数',
  `maintain_contributions_count` int(11) DEFAULT NULL COMMENT '仓库获得贡献数',
  `maintain_gvp_count` int(11) DEFAULT NULL COMMENT '仓库获得 gvp 数',
  `maintain_recommend_count` int(11) DEFAULT NULL COMMENT '仓库获得推荐数',
  `watches_count` int(11) DEFAULT NULL COMMENT '用户关注仓库数',
  `first_star_project_id` int(11) DEFAULT NULL COMMENT '第一个 star 的仓库 id',
  `star_count` int(11) DEFAULT NULL COMMENT '用户 star 仓库数',
  `push_count` int(11) DEFAULT NULL COMMENT '用户推送代码次数',
  `public_not_fork_issue_count` int(11) DEFAULT NULL COMMENT '开源仓库任务数量',
  `public_not_fork_pr_count` int(11) DEFAULT NULL COMMENT '开源仓库 pr 数量',
  `handle_issue_count` int(11) DEFAULT NULL COMMENT '开源仓库任务处理量',
  `contributions_count` int(11) DEFAULT NULL COMMENT '用户贡献数',
  `max_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户参与仓库语言占比最大数',
  `max_month` int(11) DEFAULT NULL COMMENT '用户贡献最大月份',
  `max_month_count` int(11) DEFAULT NULL COMMENT '用户贡献最大月份贡献数',
  `longest_streak` int(11) DEFAULT NULL COMMENT '最长连续贡献天数',
  `longest_begin_date` datetime DEFAULT NULL COMMENT '最长连续贡献起始日',
  `longest_end_date` datetime DEFAULT NULL COMMENT '最长连续贡献结束日',
  `year_contri_day` int(11) DEFAULT NULL COMMENT '年度累计贡献天数',
  `topic_content_count` int(11) DEFAULT NULL COMMENT '参与话题内容数【issue + pr】（创建、表态、评论）',
  `agree_count` int(11) DEFAULT NULL COMMENT '参与话题内容收获点赞数',
  `max_contribution_project_id` int(11) DEFAULT NULL COMMENT '贡献最大仓库 id',
  `max_contribution_project_people` int(11) DEFAULT NULL COMMENT '贡献最大仓库参与人数',
  `max_contribution_project_commit` int(11) DEFAULT NULL COMMENT '贡献最大仓库提交次数',
  `first_gitee_go_date` datetime DEFAULT NULL COMMENT '第一次创建 gitee-go 流水线日',
  `update_wiki_project_count` int(11) DEFAULT NULL COMMENT '更新 wiki 开源项目数',
  `follower_count` int(11) DEFAULT NULL COMMENT 'follow 用户的人数',
  `first_follow_user_id` int(11) DEFAULT NULL COMMENT '用户第一个关注的人 id',
  `followers_ids` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关注用户的前五个 ids',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_new_user_powers_on_user_id_and_year` (`user_id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` text COLLATE utf8mb4_unicode_ci,
  `noteable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_id` int(11) DEFAULT '0',
  `line_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noteable_id` int(11) DEFAULT NULL,
  `system` tinyint(1) DEFAULT '0',
  `updated_by_id` int(11) DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ancestry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v_order` int(11) DEFAULT '0',
  `comment_path` varchar(540) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diff_position_id` int(11) DEFAULT NULL,
  `is_pull_request_review` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是PR评审评论',
  PRIMARY KEY (`id`),
  KEY `index_notes_on_commit_id` (`commit_id`),
  KEY `index_notes_on_created_at` (`created_at`),
  KEY `index_notes_on_noteable_type` (`noteable_type`),
  KEY `index_notes_on_ancestry` (`ancestry`),
  KEY `index_for_user_powers` (`author_id`,`created_at`),
  KEY `index_notes_on_p_t_v` (`project_id`,`noteable_type`,`v_order`),
  KEY `index_notes_on_diff_position_id` (`diff_position_id`),
  KEY `index_notes_on_noteable_id_and_noteable_type_and_updated_at` (`noteable_id`,`noteable_type`,`updated_at`),
  KEY `index_notes_on_p_t_p_c` (`project_id`,`noteable_type`,`comment_path`(25),`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notify_messages`
--

DROP TABLE IF EXISTS `notify_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `type_id` int(11) DEFAULT NULL COMMENT '类型 id（同意/拒绝GVP等）',
  `redirect_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '重定向链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='GVP，推荐，捐赠通知信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_grants`
--

DROP TABLE IF EXISTS `oauth_access_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_grants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(11) NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_grants_on_token` (`token`),
  KEY `index_oauth_access_grants_on_app_and_owner` (`application_id`,`resource_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resource_owner_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `application_id` int(11) DEFAULT NULL COMMENT '应用 id',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '令牌',
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '重新刷新令牌',
  `expires_in` int(11) DEFAULT NULL COMMENT '过期时间',
  `revoked_at` datetime DEFAULT NULL COMMENT '撤销时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `scopes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '授权权限范围',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `provider_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `available_access` int(11) DEFAULT NULL COMMENT '剩余可用次数，为空表示不限次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_tokens_on_token` (`token`),
  UNIQUE KEY `index_oauth_access_tokens_on_refresh_token` (`refresh_token`),
  KEY `index_oauth_access_tokens_on_application_id` (`application_id`),
  KEY `index_oauth_access_tokens_on_provider_account` (`provider_account`),
  KEY `index_oauth_access_tokens_on_user_app` (`resource_owner_id`,`application_id`),
  KEY `index_oauth_access_tokens_on_appid_ownerid_createdat` (`application_id`,`resource_owner_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OAuth2.0 授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_applications`
--

DROP TABLE IF EXISTS `oauth_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `site_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `access_limit` int(11) DEFAULT '10000',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'User' COMMENT 'OAuth 的类型（默认 User）',
  `enterprise_id` int(11) DEFAULT '0' COMMENT '与企业关联的 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_applications_on_uid` (`uid`),
  KEY `index_oauth_applications_on_enterprise_id_and_uid` (`enterprise_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth_refs`
--

DROP TABLE IF EXISTS `oauth_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_application_id` int(11) NOT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oauth_refs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `oauth_application_id_target_id_target_type` (`oauth_application_id`,`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `open_source_vips`
--

DROP TABLE IF EXISTS `open_source_vips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_source_vips` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仓库地址',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `apply_description` text COLLATE utf8_unicode_ci COMMENT '申请说明',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `remark` text COLLATE utf8_unicode_ci COMMENT '备注',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `last_accepted_at` datetime DEFAULT NULL COMMENT '最近更新时间',
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_open_source_vips_on_project_id` (`project_id`),
  KEY `index_open_source_vips_on_state` (`state`),
  KEY `index_open_source_vips_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='GVP (Gitee Most Valuable Projects) - 码云最有价值开源项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operate_logs`
--

DROP TABLE IF EXISTS `operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `target_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `operated_by_id` int(11) DEFAULT NULL COMMENT '（旧的）被操作对象 id',
  `operated_by_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `state_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `change_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `before_change_id` int(11) DEFAULT NULL COMMENT '变更前 id',
  `before_change_value` text COLLATE utf8mb4_unicode_ci,
  `after_change_id` int(11) DEFAULT NULL COMMENT '变更后 id',
  `after_change_value` text COLLATE utf8mb4_unicode_ci,
  `through_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `through_id` int(11) DEFAULT NULL COMMENT '通过 id',
  `through_value` text COLLATE utf8mb4_unicode_ci,
  `issue_field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_operate_logs_on_target_id_and_target_type_and_id` (`target_id`,`target_type`,`id`),
  KEY `index_operate_logs_on_issue_field_id` (`issue_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_allocations`
--

DROP TABLE IF EXISTS `order_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_allocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分摊计收',
  `commerce_order_id` int(11) NOT NULL COMMENT '订单',
  `income_today` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '当日收入',
  `date` date NOT NULL COMMENT '日期',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_order_allocations_on_commerce_order_id_and_date` (`commerce_order_id`,`date`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分摊计收';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paas`
--

DROP TABLE IF EXISTS `paas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deploy_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deploy_commit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_deploy_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paas_frame` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paas_domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `build_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `app_guid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_paas_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_applications`
--

DROP TABLE IF EXISTS `page_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户真实姓名',
  `id_portrait` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片（人像面）',
  `id_national_emblem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证照片（国徽面）',
  `id_holding` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手持身份证照片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `refuse_reason` text COLLATE utf8mb4_unicode_ci COMMENT '拒绝原因',
  `status` int(11) DEFAULT '0' COMMENT '申请状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_num` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证号',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '操作人',
  `id_holding_back` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_applied_at` datetime DEFAULT NULL COMMENT '最后提交认证时间',
  PRIMARY KEY (`id`),
  KEY `index_page_applications_on_user_id` (`user_id`),
  KEY `index_page_applications_on_status_and_user_id` (`status`,`user_id`),
  KEY `index_page_apps_idnum_status_user_id` (`id_num`,`status`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分支',
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '域名',
  `last_clone_at` datetime DEFAULT NULL COMMENT '最近克隆时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `build_result` text COLLATE utf8_unicode_ci COMMENT '部署结果',
  `page_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'project' COMMENT 'page 类型（弃用）',
  `wiki_info_id` int(11) DEFAULT NULL COMMENT 'wiki info id（弃用）',
  `build_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部署目录',
  `ssl_certificate_crt` text COLLATE utf8_unicode_ci COMMENT '证书文件',
  `ssl_certificate_key` text COLLATE utf8_unicode_ci COMMENT '私钥文件',
  `ssl_status` int(11) NOT NULL DEFAULT '0' COMMENT 'SSL 状态',
  `force_https` tinyint(1) DEFAULT '0' COMMENT '是否强制使用 HTTPS',
  `auto_update` tinyint(1) DEFAULT '0' COMMENT '是否自动更新Page',
  `page_function` tinyint(1) DEFAULT '0' COMMENT 'pages 白名单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pages_on_domain` (`domain`),
  KEY `index_pages_on_page_function` (`page_function`),
  KEY `index_pages_on_project_id` (`project_id`),
  KEY `index_pages_on_wiki_info_id_and_page_type` (`wiki_info_id`,`page_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Pages 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_orders`
--

DROP TABLE IF EXISTS `payment_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '交易流水号',
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `payment_channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付渠道',
  `payment_details` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON交易详情',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'paid' COMMENT '交易状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payment_orders_on_order_id` (`order_id`),
  KEY `index_payment_orders_on_payment_id` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '号码',
  `state` int(11) DEFAULT '0',
  `captcha` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号来源',
  PRIMARY KEY (`id`),
  KEY `index_phones_on_user_id` (`user_id`),
  KEY `index_phones_on_phone_and_state` (`phone`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinned_group_projects`
--

DROP TABLE IF EXISTS `pinned_group_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinned_group_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pinned_group_projects_on_group_id_and_project_id` (`group_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pinned_users_projects`
--

DROP TABLE IF EXISTS `pinned_users_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pinned_users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `order` int(11) NOT NULL COMMENT '排序',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pinned_users_projects_on_project_id_and_user_id` (`project_id`,`user_id`),
  KEY `index_pinned_users_projects_on_user_id_and_order` (`user_id`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='个人精选仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_repositories`
--

DROP TABLE IF EXISTS `pool_repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_repositories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_project_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pool_repositories_on_disk_path` (`disk_path`),
  UNIQUE KEY `index_pool_repositories_on_source_project_id` (`source_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `private_assets`
--

DROP TABLE IF EXISTS `private_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `target_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `access_level` int(11) DEFAULT '10' COMMENT '权限',
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件路径',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '标识符',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `access_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `remote_file_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fastdfs路径',
  `group_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'fastdfs组名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_private_assets_on_uuid` (`uuid`),
  KEY `index_private_assets_on_user_id` (`user_id`),
  KEY `index_private_assets_on_target` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='私有资源存储表，如企业发票';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_access_infos`
--

DROP TABLE IF EXISTS `program_access_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_access_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业表id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表id',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目表id',
  `accessed_at` datetime DEFAULT NULL COMMENT '此项目最近被访问的时间',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pai_on_entid_and_proid_and_userid` (`program_id`,`enterprise_id`,`user_id`),
  KEY `idx_pai_on_entid_and_userid_and_time` (`enterprise_id`,`user_id`,`accessed_at`),
  KEY `index_program_access_infos_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_collections`
--

DROP TABLE IF EXISTS `program_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `accessed_at` datetime DEFAULT NULL COMMENT '最后访问时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_collections_on_p_id_and_u_id` (`program_id`,`user_id`),
  KEY `index_program_collections_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_components`
--

DROP TABLE IF EXISTS `program_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业id',
  `program_id` int(11) NOT NULL COMMENT '项目id',
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '组件ident',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `position` int(11) NOT NULL COMMENT '位置（排序值）',
  `updated_by_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_program_components_on_program_id` (`program_id`),
  KEY `index_program_components_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_group_refs`
--

DROP TABLE IF EXISTS `program_group_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_group_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL COMMENT '项目 id',
  `group_id` int(11) DEFAULT NULL COMMENT '团队 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_group_refs_on_program_id_and_group_id` (`program_id`,`group_id`),
  KEY `index_program_group_refs_on_program_id` (`program_id`),
  KEY `index_program_group_refs_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_infos`
--

DROP TABLE IF EXISTS `program_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL COMMENT '项目id',
  `test_case_init_status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'original' COMMENT '测试用例示例数据初始化状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `change_category_status` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目修改类型状态',
  `issue_module` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '任务组件类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_infos_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_issue_field_refs`
--

DROP TABLE IF EXISTS `program_issue_field_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_issue_field_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `program_id` int(11) NOT NULL COMMENT '项目 id',
  `issue_field_id` int(11) NOT NULL COMMENT '任务字段 id',
  `sort` int(11) NOT NULL COMMENT '排序值',
  `fixed` tinyint(1) DEFAULT NULL COMMENT '字段是否为固定字段',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_program_issue_field_refs_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_project_refs`
--

DROP TABLE IF EXISTS `program_project_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_project_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_project_refs_on_program_id_and_project_id` (`program_id`,`project_id`),
  KEY `index_program_project_refs_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_statistics`
--

DROP TABLE IF EXISTS `program_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `create_issue_count` int(11) DEFAULT '0' COMMENT '创建任务数',
  `create_pr_count` int(11) DEFAULT '0' COMMENT '创建 PR 数',
  `merge_pr_count` int(11) DEFAULT '0' COMMENT 'PR 合并数',
  `close_issue_count` int(11) DEFAULT '0' COMMENT '实际完成任务数',
  `finish_issue_count` int(11) DEFAULT '0' COMMENT '按期完成任务数',
  `delay_issue_count` int(11) DEFAULT '0' COMMENT '延期任务数',
  `commit_count` int(11) DEFAULT '0',
  `add_code_line` int(11) DEFAULT '0' COMMENT '新增代码行',
  `date` date DEFAULT NULL COMMENT '日期',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_program_statistics_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`),
  KEY `t` (`program_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program_user_refs`
--

DROP TABLE IF EXISTS `program_user_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_user_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_program_user_refs_on_program_id_and_user_id` (`program_id`,`user_id`),
  KEY `index_program_user_refs_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '项目名',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '项目描述',
  `assignee_id` int(11) DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `enterprise_id` int(11) NOT NULL,
  `outsourced` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '项目状态',
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '企业项目内唯一标示',
  `color` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '颜色(eg: #00BE2D)',
  `category` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'standard' COMMENT '项目类型',
  `topped_at` datetime DEFAULT NULL COMMENT '置顶时间',
  PRIMARY KEY (`id`),
  KEY `index_programs_on_enterprise_id_and_assignee_id` (`enterprise_id`,`assignee_id`),
  KEY `index_programs_on_enterprise_id_and_author_id` (`enterprise_id`,`author_id`),
  KEY `index_programs_on_enterprise_id_and_created_at` (`enterprise_id`,`created_at`),
  KEY `index_programs_on_enterprise_id_and_updated_at` (`enterprise_id`,`updated_at`),
  KEY `index_programs_on_enterprise_id_and_ident` (`enterprise_id`,`ident`),
  KEY `index_programs_on_enterprise_id_and_category` (`enterprise_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_api_docs`
--

DROP TABLE IF EXISTS `project_api_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_api_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '0',
  `message` text COLLATE utf8_unicode_ci,
  `service_status` tinyint(1) DEFAULT '0',
  `branch_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `pom_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'java',
  PRIMARY KEY (`id`),
  KEY `index_project_api_docs_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_baidu_statistic_keys`
--

DROP TABLE IF EXISTS `project_baidu_statistic_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_baidu_statistic_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '百度统计 key',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_baidu_statistic_keys_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_category_refs`
--

DROP TABLE IF EXISTS `project_category_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_category_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `project_tag_id` int(11) DEFAULT NULL COMMENT '分类 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_project_category_refs_on_project_tag_id` (`project_tag_id`),
  KEY `index_project_category_refs_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_change_records`
--

DROP TABLE IF EXISTS `project_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `action` int(11) DEFAULT NULL COMMENT '动作（1: 更新, 2: 删除）',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `shard` int(11) DEFAULT '0' COMMENT '爬虫用到（当前时间的时间戳%3的值）',
  `fields` text COLLATE utf8_unicode_ci,
  `baidu_opt` int(11) DEFAULT NULL COMMENT '仓库操作类型',
  `es_delete` tinyint(1) DEFAULT '0' COMMENT '标记es删除',
  `baidu_delete` tinyint(1) DEFAULT '0' COMMENT '标记baidu删除',
  PRIMARY KEY (`id`),
  KEY `index_project_change_records_on_project_id` (`project_id`),
  KEY `index_project_change_records_on_shard_and_id` (`shard`,`id`),
  KEY `index_project_change_records_on_baidu_opt` (`baidu_opt`),
  KEY `index_project_change_records_on_baidu_delete_and_id` (`baidu_delete`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库变更记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_contributions`
--

DROP TABLE IF EXISTS `project_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL COMMENT '仓库 id',
  `user_id` bigint(20) NOT NULL COMMENT '用户 id',
  `updated_date` date NOT NULL COMMENT '数据更新日（做版本使用）',
  `composite_percent` float NOT NULL COMMENT '综合超越百分比',
  `composite_rank` float NOT NULL COMMENT '综合超越排名',
  `code_percent` float NOT NULL COMMENT '代码贡献度百分比',
  `code_rank` float NOT NULL COMMENT '代码贡献度排名',
  `maintenance_percent` float NOT NULL COMMENT '维护贡献度百分比',
  `maintenance_rank` float NOT NULL COMMENT '维护贡献度排名',
  `dev_percent` float NOT NULL COMMENT '开发活跃度百分比',
  `dev_rank` float NOT NULL COMMENT '开发活跃度排名',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_contribution_on_pid_updated_date_uid` (`project_id`,`updated_date`,`user_id`),
  KEY `index_contribution_on_pid_uid_updated_date` (`project_id`,`user_id`,`updated_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_group_authorizations`
--

DROP TABLE IF EXISTS `project_group_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_group_authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库组织授权表',
  `project_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `access_level` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_group_authorizations_on_project_id_and_group_id` (`project_id`,`group_id`),
  KEY `index_project_group_authorizations_on_project_id` (`project_id`),
  KEY `index_project_group_authorizations_on_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库组织授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_infos`
--

DROP TABLE IF EXISTS `project_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `contributors_count` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `repo_size` int(11) DEFAULT '0',
  `open_application` tinyint(1) DEFAULT '0',
  `pr_test_num` int(11) DEFAULT '0',
  `pr_assign_num` int(11) DEFAULT '0',
  `pr_master_only` int(11) DEFAULT '0',
  `online_edit_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `force_verify_apply` int(11) DEFAULT '0',
  `can_readonly` tinyint(1) DEFAULT '0',
  `drc_status` int(11) DEFAULT '0' COMMENT 'DRC导入状态',
  `readme_oid` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'readme的oid',
  `readme_content` text COLLATE utf8mb4_unicode_ci COMMENT 'readme的内容',
  `commits_count` int(11) DEFAULT '0',
  `files_count` int(11) DEFAULT '0',
  `lightweight_pr_enabled` tinyint(1) DEFAULT '1',
  `security_hole_enabled` tinyint(1) DEFAULT '0',
  `gitee_scan_manual` tinyint(1) DEFAULT '0' COMMENT '仓库Gitee Scan 手动扫描开关',
  `forbid_md_catalog` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁止加载 README 的侧边目录',
  `gitee_reward_enabled` tinyint(1) DEFAULT '1' COMMENT '是否开启Gitee Reward',
  `pr_make_issue_complete` tinyint(1) DEFAULT '1' COMMENT '是否开启合并 pr 改变 issue 状态',
  `pr_api_review_num` int(11) DEFAULT '0' COMMENT '合并 PR 前API审核者需通过的票数(0：无设置，1：至少一人通过，-1：需全部API审核人员通过)',
  `webhooks_count` int(11) DEFAULT '50' COMMENT 'Webhook 数量上限',
  `latest_scan_id` int(11) DEFAULT '0' COMMENT '最近一次执行GiteeScan扫描的记录id',
  `gitee_reward_author_protection` tinyint(1) DEFAULT '1' COMMENT '开启Gitee Reward作者保护',
  `program_pipeline_enabled` tinyint(1) DEFAULT '1' COMMENT '是否支持项目流水线',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_infos_on_uniq_project_id` (`project_id`),
  KEY `index_project_infos_on_project_id_and_repo_size` (`project_id`,`repo_size`),
  KEY `index_project_infos_on_project_id_and_program_pipeline_enabled` (`project_id`,`program_pipeline_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_label_refs`
--

DROP TABLE IF EXISTS `project_label_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_label_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库标签中间表',
  `project_id` int(11) NOT NULL COMMENT '仓库id',
  `project_label_id` int(11) NOT NULL COMMENT '仓库话题标签id',
  `user_id` int(11) NOT NULL COMMENT '用户的id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_label_refs_on_project_id` (`project_id`),
  KEY `index_project_label_refs_on_project_label_id_and_created_at` (`project_label_id`,`created_at`),
  KEY `index_project_label_refs_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库标签中间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_labels`
--

DROP TABLE IF EXISTS `project_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库标签表',
  `name` varchar(191) NOT NULL COMMENT '标签名',
  `related_name` varchar(191) NOT NULL COMMENT '联想展示的标签名（只有类型为同义词的标签related_name和name不同）',
  `author_id` int(11) NOT NULL COMMENT '创建者id',
  `ident` varchar(191) NOT NULL COMMENT 'url标识',
  `label_type` tinyint(4) DEFAULT '0' COMMENT '标签的类型（0:用户自定义、1:精选库、2:同义词）',
  `synonym_id` int(11) DEFAULT '0',
  `description` text COMMENT '描述',
  `display_description` tinyint(4) DEFAULT '0' COMMENT '是否展示标签描述（0:不展示、1：展示）',
  `block` tinyint(4) DEFAULT '0' COMMENT '屏蔽状态(0:不屏蔽， 1:屏蔽)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_labels_on_name` (`name`),
  KEY `index_project_labels_on_synonym_id` (`synonym_id`),
  KEY `index_project_labels_on_block` (`block`),
  KEY `index_project_labels_on_label_type` (`label_type`),
  KEY `index_project_labels_on_ident` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_milestone_refs`
--

DROP TABLE IF EXISTS `project_milestone_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_milestone_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `milestone_id` int(11) DEFAULT NULL COMMENT '里程碑 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_milestone_refs_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_project_milestone_refs_on_milestone_id` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库里程碑表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_mirror_sync_tasks`
--

DROP TABLE IF EXISTS `project_mirror_sync_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_mirror_sync_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库镜像任务表',
  `project_mirror_id` int(11) DEFAULT NULL,
  `sync_state` int(11) DEFAULT '0' COMMENT '同步状态',
  `error_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '错误信息',
  `requested_at` datetime DEFAULT NULL COMMENT '请求时间',
  `started_at` datetime DEFAULT NULL COMMENT '执行开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '执行结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `jid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'sidekiq jid',
  `error_detail` text COLLATE utf8mb4_unicode_ci COMMENT '错误详情',
  PRIMARY KEY (`id`),
  KEY `index_project_mirror_sync_tasks_on_project_mirror_id` (`project_mirror_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库镜像任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_mirrors`
--

DROP TABLE IF EXISTS `project_mirrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_mirrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库镜像表',
  `project_id` int(11) DEFAULT NULL,
  `repo_import_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的import_url',
  `repo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的path',
  `repo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '镜像仓库的name',
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私人密钥PAT',
  `mirror_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `webhook_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Webhook密钥',
  `auto_sync` tinyint(1) DEFAULT '0' COMMENT '自动同步, 默认：否',
  `first_webhook_trigger` tinyint(1) DEFAULT '0' COMMENT '首次webhook调用',
  `owner_id` int(11) DEFAULT NULL COMMENT '镜像创建者',
  PRIMARY KEY (`id`),
  KEY `index_project_mirrors_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='仓库镜像表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_path_histories`
--

DROP TABLE IF EXISTS `project_path_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_path_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT 'project表id',
  `used_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '仓库使用过的地址',
  `belongs_namespace_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '仓库使用这条地址时所属的空间地址',
  `applied_time` datetime(6) NOT NULL COMMENT '此地址记录被应用的时间',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-禁用，false-可用，默认false',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true-所属资源被删除，false-所属资源存在，默认false',
  `created_at` datetime(6) NOT NULL COMMENT '创建时间',
  `updated_at` datetime(6) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_pph_on_bnspath_and_upath_and_pid` (`belongs_namespace_path`,`used_path`,`project_id`),
  KEY `idx_pph_on_upath_and_time` (`used_path`,`applied_time`),
  KEY `idx_pph_on_project_id_and_time` (`project_id`,`applied_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_pr_assigns`
--

DROP TABLE IF EXISTS `project_pr_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_pr_assigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assign_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_pr_assigns_on_user_id` (`user_id`),
  KEY `index_project_pr_assigns_on_project_id_and_assign_type` (`project_id`,`assign_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_public_applications`
--

DROP TABLE IF EXISTS `project_public_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_public_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `namespace_id` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT '0',
  `creator_id` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_public_applications_on_project_id` (`project_id`),
  KEY `index_project_public_applications_on_namespace_id` (`namespace_id`),
  KEY `index_project_public_applications_on_creator_id` (`creator_id`),
  KEY `index_project_public_apps_on_operator_and_status_and_created_at` (`operator_id`,`status`,`created_at`),
  KEY `index_project_public_applications_on_status_and_created_at` (`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_publish_limit_reasons`
--

DROP TABLE IF EXISTS `project_publish_limit_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_publish_limit_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '仓库 id',
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'normal' COMMENT '限制公开的原因',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_publish_limit_reasons_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_push_configs`
--

DROP TABLE IF EXISTS `project_push_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_push_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `require_author_email_registered` tinyint(1) DEFAULT '0' COMMENT '提交邮箱必须已注册',
  `restrict_push_own_commit` tinyint(1) DEFAULT '0' COMMENT '只能推送自己的commit',
  `restrict_author_email_suffix` tinyint(1) DEFAULT '0' COMMENT '限制邮箱域名后缀',
  `author_email_suffix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱域名后缀',
  `restrict_commit_message` tinyint(1) DEFAULT '0' COMMENT '限制提交内容格式',
  `commit_message_regex` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '提交内容正则',
  `restrict_file_size` tinyint(1) DEFAULT '0' COMMENT '限制单文件大小',
  `max_file_size` int(11) DEFAULT '0' COMMENT '最大单文件体积（MB）',
  `except_manager` tinyint(1) DEFAULT '0' COMMENT '仓库管理员不受限',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_push_configs_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_radars`
--

DROP TABLE IF EXISTS `project_radars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_radars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `all_percent` float DEFAULT NULL,
  `influence` float DEFAULT NULL,
  `influence_percent` float DEFAULT NULL,
  `health` float DEFAULT NULL,
  `health_percent` float DEFAULT NULL,
  `vitality` float DEFAULT NULL,
  `vitality_percent` float DEFAULT NULL,
  `community` float DEFAULT NULL,
  `community_percent` float DEFAULT NULL,
  `trend` float DEFAULT NULL,
  `trend_percent` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `real_score` float DEFAULT '0' COMMENT '指数综合得分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_radars_on_project_id_and_version` (`project_id`,`version`),
  KEY `index_project_radars_on_all_percent` (`all_percent`),
  KEY `index_project_radars_on_version` (`version`),
  KEY `index_project_radars_on_real_score_and_version` (`real_score`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_statistics`
--

DROP TABLE IF EXISTS `project_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `create_issue_count` int(11) DEFAULT '0' COMMENT '创建 Issue 数',
  `create_pr_count` int(11) DEFAULT '0' COMMENT '创建 PR 数',
  `create_milestone_count` int(11) DEFAULT '0' COMMENT '创建里程碑数',
  `close_issue_count` int(11) DEFAULT '0' COMMENT '任务完成数',
  `merge_pr_count` int(11) DEFAULT '0' COMMENT '合并 PR 数',
  `close_milestone_count` int(11) DEFAULT '0' COMMENT '关闭里程碑数',
  `commit_count` int(11) DEFAULT '0' COMMENT '提交次数',
  `code_line_count` int(11) DEFAULT '0' COMMENT '代码行数',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `date` date NOT NULL COMMENT '日期',
  `close_pr_count` int(11) DEFAULT '0' COMMENT '关闭 PR 数',
  `push_count` int(11) DEFAULT '0' COMMENT 'Push 数量',
  `pull_count` int(11) DEFAULT '0' COMMENT 'Pull 数量',
  `fork_count` int(11) DEFAULT '0' COMMENT 'fork 统计',
  `star_count` int(11) DEFAULT '0' COMMENT 'Star 统计',
  PRIMARY KEY (`id`),
  KEY `index_project_statistics_on_enterprise_id_and_project_id` (`enterprise_id`,`project_id`),
  KEY `index_project_statistics_on_project_id_and_date` (`project_id`,`date`),
  KEY `index_project_statistics_on_enterprise_id_and_date` (`enterprise_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仓库数据统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_tag_refs`
--

DROP TABLE IF EXISTS `project_tag_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tag_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_tag_refs_on_p_t` (`project_id`,`project_tag_id`),
  KEY `tag_id` (`project_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_tags`
--

DROP TABLE IF EXISTS `project_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ident` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `projects_count` int(11) DEFAULT '0',
  `codes_order` int(11) DEFAULT '1',
  `root_id` int(11) DEFAULT '0',
  `name_zh_tw` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '繁体中文名',
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '英文名',
  PRIMARY KEY (`id`),
  KEY `index_project_tags_on_parent_id` (`parent_id`),
  KEY `index_project_tags_on_ident` (`ident`),
  KEY `index_project_tags_on_name` (`name`),
  KEY `index_project_tags_on_parent_id_and_order` (`parent_id`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `homepage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '主页地址',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `default_branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issues_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `wiki_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `namespace_id` int(11) DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `root_id` int(11) DEFAULT NULL,
  `issues_tracker` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gitlab',
  `issues_tracker_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `snippets_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `pull_requests_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `last_activity_at` datetime DEFAULT NULL,
  `stars_count` int(11) DEFAULT '0',
  `forks_count` int(11) DEFAULT '0',
  `recomm` int(11) DEFAULT '0',
  `recomm_at` datetime DEFAULT NULL,
  `lang_stats` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `watches_count` int(11) DEFAULT '0',
  `domain_id` int(11) DEFAULT '1',
  `origin_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_push_at` datetime DEFAULT NULL,
  `can_send_email` tinyint(1) DEFAULT '1',
  `can_hook` tinyint(1) DEFAULT '0',
  `hook_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hook_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `come_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bind_team` tinyint(1) DEFAULT '0',
  `paas_id` int(11) NOT NULL DEFAULT '0',
  `fork_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `import_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `recomm_self` tinyint(1) DEFAULT '0',
  `svn_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `hook_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `block` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_comment` tinyint(1) DEFAULT '1',
  `donate_status` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `outsourced` tinyint(1) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `vip` tinyint(1) DEFAULT '0',
  `license` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `forbid_force_push` tinyint(1) DEFAULT '0',
  `forbid_force_sync` tinyint(1) DEFAULT '0',
  `storages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_path` varchar(540) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sonar_service` int(11) DEFAULT '0' COMMENT 'sonar服务开关',
  `sonar_service_at` datetime DEFAULT NULL COMMENT 'sonar服务开启时间',
  `issue_comment` tinyint(1) DEFAULT '0',
  `template_id` int(11) DEFAULT NULL,
  `template_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '仓库模板',
  `path_new` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_new` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bits` int(11) NOT NULL DEFAULT '0',
  `pool_repository_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_projects_on_path_and_namespace_id` (`path`,`namespace_id`),
  UNIQUE KEY `index_projects_on_namespace_id_and_name_new` (`namespace_id`,`name_new`),
  UNIQUE KEY `index_projects_on_namespace_id_and_path_new` (`namespace_id`,`path_new`),
  KEY `index_projects_on_owner_id` (`creator_id`),
  KEY `index_projects_on_enterprise_id` (`enterprise_id`),
  KEY `index_projects_on_license_stars_count` (`parent_id`,`public`,`license`,`stars_count`),
  KEY `index_projects_on_license_last_push_at` (`parent_id`,`public`,`license`,`last_push_at`),
  KEY `index_projects_on_parent_id_and_public_and_recomm_and_recomm_at` (`parent_id`,`public`,`recomm`,`recomm_at`),
  KEY `index_projects_on_parent_id_and_public_and_stars_count` (`parent_id`,`public`,`stars_count`),
  KEY `index_projects_on_parent_public_lang_license_stars` (`parent_id`,`public`,`lang_id`,`license`,`stars_count`),
  KEY `index_projects_on_parent_id_and_public_and_last_push_at` (`parent_id`,`public`,`last_push_at`),
  KEY `index_projects_on_parent_public_lang_license_push` (`parent_id`,`public`,`lang_id`,`license`,`last_push_at`),
  KEY `index_projects_on_parent_public_lang_stars` (`parent_id`,`public`,`lang_id`,`stars_count`),
  KEY `index_projects_on_parent_public_lang_push` (`parent_id`,`public`,`lang_id`,`last_push_at`),
  KEY `index_projects_on_recomm_self_and_updated_at` (`recomm_self`,`updated_at`),
  KEY `index_projects_on_donate_status_and_updated_at` (`donate_status`,`updated_at`),
  KEY `index_projects_on_created_at_and_parent_id` (`created_at`,`parent_id`),
  KEY `index_gvp` (`vip`,`public`,`parent_id`),
  KEY `index_projects_on_import_url` (`import_url`),
  KEY `index_projects_on_public_and_status` (`public`,`status`),
  KEY `index_projects_on_enterprise_id_and_status` (`enterprise_id`,`status`),
  KEY `index_projects_on_namespace_id_and_created_at` (`namespace_id`,`created_at`),
  KEY `index_projects_on_disk_path` (`disk_path`(78)),
  KEY `index_projects_on_root_id_and_created_at` (`root_id`,`created_at`),
  KEY `index_projects_on_parent_id_and_created_at` (`parent_id`,`created_at`),
  KEY `index_projects_on_bits` (`bits`),
  KEY `index_projects_on_pool_repository_id` (`pool_repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_rules`
--

DROP TABLE IF EXISTS `promotion_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `creator_id` int(11) NOT NULL COMMENT '创建者',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `expiration_time` datetime DEFAULT NULL COMMENT '过期时间',
  `category` int(11) NOT NULL COMMENT '优惠类型（满减/折扣/补时）',
  `quantity` decimal(8,4) NOT NULL COMMENT '优惠数量',
  `condition_category` int(11) NOT NULL DEFAULT '0' COMMENT '优惠条件类型',
  `condition_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '优惠条件数量',
  `commerce_level_int` int(11) NOT NULL DEFAULT '0' COMMENT '可用套餐类型',
  `order_type_int` int(11) NOT NULL DEFAULT '0' COMMENT '可用订单类型',
  `tag_type` int(11) NOT NULL DEFAULT '0' COMMENT '标签类型（热门）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promotion_rules_on_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `way` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stop_at` datetime DEFAULT NULL,
  `condition` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_count` int(11) DEFAULT '1',
  `give_amount` int(11) DEFAULT '0',
  `give_enterprise_id` int(11) DEFAULT '0',
  `order_type` int(11) DEFAULT '65535',
  `creator_id` int(11) DEFAULT NULL,
  `sys` int(11) DEFAULT '0',
  `commerce_level_int` int(11) DEFAULT '65535',
  `activity_wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动红包外键',
  `member_condition` int(11) NOT NULL DEFAULT '0' COMMENT '最少购买成员数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_promotions_on_code_and_order_id_and_state` (`code`,`order_id`,`state`),
  KEY `index_promotions_on_user_id` (`user_id`),
  KEY `index_promotions_on_give_state_stop` (`give_enterprise_id`,`state`,`stop_at`),
  KEY `index_promotions_on_state_and_stop_at` (`state`,`stop_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protected_branches`
--

DROP TABLE IF EXISTS `protected_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `branch_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_protected_branches_on_pid_name` (`project_id`,`name`),
  KEY `index_protected_branches_on_pid_type_name` (`project_id`,`branch_type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protection_rules`
--

DROP TABLE IF EXISTS `protection_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protection_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `wildcard` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pusher` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '可推送代码人员',
  `merger` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin' COMMENT '可合并代码人员',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mode` int(11) DEFAULT '0' COMMENT '模式（0：标准模式，1：评审模式）',
  `strict` tinyint(1) DEFAULT NULL COMMENT '要求检查项必须通过',
  `contexts` text COLLATE utf8mb4_unicode_ci COMMENT '检查项列表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_protection_rules_on_project_id_and_wildcard` (`project_id`,`wildcard`),
  KEY `index_protection_rules_on_project_id_and_mode` (`project_id`,`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_assigns`
--

DROP TABLE IF EXISTS `pull_request_assigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_assigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pull_request_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assign_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pull_request_assigns_on_pr_id_user_id_assign_type` (`pull_request_id`,`user_id`,`assign_type`),
  KEY `index_pull_request_assigns_on_user_id_and_assign_type` (`user_id`,`assign_type`),
  KEY `index_pull_request_assigns_on_user_id_and_pull_request_id` (`user_id`,`pull_request_id`),
  KEY `index_pull_request_assigns_on_project_id_and_assign_type` (`project_id`,`assign_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_blocks`
--

DROP TABLE IF EXISTS `pull_request_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pull_request_id` int(11) DEFAULT NULL,
  `ref_pull_request_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pull_request_blocks_on_pull_request_id` (`pull_request_id`),
  KEY `index_pull_request_blocks_on_ref_pull_request_id` (`ref_pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_conversations`
--

DROP TABLE IF EXISTS `pull_request_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_conversations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_object_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pull_request_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL COMMENT '资源拥有者',
  `resource_object_id` int(11) NOT NULL COMMENT '资源',
  `public_state` smallint(6) NOT NULL DEFAULT '0' COMMENT '资源公开状态(公开，私有)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pr_conversation_resource_uniq_key` (`resource_object_id`,`resource_object_type`),
  KEY `pr_conversation_select_key` (`pull_request_id`,`id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_infos`
--

DROP TABLE IF EXISTS `pull_request_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pull_request_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `st_commits` longtext COLLATE utf8_unicode_ci,
  `st_diffs` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'diffs 状态: [:empty, :collected, :overflow]',
  `base_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'merge base commit sha',
  `start_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'start commit sha',
  `head_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'head commit sha',
  `commits_count` int(11) DEFAULT NULL COMMENT 'commits 数',
  `real_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'diff files 数量',
  `viewed_diff_files` text COLLATE utf8_unicode_ci COMMENT 'PR 的改动文件标阅状态',
  `additions` int(11) DEFAULT NULL COMMENT '代码变更新加行',
  `deletions` int(11) DEFAULT NULL COMMENT '代码变更删除行',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_project_infos_on_uniq_pull_request_id` (`pull_request_id`),
  KEY `index_pull_request_infos_on_head_commit_sha` (`head_commit_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_request_reviews`
--

DROP TABLE IF EXISTS `pull_request_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_request_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PR 评审',
  `note_root_id` int(11) NOT NULL COMMENT '评论root id',
  `author_id` int(11) NOT NULL COMMENT '评审者 id',
  `pull_request_id` int(11) NOT NULL COMMENT 'PR id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态(0:待提交,1:发布评论,2:发布评论并通过,3:发布评审,4:历史评审)',
  `pass_option` tinyint(4) DEFAULT NULL COMMENT '通过选项(1:全部通过，2:审查通过，3:测试通过)',
  `commit_date` datetime DEFAULT NULL COMMENT '提交时间',
  `recheck` tinyint(1) DEFAULT '0' COMMENT '请求重新检查',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pull_request_reviews_on_author_id` (`author_id`),
  KEY `index_pull_request_reviews_on_pull_request_id` (`pull_request_id`),
  KEY `index_pull_request_reviews_on_project_id` (`project_id`),
  KEY `index_pull_request_reviews_on_note_root_id` (`note_root_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='PR 评审';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pull_requests`
--

DROP TABLE IF EXISTS `pull_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pull_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `target_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '目标分支',
  `source_repo` int(11) NOT NULL COMMENT '源仓库',
  `source_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '源分支名',
  `author_id` int(11) DEFAULT NULL COMMENT 'PR 创建者 id',
  `assignee_id` int(11) DEFAULT '0' COMMENT '冗余',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PR 标题',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `milestone_id` int(11) DEFAULT '0' COMMENT '里程碑 id',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PR 状态（打开/重新打开/合并/关闭）',
  `state_int` int(11) DEFAULT NULL COMMENT 'PR 状态int值',
  `merge_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PR 能否被合并（unchecked/can_be_merged/cannot_be_merged）',
  `iid` int(11) DEFAULT NULL COMMENT '仓库 PR 编号',
  `prune_branch` tinyint(1) DEFAULT '0' COMMENT '合并后是否删除提交分支',
  `merge_commit_sha` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合并产生的 commit id',
  `tester_id` int(11) DEFAULT '0' COMMENT '冗余',
  `updated_by_id` int(11) DEFAULT NULL COMMENT 'PR 更新者 id',
  `closed_at` datetime DEFAULT NULL COMMENT '关闭时间',
  `noteable_count` int(11) DEFAULT '0' COMMENT '评论数',
  `check_state` int(11) DEFAULT NULL COMMENT '审查状态',
  `test_state` int(11) DEFAULT NULL COMMENT '测试状态',
  `close_related_issue` int(11) DEFAULT '1' COMMENT '合并后是否关闭关联任务',
  `priority` int(11) DEFAULT '0' COMMENT '优先级',
  `lightweight` tinyint(1) DEFAULT '0',
  `pr_assign_num` int(11) NOT NULL DEFAULT '0' COMMENT '最少审查人数',
  `pr_test_num` int(11) NOT NULL DEFAULT '0' COMMENT '最少测试人数',
  `multiple` int(11) DEFAULT '0',
  `api_review_state` int(11) DEFAULT '0' COMMENT 'API变更审核状态',
  `api_reviewer_id` int(11) DEFAULT NULL COMMENT '冗余',
  `pr_api_review_num` int(11) DEFAULT '0' COMMENT '最少API变更审核人数',
  `latest_scan_id` int(11) DEFAULT '0' COMMENT '最近一次执行GiteeScan扫描的记录id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `draft` tinyint(1) DEFAULT '0' COMMENT '是否为草稿',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pull_requests_on_project_id_and_iid` (`project_id`,`iid`),
  KEY `idx_pull_request_assignee_id` (`assignee_id`),
  KEY `index_pull_requests_on_source_repo_and_source_branch` (`source_repo`,`source_branch`),
  KEY `index_pr_on_milestone_and_state` (`milestone_id`,`state`),
  KEY `index_projects_on_pid_state_tb` (`project_id`,`state`,`target_branch`),
  KEY `index_pull_requests_on_source_repo_and_state_and_source_branch` (`source_repo`,`state`,`source_branch`),
  KEY `index_pull_requests_on_tester_id` (`tester_id`),
  KEY `index_pull_requests_on_project_id_and_created_at` (`project_id`,`created_at`),
  KEY `index_pull_requests_on_created_at` (`created_at`),
  KEY `index_pull_requests_on_project_id_and_milestone_id` (`project_id`,`milestone_id`),
  KEY `index_pull_requests_on_project_id_and_author_id` (`project_id`,`author_id`),
  KEY `index_pull_requests_on_enterprise_id_and_project_id` (`enterprise_id`,`project_id`),
  KEY `index_pull_requests_on_enterprise_id_and_state_and_project_id` (`enterprise_id`,`state`,`project_id`),
  KEY `index_pull_requests_on_project_id_and_updated_at` (`project_id`,`updated_at`),
  KEY `index_pr_eid_state_created_at` (`enterprise_id`,`state_int`,`created_at`),
  KEY `index_pull_requests_on_project_id_and_state_int_and_closed_at` (`project_id`,`state_int`,`closed_at`),
  KEY `index_pull_requests_on_pid_state_created` (`project_id`,`state_int`,`created_at`),
  KEY `index_pull_requests_on_author_id_and_updated_at` (`author_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PR 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire_items`
--

DROP TABLE IF EXISTS `questionnaire_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL COMMENT '问卷id',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题描述',
  `required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必填',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题类型',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '问题备注',
  `answer_options` text COLLATE utf8mb4_unicode_ci COMMENT '问题选项JSON字符串',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaire_items_on_questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire_results`
--

DROP TABLE IF EXISTS `questionnaire_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL COMMENT '问卷ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '填问卷用户',
  `item_id` int(11) NOT NULL COMMENT '问题条目ID',
  `item_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问题描述',
  `answer_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案描述',
  `answer_idents` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '答案标识集合',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaire_results_on_questionnaire_id` (`questionnaire_id`),
  KEY `index_questionnaire_results_on_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '问卷标题',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `status` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态(发布、下架)',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_questionnaires_on_user_id` (`user_id`),
  KEY `index_questionnaires_on_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_change_logs`
--

DROP TABLE IF EXISTS `quota_change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_change_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `namespace_id` int(11) NOT NULL DEFAULT '0' COMMENT '命名空间ID',
  `target_id` int(11) NOT NULL COMMENT '触发对象ID',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发对象类型',
  `quantity` bigint(20) NOT NULL COMMENT '数量[由于可能有不同类型不同精度所以选择string]',
  `quota_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '额度类型',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `number` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '流水编号',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `is_minus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欠费',
  `minus_quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '欠费数量',
  PRIMARY KEY (`id`),
  KEY `index_quota_change_logs_on_enterprise_id` (`enterprise_id`),
  KEY `index_quota_change_logs_on_namespace_id` (`namespace_id`),
  KEY `index_quota_change_logs_on_number` (`number`),
  KEY `index_quota_change_logs_on_is_minus` (`is_minus`),
  KEY `index_quota_change_logs_on_target` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_commerces`
--

DROP TABLE IF EXISTS `quota_commerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_commerces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `price` decimal(10,0) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'active',
  `quota_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quota_quantity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_quota_commerces_on_name_quan_stat_type` (`quota_name`(50),`quota_quantity`,`state`(20),`type`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_packages`
--

DROP TABLE IF EXISTS `quota_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '描述',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `quantity` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `month_num` int(11) NOT NULL DEFAULT '12' COMMENT '月数',
  `category` int(11) NOT NULL COMMENT '容量类型',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_quota_packages_on_category_and_state` (`category`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表态内容',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'Note' COMMENT '所属类型(Note/PullRequest/Issue)',
  `target_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reactions_on_user_id` (`user_id`),
  KEY `index_reactions_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `readonly_items`
--

DROP TABLE IF EXISTS `readonly_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readonly_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_readonly_items_on_project_id_and_branch_and_path` (`project_id`,`branch`,`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommender_user_refs`
--

DROP TABLE IF EXISTS `recommender_user_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommender_user_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommender_id` int(11) DEFAULT NULL COMMENT '推荐官id',
  `link_user_id` int(11) DEFAULT NULL COMMENT '被推荐用户id',
  `pay_state` tinyint(1) DEFAULT '0' COMMENT '支付状态',
  `stop_at` datetime DEFAULT NULL COMMENT '关联过期时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_recommender_user_refs_on_link_user_id_and_stop_at` (`link_user_id`,`stop_at`),
  KEY `index_recommender_user_refs_on_recommender_id` (`recommender_id`),
  KEY `index_recommender_user_refs_on_pay_state` (`pay_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommender_wallets`
--

DROP TABLE IF EXISTS `recommender_wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommender_wallets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '推广官的用户 id',
  `link_user_id` int(11) NOT NULL COMMENT '被推广的用户 id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `commerce_order_id` int(11) NOT NULL COMMENT '商业订单表 id',
  `commerce_id` int(11) NOT NULL COMMENT '企业套餐表 id',
  `income_amount` float NOT NULL COMMENT '收益',
  `ratio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '佣金比例',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态（审核中/待提现/提现中/已到账）',
  `remark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `audit_due_at` datetime DEFAULT NULL COMMENT '审核到期时间',
  `applied_at` datetime DEFAULT NULL COMMENT '申请提现时间',
  `completed_at` datetime DEFAULT NULL COMMENT '到账时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_recommender_wallets_on_user_id_and_created_at` (`user_id`,`created_at`),
  KEY `index_recommender_wallets_on_link_user_id` (`link_user_id`),
  KEY `index_recommender_wallets_on_enterprise_id` (`enterprise_id`),
  KEY `index_recommender_wallets_on_commerce_order_id` (`commerce_order_id`),
  KEY `index_recommender_wallets_on_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommenders`
--

DROP TABLE IF EXISTS `recommenders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommenders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推广码',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `bank_card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行卡号',
  `deposit_bank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '开户银行',
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '银行分行',
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机',
  `level` tinyint(4) DEFAULT '0' COMMENT '等级',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_recommenders_on_code` (`code`),
  KEY `index_recommenders_on_deposit_bank` (`deposit_bank`),
  KEY `index_recommenders_on_user_id_and_level` (`user_id`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '描述',
  `author_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `tag_version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签',
  `release_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '是否预览版',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '目标（分支/commit）',
  PRIMARY KEY (`id`),
  KEY `index_releases_on_project_id` (`project_id`),
  KEY `index_releases_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_event_refs`
--

DROP TABLE IF EXISTS `report_event_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_event_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_issue_refs`
--

DROP TABLE IF EXISTS `report_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_report_issue_refs_on_week_report_id_and_issue_id` (`week_report_id`,`issue_id`),
  KEY `index_report_issue_refs_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_pr_refs`
--

DROP TABLE IF EXISTS `report_pr_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_pr_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week_report_id` int(11) DEFAULT NULL,
  `pull_request_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_report_pr_refs_on_week_report_id_and_pull_request_id` (`week_report_id`,`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource_statistics`
--

DROP TABLE IF EXISTS `resource_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `create_user_count` int(11) DEFAULT '0' COMMENT '新增成员数量',
  `create_project_count` int(11) DEFAULT '0' COMMENT '新增仓库数量',
  `create_group_count` int(11) DEFAULT '0' COMMENT '新增组织数量',
  `date` date NOT NULL COMMENT '日期',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_resource_statistics_on_enterprise_id_and_date` (`enterprise_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='统计资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scan_tasks`
--

DROP TABLE IF EXISTS `scan_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scan_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT '0' COMMENT '企业 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `scan_type` int(11) DEFAULT '0' COMMENT '扫描类型 手动1、PR自动2',
  `user_id` int(11) NOT NULL COMMENT '操作者、触发者id',
  `status` int(11) DEFAULT '0' COMMENT '扫描状态 进行中0、成功1、失败2',
  `dimensions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扫描维度 1缺陷，2规范，3漏洞',
  `priority` int(11) DEFAULT '0' COMMENT '扫描等级 1-高，2-中，3-低',
  `bug_count` int(11) DEFAULT '0' COMMENT '缺陷总数',
  `style_count` int(11) DEFAULT '0' COMMENT '规则总数',
  `cve_count` int(11) DEFAULT '0' COMMENT '漏洞总数',
  `languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '语言类型',
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '扫描分支',
  `commit_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'commit id',
  `commit_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'commit message',
  `pull_request_id` int(11) DEFAULT '0' COMMENT 'PR id',
  `path_type` int(11) DEFAULT '0' COMMENT '扫描路径类型 扫描路径1、过滤路径2',
  `scan_path` text COLLATE utf8mb4_unicode_ci COMMENT '扫描路径',
  `read_count` int(11) DEFAULT '0' COMMENT '任务报告访问次数',
  `callback_time` datetime DEFAULT NULL COMMENT '扫描回调时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_scan_tasks_on_eid_s_and_ct` (`enterprise_id`,`status`,`created_at`),
  KEY `index_scan_tasks_on_pid_s_and_ct` (`project_id`,`status`,`created_at`),
  KEY `index_scan_tasks_on_prid_s_and_ct` (`pull_request_id`,`status`,`created_at`),
  KEY `index_scan_tasks_for_pr_scan` (`pull_request_id`,`commit_id`,`branch`,`scan_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrum_sprint_members`
--

DROP TABLE IF EXISTS `scrum_sprint_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_sprint_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `scrum_sprint_id` int(11) NOT NULL COMMENT '迭代ID',
  `role_level` int(11) NOT NULL DEFAULT '1' COMMENT '角色级别',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_scrum_sprint_members_on_scrum_sprint_id_and_user_id` (`scrum_sprint_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrum_sprints`
--

DROP TABLE IF EXISTS `scrum_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_sprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '迭代名称',
  `state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open' COMMENT '状态',
  `assignee_id` int(11) NOT NULL COMMENT '负责人ID',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `started_at` datetime DEFAULT NULL COMMENT '开始时间',
  `finished_at` datetime DEFAULT NULL COMMENT '结束时间',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '迭代目标内容',
  `doc_node_id` int(11) DEFAULT '0' COMMENT '迭代文档目录id',
  `actual_started_at` datetime DEFAULT NULL COMMENT '实际开始时间',
  `actual_finished_at` datetime DEFAULT NULL COMMENT '实际结束时间',
  `start_count` int(11) DEFAULT '0' COMMENT '开始任务数',
  `complete_count` int(11) DEFAULT '0' COMMENT '完成任务数',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `time_scale` int(11) NOT NULL DEFAULT '0' COMMENT '工时规模（单位秒）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_scrum_sprints_on_program_id_and_title` (`program_id`,`title`),
  KEY `index_scrum_sprints_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`),
  KEY `index_scrum_sprints_on_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrum_stages`
--

DROP TABLE IF EXISTS `scrum_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_stages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父阶段ID',
  `scrum_version_id` int(11) NOT NULL COMMENT '版本ID',
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `state` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open' COMMENT '状态',
  `plan_closed_at` datetime DEFAULT NULL COMMENT '计划结束时间',
  `closed_at` datetime DEFAULT NULL COMMENT '实际阶段结束时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_scrum_stages_on_scrum_version_id_and_title` (`scrum_version_id`,`title`),
  KEY `index_scrum_stages_on_e_p_scrum_version_id` (`enterprise_id`,`program_id`,`scrum_version_id`),
  KEY `index_scrum_stages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrum_versions`
--

DROP TABLE IF EXISTS `scrum_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrum_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL COMMENT '项目ID',
  `number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '版本号',
  `plan_released_at` datetime DEFAULT NULL COMMENT '计划发布时间',
  `released_at` datetime DEFAULT NULL COMMENT '实际发布时间',
  `assignee_id` int(11) NOT NULL COMMENT '负责人ID',
  `creator_id` int(11) NOT NULL COMMENT '创建者ID',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '发布日志',
  `current_stage_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前阶段ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_scrum_versions_on_program_id_and_number` (`program_id`,`number`),
  KEY `index_scrum_versions_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_templates`
--

DROP TABLE IF EXISTS `search_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模版名称',
  `info` text COLLATE utf8_unicode_ci COMMENT '搜索条件json串',
  `target` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '搜索主体',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `program_id` int(11) DEFAULT '0' COMMENT '项目ID',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_search_templates_on_program_id` (`program_id`),
  KEY `user_en_program_updated_index` (`user_id`,`enterprise_id`,`program_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `securities`
--

DROP TABLE IF EXISTS `securities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL,
  `level` int(11) DEFAULT '1',
  `security_type` int(11) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `recipients` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_securities_on_enterprise_id` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortened_urls`
--

DROP TABLE IF EXISTS `shortened_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortened_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2083) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `unique_key` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_count` int(11) NOT NULL DEFAULT '0',
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_shortened_urls_on_unique_key` (`unique_key`),
  KEY `index_shortened_urls_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  KEY `index_shortened_urls_on_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snippets`
--

DROP TABLE IF EXISTS `snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  `author_id` int(11) NOT NULL COMMENT '创建者 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '文件名',
  `expires_at` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `index_snippets_on_created_at` (`created_at`),
  KEY `index_snippets_on_expires_at` (`expires_at`),
  KEY `index_snippets_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='片段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sonar_summaries`
--

DROP TABLE IF EXISTS `sonar_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonar_summaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `code_line` int(11) DEFAULT NULL,
  `total_line` int(11) DEFAULT NULL,
  `statement` int(11) DEFAULT NULL,
  `file` int(11) DEFAULT NULL,
  `directory` int(11) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `web_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sonar_status` int(11) DEFAULT NULL,
  `error` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `done_commit` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `done_branch` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'master',
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'sonar',
  `task_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'sonar',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pull_request_id` int(11) DEFAULT NULL,
  `old` tinyint(1) DEFAULT '0' COMMENT '是否是旧数据',
  PRIMARY KEY (`id`),
  KEY `index_sonar_summaries_on_project_id_and_type` (`project_id`,`type`),
  KEY `index_sonar_summaries_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collection_endorses`
--

DROP TABLE IF EXISTS `star_collection_endorses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collection_endorses` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '星选集 Star 表',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `star_collection_id` int(11) NOT NULL COMMENT '星选集id',
  `is_increase` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否新增Star',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 -1 删除 0 私有 1 公开 ',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_star_collection_endorses_on_user_id_and_star_collection_id` (`user_id`,`star_collection_id`),
  KEY `index_star_collection_endorses_on_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='星选集 Star 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collection_refs`
--

DROP TABLE IF EXISTS `star_collection_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collection_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'star 与 星选集关联表',
  `star_id` int(11) NOT NULL COMMENT 'star id',
  `star_collection_id` int(11) NOT NULL COMMENT '星选集id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_star_collection_refs_on_star_id_and_star_collection_id` (`star_id`,`star_collection_id`),
  KEY `index_star_collection_refs_on_project_id` (`project_id`),
  KEY `index_star_collection_refs_on_updated_at` (`updated_at`),
  KEY `index_star_collection_refs_on_star_collection_id` (`star_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='star 与 星选集关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star_collections`
--

DROP TABLE IF EXISTS `star_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '星选集 表',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 -1 删除 0 私有 1 公开 ',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `stars_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Star 数量',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_star_collections_on_user_id_and_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='星选集 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_stars_on_creator_id_and_project_id_and_code_id` (`creator_id`,`project_id`,`code_id`),
  KEY `index_stars_on_created_at` (`created_at`),
  KEY `index_stars_on_project_id` (`project_id`),
  KEY `index_stars_on_code_id` (`code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_keys`
--

DROP TABLE IF EXISTS `statistics_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL COMMENT '公钥 id',
  `last_visited_at` datetime DEFAULT NULL COMMENT '最后活跃时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_statistics_keys_on_key_id` (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subgroups`
--

DROP TABLE IF EXISTS `subgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `creator_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_subgroups_on_enterprise_id_and_type` (`enterprise_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_award_logs`
--

DROP TABLE IF EXISTS `system_award_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_award_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作者id（谁赠送的）',
  `target_id` int(11) NOT NULL COMMENT '接受者id(送给谁)',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接受者类型',
  `award_quantity` int(11) NOT NULL DEFAULT '0' COMMENT '赠送数量',
  `award_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赠送类型',
  `award_unit` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '赠送单位',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注、原因',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL COMMENT '过期时间',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `award_index` int(11) NOT NULL DEFAULT '1' COMMENT '赠送序号',
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理人员备注',
  `category` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user_apply' COMMENT '类别',
  `source_type` int(11) NOT NULL DEFAULT '0' COMMENT '来源类型,无来源0',
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '来源对象id,无来源0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_target_award_index_uniqe` (`target_type`,`target_id`,`award_index`),
  KEY `index_system_award_logs_on_user_id` (`user_id`),
  KEY `index_system_award_logs_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_system_award_logs_on_is_expired` (`is_expired`),
  KEY `index_system_award_logs_on_category` (`category`),
  KEY `index_system_award_logs_on_source_type_and_source_id` (`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签 id',
  `taggable_id` int(11) DEFAULT NULL COMMENT '所属 id',
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属',
  `tagger_id` int(11) DEFAULT NULL COMMENT '标记者 id',
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标记类型',
  `context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型（tags/gvp）',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`),
  KEY `index_taggings_on_tager` (`tagger_type`,`tagger_id`,`taggable_type`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_assignments`
--

DROP TABLE IF EXISTS `task_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `targetable_id` int(11) DEFAULT NULL,
  `targetable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignmentable_id` int(11) DEFAULT NULL,
  `assignmentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `operated_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_of_task_assignment` (`assignmentable_id`,`assignmentable_type`,`targetable_id`,`targetable_type`,`task_type`),
  KEY `index_task_assignments_on_target` (`targetable_id`,`targetable_type`,`task_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_case_issue_refs`
--

DROP TABLE IF EXISTS `test_case_issue_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_case_issue_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_plan_case_id` int(11) NOT NULL COMMENT '测试计划用例 ID',
  `issue_id` int(11) NOT NULL COMMENT '缺陷 ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 ID',
  `program_id` int(11) NOT NULL COMMENT '项目 ID',
  `test_plan_id` int(11) NOT NULL COMMENT '测试计划 ID',
  `updated_by_id` int(11) NOT NULL COMMENT '更新者 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_case_issue_refs_on_issue_id` (`issue_id`),
  KEY `index_test_case_issue_refs_on_test_plan_case_id` (`test_plan_case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_case_operate_logs`
--

DROP TABLE IF EXISTS `test_case_operate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_case_operate_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL COMMENT '所属 ID',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属类型',
  `user_id` int(11) DEFAULT NULL COMMENT '触发用户 ID',
  `state_type` int(11) DEFAULT NULL COMMENT '操作类型',
  `change_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '变更类型',
  `before_change_id` int(11) DEFAULT NULL COMMENT '变更前 ID',
  `after_change_id` int(11) DEFAULT NULL COMMENT '变更后 ID',
  `before_change_value` text COLLATE utf8mb4_unicode_ci COMMENT '变更前的值',
  `after_change_value` text COLLATE utf8mb4_unicode_ci COMMENT '变更后的值',
  `through_id` int(11) DEFAULT NULL COMMENT 'through ID（通过某个对象触发）',
  `through_type` text COLLATE utf8mb4_unicode_ci COMMENT 'through 类型（对象类型）',
  `through_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'through 对象值',
  `step_id` int(11) DEFAULT '0' COMMENT '用例步骤 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_case_operate_logs_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_cases`
--

DROP TABLE IF EXISTS `test_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用例唯一标识',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用例标题',
  `precondition` text COLLATE utf8mb4_unicode_ci COMMENT '用例前置条件',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '用例备注',
  `module_id` int(11) NOT NULL COMMENT '所属模块',
  `case_type` int(11) DEFAULT NULL COMMENT '用例类型',
  `priority` int(11) DEFAULT NULL COMMENT '用例优先级',
  `enterprise_id` int(11) NOT NULL COMMENT '用例所属企业',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '用例所属项目',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '用例状态',
  `maintainer_id` int(11) DEFAULT NULL COMMENT '用例维护人',
  `creator_id` int(11) NOT NULL COMMENT '创建者',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_test_cases_on_ident` (`ident`),
  KEY `index_test_cases_on_program_id_and_ident` (`program_id`,`ident`),
  KEY `index_test_cases_on_enterprise_id_and_program_id` (`enterprise_id`,`program_id`),
  KEY `index_test_cases_on_program_id_and_case_type` (`program_id`,`case_type`),
  KEY `index_test_cases_on_program_id_and_state` (`program_id`,`state`),
  KEY `index_test_cases_on_program_id_and_priority` (`program_id`,`priority`),
  KEY `index_test_cases_on_program_id_and_maintainer_id` (`program_id`,`maintainer_id`),
  KEY `index_test_cases_on_program_id_and_creator_id` (`program_id`,`creator_id`),
  KEY `index_test_cases_on_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_notes`
--

DROP TABLE IF EXISTS `test_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '评论所属企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '评论所属项目 ID',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT '评论内容',
  `noteable_id` int(11) NOT NULL COMMENT '评论所属 model id',
  `noteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论所属 model',
  `author_id` int(11) NOT NULL COMMENT '评论者 id',
  `system` tinyint(1) DEFAULT '0' COMMENT '是否是系统产生的',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论来源如:api|web|import',
  `ancestry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论层级ids以分隔符/隔开',
  `execute_state` int(11) DEFAULT NULL COMMENT '测试计划执行结果状态',
  `is_execute_note` tinyint(1) DEFAULT '0' COMMENT '评论是否属于执行备注',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_notes_on_enterprise_id` (`enterprise_id`),
  KEY `index_test_notes_on_program_id` (`program_id`),
  KEY `index_test_notes_on_n_t_u` (`noteable_id`,`noteable_type`,`updated_at`),
  KEY `index_test_notes_on_noteable_type` (`noteable_type`),
  KEY `index_test_notes_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_plan_case_modules`
--

DROP TABLE IF EXISTS `test_plan_case_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plan_case_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT '所属测试计划 ID',
  `module_id` int(11) NOT NULL COMMENT '直属模块 ID',
  `module_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模块链路',
  `enterprise_id` int(11) NOT NULL COMMENT '所属企业 ID',
  `program_id` int(11) NOT NULL COMMENT '所属项目 ID',
  `case_count` int(11) NOT NULL DEFAULT '1' COMMENT '引用该模块的用例数量',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_plan_case_modules_on_module_id` (`module_id`),
  KEY `index_test_plan_case_modules_on_p_m` (`plan_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_plan_case_steps`
--

DROP TABLE IF EXISTS `test_plan_case_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plan_case_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_case_id` int(11) NOT NULL COMMENT '步骤所属用 ID',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '用例步骤描述',
  `expected_result` text COLLATE utf8mb4_unicode_ci COMMENT '预期结果',
  `actual_result` text COLLATE utf8mb4_unicode_ci COMMENT '实际结果',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '步骤状态',
  `sort` int(11) DEFAULT '0' COMMENT '排序值',
  `enterprise_id` int(11) NOT NULL COMMENT '所属企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属项目 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_plan_case_steps_on_test_case_id` (`test_case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_plan_cases`
--

DROP TABLE IF EXISTS `test_plan_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plan_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用例唯一标识',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用例标题',
  `precondition` text COLLATE utf8mb4_unicode_ci COMMENT '用例前置条件',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '用例备注',
  `module_id` int(11) NOT NULL COMMENT '所属模块',
  `case_type` int(11) DEFAULT NULL COMMENT '用例类型',
  `priority` int(11) DEFAULT NULL COMMENT '用例优先级',
  `enterprise_id` int(11) NOT NULL COMMENT '用例所属企业',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '用例所属项目',
  `state` int(11) NOT NULL COMMENT '用例状态',
  `maintainer_id` int(11) DEFAULT NULL COMMENT '用例维护人',
  `creator_id` int(11) NOT NULL COMMENT '创建者',
  `parent_id` int(11) NOT NULL COMMENT '父用例 ID',
  `executor_id` int(11) DEFAULT NULL COMMENT '用例执行人 ID',
  `plan_id` int(11) NOT NULL COMMENT '用例所属计划 ID',
  `result` int(11) NOT NULL DEFAULT '0' COMMENT '用例执行结果',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_test_plan_cases_on_ident` (`ident`),
  KEY `index_test_plan_cases_on_plan_id_and_ident` (`plan_id`,`ident`),
  KEY `index_test_plan_cases_on_plan_id_and_case_type` (`plan_id`,`case_type`),
  KEY `index_test_plan_cases_on_plan_id_and_state` (`plan_id`,`state`),
  KEY `index_test_plan_cases_on_plan_id_and_priority` (`plan_id`,`priority`),
  KEY `index_test_plan_cases_on_plan_id_and_maintainer_id` (`plan_id`,`maintainer_id`),
  KEY `index_test_plan_cases_on_plan_id_and_creator_id` (`plan_id`,`creator_id`),
  KEY `index_test_plan_cases_on_plan_id_and_module_id` (`plan_id`,`module_id`),
  KEY `index_test_plan_cases_on_plan_id_and_result` (`plan_id`,`result`),
  KEY `index_test_plan_cases_on_plan_id_and_executor_id` (`plan_id`,`executor_id`),
  KEY `index_test_plan_cases_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_plan_pr_refs`
--

DROP TABLE IF EXISTS `test_plan_pr_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plan_pr_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_plan_id` int(11) NOT NULL COMMENT '测试计划 ID',
  `pull_request_id` int(11) NOT NULL COMMENT 'pull request ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_test_plan_pr_refs_on_test_plan_id_and_pull_request_id` (`test_plan_id`,`pull_request_id`),
  KEY `index_test_plan_pr_refs_on_pull_request_id` (`pull_request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_plans`
--

DROP TABLE IF EXISTS `test_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '测试计划标题',
  `state` int(11) NOT NULL COMMENT '测试计划状态',
  `reset_state` int(11) DEFAULT NULL COMMENT '测试计划挂起前的状态：0 未开始, 1 进行中',
  `assignee_id` int(11) NOT NULL COMMENT '测试计划负责人 ID',
  `creator_id` int(11) NOT NULL COMMENT '测试计划创建人 ID',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '测试计划描述',
  `enterprise_id` int(11) NOT NULL COMMENT '测试计划所属企业 ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '测试计划所属项目 ID',
  `start_date` date DEFAULT NULL COMMENT '测试计划开始时间',
  `end_date` date DEFAULT NULL COMMENT '测试计划结束时间',
  `scrum_version_id` int(11) DEFAULT NULL COMMENT '测试计划关联版本 ID',
  `milestone_sprint_id` int(11) DEFAULT NULL COMMENT '测试计划关联 里程碑/迭代 ID',
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '测试计划关联类型（milestone、sprint）',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_plans_on_title_and_state_and_created_at` (`title`,`state`,`created_at`),
  KEY `index_test_plans_on_enterprise_id_and_program_id_and_created_at` (`enterprise_id`,`program_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tianyancha_enterprises`
--

DROP TABLE IF EXISTS `tianyancha_enterprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tianyancha_enterprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名',
  `reg_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经营状态',
  `establish_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成立日期',
  `reg_capital` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册资本',
  `legal_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '法人',
  `reg_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注册号',
  `credit_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '统一社会信用代码',
  `base` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省份',
  `org_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织机构代码',
  `company_type` int(11) DEFAULT NULL COMMENT '公司类型',
  `result_type` int(11) DEFAULT NULL COMMENT '公司 or 个人',
  PRIMARY KEY (`id`),
  KEY `index_tianyancha_enterprises_on_credit_code` (`credit_code`),
  KEY `index_tianyancha_enterprises_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `hot_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_lang_category` (`language_id`,`category_id`,`hot`,`target_type`),
  KEY `index_topics_on_category_days` (`category_id`,`days`,`language_id`,`target_type`),
  KEY `index_topics_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tour_histories`
--

DROP TABLE IF EXISTS `tour_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `touch_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tour_histories_on_user_id_and_tour_id_and_touch_count` (`user_id`,`tour_id`,`touch_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tour_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `simple_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  `published` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tours_on_name` (`name`),
  KEY `index_tours_on_controller_path_and_action_name_and_published` (`controller_path`,`action_name`,`published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_confirms`
--

DROP TABLE IF EXISTS `transfer_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_confirms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `receiver_user_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transfer_confirms_on_user_id` (`user_id`),
  KEY `index_transfer_confirms_on_receiver_user_id` (`receiver_user_id`),
  KEY `index_transfer_confirms_on_target_type` (`target_type`),
  KEY `index_transfer_confirms_on_target_id` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_actions`
--

DROP TABLE IF EXISTS `trigger_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属触发器ID',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动作',
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trigger_actions_on_trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_filters`
--

DROP TABLE IF EXISTS `trigger_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_id` int(11) NOT NULL COMMENT '所属触发器ID',
  `category` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '过滤对象类型',
  `property` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '过滤值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trigger_filters_on_trigger_id` (`trigger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_logs`
--

DROP TABLE IF EXISTS `trigger_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `trigger_id` int(11) NOT NULL DEFAULT '0' COMMENT '触发器ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '产生日志的直接用户',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行状态',
  `action` int(11) NOT NULL COMMENT '执行动作',
  `target_id` int(11) NOT NULL COMMENT '产生日志的对象ID',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '产生日志对象类型',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级日志ID',
  `execute_object_id` int(11) DEFAULT NULL COMMENT '执行对象id',
  `execute_object_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行对象类型',
  `before_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '改动之前的值',
  `after_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '改动之后的值',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trigger_logs_on_parent_id` (`parent_id`),
  KEY `index_trigger_logs_on_trigger_id` (`trigger_id`),
  KEY `index_trigger_logs_on_enterprise_id` (`enterprise_id`),
  KEY `index_trigger_logs_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '归属对象ID',
  `owner_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '归属对象类型',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT '服务对象ID',
  `target_type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '服务对象类型',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_triggers_on_enterprise_id` (`enterprise_id`),
  KEY `index_triggers_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_triggers_on_owner_id_and_owner_type_and_enabled` (`owner_id`,`owner_type`,`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `u_infos`
--

DROP TABLE IF EXISTS `u_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci COMMENT '电话',
  `email` text COLLATE utf8mb4_unicode_ci COMMENT '邮箱',
  `sex` text COLLATE utf8mb4_unicode_ci COMMENT '性别',
  `address` text COLLATE utf8mb4_unicode_ci COMMENT '地址',
  `wechat` text COLLATE utf8mb4_unicode_ci COMMENT '微信',
  `weibo` text COLLATE utf8mb4_unicode_ci COMMENT '微博',
  `blog` text COLLATE utf8mb4_unicode_ci COMMENT '博客地址',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload_assets`
--

DROP TABLE IF EXISTS `upload_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传资源记录',
  `user_id` int(11) DEFAULT NULL COMMENT '上传人',
  `asset_type` tinyint(4) DEFAULT NULL COMMENT '资源类型（图片，视频等）',
  `size` int(11) DEFAULT NULL COMMENT '大小',
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url路径',
  `storage_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '磁盘路径',
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '上传来源',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_upload_assets_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='上传资源记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_account_confirms`
--

DROP TABLE IF EXISTS `user_account_confirms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_confirms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否确认帐号信息',
  `reminder_at` datetime DEFAULT NULL COMMENT '提醒时间',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '换绑 token',
  `token_expires_in` datetime NOT NULL COMMENT 'token 过期时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_account_confirms_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `default_address` tinyint(1) DEFAULT '0',
  `drc_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'DRC唯一id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_addresses_on_drc_id` (`drc_id`),
  KEY `index_user_addresses_on_user_id` (`user_id`),
  KEY `index_user_addresses_on_enterprise_id` (`enterprise_id`),
  KEY `index_user_addresses_on_tel` (`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_change_records`
--

DROP TABLE IF EXISTS `user_change_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_change_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `action` int(11) DEFAULT '1' COMMENT '动作',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fields` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_user_change_records_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户变更记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_ent_changelog_refs`
--

DROP TABLE IF EXISTS `user_ent_changelog_refs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_ent_changelog_refs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  `changelog_id` int(11) NOT NULL COMMENT '更新日志 ID',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_ent_changelog_refs_on_user_id_and_changelog_id` (`user_id`,`changelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_feature_records`
--

DROP TABLE IF EXISTS `user_feature_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feature_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `feature_log_id` int(11) DEFAULT NULL,
  `slide_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_feature_records_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_file_collections`
--

DROP TABLE IF EXISTS `user_file_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_file_collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL COMMENT '文件 id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业 id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_file_collections_on_enterprise_id_and_user_id` (`enterprise_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户收藏文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户 ID',
  `oauth_scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户第三方应用授权权限',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `drc_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'DRC唯一id',
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司',
  `profession` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职业',
  `specialty` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '特长',
  `wechat` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信',
  `qq` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT 'QQ',
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '领英',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `role_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否海外用户',
  `sign_up_ip` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_up_area` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_infos_on_user_id` (`user_id`),
  UNIQUE KEY `index_user_infos_on_drc_id` (`drc_id`),
  KEY `index_user_infos_on_sign_up_ip` (`sign_up_ip`),
  KEY `index_user_infos_on_sign_up_area` (`sign_up_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `content` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `message_type` int(11) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_msg_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会话key',
  `user_id` int(11) DEFAULT NULL COMMENT '私信所属用户',
  `parent_id` int(11) DEFAULT '0' COMMENT '父消息id',
  `read_at` datetime DEFAULT NULL COMMENT '消息被读取的时间',
  `state` tinyint(4) DEFAULT '0' COMMENT '为以后撤回或软删除预留',
  PRIMARY KEY (`id`),
  KEY `index_user_messages_on_from_user_id` (`from_user_id`),
  KEY `index_user_messages_on_to_user_id` (`to_user_id`),
  KEY `index_user_messages_on_read` (`read`),
  KEY `index_user_messages_on_message_type` (`message_type`),
  KEY `index_user_messages_on_user_msg_name` (`user_msg_name`),
  KEY `index_user_messages_on_user_id_and_user_msg_name` (`user_id`,`user_msg_name`),
  KEY `index_user_messages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification_settings`
--

DROP TABLE IF EXISTS `user_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notification_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `way_of_notice` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_notification_settings_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notifications`
--

DROP TABLE IF EXISTS `user_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属（UserMessage/Project/NotifyMessage等）',
  `target_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属 id',
  `project_id` int(11) NOT NULL,
  `participating` tinyint(1) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `mute` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `noti_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '冗余',
  `noti_category` int(11) DEFAULT NULL,
  `refer` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_notifications_on_project_id` (`project_id`),
  KEY `index_user_notifications_on_actor_id` (`actor_id`),
  KEY `index_user_notifications_on_target_and_user` (`target_type`,`target_id`,`user_id`),
  KEY `index_user_notifications_on_created_at` (`created_at`),
  KEY `index_on_uid_refer_unread_update` (`user_id`,`refer`,`unread`,`updated_at`),
  KEY `index_on_uid_pid_refer_unread_update` (`user_id`,`project_id`,`refer`,`unread`,`updated_at`),
  KEY `index_user_notifications_on_uid_unread_update` (`user_id`,`unread`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notifications_archive_before_6000`
--

DROP TABLE IF EXISTS `user_notifications_archive_before_6000`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notifications_archive_before_6000` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `target_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属（UserMessage/Project/NotifyMessage等）',
  `target_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所属 id',
  `project_id` int(11) NOT NULL,
  `participating` tinyint(1) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `mute` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `noti_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '内容',
  `suffix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '冗余',
  `noti_category` int(11) DEFAULT NULL,
  `refer` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_notifications_on_project_id` (`project_id`),
  KEY `index_user_notifications_on_actor_id` (`actor_id`),
  KEY `index_user_notifications_on_target_and_user` (`target_type`,`target_id`,`user_id`),
  KEY `index_user_notifications_on_created_at` (`created_at`),
  KEY `index_on_uid_refer_unread_update` (`user_id`,`refer`,`unread`,`updated_at`),
  KEY `index_on_uid_pid_refer_unread_update` (`user_id`,`project_id`,`refer`,`unread`,`updated_at`),
  KEY `index_user_notifications_on_uid_unread_update` (`user_id`,`unread`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_powers`
--

DROP TABLE IF EXISTS `user_powers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_powers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_push_at` datetime DEFAULT NULL,
  `holiday_count` int(11) DEFAULT NULL,
  `start_count` int(11) DEFAULT NULL,
  `watch_count` int(11) DEFAULT NULL,
  `fork_count` int(11) DEFAULT NULL,
  `longest_streak` int(11) DEFAULT NULL,
  `create_issue_count` int(11) DEFAULT NULL,
  `close_issue_count` int(11) DEFAULT NULL,
  `recommend_count` int(11) DEFAULT NULL,
  `donates_count` int(11) DEFAULT NULL,
  `contributions_count` int(11) DEFAULT NULL,
  `horse_power` int(11) DEFAULT NULL,
  `ranking` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `year` int(11) DEFAULT '2016',
  `k_star_count` int(11) DEFAULT NULL,
  `gvp_count` int(11) DEFAULT NULL,
  `get_start_count` int(11) DEFAULT NULL,
  `get_fork_count` int(11) DEFAULT NULL,
  `get_watch_count` int(11) DEFAULT NULL,
  `top_2_p_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_count` int(11) DEFAULT NULL,
  `push_count` int(11) DEFAULT NULL,
  `push_public_count` int(11) DEFAULT NULL,
  `public_issue_count` int(11) DEFAULT NULL,
  `public_note_count` int(11) DEFAULT NULL,
  `favorite_language_id` int(11) DEFAULT NULL,
  `ot_count` int(11) DEFAULT NULL,
  `contributions_project_count` int(11) DEFAULT NULL,
  `contributions_issue_count` int(11) DEFAULT NULL,
  `contributions_pull_request_count` int(11) DEFAULT NULL,
  `max_season` int(11) DEFAULT NULL,
  `max_season_percent` int(11) DEFAULT NULL,
  `push_count_percent` int(11) DEFAULT NULL,
  `push_type` int(11) DEFAULT NULL,
  `user_watches_count` int(11) DEFAULT NULL,
  `user_follows_count` int(11) DEFAULT NULL,
  `first_star_project_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_follow_openharmony` int(11) DEFAULT NULL,
  `is_star_openharmony` int(11) DEFAULT NULL,
  `is_watch_openharmony` int(11) DEFAULT NULL,
  `is_star_open_guide` int(11) DEFAULT NULL,
  `is_watch_open_guide` int(11) DEFAULT NULL,
  `public_not_fork_push_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_issue_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_pr_gvp_count` int(11) DEFAULT NULL,
  `public_not_fork_push_count` int(11) DEFAULT NULL,
  `public_not_fork_issue_count` int(11) DEFAULT NULL,
  `public_not_fork_pr_count` int(11) DEFAULT NULL,
  `contribute_type` int(11) DEFAULT NULL,
  `in_gvp_ids_string` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_not_fork_project_count` int(11) DEFAULT NULL,
  `maintain_gvp_contributor_count` int(11) DEFAULT NULL,
  `maintain_star_user_count` int(11) DEFAULT NULL,
  `maintain_star_count` int(11) DEFAULT NULL,
  `maintain_recomm_count` int(11) DEFAULT NULL,
  `maintain_gvp_count` int(11) DEFAULT NULL,
  `maintain_contribute_event_count` int(11) DEFAULT NULL,
  `final_openharmony_time` datetime DEFAULT NULL,
  `final_open_guide_time` datetime DEFAULT NULL,
  `maintain_gvp_ids_string` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_powers_on_user_id_and_year` (`user_id`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_remarks`
--

DROP TABLE IF EXISTS `user_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '创建者',
  `target_id` int(11) DEFAULT NULL COMMENT '目标用户',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_remarks_on_user_id_and_target_id` (`user_id`,`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_statistics`
--

DROP TABLE IF EXISTS `user_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `enterprise_id` int(11) NOT NULL COMMENT '企业 id',
  `close_issue_count` int(11) DEFAULT '0' COMMENT '完成任务数量',
  `commit_count` int(11) DEFAULT '0' COMMENT '推送数量',
  `review_pr_count` int(11) DEFAULT '0' COMMENT '审核 PR 数量',
  `date` date NOT NULL COMMENT '日期',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `project_id` int(11) NOT NULL COMMENT '任务',
  `test_pr_count` int(11) DEFAULT '0' COMMENT '测试 PR 数量',
  `create_issue_count` int(11) DEFAULT '0' COMMENT '新建任务数量',
  `create_pr_count` int(11) DEFAULT '0' COMMENT '新建 PR 数量',
  `merge_pr_count` int(11) DEFAULT '0' COMMENT '合并 PR 数量',
  `add_code_line` int(11) DEFAULT '0' COMMENT '增加了多少代码行',
  `remove_code_line` int(11) DEFAULT '0' COMMENT '移除了多少代码行',
  `fork_count` int(11) DEFAULT '0' COMMENT 'fork 统计',
  `star_count` int(11) DEFAULT '0' COMMENT 'Star 统计',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_statistics_on_p_d_u_e` (`project_id`,`date`,`user_id`,`enterprise_id`),
  KEY `en_user_project_date_index` (`enterprise_id`,`user_id`,`project_id`,`date`),
  KEY `index_user_statistics_on_project_id_and_user_id` (`project_id`,`user_id`),
  KEY `index_user_statistics_on_e_date` (`enterprise_id`,`date`),
  KEY `index_user_statistics_on_p_e_date` (`project_id`,`enterprise_id`,`date`),
  KEY `index_user_statistics_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team_project_relationships`
--

DROP TABLE IF EXISTS `user_team_project_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_project_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_team_id` int(11) DEFAULT NULL,
  `greatest_access` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_team_project_relationships_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_team_user_relationships`
--

DROP TABLE IF EXISTS `user_team_user_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_team_user_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_team_id` int(11) NOT NULL,
  `group_admin` tinyint(1) DEFAULT NULL,
  `permission` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_team_user_id` (`user_id`),
  KEY `idx_user_team_user_team_id` (`user_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_teams`
--

DROP TABLE IF EXISTS `user_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_user_teams_on_owner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` text COLLATE utf8_unicode_ci,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_expires_in` datetime DEFAULT NULL,
  `refresh_token_expires_in` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_tokens_on_user_id_and_platform` (`user_id`,`platform`),
  KEY `index_user_tokens_on_token` (`token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `useragents`
--

DROP TABLE IF EXISTS `useragents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useragents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(6553) COLLATE utf8_unicode_ci NOT NULL COMMENT 'value of user agent',
  `sha` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'sha of value',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_useragents_on_sha` (`sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user agents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `projects_limit` int(11) DEFAULT '1000',
  `authentication_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT '1',
  `bio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT '0',
  `locked_at` datetime DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_create_group` tinyint(1) NOT NULL DEFAULT '1',
  `can_create_team` tinyint(1) NOT NULL DEFAULT '1',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_scheme_id` int(11) NOT NULL DEFAULT '1',
  `weibo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portrait` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_changed_username` tinyint(1) DEFAULT NULL,
  `notification_level` int(11) NOT NULL DEFAULT '3',
  `confirmation_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `private_count` int(11) DEFAULT '1000',
  `activate_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extern_uid` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth2_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain_id` int(11) DEFAULT '1',
  `score` int(11) DEFAULT '0',
  `inviter_id` int(11) DEFAULT '0',
  `invite_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bae_services` mediumtext COLLATE utf8mb4_unicode_ci,
  `forced_out` tinyint(1) DEFAULT '0',
  `unconfirmed_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oscid` int(11) DEFAULT NULL,
  `osc_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coin` int(11) DEFAULT '0',
  `donate_desc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `role` int(11) DEFAULT '0',
  `public_info` int(11) NOT NULL DEFAULT '6',
  `authentication_type` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_admin` (`admin`),
  KEY `index_users_on_name` (`name`),
  KEY `index_users_on_username` (`username`),
  KEY `index_users_on_invite_token` (`invite_token`),
  KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `index_users_on_unconfirmed_email` (`unconfirmed_email`),
  KEY `index_users_on_created_at` (`created_at`),
  KEY `index_users_on_oscid` (`oscid`),
  KEY `index_users_on_enterprise_id` (`enterprise_id`),
  KEY `index_users_on_last_sign_in_ip` (`last_sign_in_ip`),
  KEY `index_users_on_current_sign_in_ip` (`current_sign_in_ip`),
  KEY `index_users_on_current_sign_in_at` (`current_sign_in_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_projects`
--

DROP TABLE IF EXISTS `users_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户 id',
  `project_id` int(11) NOT NULL COMMENT '仓库 id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `project_access` int(11) NOT NULL DEFAULT '0' COMMENT '仓库访问权限',
  PRIMARY KEY (`id`),
  KEY `index_users_projects_on_project_id_and_project_access` (`project_id`,`project_access`),
  KEY `index_users_projects_on_user_id_and_project_id` (`user_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户仓库表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visitor_logs`
--

DROP TABLE IF EXISTS `visitor_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '被访问的用户',
  `visitor_id` int(11) DEFAULT NULL COMMENT '访问者',
  `visit_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `visit_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问页面url',
  `visit_at` datetime DEFAULT NULL COMMENT '访问时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_visitor_logs_on_user_id` (`user_id`),
  KEY `index_visitor_logs_on_visitor_id` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wallet_withdraws`
--

DROP TABLE IF EXISTS `wallet_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `commerce_order_id` int(11) DEFAULT NULL,
  `commerce_id` int(11) DEFAULT NULL,
  `income_amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `remark` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applied_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_wallet_withdraws_on_commerce_order_id` (`commerce_order_id`),
  KEY `index_wallet_withdraws_on_user_id_and_commerce_order_id` (`user_id`,`commerce_order_id`),
  KEY `index_wallet_withdraws_on_promotion_id` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `self_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `watch_type` int(11) DEFAULT '0' COMMENT '关注策略类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_watches_on_self_id_and_project_id` (`self_id`,`project_id`),
  KEY `index_watches_on_created_at_and_project_id` (`created_at`,`project_id`),
  KEY `index_watches_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_hook_infos`
--

DROP TABLE IF EXISTS `web_hook_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hook_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_hook_id` int(11) NOT NULL COMMENT 'web hook ID',
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'web hook 触发事件名',
  `event_ident` int(11) NOT NULL COMMENT '触发事件下的具体属性唯一标识',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index_web_hook_infos_on_wid_and_name_and_ident` (`web_hook_id`,`event_name`,`event_ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_hook_logs`
--

DROP TABLE IF EXISTS `web_hook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hook_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_hook_id` int(11) NOT NULL COMMENT 'Webhook ID (外键)',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_headers` text COLLATE utf8mb4_unicode_ci,
  `request_payload` mediumtext COLLATE utf8mb4_unicode_ci,
  `response_headers` text COLLATE utf8mb4_unicode_ci,
  `response_body` text COLLATE utf8mb4_unicode_ci,
  `response_status` int(11) DEFAULT NULL COMMENT '响应状态码',
  `duration` float DEFAULT NULL COMMENT '请求完成时间',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `encryption_type` int(11) DEFAULT NULL COMMENT '加密方式',
  `send_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_hook_logs_on_web_hook_id_and_created_at` (`web_hook_id`,`created_at`),
  KEY `index_web_hook_logs_on_web_hook_id_and_updated_at` (`web_hook_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Webhook 日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `web_hooks`
--

DROP TABLE IF EXISTS `web_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` text COLLATE utf8mb4_unicode_ci,
  `result_code` int(11) DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci,
  `push_events` tinyint(1) DEFAULT '1',
  `tag_push_events` tinyint(1) DEFAULT '0',
  `issues_events` tinyint(1) DEFAULT '0',
  `note_events` tinyint(1) DEFAULT '0',
  `merge_requests_events` tinyint(1) DEFAULT '0',
  `data_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `service` tinyint(1) DEFAULT '0',
  `properties` text COLLATE utf8mb4_unicode_ci,
  `encryption_type` int(11) DEFAULT '0' COMMENT '加密方式',
  `program_id` int(11) DEFAULT NULL,
  `check_run_events` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_web_hooks_on_project_id` (`project_id`),
  KEY `index_web_hooks_on_enterprise_id` (`enterprise_id`),
  KEY `index_web_hooks_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `week_report_templates`
--

DROP TABLE IF EXISTS `week_report_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_report_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL COMMENT '所属企业',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否是默认模板',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模板名',
  `content` text COLLATE utf8_unicode_ci COMMENT '模板内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_week_report_templates_on_enterprise_id_and_is_default` (`enterprise_id`,`is_default`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `week_reports`
--

DROP TABLE IF EXISTS `week_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `week_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '工作汇总',
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `week_index` int(11) DEFAULT NULL,
  `week_begin` date DEFAULT NULL,
  `week_end` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_on_user_id_enterprise_id_year_week_index` (`enterprise_id`,`user_id`,`year`,`week_index`),
  KEY `index_week_reports_on_enterprise_id_and_year_and_week_index` (`enterprise_id`,`year`,`week_index`),
  KEY `index_week_reports_on_user_id_and_week` (`user_id`,`year`,`week_index`),
  KEY `index_week_reports_on_enterprise_id_and_week_index` (`enterprise_id`,`week_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weeklies`
--

DROP TABLE IF EXISTS `weeklies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weeklies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `html_content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_data`
--

DROP TABLE IF EXISTS `wiki_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_sort_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件内容',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wiki_data_on_wiki_sort_id` (`wiki_sort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_infos`
--

DROP TABLE IF EXISTS `wiki_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专属地址',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `creator_id` int(11) DEFAULT NULL,
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `group_id` int(11) DEFAULT '0',
  `subgroup_id` int(11) DEFAULT '0',
  `project_id` int(11) DEFAULT '0',
  `last_updated_at` datetime DEFAULT NULL,
  `public` int(11) DEFAULT '0',
  `storages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '机器 ip',
  `disk_path` varchar(540) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '仓库路径',
  `program_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_wiki_infos_on_enterprise_id_and_path_and_project_id` (`enterprise_id`,`path`,`project_id`),
  KEY `index_path` (`path`),
  KEY `index_wiki_infos_on_enterprise_id_path_name` (`enterprise_id`,`path`,`name`),
  KEY `index_wiki_infos_on_project_id_group_id` (`enterprise_id`,`project_id`,`group_id`),
  KEY `index_wiki_infos_on_project_id_and_enterprise_id` (`project_id`,`enterprise_id`),
  KEY `index_wiki_infos_on_group_id_and_enterprise_id` (`group_id`,`enterprise_id`),
  KEY `index_wiki_infos_on_program_id` (`program_id`),
  KEY `index_wiki_infos_on_disk_path` (`disk_path`(78)),
  KEY `index_wiki_infos_on_creator_id` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_logs`
--

DROP TABLE IF EXISTS `wiki_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `wiki_message` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_level` int(11) DEFAULT '10',
  `parent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wiki_logs_on_p_id_and_title_and_parent` (`project_id`,`title`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wiki_sorts`
--

DROP TABLE IF EXISTS `wiki_sorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_sorts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件名称',
  `wiki_id` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `enterprise_id` int(11) NOT NULL DEFAULT '0',
  `editing_user_id` int(11) DEFAULT '0',
  `last_edit_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `editor_id` int(11) DEFAULT '0',
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_level` int(11) DEFAULT '0',
  `info_id` int(11) DEFAULT NULL COMMENT 'wiki_info id',
  `creator_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `file_type` int(11) DEFAULT '0' COMMENT '文件类型 0未知 1文件 2目录',
  PRIMARY KEY (`id`),
  KEY `index_wiki_sorts_on_wiki_id_and_type` (`wiki_id`,`type`),
  KEY `index_wiki_sorts_on_parent_id_and_wiki_id_and_type` (`parent_id`,`wiki_id`,`type`),
  KEY `index_wiki_sorts_on_enterprise_id` (`enterprise_id`),
  KEY `index_wiki_sorts_on_info_id_and_parent_id` (`info_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdraw_user_infos`
--

DROP TABLE IF EXISTS `withdraw_user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraw_user_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ali_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_withdraw_user_infos_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_orders`
--

DROP TABLE IF EXISTS `work_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attach_id` int(11) DEFAULT NULL,
  `attach_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `contack_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_orders_on_target_attach` (`target_id`,`target_type`,`attach_id`,`attach_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务状态的工作流',
  `issue_type_id` int(11) DEFAULT NULL COMMENT '任务类型 id',
  `state_id` int(11) DEFAULT NULL COMMENT '当前状态的 id(issue_state.id)',
  `next_state_id` int(11) DEFAULT NULL COMMENT '下一个状态的 id(issue_state.id)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflows_on_issue_type_id_and_state_id` (`issue_type_id`,`state_id`),
  KEY `idx_type_id_state_id_next_state_id` (`issue_type_id`,`state_id`,`next_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='任务状态的工作流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workload_logs`
--

DROP TABLE IF EXISTS `workload_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workload_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workload_id` int(11) NOT NULL COMMENT '工时记录ID',
  `enterprise_id` int(11) NOT NULL COMMENT '企业ID',
  `creator_id` int(11) NOT NULL COMMENT '操作人',
  `owner_id` int(11) NOT NULL COMMENT '登记人',
  `duration` int(11) NOT NULL COMMENT '时长(秒)',
  `description` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `registered_at` date NOT NULL COMMENT '登记时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `commit_sha` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关联的commit id',
  `commit_project_id` int(11) DEFAULT NULL COMMENT '关联commit的项目ID',
  PRIMARY KEY (`id`),
  KEY `index_workload_logs_on_workload_id` (`workload_id`),
  KEY `index_on_eid_oid_rat` (`enterprise_id`,`owner_id`,`registered_at`),
  KEY `index_workload_logs_on_enterprise_id_and_registered_at` (`enterprise_id`,`registered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workloads`
--

DROP TABLE IF EXISTS `workloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `target_id` int(11) NOT NULL COMMENT '工时依赖对ID',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '工时依赖对象类型',
  `enterprise_id` int(11) NOT NULL COMMENT '企业id',
  `program_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目ID',
  `milestone_id` int(11) NOT NULL DEFAULT '0' COMMENT '里程碑ID',
  `registered_duration` int(11) NOT NULL DEFAULT '0' COMMENT '登记工时(单位秒)',
  `left_duration` int(11) NOT NULL DEFAULT '0' COMMENT '剩余工时(单位秒)',
  `estimated_duration` int(11) NOT NULL DEFAULT '0' COMMENT '预估工时(单位秒)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_workloads_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_on_eid_pid` (`enterprise_id`,`program_id`),
  KEY `index_on_eid_mid` (`enterprise_id`,`milestone_id`),
  KEY `index_workloads_on_program_id` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-12 11:51:45
