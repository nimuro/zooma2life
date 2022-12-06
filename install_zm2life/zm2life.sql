use g5;
-- --------------------------------------------------------

--
-- Table structure for table `g5_order`
--

DROP TABLE IF EXISTS `g5_order`;
CREATE TABLE IF NOT EXISTS `g5_order` (
    `ms_id` int(11) NOT NULL auto_increment,
    `mb_id` varchar(20) NOT NULL default '',
    `bo_table` varchar(20) NOT NULL default '',
    `wr_id` varchar(15) NOT NULL default '',
    `ms_datetime` datetime NOT NULL default CURRENT_TIMESTAMP,
    PRIMARY KEY  (`ms_id`),
    KEY `mb_id` (`mb_id`)
    ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------