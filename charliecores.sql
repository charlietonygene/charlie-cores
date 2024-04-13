CREATE TABLE IF NOT EXISTS `playerxp` (
    `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `identifier` VARCHAR(50) NOT NULL,
    `charid` int(11) NOT NULL,
    `character` int(11) NOT NULL,
    `firstname` VARCHAR(50) NOT NULL,
    `lastname` VARCHAR(50) NOT NULL,
    `healthxp` int(11) DEFAULT 0,
    `staminaxp` int(11) DEFAULT 0,
    `healthlevel` int(11) DEFAULT 0,
    `staminalevel` int(11) DEFAULT 0,
    `healthmultiplier` int(11) DEFAULT 0,
    `staminamultiplier` int(11) DEFAULT 0,
    `totallevel` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
