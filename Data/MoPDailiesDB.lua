--------------------------------------------------------------------------------
--[[ Mists of Pandaria Report ]]--
--
-- by ThiagoCMFranco <https://github.com/ThiagoCMFranco>
--
--Copyright (C) 2025  Thiago de C. M. Franco
--
--This program is free software: you can redistribute it and/or modify
--it under the terms of the GNU General Public License as published by
--the Free Software Foundation, either version 3 of the License, or
--(at your option) any later version.
--
--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--GNU General Public License for more details.
--
--You should have received a copy of the GNU General Public License
--along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
--------------------------------------------------------------------------------

local name, qcc = ...
local L = qcc.L 
local L_Factions = qcc.L_Factions
local L_Units = qcc.L_Units
local L_Quests = qcc.L_Quests
local L_Categories = qcc.L_Categories

C_CATEGORY_ICONS = {
    [L_Categories["Category_Cook"]] = {icon = "worldquest-icon-cooking", tooltip = L_Categories["Category_Cook"]},
    [L_Categories["Category_Arch"]] = {icon = "worldquest-icon-archaeology", tooltip = L_Categories["Category_Arch"]},
    [L_Categories["Category_FAid"]] = {icon = "worldquest-icon-firstaid", tooltip = L_Categories["Category_FAid"]},
    [L_Categories["Category_Fish"]] = {icon = "worldquest-icon-fishing", tooltip = L_Categories["Category_Fish"]},
    [L_Categories["Category_Race"]] = {icon = "racing", tooltip = L_Categories["Category_Race"]},
    [L_Categories["Category_PvP"]] = {icon = "BattleMaster", tooltip = L_Categories["Category_PvP_Tooltip"]},
    [L_Categories["Category_Drop"]] = {icon = "DungeonSkull", tooltip = L_Categories["Category_Drop_Tooltip"]},
    [L_Categories["Category_Shop"]] = {icon = "Banker", tooltip = L_Categories["Category_Shop_Tooltip"]},
    [L_Categories["Category_Auto"]] = {icon = "mechagon-projects", tooltip = L_Categories["Category_Auto_Tooltip"]},  
}

C_RESTRICTED_FACTION_QUESTS = {

    --Celestials Quartermaster : Sage Whiteheart

    [31376] = "Alliance",
    [31378] = "Alliance",
    [31382] = "Alliance",
    [31380] = "Alliance",

    --Celestials Quartermaster : Sage Lotusbloom

    [31377] = "Horde",
    [31379] = "Horde",
    [31383] = "Horde",
    [31381] = "Horde",

    -- Operation: Shieldwall - Work Orders

    [32645] = "Alliance",
    [32646] = "Alliance",

    -- Dominance Offensive - Work Orders

    [32642] = "Horde",
    [32643] = "Horde",

    --Kirin Tor Offensive

    [32567] = "Alliance",
    
    [32551] = "Alliance",
    [32554] = "Alliance",
    [32553] = "Alliance",
    [32552] = "Alliance",
    [32550] = "Alliance",
    
    [32568] = "Alliance",
    
    [32558] = "Alliance",
    [32555] = "Alliance",
    [32559] = "Alliance",
    [32560] = "Alliance",
    [32557] = "Alliance",
    [32556] = "Alliance",
    
    [32731] = "Alliance",
    [32525] = "Alliance",
    [32527] = "Alliance",
    [32528] = "Alliance",
    [32532] = "Alliance",
    [32526] = "Alliance",
    [32533] = "Alliance",
    [32530] = "Alliance",
    [32529] = "Alliance",
    [32531] = "Alliance",
    
    [32634] = "Alliance",
    [32636] = "Alliance",
    [32639] = "Alliance",
    [32632] = "Alliance",
    [32638] = "Alliance",
    [32301] = "Alliance",
    [32637] = "Alliance",
    [32633] = "Alliance",
    [32628] = "Alliance",
    
    [32571] = "Alliance",
    [32573] = "Alliance",
    [32574] = "Alliance",
    [32572] = "Alliance",
    [32575] = "Alliance",
    
    [32586] = "Alliance",
    [32588] = "Alliance",
    
    [32732] = "Alliance",
    [32537] = "Alliance",
    [32546] = "Alliance",
    [32548] = "Alliance",
    [32536] = "Alliance",
    [32606] = "Alliance",
    [32547] = "Alliance",
    [32545] = "Alliance",
    [32535] = "Alliance",
    
    [32485] = "Alliance",
    [32627] = "Alliance",
    
    [32733] = "Alliance",
    [32543] = "Alliance",
    [32539] = "Alliance",
    [32540] = "Alliance",
    [32538] = "Alliance",
    [32541] = "Alliance",
    [32544] = "Alliance",
    [32542] = "Alliance",
    
    [32578] = "Alliance",
    
    [32579] = "Alliance",
    
    [32580] = "Alliance",
    
    [32607] = "Alliance",
    [32724] = "Alliance",
    
    [32581] = "Alliance",
    
    [32608] = "Alliance",
    [32582] = "Alliance",
    [32583] = "Alliance",
        

    --Sunreaver Onslaught

    [32523] = "Horde",
    
    [32282] = "Horde",
    [32298] = "Horde",
    [32297] = "Horde",
    [32283] = "Horde",
    [32207] = "Horde",
    
    [32524] = "Horde",
    
    [32234] = "Horde",
    [32494] = "Horde",
    [32493] = "Horde",
    [32206] = "Horde",
    [32233] = "Horde",
    [32232] = "Horde",
    
    [32728] = "Horde",
    [32218] = "Horde",
    [32201] = "Horde",
    [32226] = "Horde",
    [32224] = "Horde",
    [32220] = "Horde",
    [32219] = "Horde",
    [32495] = "Horde",
    [32225] = "Horde",
    [32517] = "Horde",
    
    [32288] = "Horde",
    [32265] = "Horde",
    [32300] = "Horde",
    
    [32506] = "Horde",
    [32287] = "Horde",
    [32285] = "Horde",
    [32228] = "Horde",
    [32230] = "Horde",
    
    [32208] = "Horde",
    [32209] = "Horde",
    
    [32730] = "Horde",
    [32255] = "Horde",
    [32299] = "Horde",
    [32491] = "Horde",
    [32254] = "Horde",
    [32605] = "Horde",
    [32489] = "Horde",
    [32274] = "Horde",
    [32204] = "Horde",
    
    [32269] = "Horde",
    [32262] = "Horde",
    [32302] = "Horde",
    [32303] = "Horde",
    [32266] = "Horde",
    [32213] = "Horde",
    [32305] = "Horde",
    [32264] = "Horde",
    [32268] = "Horde",
    
    [32729] = "Horde",
    [32200] = "Horde",
    [32217] = "Horde",
    [32252] = "Horde",
    [32215] = "Horde",
    [32227] = "Horde",
    [32216] = "Horde",
    [32275] = "Horde",
    
    [32293] = "Horde",
    
    [32520] = "Horde",
    
    [32521] = "Horde",
    
    [32676] = "Horde",
    [32722] = "Horde",
    
    [32522] = "Horde",
    
    [32677] = "Horde",
    [32294] = "Horde",
    [32564] = "Horde",

    --Operation: Shieldwall

    [32154] = "Alliance",
    [32159] = "Alliance",
    [32446] = "Alliance",
    [32156] = "Alliance",
    [32155] = "Alliance",
    [32157] = "Alliance",
    [32158] = "Alliance",
    [32433] = "Alliance",

    [32451] = "Alliance",
    [32143] = "Alliance",
    [32145] = "Alliance",
    [32146] = "Alliance",
    [32144] = "Alliance",
    [32142] = "Alliance",

    [32148] = "Alliance",
    [32153] = "Alliance",
    [32149] = "Alliance",
    [32152] = "Alliance",
    [32150] = "Alliance",

    [32116] = "Alliance",
    [32347] = "Alliance",
    [32119] = "Alliance",
    [32122] = "Alliance",
    [32346] = "Alliance",
    [32115] = "Alliance",
    [32121] = "Alliance",

    [32166] = "Alliance",
    [32186] = "Alliance",
    [32172] = "Alliance",

    [32164] = "Alliance",
    [32184] = "Alliance",
    [32170] = "Alliance",

    [32165] = "Alliance",
    [32185] = "Alliance",
    [32171] = "Alliance",

    --Dominance Offensive
    
    [32199] = "Horde",
    [32221] = "Horde",
    [32223] = "Horde",
    [32214] = "Horde",
    [32197] = "Horde",
    [32222] = "Horde",
    [32136] = "Horde",
    [32237] = "Horde",
    [32137] = "Horde",
    [32140] = "Horde",
    [32236] = "Horde",
    [32141] = "Horde",
    [32138] = "Horde",
    [32139] = "Horde",
    [32238] = "Horde",

    [32127] = "Horde",
    [32128] = "Horde",
    [32123] = "Horde",
    [32235] = "Horde",
    [32126] = "Horde",

    [32450] = "Horde",
    [32130] = "Horde",
    [32135] = "Horde",
    [32133] = "Horde",
    [32131] = "Horde",
    [32132] = "Horde",

    [32449] = "Horde",
    [32344] = "Horde",
    [32348] = "Horde",
    [32120] = "Horde",
    [32343] = "Horde",
    [32342] = "Horde",

    [32163] = "Horde",
    [32183] = "Horde",
    [32169] = "Horde",

    [32161] = "Horde",
    [32181] = "Horde",
    [32167] = "Horde",

    [32162] = "Horde",
    [32182] = "Horde",
    [32168] = "Horde",
    
}

--use: C_INTERFACE_TEXTURES[MoPReport_Game_Flavor]["questIcon"]
C_INTERFACE_TEXTURES = {
    ["Classic"] = {
        ["questIcon"] = "QuestDaily", --QuestRepeatableTurnin
        ["trackIcon"] = "Target-Tracker", --PlayerFriend
        ["detailsBackground"] = "tradeskill-background-recipe",
        ["friendDetail"] = "minortalents-icon-book",
        ["workOrders"] = "poi-workorders",
    },
    ["Retail"] = {
        ["questIcon"] = "Recurringavailablequesticon",
        ["trackIcon"] = "crosshair_track_32",
        ["detailsBackground"] = "Professions-Recipe-Background",
        ["friendDetail"] = "minortalents-icon-book",
        ["workOrders"] = "poi-workorders",
    },
}

C_NPC_COORDINATES = {
    [L_Units["World_Bosses_Names_Ordos"]] = {uiMapID = 554, position = {x = 0.549, y = 0.182}, name = L_Units["World_Bosses_Names_Ordos"]},
    [L_Units["World_Bosses_Names_Sha"]] = {uiMapID = 379, position = {x = 0.545, y = 0.632}, name = L_Units["World_Bosses_Names_Sha"]},
    [L_Units["World_Bosses_Names_Oondasta"]] = {uiMapID = 507, position = {x = 0.499, y = 0.540}, name = L_Units["World_Bosses_Names_Oondasta"]},
    [L_Units["World_Bosses_Names_Gaileon"]] = {uiMapID = 376, position = {x = 0.716, y = 0.644}, name = L_Units["World_Bosses_Names_Gaileon"]},
    [L_Units["World_Bosses_Names_Nalak"]] = {uiMapID = 504, position = {x = 0.605, y = 0.373}, name = L_Units["World_Bosses_Names_Nalak"]},
    [L_Units["World_Bosses_Names_Celestials"]] = {uiMapID = 554, position = {x = 0.390, y = 0.550}, name = L_Units["World_Bosses_Names_Celestials"]},

    [L_Units["Shado_Pan_Ban_Bearheart"]] = {uiMapID = 388, position = {x = 0.490, y = 0.705}, name = L_Units["Shado_Pan_Ban_Bearheart"]},
    [L_Units["Shado_Pan_Ling_of_the_Six_Pools"]] = {uiMapID = 388, position = {x = 0.490, y = 0.712}, name = L_Units["Shado_Pan_Ling_of_the_Six_Pools"]},
    [L_Units["Shado_Pan_Master_Snowdrift"]] = {uiMapID = 388, position = {x = 0.490, y = 0.706}, name = L_Units["Shado_Pan_Master_Snowdrift"]},
    
    [L_Units["Cloud_Serpent_Jenova_Longeye"]] = {uiMapID = 448, position = {x = 0.572, y = 0.456}, name = L_Units["Cloud_Serpent_Jenova_Longeye"]},
    [L_Units["Cloud_Serpent_Elder_Anli"]] = {uiMapID = 448, position = {x = 0.576, y = 0.450}, name = L_Units["Cloud_Serpent_Elder_Anli"]},
    [L_Units["Cloud_Serpent_Instructor_Skythorn"]] = {uiMapID = 448, position = {x = 0.576, y = 0.451}, name = L_Units["Cloud_Serpent_Instructor_Skythorn"]},
    [L_Units["Cloud_Serpent_Hatchling_Serpent"]] = {uiMapID = 448, position = {x = 0.574, y = 0.452}, name = L_Units["Cloud_Serpent_Hatchling_Serpent"]},
    [L_Units["Cloud_Serpent_Ningna_Darkwheel"]] = {uiMapID = 448, position = {x = 0.582, y = 0.450}, name = L_Units["Cloud_Serpent_Ningna_Darkwheel"]},
    [L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"]] = {uiMapID = 448, position = {x = 0.572, y = 0.463}, name = L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"]},
    [L_Units["Cloud_Serpent_Suchi_the_Sweet"]] = {uiMapID = 448, position = {x = 0.584, y = 0.446}, name = L_Units["Cloud_Serpent_Suchi_the_Sweet"]},
    [L_Units["Cloud_Serpent_Big_Bao"]] = {uiMapID = 448, position = {x = 0.574, y = 0.440}, name = L_Units["Cloud_Serpent_Big_Bao"]},
    
    [L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"]] = {uiMapID = 422, position = {x = 0.542, y = 0.358}, name = L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"]},
    [L_Units["The_Klaxxi_Rik'kal_the_Dissector"]] = {uiMapID = 422, position = {x = 0.544, y = 0.358}, name = L_Units["The_Klaxxi_Rik'kal_the_Dissector"]},
    [L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"]] = {uiMapID = 422, position = {x = 0.548, y = 0.360}, name = L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"]},
    [L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"]] = {uiMapID = 422, position = {x = 0.550, y = 0.358}, name = L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"]},
    [L_Units["The_Klaxxi_Korven_the_Prime"]] = {uiMapID = 422, position = {x = 0.544, y = 0.360}, name = L_Units["The_Klaxxi_Korven_the_Prime"]},
    [L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"]] = {uiMapID = 422, position = {x = 0.548, y = 0.361}, name = L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"]},
    [L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"]] = {uiMapID = 422, position = {x = 0.662, y = 0.318}, name = L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"]},
    [L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"]] = {uiMapID = 422, position = {x = 0.415, y = 0.340}, name = L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"]},
    [L_Units["The_Klaxxi_Massive_Kyparite_Core"]] = {uiMapID = 422, position = {x = 0.318, y = 0.578}, name = L_Units["The_Klaxxi_Massive_Kyparite_Core"]},
    
    [L_Units["Empty_Crate"]] = {uiMapID = 376, position = {x = 0.517, y = 0.487}, name = L_Units["Empty_Crate"]},
    [L_Units["Work_Order"]] = {uiMapID = 376, position = {x = 0.524, y = 0.663}, name = L_Units["Work_Order"]},
    
    [L_Units["The_Tillers_Farmer_Yoon"]] = {uiMapID = 376, position = {x = 0.520, y = 0.480}, name = L_Units["The_Tillers_Farmer_Yoon"]},
    [L_Units["The_Tillers_Andi"]] = {uiMapID = 376, position = {x = 0.528, y = 0.506}, name = L_Units["The_Tillers_Andi"]},
    [L_Units["The_Tillers_Visitor"]] = {uiMapID = 376, position = {x = 0.530, y = 0.520}, name = L_Units["The_Tillers_Visitor"]},

    [L_Units["The_August_Celestials_Thelonius"]] = {uiMapID = 418, position = {x = 0.312, y = 0.634}, name = L_Units["The_August_Celestials_Thelonius"]},
    [L_Units["The_August_Celestials_Kuo-Na_Quillpaw"]] = {uiMapID = 418, position = {x = 0.312, y = 0.636}, name = L_Units["The_August_Celestials_Kuo-Na_Quillpaw"]},
    [L_Units["The_August_Celestials_Yan_Quillpaw"]] = {uiMapID = 418, position = {x = 0.314, y = 0.636}, name = L_Units["The_August_Celestials_Yan_Quillpaw"]},
    [L_Units["The_August_Celestials_Ogo_the_Elder"]] = {uiMapID = 388, position = {x = 0.392, y = 0.6220}, name = L_Units["The_August_Celestials_Ogo_the_Elder"]},
    [L_Units["The_August_Celestials_Ogo_the_Youger"]] = {uiMapID = 388, position = {x = 0.392, y = 0.6221}, name = L_Units["The_August_Celestials_Ogo_the_Youger"]},
    [L_Units["The_August_Celestials_High_Adept_Paosha"]] = {uiMapID = 388, position = {x = 0.390, y = 0.626}, name = L_Units["The_August_Celestials_High_Adept_Paosha"]},
    [L_Units["The_August_Celestials_Yak-Keeper_Kyana"]] = {uiMapID = 388, position = {x = 0.392, y = 0.620}, name = L_Units["The_August_Celestials_Yak-Keeper_Kyana"]},
    [L_Units["The_August_Celestials_Sentinel_Commander_Qipan"]] = {uiMapID = 388, position = {x = 0.394, y = 0.620}, name = L_Units["The_August_Celestials_Sentinel_Commander_Qipan"]},
    [L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"]] = {uiMapID = 371, position = {x = 0.538, y = 0.618}, name = L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"]},
    [L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"]] = {uiMapID = 371, position = {x = 0.538, y = 0.618}, name = L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"]},
    [L_Units["The_August_Celestials_Sage_Whiteheart"]] = {uiMapID = 390, position = {x = 0.846, y = 0.636}, name = L_Units["The_August_Celestials_Sage_Whiteheart"]},
    [L_Units["The_August_Celestials_Sage_Lotusbloom"]] = {uiMapID = 390, position = {x = 0.626, y = 0.232}, name = L_Units["The_August_Celestials_Sage_Lotusbloom"]},
    [L_Units["The_August_Celestials_Xuen"]] = {uiMapID = 379, position = {x = 0.686, y = 0.444}, name = L_Units["The_August_Celestials_Xuen"]},
    [L_Units["The_August_Celestials_Lin_Tenderpaw"]] = {uiMapID = 379, position = {x = 0.686, y = 0.564}, name = L_Units["The_August_Celestials_Lin_Tenderpaw"]},

    [L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"]] = {uiMapID = 418, position = {x = 0.168, y = 0.786}, name = L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"]},
    [L_Units["Operation_Shieldwall_Hilda_Hornswaggle"]] = {uiMapID = 418, position = {x = 0.852, y = 0.290}, name = L_Units["Operation_Shieldwall_Hilda_Hornswaggle"]},
    [L_Units["Operation_Shieldwall_Marshal_Troteman"]] = {uiMapID = 418, position = {x = 0.896, y = 0.330}, name = L_Units["Operation_Shieldwall_Marshal_Troteman"]},
    [L_Units["Operation_Shieldwall_Mishka"]] = {uiMapID = 418, position = {x = 0.895, y = 0.335}, name = L_Units["Operation_Shieldwall_Mishka"]},
    [L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"]] = {uiMapID = 418, position = {x = 0.166, y = 0.792}, name = L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"]},
    [L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"]] = {uiMapID = 418, position = {x = 0.194, y = 0.622}, name = L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"]},
    [L_Units["Operation_Shieldwall_Amber_Kearnen"]] = {uiMapID = 418, position = {x = 0.898, y = 0.324}, name = L_Units["Operation_Shieldwall_Amber_Kearnen"]},
    [L_Units["Operation_Shieldwall_Tinkmaster_Overspark"]] = {uiMapID = 418, position = {x = 0.166, y = 0.796}, name = L_Units["Operation_Shieldwall_Tinkmaster_Overspark"]},
    [L_Units["Operation_Shieldwall_Huntsman_Blake"]] = {uiMapID = 418, position = {x = 0.842, y = 0.188}, name = L_Units["Operation_Shieldwall_Huntsman_Blake"]},
    
    [L_Units["Dominance_Offensive_Jorn_Skyseer"]] = {uiMapID = 418, position = {x = 0.126, y = 0.626}, name = L_Units["Dominance_Offensive_Jorn_Skyseer"]},
    [L_Units["Dominance_Offensive_Grizzle_Gearslip"]] = {uiMapID = 418, position = {x = 0.256, y = 0.640}, name = L_Units["Dominance_Offensive_Grizzle_Gearslip"]},
    [L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"]] = {uiMapID = 418, position = {x = 0.226, y = 0.622}, name = L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"]},
    [L_Units["Dominance_Offensive_Boss-Lady_Trixel"]] = {uiMapID = 418, position = {x = 0.136, y = 0.558}, name = L_Units["Dominance_Offensive_Boss-Lady_Trixel"]},
    [L_Units["Dominance_Offensive_Bounty_Board"]] = {uiMapID = 418, position = {x = 0.118, y = 0.545}, name = L_Units["Dominance_Offensive_Bounty_Board"]},
    [L_Units["Dominance_Offensive_Bixy_Buzzsaw"]] = {uiMapID = 418, position = {x = 0.252, y = 0.604}, name = L_Units["Dominance_Offensive_Bixy_Buzzsaw"]},
    [L_Units["Dominance_Offensive_Duke"]] = {uiMapID = 418, position = {x = 0.136, y = 0.558}, name = L_Units["Dominance_Offensive_Duke"]},
    [L_Units["Dominance_Offensive_Rivett_Clutchpop"]] = {uiMapID = 418, position = {x = 0.130, y = 0.562}, name = L_Units["Dominance_Offensive_Rivett_Clutchpop"]},
    [L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"]] = {uiMapID = 418, position = {x = 0.206, y = 0.580}, name = L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"]},
    [L_Units["Dominance_Offensive_Kaelis_Sunsoar"]] = {uiMapID = 418, position = {x = 0.816, y = 0.182}, name = L_Units["Dominance_Offensive_Kaelis_Sunsoar"]},
    [L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"]] = {uiMapID = 418, position = {x = 0.100, y = 0.538}, name = L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"]},
    [L_Units["Dominance_Offensive_Brolic"]] = {uiMapID = 418, position = {x = 0.106, y = 0.536}, name = L_Units["Dominance_Offensive_Brolic"]},
    [L_Units["Dominance_Offensive_Shokia"]] = {uiMapID = 418, position = {x = 0.102, y = 0.556}, name = L_Units["Dominance_Offensive_Shokia"]},
    [L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"]] = {uiMapID = 418, position = {x = 0.758, y = 0.342}, name = L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"]},
    [L_Units["Dominance_Offensive_Shademaster_Kiryn"]] = {uiMapID = 418, position = {x = 0.758, y = 0.344}, name = L_Units["Dominance_Offensive_Shademaster_Kiryn"]},

    [L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"]] = {uiMapID = 390, position = {x = 0.566, y = 0.435}, name = L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"]}, -- Need to update location
    [L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"]] = {uiMapID = 390, position = {x = 0.566, y = 0.434}, name = L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"]},
    [L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"]] = {uiMapID = 390, position = {x = 0.564, y = 0.436}, name = L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"]},
    [L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"]] = {uiMapID = 390, position = {x = 0.566, y = 0.437}, name = L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"]}, -- Need to update location
    [L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"]] = {uiMapID = 390, position = {x = 0.566, y = 0.436}, name = L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"]},
    [L_Units["Golden_Lotus_Golden_Pagoda_He_Softfoot"]] = {uiMapID = 390, position = {x = 0.566, y = 0.438}, name = L_Units["Golden_Lotus_Golden_Pagoda_He_Softfoot"]}, -- Need to update location

    [L_Units["Golden_Lotus_Mistfall_Village_Sun_Tenderheart"]] = {uiMapID = 390, position = {x = 0.352, y = 0.752}, name = L_Units["Golden_Lotus_Mistfall_Village_Sun_Tenderheart"]},
    [L_Units["Golden_Lotus_Mistfall_Village_Merchant_Benny"]] = {uiMapID = 390, position = {x = 0.338, y = 0.698}, name = L_Units["Golden_Lotus_Mistfall_Village_Merchant_Benny"]},
    [L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"]] = {uiMapID = 390, position = {x = 0.338, y = 0.722}, name = L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"]},
    [L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"]] = {uiMapID = 390, position = {x = 0.352, y = 0.750}, name = L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"]},
    [L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"]] = {uiMapID = 390, position = {x = 0.338, y = 0.702}, name = L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"]},
    [L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"]] = {uiMapID = 390, position = {x = 0.352, y = 0.740}, name = L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"]},

    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"]] = {uiMapID = 390, position = {x = 0.338, y = 0.386}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"]},
    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sun_Tenderheart"]] = {uiMapID = 390, position = {x = 0.332, y = 0.390}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sun_Tenderheart"]},
    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"]] = {uiMapID = 390, position = {x = 0.341, y = 0.382}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"]},
    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Kun_Autumnlight"]] = {uiMapID = 390, position = {x = 0.340, y = 0.382}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Kun_Autumnlight"]},
    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Rook_Stonetoe"]] = {uiMapID = 390, position = {x = 0.330, y = 0.380}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Rook_Stonetoe"]},
    [L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sinan_the_Dreamer"]] = {uiMapID = 390, position = {x = 0.336, y = 0.406}, name = L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sinan_the_Dreamer"]},

    [L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"]] = {uiMapID = 390, position = {x = 0.214, y = 0.716}, name = L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"]},
    [L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"]] = {uiMapID = 390, position = {x = 0.215, y = 0.715}, name = L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"]},
    [L_Units["Golden_Lotus_Setting_Sun_Kelari_Featherfoot"]] = {uiMapID = 390, position = {x = 0.182, y = 0.636}, name = L_Units["Golden_Lotus_Setting_Sun_Kelari_Featherfoot"]},
    [L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"]] = {uiMapID = 390, position = {x = 0.186, y = 0.714}, name = L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"]},
    [L_Units["Golden_Lotus_Setting_Sun_Hai-Me_Heavyhands"]] = {uiMapID = 390, position = {x = 0.204, y = 0.736}, name = L_Units["Golden_Lotus_Setting_Sun_Hai-Me_Heavyhands"]},
    
    [L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"]] = {uiMapID = 390, position = {x = 0.424, y = 0.460}, name = L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"]},
    [L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"]] = {uiMapID = 390, position = {x = 0.436, y = 0.462}, name = L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"]},

    [L_Units["Golden_Lotus_Merchant_Tantan"]] = {uiMapID = 390, position = {x = 0.422, y = 0.458}, name = L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"]},

    [L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"]] = {uiMapID = 504, position = {x = 0.632, y = 0.722}, name = L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"]},
    [L_Units["Kirin_Tor_Offensive_Archmage_Modera"]] = {uiMapID = 504, position = {x = 0.556, y = 0.744}, name = L_Units["Kirin_Tor_Offensive_Archmage_Modera"]},
    [L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"]] = {uiMapID = 504, position = {x = 0.402, y = 0.594}, name = L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"]},
    [L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"]] = {uiMapID = 504, position = {x = 0.422, y = 0.664}, name = L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"]},
    [L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"]] = {uiMapID = 504, position = {x = 0.618, y = 0.520}, name = L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"]},
    [L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"]] = {uiMapID = 504, position = {x = 0.618, y = 0.521}, name = L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"]},
    [L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"]] = {uiMapID = 504, position = {x = 0.532, y = 0.722}, name = L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"]},
    [L_Units["Kirin_Tor_Offensive_Danara_Silverglass"]] = {uiMapID = 504, position = {x = 0.402, y = 0.592}, name = L_Units["Kirin_Tor_Offensive_Danara_Silverglass"]},
    [L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"]] = {uiMapID = 504, position = {x = 0.400, y = 0.592}, name = L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"]},
    [L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"]] = {uiMapID = 504, position = {x = 0.526, y = 0.734}, name = L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"]},
    [L_Units["Kirin_Tor_Offensive_Warmage_Yurias"]] = {uiMapID = 504, position = {x = 0.534, y = 0.736}, name = L_Units["Kirin_Tor_Offensive_Warmage_Yurias"]},
    [L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"]] = {uiMapID = 504, position = {x = 0.556, y = 0.745}, name = L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"]},
    [L_Units["Kirin_Tor_Offensive_Lyalia"]] = {uiMapID = 504, position = {x = 0.588, y = 0.744}, name = L_Units["Kirin_Tor_Offensive_Lyalia"]},
    [L_Units["Kirin_Tor_Offensive_Dalvin_Jaacor"]] = {uiMapID = 504, position = {x = 0.422, y = 0.662}, name = L_Units["Kirin_Tor_Offensive_Dalvin_Jaacor"]},
    [L_Units["Kirin_Tor_Offensive_Ako"]] = {uiMapID = 504, position = {x = 0.422, y = 0.665}, name = L_Units["Kirin_Tor_Offensive_Ako"]},
    [L_Units["Kirin_Tor_Offensive_Taoshi"]] = {uiMapID = 504, position = {x = 0.586, y = 0.426}, name = L_Units["Kirin_Tor_Offensive_Taoshi"]},

    [L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"]] = {uiMapID = 504, position = {x = 0.468, y = 0.668}, name = L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"]},
    [L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"]] = {uiMapID = 504, position = {x = 0.384, y = 0.512}, name = L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"]},
    [L_Units["Sunreaver_Onslaught_Lor-themar_Theron"]] = {uiMapID = 504, position = {x = 0.326, y = 0.354}, name = L_Units["Sunreaver_Onslaught_Lor-themar_Theron"]},
    [L_Units["Sunreaver_Onslaught_Halduron_Brightwing"]] = {uiMapID = 504, position = {x = 0.324, y = 0.356}, name = L_Units["Sunreaver_Onslaught_Halduron_Brightwing"]},
    [L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"]] = {uiMapID = 504, position = {x = 0.472, y = 0.405}, name = L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"]},
    [L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"]] = {uiMapID = 504, position = {x = 0.472, y = 0.406}, name = L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"]},
    [L_Units["Sunreaver_Onslaught_Girana_the_Blooded"]] = {uiMapID = 504, position = {x = 0.324, y = 0.352}, name = L_Units["Sunreaver_Onslaught_Girana_the_Blooded"]},
    [L_Units["Sunreaver_Onslaught_Captain_Aerthas_Firehawk"]] = {uiMapID = 504, position = {x = 0.385, y = 0.512}, name = L_Units["Sunreaver_Onslaught_Captain_Aerthas_Firehawk"]},
    [L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"]] = {uiMapID = 504, position = {x = 0.386, y = 0.512}, name = L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"]},
    [L_Units["Sunreaver_Onslaught_Magister_Hathorel"]] = {uiMapID = 504, position = {x = 0.325, y = 0.352}, name = L_Units["Sunreaver_Onslaught_Magister_Hathorel"]},
    [L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"]] = {uiMapID = 504, position = {x = 0.334, y = 0.350}, name = L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"]},
    [L_Units["Sunreaver_Onslaught_Amalia_Penshire"]] = {uiMapID = 504, position = {x = 0.467, y = 0.669}, name = L_Units["Sunreaver_Onslaught_Amalia_Penshire"]},
    [L_Units["Sunreaver_Onslaught_Sunwalker_Dezco"]] = {uiMapID = 504, position = {x = 0.468, y = 0.670}, name = L_Units["Sunreaver_Onslaught_Sunwalker_Dezco"]},
    [L_Units["Sunreaver_Onslaught_Elina_Zaralae"]] = {uiMapID = 504, position = {x = 0.366, y = 0.646}, name = L_Units["Sunreaver_Onslaught_Elina_Zaralae"]},
    [L_Units["Sunreaver_Onslaught_Kethiel_Sunlance"]] = {uiMapID = 504, position = {x = 0.368, y = 0.348}, name = L_Units["Sunreaver_Onslaught_Kethiel_Sunlance"]},
    [L_Units["Sunreaver_Onslaught_Taoshi"]] = {uiMapID = 504, position = {x = 0.586, y = 0.426}, name = L_Units["Sunreaver_Onslaught_Taoshi"]},

}

--key: Faction Id
--data: Faction Id, Faction Name, Faction Level, Faction Type, Faction Allignment, Hide if unknown, Use Details Window
C_MOP_FACTIONS = {

    
    [1376]={1376,L_Factions[1376],60,L["Factions"],"Alliance",false,true,1}, --"Operação: Muralha de Escudos"
    [1242]={1242,L_Factions[1242],60,L["Factions"],"Alliance",false,false,2}, --"Jinyus Barbatana de Pérola"
    [1387]={1387,L_Factions[1387],60,L["Factions"],"Alliance",false,true,3}, --"Ofensiva do Kirin Tor"
    [1375]={1375,L_Factions[1375],60,L["Factions"],"Horde",false,true,4}, --"Dominance Offensive"
    [1228]={1228,L_Factions[1228],60,L["Factions"],"Horde",false,false,5}, --"Hozens da Floresta"
    [1388]={1388,L_Factions[1388],60,L["Factions"],"Horde",false,true,6}, --"Sunreaver Onslaught"
    [1269]={1269,L_Factions[1269],60,L["Factions"],"Both",false,true,7}, --"Lótus Dourado"
    [1271]={1271,L_Factions[1271],60,L["Factions"],"Both",false,true,8}, --"Ordem da Serpente das Nuvens"
    [1435]={1435,L_Factions[1435],60,L["Factions"],"Both",false,false,9}, --"Ataque Shado-Pan"
    [1270]={1270,L_Factions[1270],60,L["Factions"],"Both",false,true,10}, --"Shado-Pan"
    [1341]={1341,L_Factions[1341],60,L["Factions"],"Both",false,true,11}, --"Os Celestiais Majestosos"
    [1359]={1359,L_Factions[1359],60,L["Factions"],"Both",false,false,12}, --"O Principe Negro"
    [1337]={1337,L_Factions[1337],60,L["Factions"],"Both",false,true,13}, --"Os Klaxxi"
    [1492]={1492,L_Factions[1492],60,L["Factions"],"Both",false,false,14}, --"Imperador Shaohao"
    [1345]={1345,L_Factions[1345],60,L["Factions"],"Both",false,false,15}, --"Os Andarilhos das Lendas"
    [1440]={1440,L_Factions[1440],60,L["Factions"],"Both",true,false,16}, --"Rebelião Lançanegra"
    [1216]={1216,L_Factions[1216],60,L["Factions"],"Both",true,false,17}, --"Academia de Shang Xi"
    [1416]={1416,L_Factions[1416],60,L["Factions"],"Both",true,false,18}, --"Confiança de Akama"
    [1351]={1351,L_Factions[1351],60,L["Factions"],"Both",false,false,19}, --"Os Mestres Cervejeiros"
    [1302]={1302,L_Factions[1302],60,L["Factions"],"Both",false,true,20}, --"Os Pescadores"
    [1272]={1272,L_Factions[1272],60,L["Factions"],"Both",false,true,21}, -- "Os Lavradores"

    }

    C_MOP_FRIENDS = {
    [1302] = {
        [1358]={1358,L_Factions[1358],60,L["Friends"],"Both",false,false,1}, -- Nat Pagle
    },
    [1272] = {
        [1283]={1283,L_Factions[1283],60,L["Friends"],"Both",false,false,2}, -- Farmer Fung
        [1277]={1277,L_Factions[1277],60,L["Friends"],"Both",false,false,3}, -- Chee Chee
        [1275]={1275,L_Factions[1275],60,L["Friends"],"Both",false,false,4}, -- Ella
        [1276]={1276,L_Factions[1276],60,L["Friends"],"Both",false,false,5}, -- Old Hillpaw
        [1282]={1282,L_Factions[1282],60,L["Friends"],"Both",false,false,6}, -- Fish Fellreed
        [1273]={1273,L_Factions[1273],60,L["Friends"],"Both",false,false,7}, -- Jogu the Drunk
        [1278]={1278,L_Factions[1278],60,L["Friends"],"Both",false,false,8}, -- Sho
        [1280]={1280,L_Factions[1280],60,L["Friends"],"Both",false,false,9}, -- Tina Mudclaw
        [1279]={1279,L_Factions[1279],60,L["Friends"],"Both",false,false,10}, -- Haohan Mudclaw
        [1281]={1281,L_Factions[1281],60,L["Friends"],"Both",false,false,11}, -- Gina Mudclaw
    }
}
--key level 1: Faction Id
--key level 2: Quest Id
--data: Quest Id, Quest Localized Name, Quest Level, Quest Localized Faction, Quest Giver Name, Category 1, Category 2 -- Quest English Faction - Quest English Name
C_MOP_DAILY_QUESTS = {
    [1271] ={
        [30151]={30151,L_Quests[30151],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Hatchling_Serpent"],"",""}, -- Order of the Cloud Serpent - Catch!
        [31704]={31704,L_Quests[31704],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Hatchling_Serpent"],"",""}, -- Order of the Cloud Serpent - Pooped
        [31705]={31705,L_Quests[31705],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - Needle Me Not
        [31707]={31707,L_Quests[31707],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - A Tangled Web
        [31701]={31701,L_Quests[31701],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - Dark Huntress
        [30158]={30158,L_Quests[30158],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - Disarming the Enemy
        [30157]={30157,L_Quests[30157],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Suchi_the_Sweet"],"",""}, -- Order of the Cloud Serpent - Emptier Nests
        [30156]={30156,L_Quests[30156],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Hatchling_Serpent"],"",""}, -- Order of the Cloud Serpent - Feeding Time
        [31709]={31709,L_Quests[31709],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Big_Bao"],"",""}, -- Order of the Cloud Serpent - Lingering Doubt
        [31703]={31703,L_Quests[31703],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - Madcap Mayhem
        [31712]={31712,L_Quests[31712],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - Monkey Mischief
        [31702]={31702,L_Quests[31702],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - On The Prowl

        [30155]={30155,L_Quests[30155],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - Restoring the Balance
        [31708]={31708,L_Quests[31708],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"],"",""}, -- Order of the Cloud Serpent - Serpent's Scale
        [31194]={31194,L_Quests[31194],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - Slitherscale Suppression
        [31699]={31699,L_Quests[31699],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Ningna_Darkwheel"],"",""}, -- Order of the Cloud Serpent - Sprite Fright
        [30150]={30150,L_Quests[30150],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Hatchling_Serpent"],"",""}, -- Order of the Cloud Serpent - Sweet as Honey
        [30154]={30154,L_Quests[30154],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Hatchling_Serpent"],"",""}, -- Order of the Cloud Serpent - The Easiest Way To A Serpent's Heart
        [31711]={31711,L_Quests[31711],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],"",""}, -- Order of the Cloud Serpent - The Seed of Doubt
        [31700]={31700,L_Quests[31700],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Ningna_Darkwheel"],"",""}, -- Order of the Cloud Serpent - The Shoe Is On The Other Foot
        [31698]={31698,L_Quests[31698],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - Thinning The Pack
        [31706]={31706,L_Quests[31706],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Instructor_Skythorn"],"",""}, -- Order of the Cloud Serpent - Weeping Widows

        [30149]={30149,L_Quests[30149],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Jenova_Longeye"],L_Categories["Category_Professions"],L_Categories["Category_Cook"]},  -- Order of the Cloud Serpent - A Feast for the Senses
        [30147]={30147,L_Quests[30147],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Jenova_Longeye"],L_Categories["Category_Professions"],L_Categories["Category_Arch"]},  -- Order of the Cloud Serpent - Fragments of the Past
        [30148]={30148,L_Quests[30148],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Jenova_Longeye"],L_Categories["Category_Professions"],L_Categories["Category_FAid"]},  -- Order of the Cloud Serpent - Just a Flesh Wound
        [30146]={30146,L_Quests[30146],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Jenova_Longeye"],L_Categories["Category_Professions"],L_Categories["Category_Fish"]},  -- Order of the Cloud Serpent - Snack Time
 
        [31717]={31717,L_Quests[31717],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],L_Categories["Category_Race"],L_Categories["Category_Race"]},  -- Order of the Cloud Serpent - The Trainer's Challenge: Ace Longpaw
        [31718]={31718,L_Quests[31718],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],L_Categories["Category_Race"],L_Categories["Category_Race"]},  -- Order of the Cloud Serpent - The Trainer's Challenge: Big Bao
        [31719]={31719,L_Quests[31719],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],L_Categories["Category_Race"],L_Categories["Category_Race"]},  -- Order of the Cloud Serpent - The Trainer's Challenge: Ningna Darkwheel
        [31720]={31720,L_Quests[31720],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],L_Categories["Category_Race"],L_Categories["Category_Race"]},  -- Order of the Cloud Serpent - The Trainer's Challenge: Suchi the Sweet
        [31721]={31721,L_Quests[31721],60,1271,L_Factions[1271],L_Units["Cloud_Serpent_Elder_Anli"],L_Categories["Category_Race"],L_Categories["Category_Race"]},  -- Order of the Cloud Serpent - The Trainer's Challenge: Qua-Ro Whitebrow

    },

    [1270] ={
        [31114]={31114,L_Quests[31114],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "Assault Deadtalker's Plateau"
        [31113]={31113,L_Quests[31113],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "Assault Fire Camp Gai-Cho"
        [31118]={31118,L_Quests[31118],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "The Deadtalker Cipher"
        [31116]={31116,L_Quests[31116],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "Spirit Dust"
        [31119]={31119,L_Quests[31119],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "The Enemy of My Enemy... Is Still My Enemy!"
        [31117]={31117,L_Quests[31117],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "Uruk!"
        [31120]={31120,L_Quests[31120],60,1270,L_Factions[1270],L_Units["Shado_Pan_Master_Snowdrift"],"","","",1}, -- Shado-Pan - "Cheng Bo!"
        
        --Set One
        [31041]={31041,L_Quests[31041],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_1"],"","",1}, -- Shado-Pan - "Egg Rescue!"
        [31046]={31046,L_Quests[31046],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_1"],"","",2}, -- Shado-Pan - "Little Hatchlings"
        [31040]={31040,L_Quests[31040],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_1"],"","",3}, -- Shado-Pan - "Spiteful Sprites"
        [31039]={31039,L_Quests[31039],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_1"],"","",4}, -- Shado-Pan - "The Mogu Menace"
        [31049]={31049,L_Quests[31049],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_1"],"","",5}, -- Shado-Pan - "In Sprite Of Everything"

        --Set Two
        [31042]={31042,L_Quests[31042],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_2"],"","",1}, -- Shado-Pan - "Onyx Hearts"
        [31043]={31043,L_Quests[31043],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_2"],"","",2}, -- Shado-Pan - "Dark Arts"
        [31047]={31047,L_Quests[31047],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_2"],"","",3}, -- Shado-Pan - "Born Free"
        [31105]={31105,L_Quests[31105],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_2"],"","",4}, -- Shado-Pan - "The Mogu Menace"
        [31061]={31061,L_Quests[31061],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_2"],"","",5}, -- Shado-Pan - "Riding the Storm"

        --Set Three
        [31044]={31044,L_Quests[31044],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_3"],"","",1}, -- Shado-Pan - "Bronze Claws"
        [31045]={31045,L_Quests[31045],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_3"],"","",2}, -- Shado-Pan - "Illusions Of The Past"
        [31048]={31048,L_Quests[31048],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_3"],"","",3}, -- Shado-Pan - "Grave Consequences"
        [31106]={31106,L_Quests[31106],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_3"],"","",4}, -- Shado-Pan - "The Mogu Menace"
        [31062]={31062,L_Quests[31062],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ban_Bearheart"],L_Categories["Category_SET_3"],"","",5}, -- Shado-Pan - "When The Dead Speak"

        [31198]={31198,L_Quests[31198],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "A Morale Victory"
        [31199]={31199,L_Quests[31199],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "Destroy the Siege Weapons!"
        [31200]={31200,L_Quests[31200],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "Fumigation"
        [31196]={31196,L_Quests[31196],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "Sra'vess Wetwork"
        [31197]={31197,L_Quests[31197],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "The Bigger They Come..."
        [31204]={31204,L_Quests[31204],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "Target of Opportunity: Sra'thik Hivelord"
        [31203]={31203,L_Quests[31203],60,1270,L_Factions[1270],L_Units["Shado_Pan_Ling_of_the_Six_Pools"],"","","",5}, -- Shado-Pan - "Target of Opportunity: Sra'thik Swarmlord"

        
    },

    [1337] = {

        [31268] = {31268, L_Quests[31268], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 1}, -- The Klaxxi - A Little Brain Work
        [31271] = {31271, L_Quests[31271], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 2}, -- The Klaxxi - Bad Genes
        [31272] = {31272, L_Quests[31272], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"], "", "", 3}, -- The Klaxxi - Infection
        [31024] = {31024, L_Quests[31024], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 4}, -- The Klaxxi - Kunchong Treats
        [31267] = {31267, L_Quests[31267], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 5}, -- The Klaxxi - Mistblade Destruction
        [31233] = {31233, L_Quests[31233], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Korven_the_Prime"], "", "", 6}, -- The Klaxxi - Sap Tapping
        [31270] = {31270, L_Quests[31270], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Korven_the_Prime"], "", "", 7}, -- The Klaxxi - The Fight Against Fear
        [31269] = {31269, L_Quests[31269], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Korven_the_Prime"], "", "", 8}, -- The Klaxxi - The Scale-Lord

        [31232] = {31232, L_Quests[31232], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Korven_the_Prime"], "", "", 9}, -- The Klaxxi - An Ancient Empire
        [31238] = {31238, L_Quests[31238], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 10}, -- The Klaxxi - Brain Food
        [31237] = {31237, L_Quests[31237], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"], "", "", 11}, -- The Klaxxi - Debugging the Terrace
        [31231] = {31231, L_Quests[31231], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 12}, -- The Klaxxi - Dreadspinner Extermination
        [31235] = {31235, L_Quests[31235], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 13}, -- The Klaxxi - Nope Nope Nope
        [31234] = {31234, L_Quests[31234], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 14}, -- The Klaxxi - Putting An Eye Out
        [31677] = {31677, L_Quests[31677], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"], "", L_Categories["Category_Drop"], 15}, -- The Klaxxi - The Warlord's Ashes

        [31109] = {31109, L_Quests[31109], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 15}, -- The Klaxxi - Culling the Swarm
        [31216] = {31216, L_Quests[31216], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"], "", "", 15}, -- The Klaxxi - Dark Skies
        [31494] = {31494, L_Quests[31494], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 15}, -- The Klaxxi - Free From Her Clutches
        [31504] = {31504, L_Quests[31504], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"], "", "", 15}, -- The Klaxxi - Ordnance Disposal
        [31496] = {31496, L_Quests[31496], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Korven_the_Prime"], "", "", 15}, -- The Klaxxi - Sampling the Empire's Finest
        [31503] = {31503, L_Quests[31503], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 15}, -- The Klaxxi - Shortcut to Ruin
        [31487] = {31487, L_Quests[31487], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 15}, -- The Klaxxi - Sonic Disruption
        [31599] = {31599, L_Quests[31599], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"], "", L_Categories["Category_Drop"], 15}, -- The Klaxxi - The Matriarch's Maw
        [31502] = {31502, L_Quests[31502], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 15}, -- The Klaxxi - Wing Clip

        [31111] = {31111, L_Quests[31111], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 15}, -- The Klaxxi - Eradicating the Zan'thik
        [31509] = {31509, L_Quests[31509], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 15}, -- The Klaxxi - Fear Takes Root
        [31598] = {31598, L_Quests[31598], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Massive_Kyparite_Core"], "", L_Categories["Category_Drop"], 15}, -- The Klaxxi - Kypa'rak's Core
        [31506] = {31506, L_Quests[31506], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"], "", "", 15}, -- The Klaxxi - Shackles of Manipulation
        [31508] = {31508, L_Quests[31508], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Rik'kal_the_Dissector"], "", "", 15}, -- The Klaxxi - Specimen Request
        [31505] = {31505, L_Quests[31505], 90, 1337, L_Factions[1337], L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"], "", "", 15}, -- The Klaxxi - Vess-Guard Duty

    },

    [1302] ={
        [31443] = {31443, L_Quests[31443], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Flying Tiger Gourami
        [30613] = {30613, L_Quests[30613], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Armored Carp
        [30754] = {30754, L_Quests[30754], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Bright Bait
        [30588] = {30588, L_Quests[30588], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Fishing for a Bruising
        [30598] = {30598, L_Quests[30598], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Who Knew Fish Liked Eggs?
        [30658] = {30658, L_Quests[30658], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Huff & Puff
        [30586] = {30586, L_Quests[30586], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Jagged Abalone
        [30678] = {30678, L_Quests[30678], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Like Bombing Fish In A Barrel
        [31446] = {31446, L_Quests[31446], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Mimic Octopus
        [30763] = {30763, L_Quests[30763], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Piranha!
        [30698] = {30698, L_Quests[30698], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Scavenger Hunt
        [30584] = {30584, L_Quests[30584], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Shocking!
        [30700] = {30700, L_Quests[30700], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Snapclaw
        [31444] = {31444, L_Quests[31444], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Spinefish Alpha
        [30701] = {30701, L_Quests[30701], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - Viseclaw Soup
        [30585] = {30585, L_Quests[30585], 90, 1302, L_Factions[1302], L_Units["The_Anglers_"], L_Categories["Category_Fish"],L_Categories["Category_Fish"], 1}, -- The Anglers - What Lurks Below

    },

    [1272] = {
        [31672] = {31672, L_Quests[31672], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 1}, -- The Tillers - "A Pumpkin-y Perfume"
        [31942] = {31942, L_Quests[31942], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 2}, -- The Tillers - "It's Melon Time"
        [31673] = {31673, L_Quests[31673], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 3}, -- The Tillers - "Red Blossom Leeks, You Make the Croc-in' World Go Down"
        [30337] = {30337, L_Quests[30337], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 4}, -- The Tillers - "Simian Sabotage"
        [31941] = {31941, L_Quests[31941], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 5}, -- The Tillers - "Squash Those Foul Odors"
        [30335] = {30335, L_Quests[30335], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 6}, -- The Tillers - "Stalling the Ravage"
        [30334] = {30334, L_Quests[30334], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 7}, -- The Tillers - "Stealing is Bad... Re-Stealing is OK"
        [31670] = {31670, L_Quests[31670], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 8}, -- The Tillers - "That Dangling Carrot"
        [31669] = {31669, L_Quests[31669], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 9}, -- The Tillers - "The Cabbage Test"
        [30336] = {30336, L_Quests[30336], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 10}, -- The Tillers - "The Kunzen Hunter-Chief"
        [30333] = {30333, L_Quests[30333], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 11}, -- The Tillers - "The Lesser of Two Evils"
        [31674] = {31674, L_Quests[31674], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 12}, -- The Tillers - "The Pink Turnip Challenge"
        [31675] = {31675, L_Quests[31675], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 13}, -- The Tillers - "The White Turnip Treatment"
        [31943] = {31943, L_Quests[31943], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 14}, -- The Tillers - "Which Berries? Witchberries."
        [31671] = {31671, L_Quests[31671], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Farmer_Yoon"], "", "", 15}, -- The Tillers - "Why Not Scallions?"

        [30471] = {30471, L_Quests[30471], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 1}, -- The Tillers - "A Gift For Chee Chee"
        [30474] = {30474, L_Quests[30474], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 2}, -- The Tillers - "A Gift For Ella"
        [30473] = {30473, L_Quests[30473], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 3}, -- The Tillers - "A Gift For Fish"
        [30475] = {30475, L_Quests[30475], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 4}, -- The Tillers - "A Gift For Fung"
        [30479] = {30479, L_Quests[30479], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 5}, -- The Tillers - "A Gift For Gina"
        [30477] = {30477, L_Quests[30477], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 6}, -- The Tillers - "A Gift For Haohan"
        [30478] = {30478, L_Quests[30478], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 7}, -- The Tillers - "A Gift For Jogu"
        [30476] = {30476, L_Quests[30476], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 8}, -- The Tillers - "A Gift For Old Hillpaw"
        [30472] = {30472, L_Quests[30472], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 9}, -- The Tillers - "A Gift For Sho"
        [30470] = {30470, L_Quests[30470], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Andi"], "", "", 10}, -- The Tillers - "A Gift For Tina"
        
        [30318] = {30318, L_Quests[30318], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 1}, -- The Tillers - "Chasing the Chicken"
        [30322] = {30322, L_Quests[30322], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 2}, -- The Tillers - "Money Matters"
        [30324] = {30324, L_Quests[30324], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 3}, -- The Tillers - "Not in Chee-Chee's Backyard"
        [30319] = {30319, L_Quests[30319], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 4}, -- The Tillers - "Pest Problems"
        [30326] = {30326, L_Quests[30326], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 5}, -- The Tillers - "The Kunzen Legend-Chief"
        [30323] = {30323, L_Quests[30323], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 6}, -- The Tillers - "They Don't Even Wear Them"
        [30317] = {30317, L_Quests[30317], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 7}, -- The Tillers - "Water, Water Everywhere"
        [30321] = {30321, L_Quests[30321], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 8}, -- The Tillers - "Weed War II"
        [30325] = {30325, L_Quests[30325], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 9}, -- The Tillers - "Where It Counts"
        [30327] = {30327, L_Quests[30327], 90, 1272, L_Factions[1272], L_Units["The_Tillers_Visitor"], "", "", 10}, -- The Tillers - "You Have to Burn the Ropes"
    },

    [1341] = {
        [30716] = {30716, L_Quests[30716], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Kuo-Na_Quillpaw"], L_Categories["Category_Chi-Ji"], "", 1}, -- The August Celestials - Chasing Hope
        [30717] = {30717, L_Quests[30717], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Yan_Quillpaw"], L_Categories["Category_Chi-Ji"], "", 2}, -- The August Celestials - Gifts of the Great Crane
        [30718] = {30718, L_Quests[30718], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 3}, -- The August Celestials - Students of Chi-Ji
        [30725] = {30725, L_Quests[30725], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 4}, -- The August Celestials - Ellia Ravenmane
        [30726] = {30726, L_Quests[30726], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 5}, -- The August Celestials - Minh Do-Tan
        [30727] = {30727, L_Quests[30727], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 6}, -- The August Celestials - Ellia Ravenmane: Rematch
        [30728] = {30728, L_Quests[30728], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 7}, -- The August Celestials - Fat Long-Fat
        [30729] = {30729, L_Quests[30729], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 8}, -- The August Celestials - Julia Bates
        [30730] = {30730, L_Quests[30730], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 9}, -- The August Celestials - Dextrous Izissha
        [30731] = {30731, L_Quests[30731], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 10}, -- The August Celestials - Kuo-Na Quillpaw
        [30732] = {30732, L_Quests[30732], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 11}, -- The August Celestials - Ellia Ravenmane: Revenge
        [30733] = {30733, L_Quests[30733], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 12}, -- The August Celestials - Tukka-Tuk
        [30734] = {30734, L_Quests[30734], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 13}, -- The August Celestials - Huck Wheelbarrow
        [30735] = {30735, L_Quests[30735], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 14}, -- The August Celestials - Mindel Sunspeaker
        [30736] = {30736, L_Quests[30736], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 15}, -- The August Celestials - Yan Quillpaw
        [30737] = {30737, L_Quests[30737], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 16}, -- The August Celestials - Fat Long-Fat: Rematch
        [30738] = {30738, L_Quests[30738], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 17}, -- The August Celestials - Thelonius
        [30739] = {30739, L_Quests[30739], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 18}, -- The August Celestials - Ellia Ravenmane: Redemption
        [30740] = {30740, L_Quests[30740], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Thelonius"], L_Categories["Category_Chi-Ji"], "", 19}, -- The August Celestials - Champion of Chi-Ji

        [30952] = {30952, L_Quests[30952], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Ogo_the_Elder"], L_Categories["Category_Niuzao"], "", 1}, -- The August Celestials - "The Unending Siege"
        [30953] = {30953, L_Quests[30953], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Yak-Keeper_Kyana"], L_Categories["Category_Niuzao"], "", 2}, -- The August Celestials - "Fallen Sentinels"
        [30954] = {30954, L_Quests[30954], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Ogo_the_Youger"], L_Categories["Category_Niuzao"], "", 3}, -- The August Celestials - "A Blade is a Blade"
        [30955] = {30955, L_Quests[30955], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_High_Adept_Paosha"], L_Categories["Category_Niuzao"], "", 4}, -- The August Celestials - "Paying Tribute"
        [30956] = {30956, L_Quests[30956], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Ogo_the_Elder"], L_Categories["Category_Niuzao"], "", 5}, -- The August Celestials - "The Siege Swells"
        [30957] = {30957, L_Quests[30957], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sentinel_Commander_Qipan"], L_Categories["Category_Niuzao"], "", 6}, -- The August Celestials - "The Overwhelming Swarm"
        [30958] = {30958, L_Quests[30958], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_High_Adept_Paosha"], L_Categories["Category_Niuzao"], "", 7}, -- The August Celestials - "In Battle's Shadow"
        [30959] = {30959, L_Quests[30959], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Ogo_the_Youger"], L_Categories["Category_Niuzao"], "", 8}, -- The August Celestials - "The Big Guns"

        [30063] = {30063, L_Quests[30063], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Behind the Masks"
        [30064] = {30064, L_Quests[30064], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Saving the Sutras"
        [30065] = {30065, L_Quests[30065], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Arrows of Fortune"
        [30066] = {30066, L_Quests[30066], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Hidden Power"
        [30067] = {30067, L_Quests[30067], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "The Shadow of Doubt"
        [30068] = {30068, L_Quests[30068], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Flames of the Void"
        [30006] = {30006, L_Quests[30006], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "The Darkness Around Us"
        
        [31517] = {31517, L_Quests[31517], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Contending With Bullies"
        [30879] = {30879, L_Quests[30879], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 1: Brewmaster Chani"
        [30880] = {30880, L_Quests[30880], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 1: The Streetfighter"
        [30881] = {30881, L_Quests[30881], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 2: Clever Ashyo & Ken-Ken"
        [30882] = {30882, L_Quests[30882], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 2: Kang Bramblestaff"
        [30885] = {30885, L_Quests[30885], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 3: Master Boom Boom"
        [30883] = {30883, L_Quests[30883], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 3: The Wrestler"
        [30902] = {30902, L_Quests[30902], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 4: Master Windfur"
        [30907] = {30907, L_Quests[30907], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Xuen"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Round 4: The P.U.G."
        [31492] = {31492, L_Quests[31492], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Lin_Tenderpaw"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "The Torch of Strength"

        [31376] = {31376, L_Quests[31376], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Whiteheart"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Attack At The Temple of the Jade Serpent"
        [31378] = {31378, L_Quests[31378], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Whiteheart"], L_Categories["Category_Chi-Ji"], "", 1}, -- The August Celestials - "Challenge At The Temple of the Red Crane"
        [31382] = {31382, L_Quests[31382], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Whiteheart"], L_Categories["Category_Niuzao"], "", 1}, -- The August Celestials - "Defense At Niuzao Temple"
        [31380] = {31380, L_Quests[31380], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Whiteheart"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Trial At The Temple of the White Tiger"

        [31377] = {31377, L_Quests[31377], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Lotusbloom"], L_Categories["Category_Jade_Serpent"], "", 1}, -- The August Celestials - "Attack At The Temple of the Jade Serpent"
        [31379] = {31379, L_Quests[31379], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Lotusbloom"], L_Categories["Category_Chi-Ji"], "", 1}, -- The August Celestials - "Challenge At The Temple of the Red Crane"
        [31383] = {31383, L_Quests[31383], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Lotusbloom"], L_Categories["Category_Niuzao"], "", 1}, -- The August Celestials - "Defense At Niuzao Temple"
        [31381] = {31381, L_Quests[31381], 90, 1341, L_Factions[1341], L_Units["The_August_Celestials_Sage_Lotusbloom"], L_Categories["Category_White_Tiger"], "", 1}, -- The August Celestials - "Trial At The Temple of the White Tiger"
    },

    -- Operação: Muralha de Escudos
    [1376] = {
        [32154] = {32154, L_Quests[32154], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"], "", "", 1}, -- Operation: Shieldwall - "Burn Out!"
        [32159] = {32159, L_Quests[32159], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_"], "", "", 1}, -- Operation: Shieldwall - "Circle of Life"
        [32446] = {32446, L_Quests[32446], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"], "", "", 1}, -- Operation: Shieldwall - "Dis-Assembly Required"
        [32156] = {32156, L_Quests[32156], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Mishka"], "", "", 1}, -- Operation: Shieldwall - "It's Only Right"
        [32155] = {32155, L_Quests[32155], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_"], "", "", 1}, -- Operation: Shieldwall - "Necessary Breaks"
        [32157] = {32157, L_Quests[32157], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"], "", "", 1}, -- Operation: Shieldwall - "The Only Good Goblin..."
        [32158] = {32158, L_Quests[32158], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"], "", "", 1}, -- Operation: Shieldwall - "Two Step Program"
        [32433] = {32433, L_Quests[32433], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_"], "", "", 1}, -- Operation: Shieldwall - "Undermining the Under Miner"

        [32451] = {32451, L_Quests[32451], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Amber_Kearnen"], "", "", 1}, -- Operation: Shieldwall - "Send A Message"
        [32143] = {32143, L_Quests[32143], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Tinkmaster_Overspark"], "", "", 1}, -- Operation: Shieldwall - "A Kind of Magic"
        [32145] = {32145, L_Quests[32145], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"], "", "", 1}, -- Operation: Shieldwall - "Don't Lose Your Head"
        [32146] = {32146, L_Quests[32146], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"], "", "", 1}, -- Operation: Shieldwall - "Hammer to Fall"
        [32144] = {32144, L_Quests[32144], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Mishka"], "", "", 1}, -- Operation: Shieldwall - "Under Pressure"
        [32142] = {32142, L_Quests[32142], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"], "", "", 1}, -- Operation: Shieldwall - "We Will Rock You"

        [32148] = {32148, L_Quests[32148], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Marshal_Troteman"], "", "", 1}, -- Operation: Shieldwall - "Attack! Move!"
        [32153] = {32153, L_Quests[32153], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Marshal_Troteman"], "", "", 1}, -- Operation: Shieldwall - "Hero Killer"
        [32149] = {32149, L_Quests[32149], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Mishka"], "", "", 1}, -- Operation: Shieldwall - "Resource Gathering"
        [32152] = {32152, L_Quests[32152], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Marshal_Troteman"], "", "", 1}, -- Operation: Shieldwall - "Siege Damage"
        [32150] = {32150, L_Quests[32150], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Mishka"], "", "", 1}, -- Operation: Shieldwall - "Supply Block"

        [32116] = {32116, L_Quests[32116], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Marshal_Troteman"], "", "", 1}, -- Operation: Shieldwall - "Priorities, People!"
        [32347] = {32347, L_Quests[32347], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "Eviction Notice"
        [32119] = {32119, L_Quests[32119], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "It Is A Mystery"
        [32122] = {32122, L_Quests[32122], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "Ogudei's Lieutenants"
        [32346] = {32346, L_Quests[32346], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "Oi Ain't Afraid o' No Ghosts!"
        [32115] = {32115, L_Quests[32115], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "Shackles of the Past"
        [32121] = {32121, L_Quests[32121], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Hilda_Hornswaggle"], "", "", 1}, -- Operation: Shieldwall - "The Spirit Trap"

        [32166] = {32166, L_Quests[32166], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Shop"], 1}, -- Operation: Shieldwall - "Beastmaster's Hunt: The Crab"
        [32186] = {32186, L_Quests[32186], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Drop"], 2}, -- Operation: Shieldwall - "Beastmaster's Quarry: The Crab"
        [32172] = {32172, L_Quests[32172], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Auto"], 3}, -- Operation: Shieldwall - "A Colossal Victory"

        [32164] = {32164, L_Quests[32164], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Shop"], 1}, -- Operation: Shieldwall - "Beastmaster's Hunt: The Crane"
        [32184] = {32184, L_Quests[32184], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Drop"], 2}, -- Operation: Shieldwall - "Beastmaster's Quarry: The Crane"
        [32170] = {32170, L_Quests[32170], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Auto"], 3}, -- Operation: Shieldwall - "Ancient's Fall"

        [32165] = {32165, L_Quests[32165], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Shop"], 1}, -- Operation: Shieldwall - "Beastmaster's Hunt: The Tiger"
        [32185] = {32185, L_Quests[32185], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Drop"], 2}, -- Operation: Shieldwall - "Beastmaster's Quarry: The Tiger"
        [32171] = {32171, L_Quests[32171], 90, 1376, L_Factions[1376], L_Units["Operation_Shieldwall_Huntsman_Blake"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Auto"], 3}, -- Operation: Shieldwall - "End of an Elder"

    };

    -- Ofensiva do Kirin Tor
    [1387] = {

        [32567] = {},
        ["32567_1"] = {32567, L_Quests[32567], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "The Beast Pens"
        ["32567_2"] = {32567, L_Quests[32567], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "The Beast Pens"
        ["32567_3"] = {32567, L_Quests[32567], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "The Beast Pens"
        ["32567_4"] = {32567, L_Quests[32567], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "The Beast Pens"

        [32551] = {32551, L_Quests[32551], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Compy Stomp"
        [32554] = {32554, L_Quests[32554], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Dino Might"
        [32553] = {32553, L_Quests[32553], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "Direhorn vs Devilsaur"
        [32552] = {32552, L_Quests[32552], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "Loa-saur"
        [32550] = {32550, L_Quests[32550], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Saur Loser"

        [32568] = {},
        ["32568_1"] = {32568, L_Quests[32568], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "No Time To Rest"
        ["32568_2"] = {32568, L_Quests[32568], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "No Time To Rest"
        ["32568_3"] = {32568, L_Quests[32568], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "No Time To Rest"
        ["32568_4"] = {32568, L_Quests[32568], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "No Time To Rest"

        [32558] = {32558, L_Quests[32558], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "All In the Family"
        [32555] = {32555, L_Quests[32555], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "Centuries in Sentries"
        [32559] = {32559, L_Quests[32559], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Even Giants Fall"
        [32560] = {32560, L_Quests[32560], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Keep It Secret"
        [32557] = {32557, L_Quests[32557], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Out of Enemy Hands"
        [32556] = {32556, L_Quests[32556], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "The More You Know"

        [32731] = {32731, L_Quests[32731], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"], "", "", 1}, -- Kirin Tor Offensive - "The Court of Bones"
        [32525] = {32525, L_Quests[32525], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Danara_Silverglass"], "", "", 1}, -- Kirin Tor Offensive - "Ashes of the Enemy"
        [32527] = {32527, L_Quests[32527], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Grave Circumstances"
        [32528] = {32528, L_Quests[32528], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Danara_Silverglass"], "", "", 1}, -- Kirin Tor Offensive - "Into the Crypts"
        [32532] = {32532, L_Quests[32532], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Danara_Silverglass"], "", "", 1}, -- Kirin Tor Offensive - "Rise No More!"
        [32526] = {32526, L_Quests[32526], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Soul Surrender"
        [32533] = {32533, L_Quests[32533], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Danara_Silverglass"], "", "", 1}, -- Kirin Tor Offensive - "Stone Cold"
        [32530] = {32530, L_Quests[32530], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"], "", "", 1}, -- Kirin Tor Offensive - "The Bloodletter"
        [32529] = {32529, L_Quests[32529], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"], "", "", 1}, -- Kirin Tor Offensive - "The Call of Thunder"
        [32531] = {32531, L_Quests[32531], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"], "", "", 1}, -- Kirin Tor Offensive - "The Conquest of Stone"

        [32634] = {32634, L_Quests[32634], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Breaking Down the Defenses"
        [32636] = {32636, L_Quests[32636], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Captive Audience"
        [32639] = {32639, L_Quests[32639], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Deconstruction"
        [32632] = {32632, L_Quests[32632], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Warmage_Yurias"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Made for War"
        [32638] = {32638, L_Quests[32638], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Mana Scavengers"
        [32301] = {32301, L_Quests[32301], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Old Enemies"
        [32637] = {32637, L_Quests[32637], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Overpowered"
        [32633] = {32633, L_Quests[32633], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Warmage_Yurias"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Spellbound"
        [32628] = {32628, L_Quests[32628], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", L_Categories["Category_PvP"], 1}, -- Kirin Tor Offensive - "Tactical Mana Bombs"

        [32571] = {32571, L_Quests[32571], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Warmage_Yurias"], "", "", 1}, -- Kirin Tor Offensive - "A Wing to Fly On"
        [32573] = {32573, L_Quests[32573], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", "", 1}, -- Kirin Tor Offensive - "Enemies Beneath the Tower"
        [32574] = {32574, L_Quests[32574], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"], "", "", 1}, -- Kirin Tor Offensive - "The Shuddering Moor"
        [32572] = {32572, L_Quests[32572], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", "", 1}, -- Kirin Tor Offensive - "The Sleepless Legion"
        [32575] = {32575, L_Quests[32575], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"], "", "", 1}, -- Kirin Tor Offensive - "The Zandalari Colossus"

        [32586] = {32586, L_Quests[32586], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "Maximum Capacitor"
        [32588] = {32588, L_Quests[32588], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"], "", "", 1}, -- Kirin Tor Offensive - "On Her Magic-ey Secret Service"

        [32732] = {32732, L_Quests[32732], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"], "", "", 1}, -- Kirin Tor Offensive - "Ihgaluk Crag"
        [32537] = {32537, L_Quests[32537], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "De-Constructed"
        [32546] = {32546, L_Quests[32546], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"], "", "", 1}, -- Kirin Tor Offensive - "Just Some Light Clean-Up Work"
        [32548] = {32548, L_Quests[32548], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"], "", "", 1}, -- Kirin Tor Offensive - "Left To Rot"
        [32536] = {32536, L_Quests[32536], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Manipulating the Saurok"
        [32606] = {32606, L_Quests[32606], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Subtle Encouragement"
        [32547] = {32547, L_Quests[32547], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"], "", "", 1}, -- Kirin Tor Offensive - "The Creeping Carpet of Ihgaluk"
        [32545] = {32545, L_Quests[32545], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lyalia"], "", "", 1}, -- Kirin Tor Offensive - "The Residents of Ihgaluk"
        [32535] = {32535, L_Quests[32535], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "The Skumblade Threat"

        [32485] = {32485, L_Quests[32485], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Bolstering the Defenses"
        [32627] = {32627, L_Quests[32627], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Warmage_Yurias"], "", "", 1}, -- Kirin Tor Offensive - "Charged Moganite"

        [32733] = {32733, L_Quests[32733], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Za'Tual"
        [32543] = {32543, L_Quests[32543], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Dangers of Za'Tual"
        [32539] = {32539, L_Quests[32539], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Dalvin_Jaacor"], "", "", 1}, -- Kirin Tor Offensive - "Dark Offerings"
        [32540] = {32540, L_Quests[32540], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Harbingers of the Loa"
        [32538] = {32538, L_Quests[32538], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Dalvin_Jaacor"], "", "", 1}, -- Kirin Tor Offensive - "Heinous Sacrifice"
        [32541] = {32541, L_Quests[32541], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Ako"], "", "", 1}, -- Kirin Tor Offensive - "Preventing a Future Threat"
        [32544] = {32544, L_Quests[32544], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Ako"], "", "", 1}, -- Kirin Tor Offensive - "Pterrible Ptorment"
        [32542] = {32542, L_Quests[32542], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Surgical Strike"

        [32578] = {},
        ["32578_1"] = {32578, L_Quests[32578], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Among the Bones"
        ["32578_2"] = {32578, L_Quests[32578], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Among the Bones"
        ["32578_3"] = {32578, L_Quests[32578], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Among the Bones"
        ["32578_4"] = {32578, L_Quests[32578], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Among the Bones"

        [32579] = {},
        ["32579_1"] = {32579, L_Quests[32579], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Competing Magic"
        ["32579_2"] = {32579, L_Quests[32579], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Competing Magic"
        ["32579_3"] = {32579, L_Quests[32579], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Competing Magic"
        ["32579_4"] = {32579, L_Quests[32579], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Competing Magic"

        [32580] = {},
        ["32580_1"] = {32580, L_Quests[32580], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Encroaching Force"
        ["32580_2"] = {32580, L_Quests[32580], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Encroaching Force"
        ["32580_3"] = {32580, L_Quests[32580], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Encroaching Force"
        ["32580_4"] = {32580, L_Quests[32580], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Encroaching Force"

        [32607] = {32607, L_Quests[32607], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Taoshi"], "", "", 1}, -- Kirin Tor Offensive - "Extended Shore Leave"
        [32724] = {32724, L_Quests[32724], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Forge Ahead!"

        [32581] = {},
        ["32581_1"] = {32581, L_Quests[32581], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"], "", "", 1}, -- Kirin Tor Offensive - "Imposing Threat"
        ["32581_2"] = {32581, L_Quests[32581], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Modera"], "", "", 1}, -- Kirin Tor Offensive - "Imposing Threat"
        ["32581_3"] = {32581, L_Quests[32581], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"], "", "", 1}, -- Kirin Tor Offensive - "Imposing Threat"
        ["32581_4"] = {32581, L_Quests[32581], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"], "", "", 1}, -- Kirin Tor Offensive - "Imposing Threat"

        [32608] = {32608, L_Quests[32608], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Taoshi"], "", "", 1}, -- Kirin Tor Offensive - "Raiding the Vault"
        [32582] = {32582, L_Quests[32582], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Raining Bones"
        [32583] = {32583, L_Quests[32583], 90, 1387, L_Factions[1387], L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"], "", "", 1}, -- Kirin Tor Offensive - "Zandalari on the Rise"
        
    };

    -- Dominance Offensive
    [1375] = {
        
        [32199] = {32199, L_Quests[32199], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Duke"], "", "", 1}, -- Dominance Offensive - "Krasarang Steampot"
        [32221] = {32221, L_Quests[32221], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Rivett_Clutchpop"], "", "", 1}, -- Dominance Offensive - "Storming the Beach"
        [32223] = {32223, L_Quests[32223], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Bounty_Board"], "", "", 1}, -- Dominance Offensive - "WANTED: Lieutenant Ethan Jacobson"
        [32214] = {32214, L_Quests[32214], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Rivett_Clutchpop"], "", "", 1}, -- Dominance Offensive - "Bilgewater Infiltrators"
        [32197] = {32197, L_Quests[32197], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Duke"], "", "", 1}, -- Dominance Offensive - "Mystery Meatloaf"
        [32222] = {32222, L_Quests[32222], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Bounty_Board"], "", "", 1}, -- Dominance Offensive - "WANTED: Chief Engineer Cogwrench"
        [32136] = {32136, L_Quests[32136], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Boss-Lady_Trixel"], "", "", 1}, -- Dominance Offensive - "Work Order: Fuel"
        [32237] = {32237, L_Quests[32237], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Bixy_Buzzsaw"], "", "", 1}, -- Dominance Offensive - "Precious Resource"
        [32137] = {32137, L_Quests[32137], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Grizzle_Gearslip"], "", "", 1}, -- Dominance Offensive - "Runnin' On Empty"
        [32140] = {32140, L_Quests[32140], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Boss-Lady_Trixel"], "", "", 1}, -- Dominance Offensive - "Work Order: Iron"
        [32236] = {32236, L_Quests[32236], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Bixy_Buzzsaw"], "", "", 1}, -- Dominance Offensive - "Bug Off!"
        [32141] = {32141, L_Quests[32141], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"], "", "", 1}, -- Dominance Offensive - "Power Metal"
        [32138] = {32138, L_Quests[32138], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Boss-Lady_Trixel"], "", "", 1}, -- Dominance Offensive - "Work Order: Lumber"
        [32139] = {32139, L_Quests[32139], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"], "", "", 1}, -- Dominance Offensive - "Stacked!"
        [32238] = {32238, L_Quests[32238], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Bixy_Buzzsaw"], "", "", 1}, -- Dominance Offensive - "Universal Remote-Explode"

        [32127] = {32127, L_Quests[32127], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Brolic"], "", "", 1}, -- Dominance Offensive - "All Dead, All Dead"
        [32128] = {32128, L_Quests[32128], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"], "", "", 1}, -- Dominance Offensive - "Another One Bites the Dust"
        [32123] = {32123, L_Quests[32123], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Shokia"], "", "", 1}, -- Dominance Offensive - "Death on Two Legs"
        [32235] = {32235, L_Quests[32235], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"], "", "", 1}, -- Dominance Offensive - "Flash! Aaaaaahhhh!"
        [32126] = {32126, L_Quests[32126], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Brolic"], "", "", 1}, -- Dominance Offensive - "Tear It Up"

        [32450] = {32450, L_Quests[32450], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"], "", "", 1}, -- Dominance Offensive - "The Time Is Now!"
        [32130] = {32130, L_Quests[32130], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"], "", "", 1}, -- Dominance Offensive - "Good Luck, Have Fun"
        [32135] = {32135, L_Quests[32135], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Shademaster_Kiryn"], "", "", 1}, -- Dominance Offensive - "Hero Killer"
        [32133] = {32133, L_Quests[32133], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Shademaster_Kiryn"], "", "", 1}, -- Dominance Offensive - "Sentry Wards"
        [32131] = {32131, L_Quests[32131], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"], "", "", 1}, -- Dominance Offensive - "We Require More Minerals!"
        [32132] = {32132, L_Quests[32132], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Shademaster_Kiryn"], "", "", 1}, -- Dominance Offensive - "Worker Harassment"

        [32449] = {32449, L_Quests[32449], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"], "", "", 1}, -- Dominance Offensive - "The Ruins of Ogudei"
        [32344] = {32344, L_Quests[32344], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Kaelis_Sunsoar"], "", "", 1}, -- Dominance Offensive - "It Is A Mystery"
        [32348] = {32348, L_Quests[32348], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Kaelis_Sunsoar"], "", "", 1}, -- Dominance Offensive - "Kick 'em While They're Down"
        [32120] = {32120, L_Quests[32120], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Kaelis_Sunsoar"], "", "", 1}, -- Dominance Offensive - "Legacy of Ogudei"
        [32343] = {32343, L_Quests[32343], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Kaelis_Sunsoar"], "", "", 1}, -- Dominance Offensive - "Ogudei's Lieutenants"
        [32342] = {32342, L_Quests[32342], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Kaelis_Sunsoar"], "", "", 1}, -- Dominance Offensive - "The Spirit Trap"

        [32163] = {32163, L_Quests[32163], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Shop"], 1}, -- Dominance Offensive - "Beastmaster's Hunt: The Crab"
        [32183] = {32183, L_Quests[32183], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Drop"], 2}, -- Dominance Offensive - "Beastmaster's Quarry: The Crab"
        [32169] = {32169, L_Quests[32169], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crab_Crate"], L_Categories["Category_Auto"], 3}, -- Dominance Offensive - "A Colossal Victory"

        [32161] = {32161, L_Quests[32161], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Shop"], 1}, -- Dominance Offensive - "Beastmaster's Hunt: The Crane"
        [32181] = {32181, L_Quests[32181], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Drop"], 2}, -- Dominance Offensive - "Beastmaster's Quarry: The Crane"
        [32167] = {32167, L_Quests[32167], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Crane_Snare"], L_Categories["Category_Auto"], 3}, -- Dominance Offensive - "Ancient's Fall"

        [32162] = {32162, L_Quests[32162], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Shop"], 1}, -- Dominance Offensive - "Beastmaster's Hunt: The Tiger"
        [32182] = {32182, L_Quests[32182], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Drop"], 2}, -- Dominance Offensive - "Beastmaster's Quarry: The Tiger"
        [32168] = {32168, L_Quests[32168], 90, 1375, L_Factions[1375], L_Units["Dominance_Offensive_Jorn_Skyseer"], L_Categories["Category_Krasarang_Sturdy_Tiger_Trap"], L_Categories["Category_Auto"], 3}, -- Dominance Offensive - "End of an Elder"

    };

    -- Sunreaver Onslaught
    [1388] = {

        [32523] = {},
        ["32523_1"] = {32523, L_Quests[32523], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "The Beast Pens"
        ["32523_2"] = {32523, L_Quests[32523], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "The Beast Pens"
        ["32523_3"] = {32523, L_Quests[32523], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "The Beast Pens"
        ["32523_4"] = {32523, L_Quests[32523], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "The Beast Pens"

        [32282] = {32282, L_Quests[32282], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Compy Stomp"
        [32298] = {32298, L_Quests[32298], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Dino Might"
        [32297] = {32297, L_Quests[32297], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Direhorn vs Devilsaur"
        [32283] = {32283, L_Quests[32283], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Loa-saur"
        [32207] = {32207, L_Quests[32207], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Saur Loser"

        [32524] = {},
        ["32524_1"] = {32524, L_Quests[32524], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "The Beating of Troll Drums"
        ["32524_2"] = {32524, L_Quests[32524], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "The Beating of Troll Drums"
        ["32524_3"] = {32524, L_Quests[32524], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "The Beating of Troll Drums"
        ["32524_4"] = {32524, L_Quests[32524], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "The Beating of Troll Drums"

        [32234] = {32234, L_Quests[32234], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Knowledge Is Power"
        [32494] = {32494, L_Quests[32494], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Power Play"
        [32493] = {32493, L_Quests[32493], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "They All Fall Down"
        [32206] = {32206, L_Quests[32206], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "This Just Won't Do"
        [32233] = {32233, L_Quests[32233], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Very Disarming"
        [32232] = {32232, L_Quests[32232], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "What's Inside Counts"

        [32728] = {32728, L_Quests[32728], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", "", 1}, -- Sunreaver Onslaught - "The Court of Bones"
        [32218] = {32218, L_Quests[32218], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Captain_Aerthas_Firehawk"], "", "", 1}, -- Sunreaver Onslaught - "Ashes of the Enemy"
        [32201] = {32201, L_Quests[32201], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "Grave Circumstances"
        [32226] = {32226, L_Quests[32226], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"], "", "", 1}, -- Sunreaver Onslaught - "Into the Crypts"
        [32224] = {32224, L_Quests[32224], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"], "", "", 1}, -- Sunreaver Onslaught - "Rise No More!"
        [32220] = {32220, L_Quests[32220], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Captain_Aerthas_Firehawk"], "", "", 1}, -- Sunreaver Onslaught - "Soul Surrender"
        [32219] = {32219, L_Quests[32219], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"], "", "", 1}, -- Sunreaver Onslaught - "Stone Cold"
        [32495] = {32495, L_Quests[32495], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "The Bloodletter"
        [32225] = {32225, L_Quests[32225], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "The Call of Thunder"
        [32517] = {32517, L_Quests[32517], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"], "", "", 1}, -- Sunreaver Onslaught - "The Conquest of Stone"

        [32288] = {32288, L_Quests[32288], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", "", 1}, -- Sunreaver Onslaught - "Bolstering the Defenses"
        [32265] = {32265, L_Quests[32265], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"], "", "", 1}, -- Sunreaver Onslaught - "Charged Moganite"
        [32300] = {32300, L_Quests[32300], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", "", 1}, -- Sunreaver Onslaught - "Disarming Irony"

        [32506] = {32506, L_Quests[32506], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", "", 1}, -- Sunreaver Onslaught - "A Wing to Fly On"
        [32287] = {32287, L_Quests[32287], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"], "", "", 1}, -- Sunreaver Onslaught - "Enemies Beneath the Tower"
        [32285] = {32285, L_Quests[32285], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", "", 1}, -- Sunreaver Onslaught - "The Shuddering Moor"
        [32228] = {32228, L_Quests[32228], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"], "", "", 1}, -- Sunreaver Onslaught - "The Sleepless Legion"
        [32230] = {32230, L_Quests[32230], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", "", 1}, -- Sunreaver Onslaught - "The Zandalari Colossus"

        [32208] = {32208, L_Quests[32208], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Maximum Capacitor"
        [32209] = {32209, L_Quests[32209], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"], "", "", 1}, -- Sunreaver Onslaught - "Save Our Scouts!"

        [32730] = {32730, L_Quests[32730], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", "", 1}, -- Sunreaver Onslaught - "Ihgaluk Crag"
        [32255] = {32255, L_Quests[32255], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "De-Constructed"
        [32299] = {32299, L_Quests[32299], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Amalia_Penshire"], "", "", 1}, -- Sunreaver Onslaught - "Just Some Light Clean-Up Work"
        [32491] = {32491, L_Quests[32491], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Amalia_Penshire"], "", "", 1}, -- Sunreaver Onslaught - "Left To Rot"
        [32254] = {32254, L_Quests[32254], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Manipulating the Saurok"
        [32605] = {32605, L_Quests[32605], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Subtle Encouragement"
        [32489] = {32489, L_Quests[32489], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Amalia_Penshire"], "", "", 1}, -- Sunreaver Onslaught - "The Creeping Carpet of Ihgaluk"
        [32274] = {32274, L_Quests[32274], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Sunwalker_Dezco"], "", "", 1}, -- Sunreaver Onslaught - "The Residents of Ihgaluk"
        [32204] = {32204, L_Quests[32204], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "The Skumblade Threat"

        [32269] = {32269, L_Quests[32269], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Breaking Down the Defenses"
        [32262] = {32262, L_Quests[32262], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Captive Audience"
        [32302] = {32302, L_Quests[32302], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Deconstruction"
        [32303] = {32303, L_Quests[32303], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Made for War"
        [32266] = {32266, L_Quests[32266], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Mana Manifestations"
        [32213] = {32213, L_Quests[32213], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Old Enemies"
        [32305] = {32305, L_Quests[32305], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Magister_Hathorel"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Overpowered"
        [32264] = {32264, L_Quests[32264], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Spellbound"
        [32268] = {32268, L_Quests[32268], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Girana_the_Blooded"], "", L_Categories["Category_PvP"], 1}, -- Sunreaver Onslaught - "Tactical Mana Bombs"

        [32729] = {32729, L_Quests[32729], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "Za'Tual"
        [32200] = {32200, L_Quests[32200], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Dangers of Za'Tual"
        [32217] = {32217, L_Quests[32217], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Elina_Zaralae"], "", "", 1}, -- Sunreaver Onslaught - "Dark Offerings"
        [32252] = {32252, L_Quests[32252], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Harbingers of the Loa"
        [32215] = {32215, L_Quests[32215], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Elina_Zaralae"], "", "", 1}, -- Sunreaver Onslaught - "Heinous Sacrifice"
        [32227] = {32227, L_Quests[32227], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Kethiel_Sunlance"], "", "", 1}, -- Sunreaver Onslaught - "Preventing a Future Threat"
        [32216] = {32216, L_Quests[32216], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Kethiel_Sunlance"], "", "", 1}, -- Sunreaver Onslaught - "Pterrible Ptorment"
        [32275] = {32275, L_Quests[32275], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Surgical Strike"

        [32293] = {},
        ["32293_1"] = {32293, L_Quests[32293], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Among the Bones"
        ["32293_2"] = {32293, L_Quests[32293], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "Among the Bones"
        ["32293_3"] = {32293, L_Quests[32293], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "Among the Bones"
        ["32293_4"] = {32293, L_Quests[32293], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Among the Bones"

        [32520] = {},
        ["32520_1"] = {32520, L_Quests[32520], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Competing Magic"
        ["32520_2"] = {32520, L_Quests[32520], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "Competing Magic"
        ["32520_3"] = {32520, L_Quests[32520], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "Competing Magic"
        ["32520_4"] = {32520, L_Quests[32520], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Competing Magic"

        [32521] = {},
        ["32521_1"] = {32521, L_Quests[32521], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Encroaching Force"
        ["32521_2"] = {32521, L_Quests[32521], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "Encroaching Force"
        ["32521_3"] = {32521, L_Quests[32521], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "Encroaching Force"
        ["32521_4"] = {32521, L_Quests[32521], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Encroaching Force"

        [32676] = {32676, L_Quests[32676], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Taoshi"], "", "", 1}, -- Sunreaver Onslaught - "Extended Shore Leave"
        [32722] = {32722, L_Quests[32722], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Forge Ahead!"

        [32522] = {},
        ["32522_1"] = {32522, L_Quests[32522], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"], "", "", 1}, -- Sunreaver Onslaught - "Imposing Threat"
        ["32522_2"] = {32522, L_Quests[32522], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"], "", "", 1}, -- Sunreaver Onslaught - "Imposing Threat"
        ["32522_3"] = {32522, L_Quests[32522], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Lor-themar_Theron"], "", "", 1}, -- Sunreaver Onslaught - "Imposing Threat"
        ["32522_4"] = {32522, L_Quests[32522], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Halduron_Brightwing"], "", "", 1}, -- Sunreaver Onslaught - "Imposing Threat"

        [32677] = {32677, L_Quests[32677], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Taoshi"], "", "", 1}, -- Sunreaver Onslaught - "Raiding the Vault"
        [32294] = {32294, L_Quests[32294], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Raining Bones"
        [32564] = {32564, L_Quests[32564], 90, 1388, L_Factions[1388], L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"], "", "", 1}, -- Sunreaver Onslaught - "Zandalari on the Rise"

    };

    -- Lótus Dourado
    [1269] = {
        [30283] = {30283, L_Quests[30283], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "A Smashing Impression"
        [31755] = {31755, L_Quests[31755], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Acts of Cruelty"
        [30282] = {30282, L_Quests[30282], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Burning Away the Filth"
        [31754] = {31754, L_Quests[31754], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Cannonfire"
        [31762] = {31762, L_Quests[31762], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Crumbling Behemoth"
        [30320] = {30320, L_Quests[30320], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Free Spirits"
        [30312] = {30312, L_Quests[30312], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Given a Second Chance"
        [31756] = {31756, L_Quests[31756], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "High Chance of Rain"
        [30311] = {30311, L_Quests[30311], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "High Standards"
        [30293] = {30293, L_Quests[30293], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "In Enemy Hands" 
        [31758] = {31758, L_Quests[31758], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Laosy Scouting"
        [30292] = {30292, L_Quests[30292], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Rude Awakenings"
        [30309] = {30309, L_Quests[30309], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Set in Stone"
        [30308] = {30308, L_Quests[30308], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Stone Hard Quilen"
        [31760] = {31760, L_Quests[31760], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Striking First"
        [30307] = {30307, L_Quests[30307], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Eternal Vigil"
        [30281] = {30281, L_Quests[30281], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_He_Softfoot"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Silent Approach"
        [30310] = {30310, L_Quests[30310], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Thundering Skies"
        [31757] = {31757, L_Quests[31757], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Unleashed Spirits"
        [31136] = {31136, L_Quests[31136], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Behind Our Lines"
        [30482] = {30482, L_Quests[30482], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_He_Softfoot"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Soul-Gatherer"

        [31246] = {31246, L_Quests[31246], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Attack on Mistfall Village"
        [31249] = {31249, L_Quests[31249], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Mistfall Village"
        [30286] = {30286, L_Quests[30286], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Backed Into a Corner"
        [30195] = {30195, L_Quests[30195], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Merchant_Benny"], "", "", 1}, -- Golden Lotus - "Blooming Blossoms"
        [30263] = {30263, L_Quests[30263], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Clearing in the Forest"
        [30194] = {30194, L_Quests[30194], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Encroaching Storm"
        [30289] = {30289, L_Quests[30289], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Freeing Mind and Body"
        [30196] = {30196, L_Quests[30196], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"], "", "", 1}, -- Golden Lotus - "Lushroom Rush"
        [30193] = {30193, L_Quests[30193], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"], "", "", 1}, -- Golden Lotus - "Meating Expectations"
        [31293] = {31293, L_Quests[31293], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Mogu Make Poor House Guests"
        [30192] = {30192, L_Quests[30192], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"], "", "", 1}, -- Golden Lotus - "My Town, It's on Fire"
        [30288] = {30288, L_Quests[30288], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"], "", "", 1}, -- Golden Lotus - "My Town, It's On Fire Again"
        [30231] = {30231, L_Quests[30231], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"], "", "", 1}, -- Golden Lotus - "Pomfruit Pickup"
        [30238] = {30238, L_Quests[30238], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Return to Rest"
        [30232] = {30232, L_Quests[30232], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Ruffling Some Feathers"
        [30190] = {30190, L_Quests[30190], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"], "", "", 1}, -- Golden Lotus - "Sprite Plight"
        [30191] = {30191, L_Quests[30191], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"], "", "", 1}, -- Golden Lotus - "Steer Clear of the Beer Here"
        [30290] = {30290, L_Quests[30290], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Stonebound Killers"
        [30237] = {30237, L_Quests[30237], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "The Pandaren Uprising Relived"
        [30285] = {30285, L_Quests[30285], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Wu Kao Scouting Reports"
        
        [30236] = {30236, L_Quests[30236], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Aetha"
        [30297] = {30297, L_Quests[30297], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Baolai the Immolator"
        [30296] = {30296, L_Quests[30296], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Gaohun the Soul-Severer"
        [30239] = {30239, L_Quests[30239], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Lao-Fe the Slavebinder"
        [30235] = {30235, L_Quests[30235], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"], "", "", 1}, -- Golden Lotus - "Quid Pro Quo"
        
        [31244] = {31244, L_Quests[31244], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"], "", "", 1}, -- Golden Lotus - "Guo-Lai Encampment"
        [31240] = {31240, L_Quests[31240], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"], "", "", 1}, -- Golden Lotus - "Guo-Lai Infestation"
        [31296] = {31296, L_Quests[31296], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Ruins of Guo-Lai"

        [30481] = {30481, L_Quests[30481], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Rook_Stonetoe"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Carved in Stone"
        [30304] = {30304, L_Quests[30304], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Hard as a Rock"
        [30200] = {30200, L_Quests[30200], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "In Ashen Webs"
        [30299] = {30299, L_Quests[30299], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "No Stone Unturned"
        [30301] = {30301, L_Quests[30301], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"], "", "", 1}, -- Golden Lotus - "Offering a Warm Welcome"
        [30298] = {30298, L_Quests[30298], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"], "", "", 1}, -- Golden Lotus - "Painting the Ruins Red"
        [30205] = {30205, L_Quests[30205], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sinan_the_Dreamer"], "", "", 1}, -- Golden Lotus - "Runelocked"
        [30206] = {30206, L_Quests[30206], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sinan_the_Dreamer"], "", "", 1}, -- Golden Lotus - "Runes in the Ruins"
        [30204] = {30204, L_Quests[30204], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "That's Not a Rock!"
        [30300] = {30300, L_Quests[30300], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Key to Success"
        [30228] = {30228, L_Quests[30228], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "Troubling the Troublemakers"

        [30225] = {30225, L_Quests[30225], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "The Ashweb Matriarch"
        [30302] = {30302, L_Quests[30302], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"], "", "", 1}, -- Golden Lotus - "The Imperion Threat"
        [30227] = {30227, L_Quests[30227], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "Wulon, the Granite Sentinel"

        [31297] = {31297, L_Quests[31297], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Setting Sun Garrison"
        [30244] = {30244, L_Quests[30244], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Along the Serpent's Spine"
        [30266] = {30266, L_Quests[30266], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Bloodied Skies"
        [30245] = {30245, L_Quests[30245], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Lost Scouts"
        [30243] = {30243, L_Quests[30243], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Mantid Under Fire"
        [30444] = {30444, L_Quests[30444], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "No Reprieve"
        [30261] = {30261, L_Quests[30261], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kelari_Featherfoot"], "", "", 1}, -- Golden Lotus - "Roll Club: Serpent's Spine"
        [30247] = {30247, L_Quests[30247], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kelari_Featherfoot"], "", "", 1}, -- Golden Lotus - "Roll Club: Vale of Eternal Blossoms"
        [30242] = {30242, L_Quests[30242], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"], "", "", 1}, -- Golden Lotus - "Survival Ring: Blades"
        [30240] = {30240, L_Quests[30240], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"], "", "", 1}, -- Golden Lotus - "Survival Ring: Flame"
        [30250] = {30250, L_Quests[30250], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"], "", "", 1}, -- Golden Lotus - "Survival Ring: Thunder"
        [30306] = {30306, L_Quests[30306], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Hai-Me_Heavyhands"], "", "", 1}, -- Golden Lotus - "The Battle Ring"
        [30246] = {30246, L_Quests[30246], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "Upon the Ramparts"
        [30264] = {30264, L_Quests[30264], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "Enemy at the Gates"
        [30248] = {30248, L_Quests[30248], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "The Butcher"
        [30249] = {30249, L_Quests[30249], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"], "", "", 1}, -- Golden Lotus - "Under the Setting Sun"
        [30251] = {30251, L_Quests[30251], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"], "", "", 1}, -- Golden Lotus - "Vyraxxis, the Krik'thik Swarm-Lord"

        [31131] = {31131, L_Quests[31131], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Whitepetal Lake"
        [30284] = {30284, L_Quests[30284], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "A Thousand Pointy Teeth"
        [30338] = {30338, L_Quests[30338], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "A Weighty Task"
        [30342] = {30342, L_Quests[30342], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Fiery Tongue, Fragile Feet"
        [30339] = {30339, L_Quests[30339], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Merchant_Tantan"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Getting your Hands Dirty"
        [30294] = {30294, L_Quests[30294], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Small Comforts"
        [30265] = {30265, L_Quests[30265], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Sparkle in the Eye"
        [30340] = {30340, L_Quests[30340], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Merchant_Tantan"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Stick in the Mud"
        [30291] = {30291, L_Quests[30291], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Stunning Display"
        [30314] = {30314, L_Quests[30314], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Displaced Paleblade"
        [30313] = {30313, L_Quests[30313], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "The Moving Mists"
        [30341] = {30341, L_Quests[30341], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Under Watchful Eyes"
        [30233] = {30233, L_Quests[30233], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Cracklefang"
        [30234] = {30234, L_Quests[30234], 90, 1269, L_Factions[1269], L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"], "", L_Categories["Category_Time"], 1}, -- Golden Lotus - "Vicejaw"
        
    };

    ["WORK_ORDERS"] = {
        [32649] = {32649, L_Quests[32649], 90, 1270, L_Factions[1270], L_Units["Work_Order"], "", "", 1}, -- Shado-Pan - Work Order: Shado-Pan I
        [32650] = {32650, L_Quests[32650], 90, 1270, L_Factions[1270], L_Units["Empty_Crate"], "", "", 2}, -- Shado-Pan - Work Order: Shado-Pan II
        [32658] = {32658, L_Quests[32658], 90, 1337, L_Factions[1337], L_Units["Work_Order"], "", "", 3}, -- The Klaxxi - Work Order: The Klaxxi I
        [32659] = {32659, L_Quests[32659], 90, 1337, L_Factions[1337], L_Units["Empty_Crate"], "", "", 4}, -- The Klaxxi - Work Order: The Klaxxi II

        [32645] = {32645, L_Quests[32645], 90, 1337, L_Factions[1337], L_Units["Work_Order"], "", "", 4},
        [32646] = {32646, L_Quests[32646], 90, 1337, L_Factions[1337], L_Units["Empty_Crate"], "", "", 4},
        [32653] = {32653, L_Quests[32653], 90, 1337, L_Factions[1337], L_Units["Work_Order"], "", "", 4},
        [32657] = {32657, L_Quests[32657], 90, 1337, L_Factions[1337], L_Units["Empty_Crate"], "", "", 4},
        [32642] = {32642, L_Quests[32642], 90, 1337, L_Factions[1337], L_Units["Work_Order"], "", "", 4},
        [32643] = {32643, L_Quests[32643], 90, 1337, L_Factions[1337], L_Units["Empty_Crate"], "", "", 4},
        [32647] = {32647, L_Quests[32647], 90, 1337, L_Factions[1337], L_Units["Work_Order"], "", "", 4},
        [32648] = {32648, L_Quests[32648], 90, 1337, L_Factions[1337], L_Units["Empty_Crate"], "", "", 4},
    }
}

C_SHARED_QUEST = {
    [32293] = true,
    [32520] = true,
    [32521] = true,
    [32522] = true,
    [32523] = true,
    [32524] = true,
    [32578] = true,
    [32579] = true,
    [32580] = true,
    [32581] = true,
    [32567] = true,
    [32568] = true,
}

--key: Quest Id
--data: Quest Id, Boss Localized Name, Boss Level, Localized Boss Label
C_MOP_WORLD_BOSSES = {
    [32099]={32099,L_Units["World_Bosses_Names_Sha"], 0, L["World_Bosses_Label"],50500,1},
    [32098]={32098,L_Units["World_Bosses_Names_Gaileon"], 0, L["World_Bosses_Label"],50500,2},
    [32518]={32518,L_Units["World_Bosses_Names_Nalak"], 0, L["World_Bosses_Label"],50502,3},
    [32519]={32519,L_Units["World_Bosses_Names_Oondasta"], 0, L["World_Bosses_Label"],50502,4},
    [33117]={33117,L_Units["World_Bosses_Names_Celestials"], 0, L["World_Bosses_Label"],50504,5},
    [33118]={33118,L_Units["World_Bosses_Names_Ordos"], 0, L["World_Bosses_Label"],50504,6},
}

--key: Quest Id
--data: Bonus Roll Quest Id, Boss Localized Name, Boss Level, Localized Boss Label
C_MOP_WORLD_BOSSES_BONUS_ROLL = {
    [32098]={32923,L_Units["World_Bosses_Names_Gaileon"], 0, L["World_Bosses_Label"],1,50000},
    [32099]={32924,L_Units["World_Bosses_Names_Sha"], 0, L["World_Bosses_Label"],2,50000},
    [32518]={33109,L_Units["World_Bosses_Names_Nalak"], 0, L["World_Bosses_Label"],3,50502},
    [32519]={32922,L_Units["World_Bosses_Names_Oondasta"], 0, L["World_Bosses_Label"],4,50502},
    [33117]={33226,L_Units["World_Bosses_Names_Celestials"], 0, L["World_Bosses_Label"],5,50504},
    [33118]={33225,L_Units["World_Bosses_Names_Ordos"], 0, L["World_Bosses_Label"],6,50504},
}

C_Currencies = {
    [697] = { name = "Elder Charm of Good Fortune", icon = "Interface\\Icons\\inv_misc_coin_17", sequence = 7, version = 50000 },
    [738] = { name = "Lesser Charm of Good Fortune", icon = "Interface\\Icons\\inv_misc_coin_18", sequence = 6, version = 50000 },
    [752] = { name = "Mogu Rune of Fate", icon = "Interface\\Icons\\Archaeology_5_0_mogucoin", sequence = 5, version = 50502 },
    [776] = { name = "Warforged Seal", icon = "Interface\\Icons\\inv_arcane_orb", sequence = 4, version = 50000 },
    [777] = { name = "Timeless Coin", icon = "Interface\\Icons\\timelesscoin", sequence = 2, version = 50504 },
    [402] = { name = "Ironpaw Token", icon = "Interface\\Icons\\inv_relics_idolofferocity", sequence = 1, version = 50000 },
    [789] = { name = "Bloody Coin", icon = "Interface\\Icons\\Timelesscoin-bloody", sequence = 3, version = 50504 },
    
}
