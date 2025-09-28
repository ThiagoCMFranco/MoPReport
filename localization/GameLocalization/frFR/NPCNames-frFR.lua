--Translator ork
--if GetLocale() ~= "frFR" then return end
local _, qcc = ...
qcc.L_Units = {}
local L_Units = qcc.L_Units

--World Bosses

L_Units["World_Bosses_Names_Ordos"] = "Ordos, Dieu du feu des yaungols"
L_Units["World_Bosses_Names_Sha"] = "Sha de la colère"
L_Units["World_Bosses_Names_Oondasta"] = "Oondasta"
L_Units["World_Bosses_Names_Gaileon"] = "Galion (Troupe de guerre de Salyis)"
L_Units["World_Bosses_Names_Nalak"] = "Nalak, Le seigneur des tempêtes"
L_Units["World_Bosses_Names_Celestials"] = "Les Astres vénérables"

-- Order

L_Units["Cloud_Serpent_Jenova_Longeye"] = "Jenova Regard au Loin"
L_Units["Cloud_Serpent_Elder_Anli"] = "Ancienne Anli"
L_Units["Cloud_Serpent_Instructor_Skythorn"] = "Instructeur Ronce du Ciel"
L_Units["Cloud_Serpent_"] = nil  --Necessita dividir em referências individuais para cada NPC.
L_Units["Cloud_Serpent_Hatchling_Serpent"] = "Votre nouveau-né | Votre serpent-nuage"
L_Units["Cloud_Serpent_Ningna_Darkwheel"] = "Ningna Roue de l’Ombre"
L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"] = "Qua Ro Front de Neige"
L_Units["Cloud_Serpent_Suchi_the_Sweet"] = "Suchi la Tendre"
L_Units["Cloud_Serpent_Big_Bao"] = "Gros Bao"

--Shado-Pan

L_Units["Shado_Pan_Ban_Bearheart"] = "Ban Cœur dʼOurs"
L_Units["Shado_Pan_Ling_of_the_Six_Pools"] = "Ling des Six Bassins"
L_Units["Shado_Pan_Master_Snowdrift"] = "Maître Banc de Neige"

--The Klaxxi

L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"] = "Kil’ruk le Saccageur des vents"
L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"] = "Kaz’tik le Manipulateur"
L_Units["The_Klaxxi_Korven_the_Prime"] = "Korven le Premier"
L_Units["The_Klaxxi_Rik'kal_the_Dissector"] = "Rik’kal le Disséqueur"
L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"] = "Xaril l’Esprit empoisonné"
L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"] = "Hisek le Gardien de l’essaim"
L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"] = "Cendres du seigneur de guerre Gurthan"
L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"] = "Énormes mandibules de kunchong"
L_Units["The_Klaxxi_Massive_Kyparite_Core"] = "Noyau de kyparite massif"

-- The Tillers

L_Units["The_Tillers_Farmer_Yoon"] = "Fermier Yoon"
L_Units["The_Tillers_Andi"] = "Andi"
L_Units["The_Tillers_Visitor"] = "Visiteur" --Necessita dividir em referências individuais para cada NPC.

-- The Anglers
L_Units["The_Tillers_"] = "" --Necessita dividir em referências individuais para cada NPC.

-- Celestials

L_Units["The_August_Celestials_Thelonius"] = "Thélonius"
L_Units["The_August_Celestials_Kuo-Na_Quillpaw"] = "Kuo Na Patte de Plumes"
L_Units["The_August_Celestials_Yan_Quillpaw"] = "Yan Patte de Plumes"
L_Units["The_August_Celestials_Ogo_the_Elder"] = "Ogo lʼAncien"
L_Units["The_August_Celestials_Ogo_the_Youger"] = "Ogo le Jeune"
L_Units["The_August_Celestials_High_Adept_Paosha"] = "Grand adepte Paosha"
L_Units["The_August_Celestials_Yak-Keeper_Kyana"] = "Gardienne de yacks Kyana"
L_Units["The_August_Celestials_Sentinel_Commander_Qipan"] = "Commandant des sentinelles Qipan"
L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"] = "Vénérable ancien Tai Feng"

L_Units["The_August_Celestials_Sage_Whiteheart"] = "Sage Cœur Blanc"
L_Units["The_August_Celestials_Sage_Lotusbloom"] = "Sage Fleur de Lotus"
L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"] = "Vénérable ancienne Sing de la Tempête"
L_Units["The_August_Celestials_Xuen"] = "Xuen"
L_Units["The_August_Celestials_Lin_Tenderpaw"] = "Lin Patte de Velours"

-- Operation: Shieldwall

L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"] = "Sully « la Saumure » McLeary"
L_Units["Operation_Shieldwall_Hilda_Hornswaggle"] = "Hilda Cornegidouille"
L_Units["Operation_Shieldwall_Marshal_Troteman"] = "Maréchal Troteman"
L_Units["Operation_Shieldwall_Mishka"] = "Mishka"
L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"] = "Amiral du ciel Rogers"
L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"] = "Séraphine de l’hiver"
L_Units["Operation_Shieldwall_Amber_Kearnen"] = "Amber Kearnen"
L_Units["Operation_Shieldwall_Tinkmaster_Overspark"] = "Maître-bricoleur Suprétincelle"
L_Units["Operation_Shieldwall_Huntsman_Blake"] = "Veneur Blake"

-- Dominance Offensive

L_Units["Dominance_Offensive_Jorn_Skyseer"] = "Jorn Oeil-des-Cieux"
L_Units["Dominance_Offensive_Grizzle_Gearslip"] = "Geignard Glissécrou"
L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"] = "Daxil « la Gemme » Rochégrise"
L_Units["Dominance_Offensive_Boss-Lady_Trixel"] = "Dame-Boss Trixel"
L_Units["Dominance_Offensive_Bounty_Board"] = "Tableau de récompense"
L_Units["Dominance_Offensive_Bixy_Buzzsaw"] = "Bixy Tronçobuzz"
L_Units["Dominance_Offensive_Duke"] = "Duke"
L_Units["Dominance_Offensive_Rivett_Clutchpop"] = "Rivett Popembraye"
L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"] = "Zino « le Déchiqueteur » Hachémenu"
L_Units["Dominance_Offensive_Kaelis_Sunsoar"] = "Kaelis Lever-de-Soleil"
L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"] = "Garde de sang Gro’tash"
L_Units["Dominance_Offensive_Brolic"] = "Brolic"
L_Units["Dominance_Offensive_Shokia"] = "Shokia"
L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"] = "Zazzix « le Roussi » Grilletorpille"
L_Units["Dominance_Offensive_Shademaster_Kiryn"] = "Maîtresse de l’Ombre Kiryn"

-- Golden Lotus

L_Units["QuestHub_Golden_Pagoda"] = "Pagode dorée"
L_Units["QuestHub_Mistfall_Village"] = "Tombe-brume"
L_Units["QuestHub_Ruins_of_Guo-Lai"] = "Les ruines de Guo-Lai"
L_Units["QuestHub_Setting_Sun"] = "La garnison du Soleil couchant"
L_Units["QuestHub_Whitepetal_Lake"] = "Lac Blanc-Pétale"

L_Units["Golden_Lotus_Golden_Pagoda_Ren_Firetongue"] = "Ren Langue de Feu" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"
L_Units["Golden_Lotus_Golden_Pagoda_Sun_Tenderheart"] = "Sun Cœur de Douceur" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"
L_Units["Golden_Lotus_Golden_Pagoda_Anji_Autumnlight"] = "Anji Clair d’Automne" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"
L_Units["Golden_Lotus_Golden_Pagoda_Kun_Autumnlight"] = "Kun Clair d'Automne" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"
L_Units["Golden_Lotus_Golden_Pagoda_Leven_Dawnblade"] = "Leven Lame de l’Aube" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"
L_Units["Golden_Lotus_Golden_Pagoda_He_Softfoot"] = "He Pas de Loup" .. " (" .. L_Units["QuestHub_Golden_Pagoda"] .. ")"

L_Units["Golden_Lotus_Mistfall_Village_Sun_Tenderheart"] = "Sun Cœur de Douceur" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"
L_Units["Golden_Lotus_Mistfall_Village_Merchant_Benny"] = "Marchand Benny" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"
L_Units["Golden_Lotus_Mistfall_Village_Che_Wildwalker"] = "Che Marche Sauvage" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"
L_Units["Golden_Lotus_Mistfall_Village_Rook_Stonetoe"] = "Freux Orteil de Pierre" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"
L_Units["Golden_Lotus_Mistfall_Village_Cook_Tope"] = "Cuisinier Tope" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"
L_Units["Golden_Lotus_Mistfall_Village_Mayor_Shiyo"] = "Maire Shiyo" .. " (" .. L_Units["QuestHub_Mistfall_Village"] .. ")"

L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Leven_Dawnblade"] = "Leven Lame de l’Aube" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")" --338 386
L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sun_Tenderheart"] = "Sun Cœur de Douceur" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")"
L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Anji_Autumnlight"] = "Anji Clair d’Automne" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")"
L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Kun_Autumnlight"] = "Kun Clair d'Automne" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")"
L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Rook_Stonetoe"] = "Freux Orteil de Pierre" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")"
L_Units["Golden_Lotus_Ruins_of_Guo-Lai_Sinan_the_Dreamer"] = "Sinan la Rêveuse" .. " (" .. L_Units["QuestHub_Ruins_of_Guo-Lai"] .. ")"

L_Units["Golden_Lotus_Setting_Sun_Anji_Autumnlight"] = "Anji Clair d’Automne" .. " (" .. L_Units["QuestHub_Setting_Sun"] .. ")"
L_Units["Golden_Lotus_Setting_Sun_Kun_Autumnlight"] = "Kun Clair d'Automne" .. " (" .. L_Units["QuestHub_Setting_Sun"] .. ")"
L_Units["Golden_Lotus_Setting_Sun_Kelari_Featherfoot"] = "Kelari Pied Plume" .. " (" .. L_Units["QuestHub_Setting_Sun"] .. ")"
L_Units["Golden_Lotus_Setting_Sun_Yumi_Goldenpaw"] = "Yumi Patte d’Or" .. " (" .. L_Units["QuestHub_Setting_Sun"] .. ")"
L_Units["Golden_Lotus_Setting_Sun_Hai-Me_Heavyhands"] = "Hai Me Mains de Plomb" .. " (" .. L_Units["QuestHub_Setting_Sun"] .. ")"

L_Units["Golden_Lotus_Whitepetal_Lake_Ren_Firetongue"] = "Ren Langue de Feu" .. " (" .. L_Units["QuestHub_Whitepetal_Lake"] .. ")"
L_Units["Golden_Lotus_Whitepetal_Lake_He_Softfoot"] = "He Pas de Loup" .. " (" .. L_Units["QuestHub_Whitepetal_Lake"] .. ")"

L_Units["Golden_Lotus_Merchant_Tantan"] = "Marchand Tantan"

L_Units["Golden_Lotus_"] = nil

L_Units["Kirin_Tor_Offensive_Lady_Jaina_Proudmoore"] = "Dame Jaina Portvaillant"
L_Units["Kirin_Tor_Offensive_Archmage_Modera"] = "Archimage Modera"
L_Units["Kirin_Tor_Offensive_Narasi_Snowdawn"] = "Narasi Aubeneige"
L_Units["Kirin_Tor_Offensive_Archmage_Lan-dalock"] = "Archimage Lanʼdalock"
L_Units["Kirin_Tor_Offensive_Scout_Captain_Daelin"] = "Capitaine des éclaireurs Daelin"
L_Units["Kirin_Tor_Offensive_Miura_Brightweaver"] = "Miura Tissebrille"

L_Units["Kirin_Tor_Offensive_Vereesa_Windrunner"] = "Vereesa Coursevent"
L_Units["Kirin_Tor_Offensive_Danara_Silverglass"] = "Danara Argeverre"
L_Units["Kirin_Tor_Offensive_Vylene_Amaranth"] = "Mylène Amaranth"

L_Units["Kirin_Tor_Offensive_Captain_Elleane_Wavecrest"] = "Capitaine Elleane Hautevague"
L_Units["Kirin_Tor_Offensive_Warmage_Yurias"] = "Mage de guerre Yurias"

L_Units["Kirin_Tor_Offensive_Sanitation_Sorcerer_Stephen_Litmatch"] = "Expert en assainissement Stephen Allumefeu"
L_Units["Kirin_Tor_Offensive_Lyalia"] = "Lyalia"

L_Units["Kirin_Tor_Offensive_Dalvin_Jaacor"] = "Dalvin Jaacor"
L_Units["Kirin_Tor_Offensive_Ako"] = "Ako"

L_Units["Kirin_Tor_Offensive_Taoshi"] = "Taoshi"

L_Units["Sunreaver_Onslaught_Archmage_Aethas_Sunreaver"] = "Archimage Aethas Saccage-soleil"
L_Units["Sunreaver_Onslaught_Grand_Magister_Rommath"] = "Grand magistère Rommath"
L_Units["Sunreaver_Onslaught_Lor-themar_Theron"] = "Lor’themar Theron"
L_Units["Sunreaver_Onslaught_Halduron_Brightwing"] = "Halduron Luisaile"

L_Units["Sunreaver_Onslaught_Scout_Captain_Elsia"] = "Capitaine des éclaireurs Elsia"
L_Units["Sunreaver_Onslaught_Magister_Edien_Sunhollow"] = "Magistère Edien Solcreuse"

L_Units["Sunreaver_Onslaught_Girana_the_Blooded"] = "Girana Premier-Sang"
L_Units["Sunreaver_Onslaught_Captain_Aerthas_Firehawk"] = "Capitaine Aerthas Faucon-de-feu"
L_Units["Sunreaver_Onslaught_Ryshelle_Brightlock"] = "Ryshelle Bouclevive"

L_Units["Sunreaver_Onslaught_Magister_Hathorel"] = "Magistère Hathorel"
L_Units["Sunreaver_Onslaught_High_Arcanist_Savor"] = "Grand arcaniste Savor"

L_Units["Sunreaver_Onslaught_Amalia_Penshire"] = "Amalia Penshire"
L_Units["Sunreaver_Onslaught_Sunwalker_Dezco"] = "Marche-soleil Dezco"

L_Units["Sunreaver_Onslaught_Elina_Zaralae"] = "Elina Zaralae"
L_Units["Sunreaver_Onslaught_Kethiel_Sunlance"] = "Kethiel Lance-Solaire"

L_Units["Sunreaver_Onslaught_Taoshi"] = "Taoshi"

L_Units["Sunreaver_Onslaught_"] = nil

L_Units["Empty_Crate"] = "Caisse de ravitaillement vide"
L_Units["Work_Order"] = "Commandes"