
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
