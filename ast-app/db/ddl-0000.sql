# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20042
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: localhost (MySQL 5.7.31)
# 数据库: ast-framework-dev
# 生成时间: 2022-12-17 03:54:05 +0000
# ************************************************************

USE DATABASE api-app

SET NAMES utf8mb4;


# 转储表 ast_vul
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ast_vul`;

CREATE TABLE `ast_vul` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `biz_id` int(11) NOT NULL,
  `source_vid` varchar(255) NOT NULL,
  `sink_vid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 转储表 ast_vul_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ast_vul_category`;

CREATE TABLE `ast_vul_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL COMMENT '漏洞大类',
  `sub_type` varchar(255) NOT NULL COMMENT '漏洞二级分类',
  `description` text NOT NULL COMMENT '漏洞描述',
  `fix_suggestion_id` int(11) NOT NULL COMMENT '修复建议 ID',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 转储表 t_config_iast_rulemap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_config_iast_rulemap`;

CREATE TABLE `t_config_iast_rulemap` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `variant_taint_pos` varchar(10) DEFAULT NULL,
  `origin_taint_pos` varchar(20) DEFAULT NULL,
  `support_ret` tinyint(1) DEFAULT NULL,
  `support_object` tinyint(1) DEFAULT NULL,
  `param_index` int(11) DEFAULT NULL,
  `method_type` varchar(10) DEFAULT NULL,
  `descriptor` varchar(512) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `bizId` int(11) unsigned NOT NULL,
  `status` int(1) DEFAULT '1',
  `vul_category_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# 转储表 t_iast_api_network_flow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_iast_api_network_flow`;

CREATE TABLE `t_iast_api_network_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `method` char(10) NOT NULL,
  `protocol` char(10) NOT NULL,
  `target` varchar(2000) NOT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `biz_id` int(11) NOT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `gmt_modified` datetime DEFAULT CURRENT_TIMESTAMP,
  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `status_code` int(11) DEFAULT NULL,
  `res_body` text,
  `res_header` json DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `is_replay_request` tinyint(1) DEFAULT NULL,
  `req_body` text,
  `parameter` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `req_header` json DEFAULT NULL,
  `access_time` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
