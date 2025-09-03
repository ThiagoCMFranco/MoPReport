--Translator Thiago Franco
--if GetLocale() ~= "enUS" then return end
local _, qcc = ...
qcc.L_Units = {}
local L_Units = qcc.L_Units

--World Bosses

L_Units["World_Bosses_Names_Ordos"] = "Ordos Fire-God of the Yaungol"
L_Units["World_Bosses_Names_Sha"] = "Sha of Anger"
L_Units["World_Bosses_Names_Oondasta"] = "Oondasta"
L_Units["World_Bosses_Names_Gaileon"] = "Salyis's Warband"
L_Units["World_Bosses_Names_Nalak"] = "Nalak The Storm Lord"
L_Units["World_Bosses_Names_Celestials"] = "The Celestials"

-- Order

L_Units["Cloud_Serpent_Jenova_Longeye"] = "Jenova Longeye"
L_Units["Cloud_Serpent_Elder_Anli"] = "Elder Anli"
L_Units["Cloud_Serpent_Instructor_Skythorn"] = "Instructor Skythorn"
L_Units["Cloud_Serpent_"] = nil  --Necessita dividir em referências individuais para cada NPC.
L_Units["Cloud_Serpent_Hatchling_Serpent"] = "Your Hatchling | Your Cloud Serpent"
L_Units["Cloud_Serpent_Ningna_Darkwheel"] = "Ningna Darkwheel"
L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"] = "Qua-Ro Whitebrow"
L_Units["Cloud_Serpent_Suchi_the_Sweet"] = "Suchi the Sweet"
L_Units["Cloud_Serpent_Big_Bao"] = "Big Bao"


--Shado-Pan

L_Units["Shado_Pan_Ban_Bearheart"] = "Ban Bearheart"
L_Units["Shado_Pan_Ling_of_the_Six_Pools"] = "Ling of the Six Pools"
L_Units["Shado_Pan_Master_Snowdrift"] = "Mestre Monte de Neve"

--The Klaxxi

L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"] = "Kil'ruk the Wind-Reaver"
L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"] = "Kaz'tik the Manipulator"
L_Units["The_Klaxxi_Korven_the_Prime"] = "Korven the Prime"
L_Units["The_Klaxxi_Rik'kal_the_Dissector"] = "Rik'kal the Dissector"
L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"] = "Xaril the Poisoned Mind"
L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"] = "Hisek the Swarmkeeper"
L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"] = "Ashes of Warlord Gurthan"
L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"] = "Enormous Kunchong Mandibles"
L_Units["The_Klaxxi_Massive_Kyparite_Core"] = "Massive Kyparite Core"

-- The Tillers

L_Units["The_Tillers_Farmer_Yoon"] = "Farmer Yoon"
L_Units["The_Tillers_Andi"] = "Andi"
L_Units["The_Tillers_Visitor"] = "Visitor" --Necessita dividir em referências individuais para cada NPC.

-- The Anglers
L_Units["The_Tillers_"] = "" --Necessita dividir em referências individuais para cada NPC.

-- Celestials

L_Units["The_August_Celestials_Thelonius"] = "Thelonius"
L_Units["The_August_Celestials_Kuo-Na_Quillpaw"] = "Kuo-Na Quillpaw"
L_Units["The_August_Celestials_Yan_Quillpaw"] = "Yan Quillpaw"
L_Units["The_August_Celestials_Ogo_the_Elder"] = "Ogo the Elder"
L_Units["The_August_Celestials_Ogo_the_Youger"] = "Ogo the Youger"
L_Units["The_August_Celestials_High_Adept_Paosha"] = "High Adept Paosha"
L_Units["The_August_Celestials_Yak-Keeper_Kyana"] = "Yak-Keeper Kyana"
L_Units["The_August_Celestials_Sentinel_Commander_Qipan"] = " Sentinel Commander Qipan"
L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"] = "Elder Sage Tai-Feng"

L_Units["The_August_Celestials_Sage_Whiteheart"] = "Sage Whiteheart"
L_Units["The_August_Celestials_Sage_Lotusbloom"] = "Sage Lotusbloom"
L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"] = "Elder Sage Storm-Sing"
L_Units["The_August_Celestials_Xuen"] = "Xuen"
L_Units["The_August_Celestials_Lin_Tenderpaw"] = "Lin Tenderpaw"

-- Operation: Shieldwall

L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"] = "Sully 'The Pickle' McLeary"
L_Units["Operation_Shieldwall_Hilda_Hornswaggle"] = "Hilda Hornswaggle"
L_Units["Operation_Shieldwall_Marshal_Troteman"] = "Marshal Troteman"
L_Units["Operation_Shieldwall_Mishka"] = "Mishka"
L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"] = "Sky Admiral Rogers"
L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"] = "Seraphine of the Winter"
L_Units["Operation_Shieldwall_Amber_Kearnen"] = "Amber Kearnen"
L_Units["Operation_Shieldwall_Tinkmaster_Overspark"] = "Tinkmaster Overspark"
L_Units["Operation_Shieldwall_Huntsman_Blake"] = "Huntsman Blake"

-- Dominance Offensive

L_Units["Dominance_Offensive_Jorn_Skyseer"] = "Jorn Skyseer"
L_Units["Dominance_Offensive_Grizzle_Gearslip"] = "Grizzle Gearslip"
L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"] = "Daxil 'The Gem' Oregrind"
L_Units["Dominance_Offensive_Boss-Lady_Trixel"] = "Boss-Lady Trixel"
L_Units["Dominance_Offensive_Bounty_Board"] = "Bounty Board"
L_Units["Dominance_Offensive_Bixy_Buzzsaw"] = "Bixy Buzzsaw"
L_Units["Dominance_Offensive_Duke"] = "Duke"
L_Units["Dominance_Offensive_Rivett_Clutchpop"] = "Rivett Clutchpop"
L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"] = "Zino 'The Shredder' Quickchop"
L_Units["Dominance_Offensive_Kaelis_Sunsoar"] = "Kaelis Sunsoar"
L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"] = "Blood Guard Gro'tash"
L_Units["Dominance_Offensive_Brolic"] = "Brolic"
L_Units["Dominance_Offensive_Shokia"] = "Shokia"
L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"] = "Zazzix 'Toasty' Sparkrocket"
L_Units["Dominance_Offensive_Shademaster_Kiryn"] = "Shademaster Kiryn"

L_Units["Kirin_Tor_Offensive"] = nil
L_Units["Sunreaver_Onslaught_"] = nil
L_Units["Golden_Lotus_"] = nil

L_Units["Empty_Crate"] = "Empty Crate"
L_Units["Work_Order"] = "Work Order"