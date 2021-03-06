-- DB update 2021_09_15_00 -> 2021_09_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_15_00 2021_09_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631203839037621100'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631203839037621100');

DELETE FROM `gossip_menu` WHERE `MenuID`=1470 AND `TextID`=2139;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES 
(1470, 2139);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(14,15) AND `SourceGroup`=1470;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(14, 1470, 2139, 0, 0, 8, 0, 3528, 0, 0, 0, 0, 0, '', 'Show gossip text 2139 if quest 3528 is rewarded'),
(14, 1470, 2139, 0, 0, 2, 0, 10818, 1, 1, 1, 0, 0, '', 'Show gossip 2139 if player does not have item 10818 including in bank'),
(14, 1470, 2140, 0, 0, 8, 0, 3528, 0, 0, 1, 0, 0, '', 'Show gossip text 2139 if quest 3528 is not rewarded'),
(14, 1470, 2140, 0, 1, 2, 0, 10818, 1, 1, 0, 0, 0, '', 'Show gossip 2140 if player has item 10818 including in bank'),
(15, 1470, 0, 0, 0, 8, 0, 3528, 0, 0, 0, 0, 0, '', 'Show gossip option 0 if quest 3528 is rewarded'),
(15, 1470, 0, 0, 0, 2, 0, 10818, 1, 1, 1, 0, 0, '', 'Show gossip option 0 if player does not have item 10818 including in bank');

DELETE FROM `gossip_menu_option` WHERE `MenuID`=1470 AND `OptionID`=0;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`) VALUES 
(1470, 0, 0, 'Yes.  Give me the spell to summon the avatar.', 4567, 1, 1, 0, 0, 0, 0, NULL, 0, 0);

UPDATE `creature_template` SET `AiName`='SmartAI' WHERE `entry`=8579;
DELETE FROM `smart_scripts` WHERE `entryorguid`=8579 AND `source_type`=0 AND `id` IN(3,4);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(8579, 0, 3, 4, 62, 0, 100, 0, 1470, 0, 0, 0, 0, 11, 12998, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, "Yeh'kinya - On Gossip Option 0 Selected - Cast 'Create Yeh'kinya's Scroll'"),
(8579, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, "Yeh'kinya - On Link - Close Gossip");

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_09_16_00' WHERE sql_rev = '1631203839037621100';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
