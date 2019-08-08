-- # load data local infile 'ASN.csv' into table asn fields terminated by ','  enclosed by '"'  lines terminated by '\n'  ignore 1 lines  (network, asn, asn_org, type)
CREATE TABLE `asn` (
  `id` mediumint(6) UNSIGNED NOT NULL,
  `network` varchar(40) NOT NULL,
  `asn_org` varchar(100) NOT NULL,
  `asn` varchar(30) NOT NULL,
  `type` enum('ipv4','ipv6') NOT NULL,
  `import_type` enum('1','2','3','4') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `asn` ADD PRIMARY KEY (`id`), ADD KEY `asn` (`asn`), ADD KEY `type` (`type`);
ALTER TABLE `asn` MODIFY `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT;



SELECT
  INET_NTOA(INET_ATON( SUBSTRING_INDEX(val, '/', 1))
   & 0xffffffff ^ ((0x1 << ( 32 - SUBSTRING_INDEX(val, '/', -1))  ) -1 )) from_ip,
  INET_NTOA(INET_ATON( SUBSTRING_INDEX(val, '/', 1))
   | ((0x100000000 >> SUBSTRING_INDEX(val, '/', -1) ) -1 )) to_ip
FROM cidr;

--  https://stackoverflow.com/questions/35562416/mysql-query-to-convert-cidr-into-ip-range
CREATE TABLE `cidr` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `val` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `cidr` (`id`, `val`)
VALUES
    (1, '192.168.2.12/24'),
    (2, '192.168.2.12/25'),
    (3, '1.0.85.128/25'),
    (4, '192.168.2.12/32');


-- select INET6_NTOA("2001:200::/37");
-- select INET6_ATON("2001:200:a00::/39")
select INET6_NTOA(INET6_ATON("2001:200:a00::"))

-- https://amiunique.org/faq
-- https://www.distilnetworks.com/wp-content/uploads/2019/05/The_Forrester_New_Wave_Bot-Management.pdf
