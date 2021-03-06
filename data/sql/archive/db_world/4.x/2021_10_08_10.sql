-- DB update 2021_10_08_09 -> 2021_10_08_10
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_10_08_09';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_10_08_09 2021_10_08_10 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1633450793115028200'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1633450793115028200');

-- A lot of missing spawns. Objects and creatures
SET @CGUID := 134649; -- 34 needed
SET @OGUID := 59171; -- 21 needed
SET @EVENT := 24;
-- Berfest Reveler
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+33;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`wander_distance`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
-- Barleybrew Apprentice <Barleybrew Brew Vendor>
(@CGUID+0,23482,530,1,1,22395,0,-4016.6,-11833,0.106771,4.04165,300,0,0,2215,0,0,0,0,0),
-- Brewfest Reveler - Exodar
(@CGUID+1,24484,530,1,1,21843,-1,-4004.32,-11859.4,0.177081,0.860784,300,0,0,2215,0,0,0,0,0),
(@CGUID+2,24484,530,1,1,21844,-1,-4001.38,-11855.2,0.211436,4.18773,300,0,0,2215,0,0,0,0,0),
(@CGUID+3,24484,530,1,1,21843,-1,-4010.47,-11852.8,0.118782,4.25763,300,0,0,2215,0,0,0,0,0),
(@CGUID+4,24484,530,1,1,21842,-1,-4009.89,-11854.7,0.121793,3.64502,300,0,0,2215,0,0,0,0,0),
(@CGUID+5,24484,530,1,1,21844,-1,-4012.09,-11839.5,0.131949,0.507355,300,0,0,2215,0,0,0,0,0),
(@CGUID+6,24484,530,1,1,21845,-1,-4005.04,-11840.8,0.203372,2.26665,300,0,0,2215,0,0,0,0,0),
(@CGUID+7,24484,530,1,1,21842,-1,-4017.34,-11851.2,0.047381,1.00608,300,0,0,2215,0,0,0,0,0),
(@CGUID+8,24484,530,1,1,21845,-1,-4013.17,-11842.1,0.114192,4.16731,300,0,0,2215,0,0,0,0,0),
(@CGUID+9,24484,530,1,1,21844,-1,-4012.1,-11847.4,0.111304,2.65935,300,0,0,2215,0,0,0,0,0),
(@CGUID+10,24484,530,1,1,21843,-1,-4017.5,-11845,0.0595054,5.9266,300,0,0,2215,0,0,0,0,0),
-- Brewfest Reveler - Eversong Woods
(@CGUID+11,24484,530,1,1,21841,-1,9318.1,-7278.19,13.3383,0.709729,300,0,0,2215,0,0,0,0,0),
(@CGUID+12,24484,530,1,1,21838,-1,9318.04,-7274.55,13.3571,5.13466,300,0,0,2215,0,0,0,0,0),
(@CGUID+13,24484,530,1,1,21840,-1,9322.69,-7278.57,13.2085,3.03844,300,0,0,2215,0,0,0,0,0),
(@CGUID+14,24484,530,1,1,21839,-1,9323.46,-7274.86,13.2653,3.31333,300,0,0,2215,0,0,0,0,0),
(@CGUID+15,24484,530,1,1,21840,-1,9333.88,-7275.82,13.514,5.39384,300,0,0,2215,0,0,0,0,0),
(@CGUID+16,24484,530,1,1,21841,-1,9335.93,-7281.15,13.695,2.03234,300,0,0,2215,0,0,0,0,0),
(@CGUID+17,24484,530,1,1,21838,-1,9340.67,-7275.46,14.0555,4.97837,300,0,0,2215,0,0,0,0,0),
(@CGUID+18,24484,530,1,1,21839,-1,9343.15,-7280.24,14.3778,2.35828,300,0,0,2215,0,0,0,0,0),
(@CGUID+19,24484,530,1,1,21840,-1,9334.47,-7296.27,13.7759,3.58271,300,0,0,2215,0,0,0,0,0),
(@CGUID+20,24484,530,1,1,21839,-1,9329.98,-7295.05,13.7486,5.6758,300,0,0,2215,0,0,0,0,0),
(@CGUID+21,24484,530,1,1,21841,-1,9340.93,-7269.42,14.5058,0.837748,300,0,0,2215,0,0,0,0,0),
-- Troll Commoner
(@CGUID+22,19177,1,1,1,21876,0,1748.94,-4497.53,28.793,5.47104,300,0,0,42,0,0,0,0,0),
(@CGUID+23,19177,1,1,1,21877,0,1752.58,-4499.43,28.2911,2.89886,300,0,0,42,0,0,0,0,0),
-- Orc Commoner
(@CGUID+24,19175,1,1,1,21868,0,1609.47,-4323.21,2.33176,3.34811,300,0,0,42,0,0,0,0,0),
(@CGUID+25,19175,1,1,1,21869,0,1605.95,-4324.2,2.19915,0.0101724,300,0,0,42,0,0,0,0,0),
-- Gnome Commoner
(@CGUID+26,19172,0,1,1,21850,0,-4831.74,-1172.58,502.278,6.19592,2,0,0,42,0,0,3,0,0),
(@CGUID+27,19172,0,1,1,21853,0,-4829.88,-1173.25,502.277,2.49582,2,0,0,42,0,0,3,0,0),
-- Bok Dropcertain
(@CGUID+28,24527,1,1,1,0,0,795.14,-4522.59,6.31052,5.20636,300,0,0,1004,0,0,0,0,0),
-- Drohn's Distillery Apprentice
(@CGUID+29,24501,530,1,1,22491,0,9333.7,-7269.67,13.7715,4.52047,300,0,0,2215,0,0,0,0,0),
-- Gordok Brew Apprentice <Gordok Brew Vendor>
(@CGUID+30,23511,530,1,1,0,0,-4020.13,-11855.6,0.0061873,1.0273,300,0,0,2215,0,0,0,0,0),
(@CGUID+31,23511,530,1,1,0,0,9313.83,-7281.3,13.8523,0.903714,300,0,0,2215,0,0,0,0,0),
-- T'chali's Voodoo Brewery Apprentice <Voodoo Brew Vendor>
(@CGUID+32,23533,530,1,1,22493,0,9330.11,-7285.87,13.7137,1.37103,300,0,0,2215,0,0,0,0,0),
-- Thunderbrew Apprentice
(@CGUID+33,23510,530,1,1,0,0,-4021.3,-11842.9,0.0212859,5.9439,300,0,0,2215,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+1 AND @CGUID+21;
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@CGUID+1, 0, 0x0, 0x101, '43908'),
(@CGUID+2, 0, 0x0, 0x101, '43908'),
(@CGUID+3, 0, 0x0, 0x101, '43908'),
(@CGUID+4, 0, 0x0, 0x101, '43908'),
(@CGUID+5, 0, 0x0, 0x101, '43908'),
(@CGUID+6, 0, 0x0, 0x101, '43908'),
(@CGUID+7, 0, 0x0, 0x101, '43908'),
(@CGUID+8, 0, 0x0, 0x101, '43908'),
(@CGUID+9, 0, 0x0, 0x101, '43908'),
(@CGUID+10, 0, 0x0, 0x101, '43908'),
(@CGUID+11, 0, 0x0, 0x101, '43907'),
(@CGUID+12, 0, 0x0, 0x101, '43907'),
(@CGUID+13, 0, 0x0, 0x101, '43907'),
(@CGUID+14, 0, 0x0, 0x101, '43907'),
(@CGUID+15, 0, 0x0, 0x101, '43907'),
(@CGUID+16, 0, 0x0, 0x101, '43907'),
(@CGUID+17, 0, 0x0, 0x101, '43907'),
(@CGUID+18, 0, 0x0, 0x101, '43907'),
(@CGUID+19, 0, 0x0, 0x101, '43907'),
(@CGUID+20, 0, 0x0, 0x101, '43907'),
(@CGUID+21, 0, 0x0, 0x101, '43907');

-- Make the above spawns only happen if Brewfest is active
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+33;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(@EVENT,@CGUID+0),(@EVENT,@CGUID+1),(@EVENT,@CGUID+2),(@EVENT,@CGUID+3),
(@EVENT,@CGUID+4),(@EVENT,@CGUID+5),(@EVENT,@CGUID+6),(@EVENT,@CGUID+7),
(@EVENT,@CGUID+8),(@EVENT,@CGUID+9),(@EVENT,@CGUID+10),(@EVENT,@CGUID+11),
(@EVENT,@CGUID+12),(@EVENT,@CGUID+13),(@EVENT,@CGUID+14),(@EVENT,@CGUID+15),
(@EVENT,@CGUID+16),(@EVENT,@CGUID+17),(@EVENT,@CGUID+18),(@EVENT,@CGUID+19),
(@EVENT,@CGUID+20),(@EVENT,@CGUID+21),(@EVENT,@CGUID+22),(@EVENT,@CGUID+23),
(@EVENT,@CGUID+24),(@EVENT,@CGUID+25),(@EVENT,@CGUID+26),(@EVENT,@CGUID+27),
(@EVENT,@CGUID+28),(@EVENT,@CGUID+29),(@EVENT,@CGUID+30),(@EVENT,@CGUID+31),
(@EVENT,@CGUID+32),(@EVENT,@CGUID+33);

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+20;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
-- Exodar
(@OGUID+0,178666,530,1,1,-4015.97,-11829.2,0.146814,2.80549,0,0,0.985913,0.167262,300,0,1),
(@OGUID+1,178666,530,1,1,-4024.94,-11840.7,-0.0137537,4.17208,0,0,0.870173,-0.492747,300,0,1),
(@OGUID+2,186259,530,1,1,-4029.42,-11849.1,-0.0817791,3.05053,0,0,0.998964,0.0455147,300,0,1),
(@OGUID+3,186260,530,1,1,-4008.1,-11835.5,0.186614,1.27632,0,0,0.595718,0.803194,300,0,1),
(@OGUID+4,186257,530,1,1,-4016.1,-11859.2,0.0441619,4.26476,0,0,0.846413,-0.532527,300,0,1),
(@OGUID+5,186221,530,1,1,-4008.42,-11850.7,0.144533,2.04601,0,0,0.853677,0.520803,300,0,1),
(@OGUID+6,186717,530,1,1,-4008.29,-11857.1,0.135722,5.47893,0,0,0.391378,-0.92023,300,0,1),
(@OGUID+7,186717,530,1,1,-4002.56,-11851,0.205429,5.13728,0,0,0.542116,-0.840304,300,0,1),
-- Darnassus
(@OGUID+8,186717,1,1,1,9962.87,2218.32,1329.82,1.77101,0,0,0.774236,0.632897,300,0,1),
(@OGUID+9,186717,1,1,1,9963.64,2192.59,1328.52,4.74374,0,0,0.695937,-0.718103,300,0,1),
-- Eversong Woods
(@OGUID+10,178666,530,1,1,9333.24,-7265.71,13.7149,3.15074,0,0,0.99999,-0.00457361,300,0,1),
(@OGUID+11,178666,530,1,1,9330.88,-7289.79,13.7388,0.18586,0,0,0.0927961,0.995685,300,0,1),
(@OGUID+12,186717,530,1,1,9319.23,-7265.19,13.7578,2.02761,0,0,0.84885,0.528633,300,0,1),
(@OGUID+13,186717,530,1,1,9310.25,-7291.41,14.4908,2.53027,0,0,0.953648,0.300923,300,0,1),
(@OGUID+14,186221,530,1,1,9318.17,-7291.17,14.4236,0.649241,0,0,0.318949,0.947772,300,0,1),
(@OGUID+15,186257,530,1,1,9318.61,-7289.66,14.436,0.782759,0,0,0.381464,0.924384,300,0,1),
(@OGUID+16,186256,530,1,1,9341.19,-7288.21,14.3979,4.71368,0,0,0.70665,-0.707563,300,0,1),
(@OGUID+17,186255,530,1,1,9343.07,-7265.55,14.691,1.48569,0,0,0.676387,0.736546,300,0,1),
(@OGUID+18,180037,530,1,1,9316.77,-7283.36,13.7084,3.63768,0,0,0.969394,-0.24551,300,0,1),
(@OGUID+19,180037,530,1,1,9313.62,-7285.06,13.9541,3.38636,0,0,0.992521,-0.122077,300,0,1),
(@OGUID+20,180037,530,1,1,9308.97,-7280.39,14.447,5.40091,0,0,0.426971,-0.904265,300,0,1);

-- Make the above game objects only spawn if Brewfest is active
DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+20;
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(@EVENT,@OGUID+0),(@EVENT,@OGUID+1),(@EVENT,@OGUID+2),(@EVENT,@OGUID+3),
(@EVENT,@OGUID+4),(@EVENT,@OGUID+5),(@EVENT,@OGUID+6),(@EVENT,@OGUID+7),
(@EVENT,@OGUID+8),(@EVENT,@OGUID+9),(@EVENT,@OGUID+10),(@EVENT,@OGUID+11),
(@EVENT,@OGUID+12),(@EVENT,@OGUID+13),(@EVENT,@OGUID+14),(@EVENT,@OGUID+15),
(@EVENT,@OGUID+16),(@EVENT,@OGUID+17),(@EVENT,@OGUID+18),(@EVENT,@OGUID+19),
(@EVENT,@OGUID+20);

SET @CGUID :=74960;
SET @OGUID :=21104;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+12;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `MovementType`) VALUES
(@CGUID+0 , 24545, 530, 1, 1, -1882.759, 5575.42, -12.3448, 4.677482, 120, 0, 0), -- Thunderbrew "Apprentice" (Area: Shattrath City)
(@CGUID+1 , 24484, 530, 1, 1, -1872.835, 5560.321, -12.3448, 2.748216, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43910 - Brewfest Reveler - Gnome)
(@CGUID+2 , 24484, 530, 1, 1, -1878.838, 5562.812, -12.3448, 5.889809, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43909 - Brewfest Reveler - Dwarf)
(@CGUID+3 , 24484, 530, 1, 1, -1878.618, 5556.088, -12.3448, 3.259485, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43910 - Brewfest Reveler - Gnome)
(@CGUID+4 , 24484, 530, 1, 1, -1897.398, 5558.127, -12.3448, 1.710423, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 44004 - Brewfest Reveler - Goblin - Female)
(@CGUID+5 , 24484, 530, 1, 1, -1899.819, 5560.333, -12.3448, 0.3665192, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 44003 - Brewfest Reveler - Goblin - Male)
(@CGUID+6 , 24484, 530, 1, 1, -1921.889, 5554.328, -12.34481, 0.04066804, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43916 - Brewfest Reveler - Troll)
(@CGUID+7 , 24484, 530, 1, 1, -1916.578, 5551.592, -12.34481, 2.666002, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43917 - Brewfest Reveler - Undead)
(@CGUID+8 , 24484, 530, 1, 1, -1924.595, 5549.645, -12.3448, 1.046868, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 43914 - Brewfest Reveler - Orc)
(@CGUID+9 , 24484, 530, 1, 1, -1897.494, 5562.316, -12.3448, 4.433136, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 44003 - Brewfest Reveler - Goblin - Male)
(@CGUID+10, 24501, 530, 1, 1, -1926.787, 5562.968, -12.3448, 5.061455, 120, 0, 0), -- Drohn's Distillery Apprentice (Area: Shattrath City)
(@CGUID+11, 24484, 530, 1, 1, -1895.234, 5560.195, -12.34481, 2.80998, 120, 0, 0), -- Brewfest Reveler (Area: Shattrath City) (Auras: 44003 - Brewfest Reveler - Goblin - Male)
(@CGUID+12, 23511, 530, 1, 1, -1906.297, 5569.852, -12.3448, 4.974188, 120, 0, 0); -- Gordok Brew Apprentice (Area: Shattrath City)

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+12;
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(@CGUID+1 , 0, 0x0, 0x101, '43910'), -- Brewfest Reveler - 43910 - Brewfest Reveler - Gnome
(@CGUID+2 , 0, 0x0, 0x101, '43909'), -- Brewfest Reveler - 43909 - Brewfest Reveler - Dwarf
(@CGUID+3 , 0, 0x0, 0x101, '43910'), -- Brewfest Reveler - 43910 - Brewfest Reveler - Gnome
(@CGUID+4 , 0, 0x0, 0x101, '44004'), -- Brewfest Reveler - 44004 - Brewfest Reveler - Goblin - Female
(@CGUID+5 , 0, 0x0, 0x101, '44003'), -- Brewfest Reveler - 44003 - Brewfest Reveler - Goblin - Male
(@CGUID+6 , 0, 0x0, 0x101, '43916'), -- Brewfest Reveler - 43916 - Brewfest Reveler - Troll
(@CGUID+7 , 0, 0x0, 0x101, '43917'), -- Brewfest Reveler - 43917 - Brewfest Reveler - Undead
(@CGUID+8 , 0, 0x0, 0x101, '43914'), -- Brewfest Reveler - 43914 - Brewfest Reveler - Orc
(@CGUID+9 , 0, 0x0, 0x101, '44003'), -- Brewfest Reveler - 44003 - Brewfest Reveler - Goblin - Male
(@CGUID+11, 0, 0x0, 0x101, '44003'); -- Brewfest Reveler - 44003 - Brewfest Reveler - Goblin - Male

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+8;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 186259, 530, 1, 1, -1875.389, 5579.114, -12.42814, 1.605702, 0, 0, 0, 1, 120, 255, 1), -- Thunderbrew Festive Wagon (Area: Shattrath City)
(@OGUID+1, 180037, 530, 1, 1, -1909.218, 5569.716, -12.42814, 4.97419, 0, 0, 0, 1, 120, 255, 1), -- Haybail 01 (Area: Shattrath City)
(@OGUID+2, 180037, 530, 1, 1, -1906.963, 5573.009, -12.42814, 3.47321, 0, 0, 0, 1, 120, 255, 1), -- Haybail 01 (Area: Shattrath City)
(@OGUID+3, 178666, 530, 1, 1, -1882.575, 5582.089, -12.42814, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- Gypsy Wagon (Area: Shattrath City)
(@OGUID+4, 178666, 530, 1, 1, -1928.171, 5567.508, -12.42814, 3.38594, 0, 0, 0, 1, 120, 255, 1), -- Gypsy Wagon (Area: Shattrath City)
(@OGUID+5, 186255, 530, 1, 1, -1920.9, 5568.442, -12.42814, 1.884953, 0, 0, 0, 1, 120, 255, 1), -- Drohn's Distillery Festive Wagon (Area: Shattrath City)
(@OGUID+6, 186257, 530, 1, 1, -1900.552, 5575.883, -12.42814, 1.937312, 0, 0, 0, 1, 120, 255, 1), -- Gordok Festive Wagon (Area: Shattrath City)
(@OGUID+7, 180037, 530, 1, 1, -1893.456, 5576.866, -12.42814, 4.223697, 0, 0, 0, 1, 120, 255, 1), -- Haybail 01 (Area: Shattrath City)
(@OGUID+8, 180037, 530, 1, 1, -1904.326, 5571.048, -12.42814, 1.902409, 0, 0, 0, 1, 120, 255, 1); -- Haybail 01 (Area: Shattrath City)

DELETE FROM `game_event_creature` WHERE `eventEntry`=24 AND `guid` BETWEEN @CGUID+0 AND @CGUID+12;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(24, @CGUID+0),
(24, @CGUID+1),
(24, @CGUID+2),
(24, @CGUID+3),
(24, @CGUID+4),
(24, @CGUID+5),
(24, @CGUID+6),
(24, @CGUID+7),
(24, @CGUID+8),
(24, @CGUID+9),
(24, @CGUID+10),
(24, @CGUID+11),
(24, @CGUID+12);

DELETE FROM `game_event_gameobject` WHERE `eventEntry`=24 AND `guid` BETWEEN @OGUID+0 AND @OGUID+8;
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(24, @OGUID+0),
(24, @OGUID+1),
(24, @OGUID+2),
(24, @OGUID+3),
(24, @OGUID+4),
(24, @OGUID+5),
(24, @OGUID+6),
(24, @OGUID+7),
(24, @OGUID+8);

--
-- END UPDATING QUERIES
--
UPDATE version_db_world SET date = '2021_10_08_10' WHERE sql_rev = '1633450793115028200';
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
