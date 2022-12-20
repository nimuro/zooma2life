use g5;
-- --------------------------------------------------------

--
-- Table structure for table `g5_board_order_data`
--

-- 메뉴 도메인 변경
update g5_menu set me_link = REPLACE(me_link, 'http://zm2life.com', 'http://localhost:8080');

-- BBS 주문 심플
DROP TABLE IF EXISTS `g5_board_order_data`;
CREATE TABLE IF NOT EXISTS `g5_board_order_data` (
    `od_id` bigint(20) unsigned null comment 'order id',
    `ms_id` int(11) NOT NULL auto_increment,
    `mb_id` varchar(20) NOT NULL default '' COMMENT '주문자 ID',
    `bo_table` varchar(20) NOT NULL default '' COMMENT 'board ID',
    `wr_id` varchar(15) NOT NULL default '' COMMENT 'board write ID',
    `ms_datetime` datetime NOT NULL default CURRENT_TIMESTAMP,
    `dt_pg` varchar(255) default '' null,
    PRIMARY KEY  (`ms_id`),
    KEY `mb_id` (`mb_id`)
    ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- BBS 주문 상세
DROP TABLE IF EXISTS `g5_board_order`;
CREATE TABLE IF NOT EXISTS `g5_board_order` (
    `od_id` bigint(20) unsigned NOT NULL,
    `mb_id` varchar(255) NOT NULL DEFAULT '',
    `od_name` varchar(20) NOT NULL DEFAULT '',
    `od_email` varchar(100) NOT NULL DEFAULT '',
    `od_tel` varchar(20) NOT NULL DEFAULT '',
    `od_hp` varchar(20) NOT NULL DEFAULT '',
    `od_zip1` char(3) NOT NULL DEFAULT '',
    `od_zip2` char(3) NOT NULL DEFAULT '',
    `od_addr1` varchar(100) NOT NULL DEFAULT '',
    `od_addr2` varchar(100) NOT NULL DEFAULT '',
    `od_addr3` varchar(255) NOT NULL DEFAULT '',
    `od_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
    `od_deposit_name` varchar(20) NOT NULL DEFAULT '',
    `od_b_name` varchar(20) NOT NULL DEFAULT '',
    `od_b_tel` varchar(20) NOT NULL DEFAULT '',
    `od_b_hp` varchar(20) NOT NULL DEFAULT '',
    `od_b_zip1` char(3) NOT NULL DEFAULT '',
    `od_b_zip2` char(3) NOT NULL DEFAULT '',
    `od_b_addr1` varchar(100) NOT NULL DEFAULT '',
    `od_b_addr2` varchar(100) NOT NULL DEFAULT '',
    `od_b_addr3` varchar(255) NOT NULL DEFAULT '',
    `od_b_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
    `od_memo` text NOT NULL,
    `od_cart_count` int(11) NOT NULL DEFAULT '0',
    `od_cart_price` int(11) NOT NULL DEFAULT '0',
    `od_cart_coupon` int(11) NOT NULL DEFAULT '0',
    `od_send_cost` int(11) NOT NULL DEFAULT '0',
    `od_send_cost2` int(11) NOT NULL DEFAULT '0',
    `od_send_coupon` int(11) NOT NULL DEFAULT '0',
    `od_receipt_price` int(11) NOT NULL DEFAULT '0',
    `od_cancel_price` int(11) NOT NULL DEFAULT '0',
    `od_receipt_point` int(11) NOT NULL DEFAULT '0',
    `od_refund_price` int(11) NOT NULL DEFAULT '0',
    `od_bank_account` varchar(255) NOT NULL DEFAULT '',
    `od_receipt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `od_coupon` int(11) NOT NULL DEFAULT '0',
    `od_misu` int(11) NOT NULL DEFAULT '0',
    `od_shop_memo` text NOT NULL,
    `od_mod_history` text NOT NULL,
    `od_status` varchar(255) NOT NULL DEFAULT '',
    `od_hope_date` date NOT NULL DEFAULT '0000-00-00',
    `od_settle_case` varchar(255) NOT NULL DEFAULT '',
    `od_other_pay_type` varchar(100) NOT NULL DEFAULT '',
    `od_test` tinyint(4) NOT NULL DEFAULT '0',
    `od_mobile` tinyint(4) NOT NULL DEFAULT '0',
    `od_pg` varchar(255) NOT NULL DEFAULT '',
    `od_tno` varchar(255) NOT NULL DEFAULT '',
    `od_app_no` varchar(20) NOT NULL DEFAULT '',
    `od_escrow` tinyint(4) NOT NULL DEFAULT '0',
    `od_casseqno` varchar(255) NOT NULL DEFAULT '',
    `od_tax_flag` tinyint(4) NOT NULL DEFAULT '0',
    `od_tax_mny` int(11) NOT NULL DEFAULT '0',
    `od_vat_mny` int(11) NOT NULL DEFAULT '0',
    `od_free_mny` int(11) NOT NULL DEFAULT '0',
    `od_delivery_company` varchar(255) NOT NULL DEFAULT '0',
    `od_invoice` varchar(255) NOT NULL DEFAULT '',
    `od_invoice_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `od_cash` tinyint(4) NOT NULL,
    `od_cash_no` varchar(255) NOT NULL,
    `od_cash_info` text NOT NULL,
    `od_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
    `od_pwd` varchar(255) NOT NULL DEFAULT '',
    `od_ip` varchar(25) NOT NULL DEFAULT '',
    PRIMARY KEY (`od_id`),
    KEY `index2` (`mb_id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;