
-- INSTRUCTIONS FOR LOCALIZATION

-- 1 ) Please avoid the "SYSTEM MESSAGES" as those are necessary for the addon code to properly identify and parse them. those are already complete.
-- 2 ) Any statement that "= true" needs to still be translated. Just remove the 'true' and replace it with the proper translation, in quotations 
--     Please include the {name} for where the player names should appear, as well as the few instances {num} needs to be included (referring to number)
-- 3 ) If appropriate, in the context of the sentence, please keep the spacing properly.
-- 4 ) Report any issues to Arkaan on CurseForge or Discord. -- You can also find me Battle.net @  DNADissector#1958   (US)
-- 5 ) THANK YOU SO MUCH FOR ADDING THIS TRANSLATION WORK!!! I will ensure you are mentioned in the release notes and at the top of this header for your contribution

-- Data insert points:
--  {name} and {name2}
--  {num}
--  {custom1} and {custom2}

    -- EXAMPLE NOTATION (English to Spanish)

    -- GRM_L["{name}'s Anniversary!"] = "Aniversario de {name}"

    ---------------------------------
    -- BEGIN TRANSLATION WORK HERE --
    ---------------------------------

GRML.Russian = function()

    GRM_L["Guild"] = "Гильдия"

    -- PLAYER MAIN ROSTER DETAILS WINDOW
    GRM_L["Level: "] = "-го уровня"
    GRM_L["Level"] = "-го уровня"
    GRM_L["Note:"] = "Заметка:"
    GRM_L["Note"] = "Заметка"
    GRM_L["Officer's Note:"] = "Офицерская заметка:"
    GRM_L["Officer's Note"] = "Офиц. заметка"
    GRM_L["Zone:"] = "Зона:"
    GRM_L["(main)"] = "(main)"
    GRM_L["( Main )"] = "( Main )"                    -- Context: This one is used on player data window, the other is smaller used in the alts list...
    GRM_L["Set as Main"] = "Выберать как основу"
    GRM_L["Set as Alt"] = "Выбрать как твинк"
    GRM_L["Remove"] = "Удалить"
    GRM_L["Please Type the Name of the alt"] = "Ведите имя твинка"
    GRM_L["Promoted:"] = "Повышен:"
    GRM_L["Unknown"] = "Неизвестно"                                                                 -- Context: The date of their promotion is "Unknown"
    GRM_L["Click here to set a Public Note"] = "Нажмите, для записи Публичной заметки"
    GRM_L["Unable to Edit Public Note at Rank"] = true
    GRM_L["Click here to set an Officer's Note"] = "Нажмите, для записи Офицерской заметки"
    GRM_L["Unable to Edit Officer Note at Rank"] = true
    GRM_L["Unable to View Officer Note at Rank"] = true
    GRM_L["Online"] = "Онлайн"
    GRM_L["( Active )"] = true                       -- I included the parentheses here as I am not sure if any languages abstain from them, or use other notation. Feel free to remove if necessary
    GRM_L["( AFK )"] = true
    GRM_L["( Busy )"] = true
    GRM_L["( Mobile )"] = true
    GRM_L["( Offline )"] = true
    GRM_L["Set Join Date"] = "Уст. дату"
    GRM_L["Edit Promo Date"] = "Редактировать дату"
    GRM_L["Edit Join Date"] = "Редактировать дату"
    GRM_L["Set Promo Date"] = "Уст. дату"
    GRM_L["In Group"] = true                            -- Context: "Player is already In Group with you"
    GRM_L["Group Invite"] = true
    GRM_L["No Invite"] = true
    GRM_L["Group Invite"] = true
    GRM_L["Date Promoted?"] = "Дата повышения?"
    GRM_L["Last Online"] = "Посл. онлайн"
    GRM_L["Time In:"] = "Время в:"            -- Context: "Time In" the current zone...
    GRM_L["Date Joined"] = "Дата вербовки"
    GRM_L["Join Date?"] = "Выберите дату"
    GRM_L["Player Was Previously Banned!"] = true
    GRM_L["Ignore Ban"] = true
    GRM_L["Player Alts"] = "Твинки игрока"
    GRM_L["Add Alt"] = "Добавить твинка"
    GRM_L["Choose Alt"] = "Выберите твинка"
    GRM_L["(Press Tab)"] = "(Нажмите Tab)" 
    GRM_L["Shift-Mouseover Name On Roster Also Works"] = "Shift+ПКМ по имени работает"
    GRM_L["Guild Log"] = "Гильд. Журнал"

    -- TOOLTIPS
    GRM_L["Rank History"] = true 
    GRM_L["Time at Rank:"] = true
    GRM_L["Right-Click to Edit"] = true
    GRM_L["Left Guild"] = true
    GRM_L["Membership History"] = true
    GRM_L["Joined:"] = "Вербовка:"                             -- as in "Joined" the guild
    GRM_L["Joined"] = "Вербовка"
    GRM_L["Left:"] = "Покинул:"                            	-- as in, "Left" the guild
    GRM_L["Rejoined:"] = "Вернулся:"                         -- as in, "Rejoined" the guild
    GRM_L["Reset Data!"] = true
    GRM_L["Notify When Player is Active"] = true
    GRM_L["Notify When Player Goes Offline"] = true
    GRM_L["Notify When Player Comes Online"] = true
    GRM_L["Edit Date"] = "Измен. дату"
    GRM_L["Clear History"] = "Отчистить историю"
    GRM_L["Options"] = "Опции"
    GRM_L["Cancel"] = "Отмена"
            
    -- LOG
    GRM_L["LOG"] = "Журнал"                -- Context - The guild Log shorthand for the tab
    GRM_L["Guild Roster Event Log"] = "Журнал событий"
    GRM_L["Clear Log"] = "Отчистить журнал"
    GRM_L["Really Clear the Guild Log?"] = "Уверены, что хотите отчистить журнал гильдии?"
    GRM_L["{name} DEMOTED {name2}"] = "{name} РАЗЖАЛОВАЛ {name2}"
    GRM_L["{name} PROMOTED {name2}"] = "{name} ПОВЫСИЛ {name2}"
    GRM_L["{name} KICKED {name2} from the Guild!"] = "{name} ИСКЛЮЧИЛ игрока {name2} из гильдии"
    GRM_L["kicked"] = "исключен"
    GRM_L["{name} has Left the guild"] = "{name} вышел из гильдии"
    GRM_L["{name} INVITED {name2} to the guild."] = "{name} ПРИГЛОСИЛ игрока {name2} в гильдию"
    GRM_L["{name} has BANNED {name2} and all linked alts from the guild!"] = "{name} ЗАБАНИЛ игрока {name2} и всех его твинков в гильдие"
    GRM_L["{name} has BANNED {name2} from the guild!"] = "{name} ЗАБАНИЛ игрока {name2} в гильдие"
    GRM_L["Reason Banned:"] = "Причина БАНа"
    GRM_L["has Left the guild"] = "покинуд гильдию"       -- Context: PlayerName "has left the guild"
    GRM_L["ALTS IN GUILD:"] = "ТВИНКОВ В ГИЛЬДИИ:"    -- Context: This appears If a person leaves the guild and there are still alts in the guild. It is like - "ALTS IN GUILD: Arkaan, Chris, Matt, and 4 others.""
    GRM_L["Player no longer on Server"] = "Игрок больше не на сервере"
    GRM_L["{name} PROMOTED {name2} from {custom1} to {custom2}"] = "{name} ПОВЫСИЛ {name2} из {custom1} в {custom2}"
    GRM_L["{name} has been PROMOTED from {custom1} to {custom2}"] = "{name} был ПОВЫШЕН из {custom1} в {custom2}"
    GRM_L["{name} DEMOTED {name2} from {custom1} to {custom2}"] = "{name} РАЗЖАЛОВАЛ {name2} из {custom1} в {custom2}"
    GRM_L["{name} has been DEMOTED from {custom1} to {custom2}"] = "{name} был РАЗЖАЛОВАН из {custom1} в {custom2}"
    GRM_L["(+ {num} More)"] = "(и {num} других)"    -- Context: Referencing num of alts if player leaves guild, that are stil in it. Example "ALTS IN GUILD: Christ, Matt, Sarah (and 4 more)"
    GRM_L["{name} has Been in the Guild {num} Times Before"] = "{name} был в гильдии {num} назад"
    GRM_L["{name} is Returning for the First Time."] = "{name} Вернулся в перный раз."
    GRM_L["None Given"] = "Без причины "                                             -- Context: No reason given for player ban. This is displayed when a player was banned, but the addon users did not input a reason why.
    GRM_L["WARNING!"] = "ВНИМАНИЕ!"    -- Context: WARNING - banned player rejoined the guild!
    GRM_L["{name} REJOINED the guild but was previously BANNED!"] = "{name} ВЕРНУЛСЯ в гильдию, но ранне был ЗАБАНЕН!"
    GRM_L["(Invited by: {name})"] = "(Приглашен кем: {name})"
    GRM_L["Invited By: {name}"] = "Приглашен кем: {name}"
    GRM_L["Date of Ban:"] = "Дата БАНа:"
    GRM_L["Date Originally Joined:"] = "Дата первой вербовки:"
    GRM_L["Old Guild Rank:"] = "Старое звание:"
    GRM_L["Reason:"] = "Причина:"
    GRM_L["Additional Notes:"] = "Дополнительные заметки"
    GRM_L["{name} has REINVITED {name2} to the guild"] = "{name} был ПЕРЕПРЕГЛАШЕН игроком {name} в гильдию"
    GRM_L["(LVL: {num})"] = "(УРОВЕНЬ: {num})"     -- Context: LVL means Player Level - so Ex: (LVL: 110)
    GRM_L["{name} has REJOINED the guild"] = "{name} ВЕРНУЛСЯ в гильдию"
    GRM_L["{name} has JOINED the guild!"] = "{name} ЗАВЕРБОВАН(а) в гильдию"
    GRM_L["Date Left:"] = "Дата выхода:"
    GRM_L["{name} has Leveled to {num}"] = "{name} повысил уровень до {num}"
    GRM_L["Leveled to"] = "Повысил уровень до"                                           -- For parsing the message, please include the string found in previous "has leveled to" message
    GRM_L["(+{num} levels)"] = "(+{num} уровней)"                                        -- Context: Person gained more than one level, hence the plural
    GRM_L["(+{num} level)"] = "(+{num} уровень)"                                         -- Context: Person gains a level, just one level.
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Added"] = "ПУБЛИЧНАЯ заметка \"{custom1}\" игрока {name} добавлена"           -- Of note, the \" in the text here will just appear as " in-game. The \" notation is telling the program not to end the string, but to include quotation
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Removed"] = "ПУБЛИЧНАЯ заметка \"{custom1}\" игрока {name} удалена"
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" to \"{custom2}\""] = "ПУБЛИЧНАЯ заметка \"{custom1}\" игрока {name} изменена на \"{custom2}\""    -- Context: "Arkaan's PUBLIC Note: "ilvl 920" to "Beast Mode ilvl 960""  -- Changing of the note. custom1 = old note, custom2 = new note
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Added"] = "ОФИЦЕРСКАЯ заметка \"{custom1}\" игрока {name} добавлена"
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Removed"] = "ОФИЦЕРСКАЯ заметка \"{custom1}\" игрока {name} удалена"
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" to \"{custom2}\""] = "ОФИЦЕРСКАЯ заметка \"{custom1}\" игрока {name} изменена на \"{custom2}\""
    GRM_L["Guild Rank Renamed from {custom1} to {custom2}"] = "Гильдейское звание переименовано с {custom1} на {custom2}"
    GRM_L["{name} has Name-Changed to {name2}"] = "{name} переименовано на {name2}"
    GRM_L["{name} has Come ONLINE after being INACTIVE for {num}"] = "{name} ВЕРНУЛСЯ игру после ОТСУТСТВИЯ втечение {num}"
    GRM_L["{name } Seems to Have Name-Changed, but their New Name was Hard to Determine"] = "{name } кажется изменил имя, но новое имя трудно определить"
    GRM_L["It Could Be One of the Following:"] = "Может быть одним из следующих:"
    GRM_L["{name} has been OFFLINE for {num}. Kick Recommended!"] = "{name} был ОФФЛАЙН втечение {num}. Рекомендуется исключить!"
    GRM_L["({num} ago)"] = "{num} спустя"    -- Context: (5 minutes ago) or (5 months 24 days ago) -- the {num} will automatically include the time-passed date.
    GRM_L["{name}'s Guild has Name-Changed to \"{name2}\""] = "Гильдия \"{name}\" изменила имя на \"{name2}\""
    GRM_L["{name} will be celebrating {num} year in the Guild! ( {custom1} )"] = "{name} празднует {num} год в гильдии! ( {custom1} )" -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild! ( {custom1} )"] = "{name} празднует {num} лет в гильдии! ( {custom1} )"          -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["Promotions"] = "Повышение"
    GRM_L["Demotions"] = "Разжалование"

     -- EVENTS WINDOW
    GRM_L["EVENTS"] = ("События")                                          -- Events tab
    GRM_L["{name}'s Anniversary!"] = ("{name}'s Юбилей!")
    GRM_L["{name}'s Birthday!"] = ("День рождения {name}'s!")
    GRM_L["Please Select Event to Add to Calendar"] = ("Выберите событие")
    GRM_L["No Calendar Events to Add"] = ("Нет добавленых событий")
    GRM_L["Event Calendar Manager"] = ("Настройка событий")
    GRM_L["Event:"] = ("События")
    GRM_L["Description:"] = ("Описание")
    GRM_L["Add to\nCalendar"] = ("Добавить")
    GRM_L["Ignore Event"] = ("Игнор события")
    GRM_L["No Player Event Has Been Selected"] = ("События игрока не выбрано")
    GRM_L["Event Added to Calendar: {custom1}"] = ("Событие добавлено в календарь:{custom1}")            -- Custom1 = the title of the event, like "Arkaan's Anniversary"
    GRM_L["Please Select Event to Add to Calendar"] = ("Пожалуста выберите событие для добавление в календарь")
    GRM_L["No Calendar Events to Add"] = ("Нет событий для добавления")
    GRM_L["{name}'s event has already been added to the calendar!"] = ("Событие {name} уже добавлено в каленьдарь")
    GRM_L["Please wait {num} more seconds to Add Event to the Calendar!"] = ("Подождите {num} секунд, чтобы добавить событие в календарь")
    GRM_L["{name}'s Event Removed From the Que!"] =("{name} событие удалено")
    GRM_L["Full Description:"] = ("Полное описание:")

    -- BAN WINDOW
    GRM_L["BAN LIST"] = "БАН лист"                                        -- Ban List Tab
    GRM_L["Reason Banned?"] = "Причина БАНа?"
    GRM_L["Click \"YES\" When Done"] = "Нажмине \"ДА\" по окончании"     -- Of note, the \" is how you notate for quotations to actually appear. Adjust as needed
    GRM_L["Select a Player"] = "Выберитье игрока"
    GRM_L["Player Selected"] = "Выбранный игрок"
    GRM_L["{name}(Still in Guild)"] = "{name}(еще в гильдии)"
    GRM_L["(Still in Guild)"] = "(еще в гильдии)"
    GRM_L["No Ban Reason Given"] = "Без причины БАНа"
    GRM_L["Reason:"] = "Причина:"                                         -- Context: As in, "Reason Banned"
    GRM_L["Total Banned:"] = "Всего забанено:"
    GRM_L["Rank"] = "Звание"
    GRM_L["Ban Date"] = "Дата БАНа"
    GRM_L["No Players Have Been Banned from Your Guild"] = "Нет забаненых игроков"
    GRM_L["Remove Ban"] = "Снять БАН"
    GRM_L["Add Player to Ban List"] = "Выберите игрока в список банов"
    GRM_L["Server:"] = "Сервер:"
    GRM_L["Class:"] = "Класс:"
    GRM_L["Reason:"] = "Причина:"
    GRM_L["It is |CFFFF0000CRITICAL|r the player's name and server are spelled correctly for accurate tracking and notifications."] = "|CFFFF0000ВАЖНО|r ввести верные имя и сервер для отслеживания и оповещения"
    GRM_L["Submit Ban"] = "Отправить БАН"
    GRM_L["Confirm"] = "Подтвердить"
    GRM_L["Cancel"] = "Отмена"
    GRM_L["Add"] = "Добавить"            -- Context: "Add" player to ban list
    GRM_L["Confirm Ban for the Following Player?"] = "Подтвердить запрет для следующего игрока?"
    GRM_L["Please Enter a Valid Player Name"] = "Введине действующе имя игрока"     -- Player Name
    GRM_L["Please Enter a Valid Server Name"] = "Введите ействующий сервер игрока"    -- Server Name
    GRM_L["Please Select a Player to Unban!"] = "Выберите игока для РАЗБАНА!"
    GRM_L["{name} - Ban List"] = "{name} - БАН лист"       -- Context: "GuildName - Ban List"
    GRM_L["No Reason Given"] = "Без причины"

    -- ADDON USERS WINDOW
    GRM_L["SYNC USERS"] = "Синх Users"
    GRM_L["Ok!"] = true
    GRM_L["Their Rank too Low"] = true
    GRM_L["Your Rank too Low"] = true
    GRM_L["Outdated Version"] = true
    GRM_L["You Need Updated Version"] = true
    GRM_L["Player Sync Disabled"] = true
    GRM_L["No Guildie Online With Addon."] = true
    GRM_L["ONE Person is Online. Recommend It!"] = true
    GRM_L["{num} others are Online! Recommend It!"] = true
    GRM_L["GRM Sync Info"] = "GRM Инфо о синхронизации"
    GRM_L["Ver: {custom1}"] = "Ver: {custom1}"  -- Context:  Ver: R1.125  - Ver is short for Version
    GRM_L["Name:"] = "Имя:"
    GRM_L["Version"] = "Версия:"
    GRM_L["Sync"] = "Синх"
    GRM_L["Your Sync is Currently Disabled"] = true

    -- OPTIONS WINDOW
    GRM_L["Add Join Date to:  |cffff0000Officer Note|r"] = "Добавлять дату вербовки в: |cffff0000Офицерскую заметку|r"         -- Context: Please keep |cffff0000 for color coding of the text, and the |r to signify the end of color change
    GRM_L["Add Join Date to:  Officer Note"] = "Добавлять дату вербовки в: Офицерскую заметку"
    GRM_L["Public Note"] = "Публичную заметку"
    GRM_L["Scanning Roster:"] = "Сканирование журнала"
    GRM_L["Guild Rank Restricted:"] = "Ограничено для звания:"
    GRM_L["Sync:"] = "Синх:"
    -- Options window -- of note, these are very concise statements. They may need to be adjusted properly in the Options window for proper spacing, so verify they look ok after translating.
    GRM_L["Slash Commands"] = "Команды в чате"
    GRM_L["Trigger scan for changes manually"] = "Принудительный запуск сканирования"
    GRM_L["Trigger sync one time manually"] = "Принудительный запуск синхронизации"
    GRM_L["Centers all Windows"] = "Центрировать все окна"
    GRM_L["Slash command info"] = "Доп. команды чата"
    GRM_L["Resets ALL data"] = "Удалить все данные"
    GRM_L["Report addon ver"] = "Сообщить версию аддона"                     -- Ver is short for Version
    GRM_L["Resets Guild data"] = "Удалить гильдейские данные"
    GRM_L["Show at Logon"] = "Открывать при входе"
    GRM_L["Only Show if Log Changes"] = "Только при изменении в журнале"
    
    -- This do need to be translated still
    GRM_L["Before Scan Timer"] = "Сканировать каждые"                  -- Context: "Scan for Changes Every 10 Seconds" -- There will be a number added here and may require custom positioning, so please provide full statement and Arkaan will allign
    GRM_L["After Scan Timer"] = "Секунд"
    GRM_L["Before Inactive Timer"] = "Уведомлять, если игрок оффлайн"
    GRM_L["After Inactive Timer"] = "дней."

    GRM_L["Reactivating SCAN for Guild Member Changes..."] = true
    GRM_L["Deactivating SCAN of Guild Member Changes..."] = true
    GRM_L["Due to server data restrictions, a scan interval must be at least 10 seconds or more!"] = true
    GRM_L["Please choose an scan interval 10 seconds or higher!"] = true
    GRM_L["{num} is too Low!"] = true
    GRM_L["The Current Lvl Cap is {num}."] = true
    GRM_L["Kick Inactive Player Reminder at"] = "Искключать игрока, неактивного в течение"      -- Context: "Kick Inactive Player Reminder at X Months" - Again, allignment will need to be adjusted for options UI, so please post
    GRM_L["Please choose a month between 1 and 99"] = true
    GRM_L["Sync BAN List With Guildies at Rank"] = "Синх. БАН лист с согильдейцами звания"     -- Context: "Sync Ban List with Guildies at Rank [DROPDOWNMENU OF RANKS] or Higher" - Please show where dropdown menu should be pinned
    GRM_L["or Higher"] = "или выше"                               -- Context: Look at the above statement. Show where this needs to go in regards to dropdown menu of rank selection in Options
    GRM_L["Restore Defaults"] = "Вернуть стандартные"
    GRM_L["Please choose between 1 and 180 days!"] = "Пожалуйста, выберите от 1 до 180 дней!"
    GRM_L["Announce Events"] = "Анонс событий за"    -- Context: "Announce Events X number of days in advance" -- the X is the editbox to modify number of days. Please include the location of where to pin that.
    GRM_L["Days in Advance"] = "дней."
    GRM_L["Please choose between 1 and 28 days!"] = true
    GRM_L["Add Events to Calendar"] = "Добавлять события в календарь"
    GRM_L["SYNC Changes With Guildies at Rank"] = "Синхронизировать с согильдейцами звания"      -- Context: at Rank [DROPDOWNRANKSELECTION] or Higher. - Please note where to place dropdown box in the position of the sentence.
    GRM_L["Reactivating Data SYNC with Guildies..."] = true
    GRM_L["Deactivating Data SYNC with Guildies..."] = true
    GRM_L["Display Sync Update Messages"] = "Отображать сообщения о синхронизации"
    GRM_L["Only Sync With Up-to-Date Addon Users"] = "Синх. ТОЛЬКО с пользователями с ПОСЛЕДНЕЙ версией аддона"
    GRM_L["Only Announce Anniversaries if Listed as 'Main'"] = "Объявлять юбилеи только для ОСНОВНЫХ персонажей"
    GRM_L["Leveled"] = "lvlup"
    GRM_L["Min:"] = "Мин"                                   -- Context: As in, the Minimum level to report or announce when player levels up
    GRM_L["Inactive Return"] = "Возвращ. неактив."
    GRM_L["resetall"] = "СбросВсе"
    GRM_L["resetguild"] = "СбросГИ"
    GRM_L["Notify When Players Request to Join the Guild"] = "Уведомлять о запросах присоединения в ГИ"
    --Side chat/log controls - Of note, limited spacing
    GRM_L["Name Change"] = "Смена имени"
    GRM_L["Rank Renamed"] = "Переим. звания"
    GRM_L["Event Announce"] = "Анонс события"
    GRM_L["Left"] = "Покинул"                        -- Context: As in, "Left" the guild...
    GRM_L["Recommendations"] = "Рекомендации"
    GRM_L["Banned"] = "БАН"
    GRM_L["To Chat:"] = "В Чате"                    -- Context: "To Chat Message frame -- in regards to announcing events like when a player leveled"
    GRM_L["To Log:"] = "В журнале"                    -- Context: To show it in the guild log.
    GRM_L["Display Changes"] = "Отображение изменений"
    GRM_L["Syncing too fast may cause disconnects!"] = "Очень быстрая синх. может привести к дисконекту!"
    GRM_L["Speed:"] = "Скорость:"                     -- Context: Speed that the sync takes place.
    GRM_L["Show 'Main' Name in Chat"] = "Писать имя 'Основы' в чате"

    -- AUDIT WINDOW
    GRM_L["AUDIT"] = "Аудит"                            -- Audit Tab name
    GRM_L["No Date Set"] = "НЕТ даты"
    GRM_L["Main"] = "Основа"
    GRM_L["Main or Alt?"] = "Основа или Твинк"
    GRM_L["Alt"] = "Твинк"
    GRM_L["Total Incomplete: {num} / {custom1}"] = "Всего незаполненых: {num} / {custom1}" -- Context: Total Incomeplete: 50 / 100    (50 out of 100)
    GRM_L["Mains: {num}"] = "Основ: {num}"        -- Context: Number of "main" toons
    GRM_L["Unique Accounts: {num}"] = "Уникальных акк-ов: {num}"
    GRM_L["All Complete"] = "Все заполнено"                                       -- Context: ц
    GRM_L["Set Incomplete to Unknown"] = "Заменить неполные на \"Неизвестно\"" -- Context: Implied to set ALL incomplete to unknown
    GRM_L["Clear All Unknown"] = "Отчистить все \"Неизвестно\""
    GRM_L["Please Wait {num} more Seconds"] = "Подождите еще {num} секунд"
    GRM_L["Guild Data Audit"] = "Аудит членов гильдит"
    GRM_L["Name"] = "Имя"
    GRM_L["Join Date"] = "Дата вербовки"
    GRM_L["Promo Date"] = "Дата повышения"
    GRM_L["Main/Alt"] = "Основа/твинк"
    GRM_L["Click Player to Edit"] = "ЛКМ для редакт."
    GRM_L["Only Show Incomplete Guildies"] = "Только неполные записи"

    -- ADDON SYSTEM MESSAGES
    GRM_L["Guild Roster Manager"] = true
    GRM_L["GRM:"] = true                                                                -- Abbreviation for "Guild Roster Manager"
    GRM_L["(Ver:"] = true                                                               -- Ver: is short for Version:
    GRM_L["GRM Updated:"] = true
    GRM_L["Configuring Guild Roster Manager for {name} for the first time."] = true
    GRM_L["Reactivating Auto SCAN for Guild Member Changes..."] = true
    GRM_L["Reactivating Data Sync..."] = true
    GRM_L["Notification Set:"] = true
    GRM_L["Report When {name} is ACTIVE Again!"] = true
    GRM_L["Report When {name} Comes Online!"] = true
    GRM_L["Report When {name} Goes Offline!"] = true
    GRM_L["A new version of Guild Roster Manager is Available!"] = true
    GRM_L["Please Upgrade!"] = true
    GRM_L["Player Does Not Have a Time Machine!"] = true
    GRM_L["Please choose a valid DAY"] = true
    GRM_L["{name} has been Removed from the Ban List."] = true
    GRM_L["{num} Players Have Requested to Join the Guild."] = true
    GRM_L["A Player Has Requested to Join the Guild."] = true
    GRM_L["Click Link to Open Recruiting Window:"] = true
    GRM_L["Guild Recruits"] = true
    GRM_L["Scanning for Guild Changes Now. One Moment..."] = true
    GRM_L["Breaking current Sync with {name}."] = true
    GRM_L["Breaking current Sync with the Guild..."] = true
    GRM_L["Initializing Sync Action. One Moment..."] = true
    GRM_L["No Players Currently Online to Sync With..."] = true
    GRM_L["No Addon Users Currently Compatible for FULL Sync."] = true
    GRM_L["SYNC is currently not possible! Unable to Sync with guildies when guild chat is restricted."] = true
    GRM_L["There are No Current Applicants Requesting to Join the Guild."] = true
    GRM_L["The Applicant List is Unavailable Without Having Invite Privileges."] = true
    GRM_L["Manual Scan Complete"] = true
    GRM_L["Analyzing guild for the first time..."] = true
    GRM_L["Building Profiles on ALL \"{name}\" members"] = true                 -- {name} will be the Guild Name, for context
    GRM_L["NOTIFICATION:"] = true                                               -- Context:  "Notification: Player is no longer AFK"
    GRM_L["{name} is now ONLINE!"] = true
    GRM_L["{name} is now OFFLINE!"] = true
    GRM_L["{name} is No Longer AFK or Busy!"] = true
    GRM_L["{name} is No Longer AFK or Busy, but they Went OFFLINE!"] = true
    GRM_L["{name} is Already in Your Group!"] = true
    GRM_L["GROUP NOTIFICATION:"] = true
    GRM_L["Players Offline:"] = true
    GRM_L["Players AFK:"] = true
    GRM_L["40 players have already been invited to this Raid!"] = true
    GRM_L["Player should try to obtain group invite privileges."] = true
    GRM_L["{name}'s saved data has been wiped!"] = true
    GRM_L["Re-Syncing {name}'s Guild Data..."] = true
    GRM_L["Wiping all Saved Roster Data Account Wide! Rebuilding from Scratch..."] = true
    GRM_L["Wiping all saved Guild data! Rebuilding from scratch..."] = true
    GRM_L["There are No Log Entries to Delete, silly {name}!"] = true
    GRM_L["Guild Log has been RESET!"] = true
    GRM_L["{name} is now set as \"main\""] = true
    GRM_L["{name} is no longer set as \"main\""] = true
    GRM_L["Reset All of {name}'s Data?"] = true
    
    -- /grm help
    GRM_L["Opens Guild Log Window"] = true
    GRM_L["Resets ALL saved data"] = true
    GRM_L["Resets saved data only for current guild"] = true
    GRM_L["Re-centers the Log window"] = true
    GRM_L["Triggers manual re-sync if sync is enabled"] = true
    GRM_L["Does a one-time manual scan for changes"] = true
    GRM_L["Displays current Addon version"] = true
    GRM_L["Opens Guild Recruitment Window"] = true
    GRM_L["WARNING! complete hard wipe, including settings, as if addon was just installed."] = true;

    -- General Misc UI
    GRM_L["Really Clear All Account-Wide Saved Data?"] = true
    GRM_L["Really Clear All Guild Saved Data?"] = true
    GRM_L["Yes!"] = "Да!"
    GRM_L["<M>"] = "<M>"                           -- <M> appears for "Main"
    GRM_L["Ban Player?"] = "ЗаБАНить игрока?"
    GRM_L["Ban the Player's {num} alts too?"] = "ЗаБАНить также {num} твинков?"        -- Plural number of alts
    GRM_L["Ban the Player's {num} alt too?"] = "ЗаБАНить также {num} твинка?"     -- Singular number of alts, just 1
    GRM_L["Please Click \"Yes\" to Ban the Player!"] = "Нажмите \"Да!\", чтобы заБАНить игрока!"

    -- Sync Messages
    GRM_L["{name} updated {name2}'s Join Date."] = true
    GRM_L["{name} updated {name2}'s Promotion Date."] = true
    GRM_L["\"{custom1}\" event added to the calendar by {name}"] = true
    GRM_L["{name} updated {name2}'s list of Alts."] = true
    GRM_L["{name} removed {name2}'s from {custom1}'s list of Alts."] = true
    GRM_L["{name} set {name2} to be 'Main'"] = true
    GRM_L["{name} has changed {name2} to be listed as an 'alt'"] = true
    GRM_L["{name} has Removed {name2} from the Ban List."] = true
    GRM_L["{name} has been BANNED from the guild!"] = true
    GRM_L["{name} has been UN-BANNED from the guild!"] = true
    GRM_L["Initiating Sync with {name} Instead!"] = true
    GRM_L["Sync Failed with {name}..."] = true
    GRM_L["The Player Appears to Be Offline."] = true
    GRM_L["There Might be a Problem With Their Sync"] = true
    GRM_L["While not ideal, Ask Them to /reload to Fix It and Please Report the Issue to Addon Creator"] = true
    GRM_L["Manually Syncing Data With Guildies Now... One Time Only."] = true
    GRM_L["Syncing Data With Guildies Now..."] = true
    GRM_L["(Loading screens may cause sync to fail)"] = true
    GRM_L["Sync With Guildies Complete..."] = true
    GRM_L["Manual Sync With Guildies Complete..."] = true
    GRM_L["No Players Currently Online to Sync With. Re-Disabling Sync..."] = true
    GRM_L["{name} tried to Sync with you, but their addon is outdated."] = true
    GRM_L["Remind them to update!"] = true

    
    -- ERROR MESSAGES
    GRM_L["Notification Has Already Been Arranged..."] = true
    GRM_L["Failed to add alt for unknown reason. Try closing Roster window and retrying!"] = true
    GRM_L["{name} is Already Listed as an Alt."] = true
    GRM_L["{name} cannot become their own alt!"] = true
    GRM_L["Player Cannot Add Themselves as an Alt"] = true
    GRM_L["Player Not Found"] = "Игрок не найден"
    GRM_L["Please try again momentarily... Updating the Guild Event Log as we speak!"] = true
    GRM_L["Invalid Command: Please type '/grm help' for More Info!"] = true
    GRM_L["{name} is not currently in a guild. Unable to Proceed!"] = true
    GRM_L["Addon does not currently support more than 75 alts!"] = true
    GRM_L["Please choose a VALID character to set as an Alt"] = true
    GRM_L["Please choose a character to set as alt."] = true
    GRM_L["GRM ERROR:"] = true
    GRM_L["Com Message too large for server"] = true                    -- Context: "Com message" is short-hand for "Communications message" - this is a technical error on syncing data.
    GRM_L["Prefix:"] = true
    GRM_L["Msg:"] = true                                                -- Context: Msg is short for Message
    GRM_L["Unable to register prefix > 16 characters: {name}"] = true   -- Context: The {name} is the string code for the prefix. This is for debugging.


    --SLASH COMMANDS
    -- These are generally written in general shorthand. The original commands will ALWAYS work, but if there is one that makes more sense in your language, please feel free to modify
    GRM_L["clearall"] = "СбросВсе"                       -- Context: In regards, "Clear All" saved data account wide 
    GRM_L["clearguild"] = "СбросГИ"                      -- Context: In regards, "Clear All" saved data from ONLY the current guild.
    GRM_L["hardreset"] = true                       -- Context: In regards, "Hard Reset" ALL data account wide, including wiping player settings
    GRM_L["help"] = "помощь"                            -- Context: "help" with info on the how to use addon
    GRM_L["version"] = "версия"                         -- Context: "version" of the addon
    GRM_L["center"] = "центр"                          -- Context: "center" the movable addon window back to center of screen
    GRM_L["sync"] = "синх"                            -- Context: "sync" the data between players one time now.
    GRM_L["scan"] = "скан"                            -- Context: "scan" for guild roster changes one time now.
    GRM_L["clearall"] = "СбросВсе"                        -- Context: In regards, "Clear All" saved data
    GRM_L["recruit"] = true                         -- Context: Open the roster "recruit" window where people request to join guild

    -- CLASSES
    GRM_L["Deathknight"] = "Рыцарь смерти"
    GRM_L["Demonhunter"] = "Охотник на демонов"
    GRM_L["Druid"] = "Друид"
    GRM_L["Hunter"] = "Охотник"
    GRM_L["Mage"] = "Маг"
    GRM_L["Monk"] = "Монах"
    GRM_L["Paladin"] = "Паладин"
    GRM_L["Priest"] = "Жрец"
    GRM_L["Rogue"] = "Разбойник"
    GRM_L["Shaman"] = "Шаман"
    GRM_L["Warlock"] = "Чернокнижник"
    GRM_L["Warrior"] = "Воин"

    -- TIME AND DATES
    GRM_L["1 Mar"] = "1 мар"                           -- This date is used in a specific circumstance. If someone's anniversary/bday landed on a leap year (Feb 29th), it defaults to the 1st of March on non-leap year
    -- Full Month Name
    GRM_L["January"] = "Январь"
    GRM_L["February"] = "Февраль"
    GRM_L["March"] = "Март"
    GRM_L["April"] = "Апрель"
    GRM_L["May"] = "Май"
    GRM_L["June"] = "Июнь"
    GRM_L["July"] = "Июль"
    GRM_L["August"] = "Август"
    GRM_L["September"] = "Сентябрь"
    GRM_L["October"] = "Октябрь"
    GRM_L["November"] = "Ноябрь"
    GRM_L["December"] = "Декабрь"
    -- Shorthand Month
    GRM_L["Jan"] = "янв"
    GRM_L["Feb"] = "фев"
    GRM_L["Mar"] = "мар"
    GRM_L["Apr"] = "апр"
    GRM_L["May"] = "май"
    GRM_L["Jun"] = "июнь"
    GRM_L["Jul"] = "июль"
    GRM_L["Aug"] = "авг"
    GRM_L["Sep"] = "сен"
    GRM_L["Oct"] = "окт"
    GRM_L["Nov"] = "ноя"
    GRM_L["Dec"] = "дек"
    -- Time Notifcation
    GRM_L["Seconds"] = "Секунд"
    GRM_L["Second"] = "Секунда"
    GRM_L["Minutes"] = "Минут"
    GRM_L["Minute"] = "Минута"
    GRM_L["Hours"] = "Часов"
    GRM_L["Hour"] = "Час"
    GRM_L["Days"] = "Дней"
    GRM_L["Day"] = "День"
    GRM_L["Months"] = "Месяцев"
    GRM_L["Month"] = "Месяц"
    GRM_L["Years"] = "Лет"
    GRM_L["Year"] = "Год"
    GRM_L["HourBreak"] = ":"            -- Context, in English, and many languages, 11am = 11:00 -- or in French, 11h00   - the hour break is the ":" or the "h" 

    GRM_L["am"] = "am"
    GRM_L["pm"] = "рm"
    GRM_L["24HR_Notation"] = "";        -- if someone is using 24hr time notation in your country, instead of 12hr, how do you notate it? In English, there is no am/pm (though "hours" is technically right, but unnecessary)

    GRM_L["{num} year"] = "{num} год"
    GRM_L["{num} years"] = "{num} лет"
    GRM_L["{num} month"] = "{num} месяца"
    GRM_L["{num} months"] = "{num} месяцев"
    GRM_L["{num} day"] = "{num} день"
    GRM_L["{num} days"] = "{num} дней"
    GRM_L["< 1 day"] = "< 1 дня"

    GRM_L["{num} yr"] = "{num} год"
    GRM_L["{num} yrs"] = "{num} лет"
    GRM_L["{num} mo"] = "{num} мес."
    GRM_L["{num} mos"] = "{num} мес."
    GRM_L["{num} hr"] = "{num} час"
    GRM_L["{num} hrs"] = "{num} час."
    GRM_L["< 1 hour"] = "< 1 часа"
    GRM_L["{num} {custom1}"] = "{num} {custom1}"     -- Context: This is a placeholder for ANY generic time data -- Ex:  "1 year" or "15 months" - The translation is set this is just to set the orientation of the number properly.

    -- MISC Punctuation
    GRM_L[","] = ","                             -- I know in some Asia languages, a comma is not used, but something similar, for example.

    -- Updates 1.126
    GRM_L["General"] = "Основные"
    GRM_L["General:"] = "Основные:"
    GRM_L["Scan"] = "Скан"
    GRM_L["Help"] = "Помощь"
    GRM_L["UI"] = "UI"                              -- UI for User Interface. Abbreviation for changing custom UI featuers, like coloring of <M> main
    GRM_L["Officer"] = "Офицер"                        -- as in, "Officer" rank
    GRM_L["Open Addon Window"] = "Открыть окно Аддона"
    GRM_L["Sync Addon Settings on All Alts in Same Guild"] = "Сохранить настройки для всех альтов в гильдии"
    GRM_L["Show Minimap Button"] = "Иконка около миникарты"
    GRM_L["Player is Not Currently in a Guild"] = true
    -- tooltips
    GRM_L["|CFFE6CC7FClick|r to open GRM"] = true                           -- Please maintain the color coding
    GRM_L["|CFFE6CC7FRight-Click|r and drag to move this button."] = true   -- Likewise, maintain color coding
    GRM_L["|CFFE6CC7FRight-Click|r to Reset to 100%"] = "|CFFE6CC7FПКМ|r для сброса до 100%"                -- for the Options slider tooltip
    GRM_L["|CFFE6CC7FRight-Click|r to Sync Join Date with Alts"] = true
    GRM_L["|CFFE6CC7FRight-Click|r to Set Notification of Status Change"] = true
    -- tooltip end
    GRM_L["GRM"] = true
    GRM_L["<A>"] = "<Тв>"                                                     -- This is the "Alt" tag on the Add Alt side window.
    GRM_L["Include Unknown as Incomplete"] = "Считать \"Неизвестно\" как неполные" -- Context: Unknown in the Audit Tab will be hidden if filtering out complete players
    GRM_L["You Do Not Have Permission to Add Events to Calendar"] = true
    GRM_L["Please Select Which Join Date to Sync"] = true
    GRM_L["Sync All Alts to {name}'s Join Date"] = true
    GRM_L["Sync All Alts to the Earliest Join Date: {name}"] = true
    GRM_L["Sync All Alts to {name}'s |cffff0000(main)|r Join Date"] = true  -- The coloring ensures that "(main)" maintains the RED color. Please keep it consistent if relevant to your language.
    GRM_L["Join Date of All Alts is Currently Synced"] = true

    -- Update 1.130
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Hide this Button."] = true
    GRM_L["Invited By:"] = "Пригласил:"
    GRM_L["To avoid storage bloat, a maximum of 2 save points is currently possible. Please remove one before Continuing."] = true
    GRM_L["Error: Guild Not Found..."] = "Ошибка: гильдия не найдена."
    GRM_L["Debugger Start"] = true;

    -- Update 1.136
    GRM_L["To avoid storage bloat, a maximum of 2 guild save points is currently possible. Please remove one before continuing"] = true
    GRM_L["Backup Point Removed for Guild \"{name}\""] = true
    GRM_L["Backup Point Restored for Guild \"{name}\""] = true
    GRM_L["Backup Point Set for Guild \"{name}\""] = true
    GRM_L["Backup"] = "Backup"
    GRM_L["Horde"] = "Орда"
    GRM_L["Alliance"] = "Альянс"
    GRM_L["Creation Date"] = "Дата создания"
    GRM_L["Members"] = "Участников"
    GRM_L["Backup {num}:"] = true           -- As in, the number of backups... so "Backup 1:"
    GRM_L["None"] = "None"
    GRM_L["Restore"] = "Восстановить"
    GRM_L["Set Backup"] = "Создать Backup"
    GRM_L["Memory Usage: {num} MB"] = "Памяти использовано: {num} MB"          -- MB references the number of MegaBytes of memory used.

    -- Update 1.137
    GRM_L["GRM: Unable to Create Backup for a Guild With Unknown Creation Date! Log into that guild on any alt to update old database."] = true
    GRM_L["Enable Auto-Backup Once Every"] = "Включить авто-бекап каждые"
    GRM_L["Auto {num}:"] = true
    GRM_L["Please Choose a Time Interval Between 1 and 99 Days!"] = true
    GRM_L["Really restore {name} Backup Point?"] = "Восстановить Backup {name}?" 
    GRM_L["Check All"] = "Проверять все"

    -- Update 1.139
    GRM_L["Right-Click for options to remove this guild from the addon database completely"] = true
    GRM_L["Player Cannot Purge the Guild Data they are Currently In!!!"] = true
    GRM_L["To reset your current guild data type '/grm clearguild'"] = true
    GRM_L["Click Here to Remove all traces of this guild, or hit ESC"] = true
    GRM_L["{name} has been removed from the database."] = true              -- The Guild Name has been removed from the database

    -- update 1.141
    GRM_L["You will still share your data with the guild, but you are currently only accepting incoming changes from rank \"{name}\" or higher"] = true    -- Reminder, the backslash before a quotation denotes the string NOT to close, but to include the quotation in display txt
    GRM_L["Only Restrict Incoming Player Data to Rank Threshold, not Outgoing"] = "Не принимать данные от игроков, ниже данного звания"
    GRM_L["Total Entries: {num}"] = "Всего записей: {num}"
    GRM_L["Search Filter"] = "Поиск"

    -- update 1.142w
    GRM_L["Choose Color:"] = "Выбор цвета:"
    GRM_L["Format:"] = "Формат:"
    GRM_L["M"] = true           -- Of note, the "M" is short for "Main" and this is the reference to the main tag on alts in guild chat.
    GRM_L["RGB Values Must be Between 1 and 255."] = true

    -- Update 1.143
    GRM_L["The Log is Currently Empty for This Guild"] = true
    GRM_L["Building Log for Export..."] = true
    GRM_L["Open Log Tools"] = "Открыть настройки"
    GRM_L["Hide Log Tools"] = "Закрыть настройки"
    GRM_L["Numbered Lines"] = "Нумерация строк"
    GRM_L["Export Log"] = "Экспорт журнала"
    GRM_L["Clear Lines:"] = "Очистить с"
    GRM_L["Enable Ctrl-Shift-Click Line Removal"] = "Включить \"Ctrl-Shift-Click\" для удаления"
    GRM_L["To"] = "По"                                      -- Clear Lines:  50 To 100     -- It stands between 2 edit boxes as its own fontstring, so work with that.
    GRM_L["Confirm Clear"] = "Очистить"
    GRM_L["Please Select Range of Lines from the Log You Wish to Remove"] = true
    GRM_L["Please put the lowest number in the first box"] = true
    GRM_L["Line selection is not valid"] = true
    GRM_L["Really Clear lines {custom1} to {custom2}?"] = true
    GRM_L["Enabling Line Numbers... Please choose within the given range"] = true
    GRM_L["Ctrl-C to Copy <> Ctrl-P to Paste <> Ctrl-A to Select All"] = true
    GRM_L["Language Selection:"] = "Выбор языка:"
    GRM_L["{num} phrases still need translation to {name}"] = "{num} фраз нуждаются в переводе на {name}" -- Ex: 300 phrases still need translation to German

    -- update 1.145
    GRM_L["You currently are at {num} non-Battletag friends. To fully take advantage of all of GRM features, please consider clearing some room."] = true
    GRM_L["Clear Space on Friends List to Find Online Status"] = true
    GRM_L["Offline"] = true
    GRM_L["{name} has requested to join the guild and is currently ONLINE!"] = true

    -- Update 1.146
    GRM_L["Really Clear line {num}?"] = true
    GRM_L["Font has been Reset to DEFAULT."] = true
    GRM_L["Font Selection:"] = "Выбор шрифта:"
    GRM_L["Font Scale:"] = "Размер шрифта:"
    GRM_L["Example"] = "Пример"
    GRM_L["Right-Click to Reset to 100%"] = "|CFFE6CC7FПКМ|r для сброса до 100%"

    -- Update 1.147
    GRM_L["|CFFE6CC7FClick|r to open Player Window"] = true
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Search the Log for Player"] = true

    -- Update 1.1480
    GRM_L["Custom Notes:"] = "Доп.Заметка:"
    GRM_L["GRM Debugging Enabled."] = true
    GRM_L["GRM Debugging Disabled."] = true
    GRM_L["Please type \"/grm debug 10\" to report 10 events (or any number)"] = true        -- Please keep the \"/grm debug 10)\" in-tact for slash command to work
    GRM_L["Format: \"/grm debug 10\""] = true                                                                  -- "" Likewise
    GRM_L["Error: Debug Command not recognized."] = true
    GRM_L["You may want to temporarily disable SYNC in the options if you are debugging another feature."] = true
    GRM_L["Sync Custom Notes"] = "Синхронизировать Доп.Заметки"
    GRM_L["Default Custom Note Rank Minimum"] = "Минимальный ранг для импорта Доп.Заметками"
    GRM_L["Reset Default Custom Note Restrictions for ALL Guildies"] = "Сбросить минимальный ранг для импорта Доп.Заметками для всей ГИ"
    GRM_L["Reset to Default"] = "Сбросить до стандартных"
    GRM_L["Reset"] = "Сбросить"
    GRM_L["|CFF00CCFFDefault Selection For All Players"] = true
    GRM_L["Each Guildie Can Still be Manually Configured"] = true
    GRM_L["Does NOT apply to Ban List or Custom Note"] = true
    GRM_L["Custom note Rank reset to default \"{name}\" (or higher)"] = true
    GRM_L["If sync was manually disabled for specific guildies, this does NOT enabled it."] = true
    GRM_L["Custom note default settings for Rank and Sync have been reset."] = true
    GRM_L["Custom note Sync has been reset to default"] = true
    GRM_L["Click here to set Custom Notes"] = "Нажмите, для установки Доп.Заметки"
    GRM_L["|CFF00CCFFCustom Note Defaults:"] = true
    GRM_L["|CFFE6CC7FLeft-Click|r to ONLY reset all to default rank"] = true
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to reset BOTH sync and rank defaults"] = true
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r to re-enable custom note sync for all"] = true
    GRM_L["Custom Note Sync Disabled in Settings"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Added"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Removed"] = true
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" to \"{custom2}\""] = true
    GRM_L["Custom Note"] = "Доп.Заметка"
    GRM_L["Syncing Outgoing Data."] = true
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction"] = true
    GRM_L["|CFFE6CC7FClick|r to Change Day"] = "|CFFE6CC7FЛКМ|r чтобы выбрать ДЕНЬ" 
    GRM_L["|CFFE6CC7FClick|r to Change Month"] = "|CFFE6CC7FЛКМ|r чтобы выбрать МЕСЯЦ" 
    GRM_L["|CFFE6CC7FClick|r to Change Year"] = "|CFFE6CC7FЛКМ|r чтобы выбрать ГОД" 
    GRM_L["Edited by {name}"] = true
    GRM_L["Note Removed by {name}"] = true
    GRM_L["|CFFFF0000Player No Longer in Guild"] = true
    GRM_L["|CFF00CCFFMinimum Rank to Sync: Player Data, Custom Notes, Ban List"] = true
    GRM_L["Warning! Ban List rank threshold is below the overall sync rank. Changing from \"{name}\" to \"{name2}\""] = true
    GRM_L["Warning! Custom Note rank threshold is below the overall sync rank. Changing default from \"{name}\" to \"{name2}\""] = true
    GRM_L["Custom Note Default Rank is Also Being Set to \"{name}\""] = true
    GRM_L["|CFF00CCFFSync filter can be set tighter for the Ban List"] = true
    GRM_L["Warning! Unable to select a Ban List rank below \"{name}\""] = true
    GRM_L["Warning! Custom Note rank filter must be below \"{name}\""] = true
    GRM_L["Setting to match core filter rank"] = true
    GRM_L["Warning! \"{name}\" is the lowest rank that can receive this custom note.\nCheck the options menu to adjust overall settings."] = true

    -- R1.1482
    GRM_L["Shift-Click Name On Roster Also Works"] = "Shift+ПКМ по имени работает"
    GRM_L["Tooltip Scale:"] = "Размер подсказки"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Language"] = "|CFFE6CC7FЛКМ|r для выбора языка"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change Display Format"] = "|CFFE6CC7FЛКМ|r для выбора формата"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Font"] = "|CFFE6CC7FЛКМ|r для выбора шрифта"
    GRM_L["Unfortunately each player's data will need to be manually reconfigured."] = true
    GRM_L["{num} custom {custom1} removed that matched text:"] = true                           -- custom1 = "note" or the plural "notes"
    GRM_L["notes"] = true
    GRM_L["Please add specific text, in quotations, to match"] = true

    -- R1.1490
    GRM_L["You will still share some outgoing data with the guild"] = true
    GRM_L["Unable to properly locate guild for backup"] = true

    -- R1.1500
    GRM_L["It's almost time to celebrate {name}'s Birthday!"] = true          -- Custom1 is the actual date.  Like "1 Mar '18"
    GRM_L["Unique accounts pull from the server is known to faulty"] = true
    GRM_L["Use only as an estimate. Hopefully Blizz fixes this soon"] = true
    GRM_L["{name}'s Anniversary!"] = true
    GRM_L["{name}'s Birthday!"] = true
    GRM_L["Guild member for over {num} year"] = true
    GRM_L["Guild member for over {num} years"] = true   -- the plural version!
    GRM_L["Add Upcoming Events to the Calendar"] = true
    GRM_L["Player rank unable to add events to calendar"] = true
    GRM_L["Anniversaries, Birthdays, and Other Events can be added with permission"] = true

    -- R1.1510
    GRM_L["Check the \"Sync Users\" tab to find out why!"] = true
    GRM_L["Time as Member:"] = true
    GRM_L["|CFFE6CC7FClick|r to select player event"] = true
    GRM_L["|CFFE6CC7FClick Again|r to open Player Window"] = true
    GRM_L["Timestamp Format:"] = "Формат даты:"
    GRM_L["Hour Format:"] = "Формат времени:"
    GRM_L["24 Hour"] = "24 часа"
    GRM_L["12 Hour (am/pm)"] = "12 часов (am/pm)"
    GRM_L["Enable Fade on Tab Change"] = "Включить ПЛАВНОЕ переключение вкладок"
    GRM_L["Confirm Custom Note"] = "Подтвердить Доп.Заметку"

    -- R1.1520
    GRM_L["A new rank has been added to the guild!"] = true
    GRM_L["{num} new ranks have been added to the guild!"] = true
    GRM_L["The guild has removed a rank!"] = true
    GRM_L["{num} guild ranks have been removed!" ] = true
    GRM_L["Edit Ban"] = "Редакт. БАН"
    GRM_L["Please Select a Player to Edit their Ban!"] = true
    GRM_L["Update Ban"] = true
    GRM_L["{name}'s Ban Info has Been Updated!"] = true

    -- R1.1530
    GRM_L["{name} plays the {custom1} class, not {custom2}."] = true             -- Example: Arkaan plays the Hunter class, not Paladin.
    GRM_L["{num} Items Updated"] = true
    GRM_L["You Currently Have Disabled Adding Events to Calendar"] = true

    -- R1.20
    GRM_L["|CFFE6CC7FHold Shift|r to view more alt details."] = true                -- "Hold Shift to view more alt details" is the phrase, but the |CFF|r is the text coloring hex code. Please keep it in there on the keyboard command coloring
    GRM_L["|CFFE6CC7FClick|r to view more alt details."] = true
    GRM_L["|CFFE6CC7FShift-Click|r to keep alt details open."] = true               -- The same can be said here. ^^
    GRM_L["|CFFE6CC7FClick|r to flip player name ordering"] = true                  -- and the reset...
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Newest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Oldest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Newest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Oldest"] = true
    GRM_L["|CFFE6CC7FClick|r to sort all Mains first"] = true
    GRM_L["|CFFE6CC7FClick|r to sort all Alts first."] = true
    GRM_L["{name}'s Profile is Being Built. One Moment..."] = true
    GRM_L["There are {num} players requesting to join your guild. You only have room for {custom1} more friends. Please consider cleaning up your friend and recruitment lists."] = true;
    GRM_L["{name}'s Alts"] = true          -- Like "Arkaan's Alts"
    GRM_L["Online:  {num}/{custom1}"] = true    -- As in "Online: 3/59"
    GRM_L["Next"] = true          -- This means to Advance forward to the "next" one. It is used on recruitment window to move to NEXT online player.
    GRM_L["Previous"] = true           -- Same context as the "next" except this one goes back to the one before.
    GRM_L["There are currently no ONLINE recruits."] = true
    GRM_L["There are currently no more players in that direction."] = true
    GRM_L["You have reached the end of the list"] = true
    GRM_L["You have reached the top of the list"] = true
    GRM_L["Auto Open Window"] = "Автооткрытие окна"
    GRM_L["Only if a player is online and you are not in combat"] = true
    GRM_L["Recruit window will open when combat ends."] = true
    GRM_L["GRM window will open when combat ends."] = true
	
	-- R1.22
    -- R1.22
    GRM_L["Please manually select your guild to view player details"] = true

    -- R1.24
    GRM_L["This also will change the <Alt> format to match"] = true
    GRM_L["M"] = true                                           -- Of note, the "M" is short for "Main" and this is the reference to the main tag on alts in guild chat. For use in the Main tagging <M> (M) etc...
    GRM_L["A"] = true           
    GRM_L["<M>"] = true                                         -- <M> appears for "Main"
    GRM_L["<A>"] = true                                         -- This is the "Alt" tag on the Add Alt side window. For use in the Alt tagging <A> (A) etc...

    -- R1.25
    GRM_L["NG"] = true                                          -- Stands for "Non-guildie" and can be in the context of calendar invites... it explains why some might have tags and others not... They might not be in your guild
    GRM_L["Include \"Joined:\" tag with the date."] = true                                          -- the \" is so you include the qutoations in the actual text. You need them or it closes the phrase.
    GRM_L["Joined: {name}"] = true                                                                  -- {name} is actually in reference to the Data Format... So "Joined: 22 May '18"   {name} = "22 May '18"
    GRM_L["GRM Auto-Detect! {name} has joined the guild and will be set as Main"] = true            -- Main auto-detect message

    -- R1.26
    GRM_L["Click to Disable Sync of Custom Note"] = true
    GRM_L["Click to Enable Sync of Custom Note"] = true
    GRM_L["Sync is Currently Disabled"] = true
    GRM_L["Custom Note Sync is Currently Disabled"] = true
    GRM_L["|CFFE6CC7FRight-Click|r for Additional Options"] = true

    -- R1.27
    GRM_L["Show Border on Public, Officer, and Custom Notes"] = true

    -- R1.28
    GRM_L["Public Note:"] = true
    GRM_L["Officer Note:"] = true
    GRM_L["Public Note"] = true
    GRM_L["Officer Note"] = true
    GRM_L["Show Public and Officer Note of Left Player in the Log"] = true
    GRM_L["Hard Reset"] = true
    GRM_L["Hard reset of ALL GRM data, account-wide. Game will reload!"] = true
    GRM_L["Reject\nAll"] = true                     -- This is the same as "Reject All" it just forces the 2 words to be on 2 separate lines without me adjusting the text width
    GRM_L["{num} Applicants to the Guild have been denied"] = true
    GRM_L["Do you really want to reject all applicants?"] = true
    GRM_L["Only recommend to kick if all player linked alts exceed max time"] = true
    GRM_L["Your Guild Leader Has Set Sync Restrictions to {name} or Higher"] = true
    GRM_L["Unable to Change Rank. Guild Leader has set restriction to {name} or higher"] = true     -- Like Initiate or higher
    GRM_L["Unable to Change Rank. Guild Leader has set restriction level."] = true
    GRM_L["Unify Control Settings for all guildies with 'g#^X' commands"] = true
    GRM_L["CONTROL TAGS:"] = true
    GRM_L["Force Settings with Guild Info Tags"] = true
    GRM_L["X = index of minimum rank. Example: 0 = {name} and {num} = {name2}"] = true
    GRM_L["'g2^X' - Establish minimum sync rank restriction for player details"] = true
    GRM_L["'g3^X' - Establish minimum sync rank restriction for BAN info"] = true
    GRM_L["'g4^X' - Establish minimum sync rank restriction for Custom Note info"] = true
    GRM_L["Warning! System messages are disabled! GRM cannot function fully without them. You must re-enable them in the chat settings."] = true
    GRM_L["Database Still Loading. GRM will open automatically when finished."] = true

    -- R1.29
    GRM_L["Do you really want to invite all applicants?"] = true
    GRM_L["There are currently 0 players online to invite."] = true
    GRM_L["It appears all players are now offline."] = true
    GRM_L["Invite\nAll"] = true                             -- Just makes it 2 lines - they \n is the line break. You can remove if not necessary, or include.
    GRM_L["Include Message When Sending Invite"] = true
    GRM_L["Click here to set custom invite message. Press Enter to save before sending invite!"] = true
    GRM_L["The highlighted character is not valid for messages. Please remove."] = true
    GRM_L["Not all characters are valid. Please remove any non-text characters."] = true
    GRM_L["Kick macro created. Press \"CTRL-SHIFT-K\" to kick all of {name}'s alts"] = true
    GRM_L["Kick the Player's {num} alts too?"] = true       -- Plural
    GRM_L["Kick the Player's {num} alt too?"] = true        -- Not Plural  - "Kick the Player's 1 alt too?"
    GRM_L["Ban and Kick the Player's {num} alts too?"] = true
    GRM_L["Ban and Kick the Player's {num} alt too?"] = true

    -- R1.30
    GRM_L["Sync With {name} is Complete..."] = true
    GRM_L["Database Still Loading. Please Wait..."] = true
    GRM_L["|CFFE6CC7FLeft-Click|r and drag to move this button."] = true
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r and drag to move this button anywhere."] = true
    GRM_L["MOTD:"] = true       -- Message Of The Day = M.O.T.D = MOTD - 
    GRM_L["minimap"] = true

    -- R1.31
    GRM_L["Show 'Main' Tag on both Mains and Alts in Chat"] = true

    -- R1.32
    GRM_L["Invites Currently Being Sent..."] = true
    GRM_L["GRM has moved the Guild Leader setting restriction codes to the Guild Info tab."] = true
    GRM_L["Please make room for them and re-add."] = true
    GRM_L["Your Guild Leader has pushed a reset of your data."] = true;
    GRM_L["Your Guild Leader Has Set BAN Sync Restrictions to {name} or Higher"] = true
    GRM_L["Your Guild Leader Has Set CUSTOM NOTE Sync Restrictions to {name} or Higher"] = true

    -- R1.33
    GRM_L["Invite all macro created. Press \"CTRL-SHIFT-K\" to invite all online recruits."] = true
    GRM_L["Macro will auto-remove after {num} seconds."] = true
    GRM_L["UI"] = true
    GRM_L["UI Controls"] = true
    GRM_L["UI Configuration:"] = true
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction for Custom Note"] = true
    GRM_L["Sync restriction is unique to just {name}'s custom note"] = true
    GRM_L["Show Character Guild Reputation"] = true
    GRM_L["Show Guild Member Birthdays"] = true
    GRM_L["Set Birthday"] = true
    GRM_L["Edit Birthday"] = true
    GRM_L["Remove Date"] = true             -- Clear Birthday shorthand
    GRM_L["Birthday"] = true
    GRM_L["Only Announce Birthdays and Anniversaries if Listed as 'Main'"] = true
    GRM_L["{name} will be celebrating {num} year in the Guild!"] = true            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild!"] = true           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["No player's currently available to sync {name}'s Guild Data..."] = true
    GRM_L["{name} has set {name2}'s Birthday: {custom1}"] = true                   -- custom note is the date like "12 Dec"
    GRM_L["{name}'s Birthday has been set: {custom1}"] = true
    GRM_L["Sync Birthdays"] = true

    -- R1.34
    GRM_L["Debugging Enabled"] = true
    GRM_L["Debugging Disabled"] = true
    GRM_L["{num} is not a valid day of the month! It must be a number between 1 and 31"] = true
    GRM_L["{num} is not a valid index of the month of the year! It must be a number between 1 and 12"] = true
    GRM_L["The day cannot be {num}. It must be a number between 1 and 31"] = true
    GRM_L["The month cannont be {num}. must be a number between 1 and 12"] = true
    GRM_L["{num} birthdays have been reset."] = true
    GRM_L["No player was found to have that birthday."] = true

    -- R1.35
    GRM_L["\"{custom1}\" setting is not valid. Value must be between 1 and 3. Defaulting to set join date to officer note with \"g5^1\""] = true    -- The custom1 will be something like "g5^8" or something. It's to account for typos or error warnings.
    GRM_L["Your Guild Leader Has Set Join Dates to only be added to the {name}"] = true         -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["Warning - Global Controls:"] = true
    GRM_L["Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["BAN Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["CUSTOM NOTE Sync Restrictions Globally Changed to {name} or Higher"] = true
    GRM_L["Join Dates Globally Changed to only be added to the {name}"] = true
    GRM_L["Unable to Modify. Global setting is set to the {name}"] = true                           -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["'g5^X' - Designate Join Date note destination. g5^1 = Officer, 2 = public, 3 = custom"] = true
    
    -- R1.37
    GRM_L["No Action Configured"] = true
    GRM_L["OLD LOG"] = true
    GRM_L["CHANGES"] = true
    GRM_L["Sync has failed to start. Please try again!"] = true
    GRM_L["Please wait {num} more seconds before manually initiating the sync process again."] = true

    -- R1.39
    GRM_L["Only Report if there are no Active Alts in the Group"] = true
    GRM_L["Level Filter Minimum:"] = true                                -- As in player level
    GRM_L["Report Milestones:"] = true
    GRM_L["Report Level Up Changes"] = true
    GRM_L["Reporting:"] = true
    GRM_L["Unable to disable level cap tracking. Please disable ALL tracking to turn off."] = true
    GRM_L["No Levels to Report to Log"] = true
    GRM_L["{name} has Surpassed their Level {num} Milestone and is Now {custom1}"] = true
    GRM_L["{name} has Reached their Level {num} Milestone"] = true
    GRM_L["{name}'s Ban has been Updated by {name2}!"] = true
    GRM_L["{name} has Updated {name2}'s BAN and also BANNED all linked alts from the guild!"] = true
    GRM_L["One moment, GRM is still being configured."] = true
    GRM_L["Press ENTER to complete"] = true
    GRM_L["Player Was Banned By: {name}"] = true
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED players are currently in the guild."] = true     -- plural
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED player is currently in the guild."] = true        -- Singular  -- please keep the color coding... this keeps the Warning in red
    
    -- R1.41
    GRM_L["{num} metadata profiles are being built for people previously in the guild. The data is being requested, but this may take some time."] = true                   -- PLURAL
    GRM_L["One metadata profile is being built for a player previously in the guild. The data is being requested, but this may take some time."] = true           -- SINGULAR, same line.
    GRM_L["Sync will re-trigger one time, in a moment, to collect final data on these profiles."] = true
    GRM_L["Auto-Focus the search box"] = true
    GRM_L["This will skip the first time if set to load on logon"] = true  -- Referring to the auto-focusing on the search box, this is a tooltip helper
    GRM_L["Please enter a valid level between 1 and {num}"] = true
    GRM_L["Player's Main: {name}"] = true
    GRM_L["Player's main no longer in the guild: {name}"] = true
    
    -- R1.43
    GRM_L["One moment, requesting additional details on {name} from the server. Ban List will soon update."] = true
    GRM_L["Unable to identify {name}. Ensure your spelling is accurate! Otherwise, they may have left the server."] = true
    GRM_L["(Unable to Identify)"] = true                                                                    -- As in, unable to identify on the server, they possibly server transferred off but are still on ban list
    GRM_L["|CFFE6CC7FClick|r to select player class"] = true
    GRM_L["|CFFE6CC7FClick|r to select player's realm."] = true
    GRM_L["All Connected Realms are available to choose."] = true
    GRM_L["{num} players were found to have the same name. Please manually select which connected realm the player you wish to ban is on."] = true
    GRM_L["Click or Press TAB to cycle through each step."] = true
    GRM_L["Former and Current Members"] = true
    GRM_L["No Matches Found. Add a Custom New Player or Match"] = true       -- as in, autocomplete typing matching
    
    --1.50
    GRM_L["{name}'s alt grouping has had their Birthday removed by: {name2}"] = true
    GRM_L["{name}'s Birthday has been removed by: {name2}"] = true
    GRM_L["Click to Sort"] = true
    GRM_L["No Updates"] = true
    GRM_L["Timestamp Formatting has been Globally Set to: < {name} >"] = true
    GRM_L["Your Guild Leader Has Globally Set the Timestamp Formatting to: < {name} >"] = true
    GRM_L["Unable to Modify. Global setting is set to :   {name}"] = true
    GRM_L["'g1^X' - Establish a universal timestamp format based on dropdown selection position"] = true

    -- If ppossible, try to maintain the allignment of the numbers, but only if it makes sense.
    GRM_L["{num}{custom1}: Join Dates"] = true
    GRM_L["{num}{custom1}: Promo Dates"] = true
    GRM_L["{num}{custom1}: Alts"] = true
    GRM_L["{num}{custom1}: Main Tags"] = true
    GRM_L["{num}{custom1}: Custom Notes"] = true
    GRM_L["{num}{custom1}: Birthdays"] = true

    -- 1.52
    GRM_L["Times in Guild: {num}"] = true
    
end

-- BuildLog() - might have some extra work, conditionally based on localization as it will now have a mix of languages saved to the log, since log is not retroactively changed.
-- The options panel might need some handcrafted care for allignment.