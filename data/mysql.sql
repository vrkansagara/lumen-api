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
