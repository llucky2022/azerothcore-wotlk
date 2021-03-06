-- DB update 2021_11_06_05 -> 2021_11_06_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_11_06_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_11_06_05 2021_11_06_06 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1636206943540376100'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1636206943540376100');

ALTER TABLE `updates` 
    CHANGE `state` `state` ENUM('RELEASED','CUSTOM','MODULE','ARCHIVED') CHARSET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'RELEASED' NOT NULL COMMENT 'defines if an update is released or archived.';

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_11_06_06' WHERE sql_rev = '1636206943540376100';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
