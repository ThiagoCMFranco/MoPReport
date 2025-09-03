--Translator Thiago Franco
if GetLocale() ~= "ptBR" then return end
local _, qcc = ...
qcc.L_Units = {}
local L_Units = qcc.L_Units

--World Bosses

L_Units["World_Bosses_Names_Ordos"] = "Ordos, o Deus-Fogo dos Yaungóis"
L_Units["World_Bosses_Names_Sha"] = "Sha da Raiva"
L_Units["World_Bosses_Names_Oondasta"] = "Oondasta"
L_Units["World_Bosses_Names_Gaileon"] = "Bando Gerreiro de Salyis"
L_Units["World_Bosses_Names_Nalak"] = "Nalak, o Senhor da Tempestade"
L_Units["World_Bosses_Names_Celestials"] = "Os Celestiais"

-- Order

L_Units["Cloud_Serpent_Jenova_Longeye"] = "Jenova Vistalonga"
L_Units["Cloud_Serpent_Elder_Anli"] = "Anciã Anli"
L_Units["Cloud_Serpent_Instructor_Skythorn"] = "Instrutor Espinho Celeste"
L_Units["Cloud_Serpent_"] = nil  --Necessita dividir em referências individuais para cada NPC.
L_Units["Cloud_Serpent_Hatchling_Serpent"] = "Sua Serpentinha | Sua serpente das nuvens" --"Your Hatchling | Your Cloud Serpent"
L_Units["Cloud_Serpent_Ningna_Darkwheel"] = "Ningna Disco Negro"
L_Units["Cloud_Serpent_Qua-Ro_Whitebrow"] = "Qua-Ro Testa Branca"
L_Units["Cloud_Serpent_Suchi_the_Sweet"] = "Suchi, a Fofa"
L_Units["Cloud_Serpent_Big_Bao"] = "Baozão"


--Shado-Pan

L_Units["Shado_Pan_Ban_Bearheart"] = "Ban Coração de Urso"
L_Units["Shado_Pan_Ling_of_the_Six_Pools"] = "Ling dos Seis Lagos"
L_Units["Shado_Pan_Master_Snowdrift"] = "Mestre Monte de Neve"

--The Klaxxi

L_Units["The_Klaxxi_Kil'ruk_the_Wind-Reaver"] = "Kil'ruk, o Aniquilador dos Ventos"
L_Units["The_Klaxxi_Kaz'tik_the_Manipulator"] = "Kaz'tik, o Manipulador"
L_Units["The_Klaxxi_Korven_the_Prime"] = "Korven, o Escolado"
L_Units["The_Klaxxi_Rik'kal_the_Dissector"] = "Rik'kal, o Dissecador"
L_Units["The_Klaxxi_Xaril_the_Poisoned_Mind"] = "Xaril, a Mente Envenenada"
L_Units["The_Klaxxi_Hisek_the_Swarmkeeper"] = "Hisek, o Guardião do Enxame"
L_Units["The_Klaxxi_Ashes_of_Warlord_Gurthan"] = "Cinzas do Senhor da Guerra Gurthan"
L_Units["The_Klaxxi_Enormous_Kunchong_Mandibles"] = "Mandíbulas de Kunchong Enormes"
L_Units["The_Klaxxi_Massive_Kyparite_Core"] = "Núcleo de Kyparita Gigante"

-- The Tillers

L_Units["The_Tillers_Farmer_Yoon"] = "Fazendeiro Yoon"
L_Units["The_Tillers_Andi"] = "Andi"
L_Units["The_Tillers_Visitor"] = "Visitantes" --Necessita dividir em referências individuais para cada NPC.

-- The Anglers
L_Units["The_Tillers_"] = "" --Necessita dividir em referências individuais para cada NPC.

-- Celestials

L_Units["The_August_Celestials_Thelonius"] = "Thelonius"
L_Units["The_August_Celestials_Kuo-Na_Quillpaw"] = "Kuo-Na Pata Pena"
L_Units["The_August_Celestials_Yan_Quillpaw"] = "Yan Pata Pena"
L_Units["The_August_Celestials_Ogo_the_Elder"] = "Ogo, o Ancião"
L_Units["The_August_Celestials_Ogo_the_Youger"] = "Ogo, o Jovem"
L_Units["The_August_Celestials_High_Adept_Paosha"] = "Alto Adepto Paosha"
L_Units["The_August_Celestials_Yak-Keeper_Kyana"] = "Tratador de Iaque Kyana"
L_Units["The_August_Celestials_Sentinel_Commander_Qipan"] = " Comandante de Sentinelas Qipan"
L_Units["The_August_Celestials_Elder_Sage_Tai-Feng"] = "Mestre Ancião Tai-Feng"

L_Units["The_August_Celestials_Sage_Whiteheart"] = "Sábio Coração Branco"
L_Units["The_August_Celestials_Sage_Lotusbloom"] = "Sábia Botão de Lótus"
L_Units["The_August_Celestials_Elder_Sage_Storm-Sing"] = "Mestra Anciã Monção-Sing"
L_Units["The_August_Celestials_Xuen"] = "Xuen"
L_Units["The_August_Celestials_Lin_Tenderpaw"] = "Lin Pata Tenra"

-- Operation: Shieldwall

L_Units["Operation_Shieldwall_Sully_The_Pickle_McLeary"] = "Sully McLeary, o Picles"
L_Units["Operation_Shieldwall_Hilda_Hornswaggle"] = "Hilda Traquitana"
L_Units["Operation_Shieldwall_Marshal_Troteman"] = "Marechal Troteman"
L_Units["Operation_Shieldwall_Mishka"] = "Mishka"
L_Units["Operation_Shieldwall_Sky_Admiral_Rogers"] = "Almirante do Céu Rogers"
L_Units["Operation_Shieldwall_Seraphine_of_the_Winter"] = "Serafina do Inverno"
L_Units["Operation_Shieldwall_Amber_Kearnen"] = "Amber Kearnen"
L_Units["Operation_Shieldwall_Tinkmaster_Overspark"] = "Mestre-faz-tudo Superchispa"
L_Units["Operation_Shieldwall_Huntsman_Blake"] = "Guarda-caça Blake"

-- Dominance Offensive

L_Units["Dominance_Offensive_Jorn_Skyseer"] = "Jorn Vidente do Céu"
L_Units["Dominance_Offensive_Grizzle_Gearslip"] = "Grislo Engrenário"
L_Units["Dominance_Offensive_Daxil_The_Gem_Oregrind"] = "Daxil Quebraferro, a 'Gema'"
L_Units["Dominance_Offensive_Boss-Lady_Trixel"] = "Chefona Trixel"
L_Units["Dominance_Offensive_Bounty_Board"] = "Quadro de Recompensas"
L_Units["Dominance_Offensive_Bixy_Buzzsaw"] = "Bixy Serrote"
L_Units["Dominance_Offensive_Duke"] = "Duque"
L_Units["Dominance_Offensive_Rivett_Clutchpop"] = "Pinno Estalagarra"
L_Units["Dominance_Offensive_Zino_The_Shredder_Quickchop"] = "Zino Picadinho, o Fatiador"
L_Units["Dominance_Offensive_Kaelis_Sunsoar"] = "Kaelis Planassol"
L_Units["Dominance_Offensive_Blood_Guard_Gro_tash"] = "Guarda-de-sangue Gro'tash"
L_Units["Dominance_Offensive_Brolic"] = "Brolic"
L_Units["Dominance_Offensive_Shokia"] = "Shokia"
L_Units["Dominance_Offensive_Zazzix_Toasty_Sparkrocket"] = "Zazzix Foguetelouco, o Tostado"
L_Units["Dominance_Offensive_Shademaster_Kiryn"] = "Mestressombra Kiryn"

L_Units["Kirin_Tor_Offensive"] = nil

L_Units["Sunreaver_Onslaught_"] = nil
L_Units["Golden_Lotus_"] = nil

L_Units["Empty_Crate"] = "Caixote Vazio"
L_Units["Work_Order"] = "Ordem de Serviço"