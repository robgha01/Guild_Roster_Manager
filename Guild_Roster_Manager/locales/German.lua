
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

GRML.German = function()
    GRM_L["German"] = "Deutsch"
	GRM_L["English"] = "Englisch"
	GRM_L["French"] = "Französisch"
	GRM_L["Italian"] = "Italienisch"
	GRM_L["Russian"] = "Russisch"
	GRM_L["SpanishMX"] = "Spanisch (Mexico)"
	GRM_L["SpanishEU"] = "Spanisch (EU)"
	GRM_L["Portugese"] = "Portugiesisch"
	GRM_L["Korean"] = "Koreanisch"
	GRM_L["MandarinCN"] = "Mandarin (China)"
	GRM_L["ManrarinTW"] = "Mandarin (Taiwan)"
    GRM_L["Guild"] = "Gilde"

    -- PLAYER MAIN ROSTER DETAILS WINDOW
    GRM_L["Level: "] = "Stufe: "
    GRM_L["Level"] = "Stufe"
    GRM_L["Note:"] = "Notiz:"
    GRM_L["Note"] = "Notiz"
    GRM_L["Officer's Note:"] = "Offiziersnotiz:"
    GRM_L["Officer's Note"] = "Offiziersnotiz"
    GRM_L["Zone:"] = "Zone:"
    GRM_L["(main)"] = "Main"
    GRM_L["( Main )"] = "Main"                                -- Context: This one is used on player data window, the other is smaller used in the alts list...
    GRM_L["Set as Main"] = "Als Main setzen"
    GRM_L["Set as Alt"] = "Als Twink setzen"
    GRM_L["Remove"] = "Entfernen"
    GRM_L["Please Type the Name of the alt"] = "Bitte den Namen des Twinks eingeben"
    GRM_L["Promoted:"] = "Befördert:"
    GRM_L["Unknown"] = "unbekannt"                                                                 -- Context: The date of their promotion is "Unknown"
    GRM_L["Click here to set a Public Note"] = "Hier öffentliche Notiz eintragen"
    GRM_L["Unable to Edit Public Note at Rank"] = "Rang ist zu niedrig, um die öffentliche Notiz zu ändern"
    GRM_L["Click here to set an Officer's Note"] = "Hier Offiziersnotiz eintragen"
    GRM_L["Unable to Edit Officer Note at Rank"] = "Rang ist zu niedrig, um die öffentliche Notiz zu ändern"
    GRM_L["Unable to View Officer Note at Rank"] = "Rang ist zu niedrig, um die öffentliche Notiz zu sehen"
    GRM_L["Online"] = "online"
    GRM_L["( Active )"] = "aktiv"                       -- I included the parentheses here as I am not sure if any languages abstain from them, or use other notation. Feel free to remove if necessary
    GRM_L["( AFK )"] = "AFK"
    GRM_L["( Busy )"] = "DND"
    GRM_L["( Mobile )"] = "Handy"
    GRM_L["( Offline )"] = "offline"
    GRM_L["Set Join Date"] = "Beitrittsdatum\nsetzen"
    GRM_L["Edit Promo Date"] = "Beförderungsdatum\nändern"
    GRM_L["Edit Join Date"] = "Beitrittsdatum\nändern"
    GRM_L["Set Promo Date"] = "Beförderungsdatum\nsetzen"
    GRM_L["In Group"] = "in Gruppe"                            -- Context: "Player is already In Group with you"
    GRM_L["Group Invite"] = "Gruppeneinladung"
    GRM_L["No Invite"] = "Keine Einladung"
    GRM_L["Group Invite"] = "Gruppeneinladung"
    GRM_L["Date Promoted?"] = "Beförderungsdatum?"
    GRM_L["Last Online"] = "zuletzt online"
    GRM_L["Time In:"] = "Zeit in Zone:"                            -- Context: "Time In" the current zone...
    GRM_L["Date Joined"] = "Beitrittsdatum"
    GRM_L["Join Date?"] = "Beitrittsdatum?"
    GRM_L["Player Was Previously Banned!"] = "Spieler war gebannt!"
    GRM_L["Ignore Ban"] = "Bann ignorieren"
    GRM_L["Player Alts"] = "Twinks"
    GRM_L["Add Alt"] = "Twink hinzufügen"
    GRM_L["Choose Alt"] = "Twink auswählen"
    GRM_L["(Press Tab)"] = "Drücke TAB"
    GRM_L["Shift-Mouseover Name On Roster Also Works"] = "Shift-Mouseover über die Namen im Roster funktioniert auch"
    GRM_L["Guild Log"] = "Guild Log"

    -- TOOLTIPS
    GRM_L["Rank History"] = "Rang-Verlauf"
    GRM_L["Time at Rank:"] = "Zeit auf Rang"
    GRM_L["Right-Click to Edit"] = "Rechtsklick zum ändern"
    GRM_L["Left Guild"] = "hat die Gilde verlassen"
    GRM_L["Membership History"] = "Mitgliedschafts-Verlauf"
    GRM_L["Joined:"] = "Beigetreten"                             -- as in "Joined" the guild
    GRM_L["Joined"] = "Beigetreten"
    GRM_L["Left:"] = "verlassen"                               -- as in, "Left" the guild
    GRM_L["Rejoined:"] = "Wiedereingetreten"                           -- as in, "Rejoined" the guild
    GRM_L["Reset Data!"] = "Daten verwerfen!"
    GRM_L["Notify When Player is Active"] = "Benachrichtigen, wenn Spieler nicht mehr AFK ist"
    GRM_L["Notify When Player Goes Offline"] = "Benachrichtigen, wenn Spieler ausloggt"
    GRM_L["Notify When Player Comes Online"] = "Benachrichtigen, wenn Spieler einloggt"
    GRM_L["Edit Date"] = "Datum ändern"
    GRM_L["Clear History"] = "Verlauf löschen"
    GRM_L["Options"] = "Optionen"
    GRM_L["Cancel"] = "Abbrechen"
            
    -- LOG
    GRM_L["LOG"] = "LOG"                                                     -- Context - The guild Log shorthand for the tab
    GRM_L["Guild Roster Event Log"] = "Guild Roster Event Verlauf"
    GRM_L["Clear Log"] = "Verlauf löschen"
    GRM_L["Really Clear the Guild Log?"] = "Gildenverlauf wirklich löschen?"
    GRM_L["{name} DEMOTED {name2}"] = "{name} hat {name2} degradiert"
    GRM_L["{name} PROMOTED {name2}"] = "{name} hat {name2} befördert"
    GRM_L["{name} KICKED {name2} from the Guild!"] = "{name} hat {name2} aus der Gilde geworfen!"
    GRM_L["kicked"] = "geworfen"
    GRM_L["{name} has Left the guild"] = "{name} hat die Gilde verlassen"
    GRM_L["{name} INVITED {name2} to the guild."] = "{name} hat {name2} in die Gilde eingeladen"
    GRM_L["{name} has BANNED {name2} and all linked alts from the guild!"] = "{name} hat {name2} und alle verbundenen Twinks aus der Gilde VERBANNT!"
    GRM_L["{name} has BANNED {name2} from the guild!"] = "{name} hat {name2} aus der Gilde VERBANNT!"
    GRM_L["Reason Banned:"] = "Bann-Grund"
    GRM_L["has Left the guild"] = "hat die Gilde verlassen"                                      -- Context: PlayerName "has left the guild"
    GRM_L["ALTS IN GUILD:"] = "Twinks in der Gilde:"                                          -- Context: This appears If a person leaves the guild and there are still alts in the guild. It is like - "ALTS IN GUILD: Arkaan, Chris, Matt, and 4 others.""
    GRM_L["Player no longer on Server"] = "Spieler ist nicht mehr auf dem Server"
    GRM_L["{name} PROMOTED {name2} from {custom1} to {custom2}"] = "{name} hat {name2} von {custom1} zu {custom2} BEFÖRDERT"
    GRM_L["{name} has been PROMOTED from {custom1} to {custom2}"] = "{name} wurde von {custom1} zu {custom2} BEFÖRDERT"
    GRM_L["{name} DEMOTED {name2} from {custom1} to {custom2}"] = "{name} hat {name2} von {custom1} zu {custom2} DEGRADIERT"
    GRM_L["{name} has been DEMOTED from {custom1} to {custom2}"] = "{name} wurde von {custom1} zu {custom2} DEGRADIERT"
    GRM_L["(+ {num} More)"] = "(+ {num} mehr)"                                          -- Context: Referencing num of alts if player leaves guild, that are stil in it. Example "ALTS IN GUILD: Christ, Matt, Sarah (and 4 more)"
    GRM_L["{name} has Been in the Guild {num} Times Before"] = "{name} war bereits {num} mal in der Gilde"
    GRM_L["{name} is Returning for the First Time."] = "{name} kehrt zum ersten Mal zurück in die Gilde"
    GRM_L["None Given"] = "Kein Grund angegeben"                                              -- Context: No reason given for player ban. This is displayed when a player was banned, but the addon users did not input a reason why.
    GRM_L["WARNING!"] = "ACHTUNG!"                                                -- Context: WARNING - banned player rejoined the guild!
    GRM_L["{name} REJOINED the guild but was previously BANNED!"] = "{name} ist zurück in der Gilde, wurde aber vorher GEBANNT!"
    GRM_L["(Invited by: {name})"] = "(eingeladen von: {name})"
    GRM_L["Invited By: {name}"] = "eingeladen von: {name}"
    GRM_L["Date of Ban:"] = "Bann-Datum"
    GRM_L["Date Originally Joined:"] = "Datum des ersten Beitritts:"
    GRM_L["Old Guild Rank:"] = "Alter Gildenrang:"
    GRM_L["Reason:"] = "Grund:"
    GRM_L["Additional Notes:"] = "zusätzliche Notizen:"
    GRM_L["{name} has REINVITED {name2} to the guild"] = "{name} hat {name2} WIEDER in die Gilde EINGELADEN"
    GRM_L["(LVL: {num})"] = "(Lvl: {num})"                                            -- Context: LVL means Player Level - so Ex: (LVL: 110)
    GRM_L["{name} has REJOINED the guild"] = "{name} ist zurück in der Gilde"
    GRM_L["{name} has JOINED the guild!"] = "{name} ist der Gilde BEIGETRETEN"
    GRM_L["Date Left:"] = "Austrittsdatum:"
    GRM_L["{name} has Leveled to {num}"] = "{name} hat Level {num} erreicht"
    GRM_L["Leveled to"] = "erreicht Level"                                            -- For parsing the message, please include the string found in previous "has leveled to" message
    GRM_L["(+{num} levels)"] = "(+{num} Level)"                                         -- Context: Person gained more than one level, hence the plural
    GRM_L["(+{num} level)"] = "(+{num} Level)"                                          -- Context: Person gains a level, just one level.
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Added"] = "Öffentliche Notiz von {name}: \"{custom1}\" hinzugefügt"           -- Of note, the \" in the text here will just appear as " in-game. The \" notation is telling the program not to end the string, but to include quotation
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Removed"] = "Öffentliche Notiz von {name}: \"{custom1}\" wurde gelöscht"
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" to \"{custom2}\""] = "Öffentliche Notiz von {name}: \"{custom1}\" geändert zu \"{custom2}\""    -- Context: "Arkaan's PUBLIC Note: "ilvl 920" to "Beast Mode ilvl 960""  -- Changing of the note. custom1 = old note, custom2 = new note
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Added"] = "Offiziersotiz von {name}: \"{custom1}\" hinzugefügt"
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Removed"] = "Offiziersnotiz von {name}: \"{custom1}\" wurde gelöscht"
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" to \"{custom2}\""] = "Offiziersnotiz von {name}: \"{custom1}\" geändert zu \"{custom2}\""
    GRM_L["Guild Rank Renamed from {custom1} to {custom2}"] = "Gildenrang {custom1} wurde umbenannt zu {custom2}"
    GRM_L["{name} has Name-Changed to {name2}"] = "Spieler {name} hat seinen Namen zu {name2} geändert"
    GRM_L["{name} has Come ONLINE after being INACTIVE for {num}"] = "Spieler {name} kam ONLINE nachdem er für {num} INAKTIV war"
    GRM_L["{name } Seems to Have Name-Changed, but their New Name was Hard to Determine"] = "Spieler {name} scheint seinen Namen geändert zu haben, aber der neue Name kann nicht eindeutig bestimmt werden"
    GRM_L["It Could Be One of the Following:"] = "Es könnte einer der folgenden sein:"
    GRM_L["{name} has been OFFLINE for {num}. Kick Recommended!"] = "{name} war für {num} OFFLINE. Kick empfohlen!"
    GRM_L["({num} ago)"] = "vor {num}"                                             -- Context: (5 minutes ago) or (5 months 24 days ago) -- the {num} will automatically include the time-passed date.
    GRM_L["{name}'s Guild has Name-Changed to \"{name2}\""] = "Der Gildenname {name} wurde in \"{name2}\" geändert."
    GRM_L["{name} will be celebrating {num} year in the Guild! ( {custom1} )"] = "{name} ist {num} Jahr in der Gilde!"            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild! ( {custom1} )"] = "{name} ist {num} Jahre in der Gilde!"           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["Promotions"] = "Beförderungen"
    GRM_L["Demotions"] = "Degradierungen"

   -- EVENTS WINDOW
    GRM_L["EVENTS"] = "EREIGNISSE"                                          -- Events tab
    GRM_L["{name}'s Anniversary!"] = "{name} hat Jahrestag!"
    GRM_L["{name}'s Birthday!"] = "{name} hat Geburtstag!"
    GRM_L["Please Select Event to Add to Calendar"] = "Wähle ein Ereignis aus, um einen Kalendereintrag zu erstellen"
    GRM_L["No Calendar Events to Add"] = "Keine Ereignisse zum Erstellen"
    GRM_L["Event Calendar Manager"] = "Ereignis Kalender Manager"
    GRM_L["Event:"] = "Ereignis:"
    GRM_L["Description:"] = "Beschreibung:"
    GRM_L["Add to\nCalendar"] = "Zum\nKalender\nhinzufügen"
    GRM_L["Ignore Event"] = "Ignoriere Ereignis"
    GRM_L["No Player Event Has Been Selected"] = "Kein Ereignis ausgewählt"
    GRM_L["Event Added to Calendar: {custom1}"] = "Ereignis zum Kalender hinzugefügt: {custom1}"              -- Custom1 = the title of the event, like "Arkaan's Anniversary"
    GRM_L["Please Select Event to Add to Calendar"] = "Wähle ein Ereignis aus, um einen Kalendereintrag zu erstellen"
    GRM_L["No Calendar Events to Add"] = "Keine Ereignisse zum Erstellen"
    GRM_L["{name}'s event has already been added to the calendar!"] = "Ereignis von {name} wurde bereits im Kalender erstellt!"
    GRM_L["Please wait {num} more seconds to Add Event to the Calendar!"] = "Bitte warte {num} Sekunden, bis du das Ereignis im Kalender erstellst!"
    GRM_L["{name}'s Event Removed From the Que!"] = "Ereignis von {name} aus der Liste entfernt!"
    GRM_L["Full Description:"] = "Beschreibung:"

    -- BAN WINDOW
    GRM_L["BAN LIST"] = "BANN-LISTE"                                        -- Ban List Tab
    GRM_L["Reason Banned?"] = "Grund?"
    GRM_L["Click \"YES\" When Done"] = "Klicke \"JA\", wenn fertig"                         -- Of note, the \" is how you notate for quotations to actually appear. Adjust as needed
    GRM_L["Select a Player"] = "Wähle einen Spieler aus"
    GRM_L["Player Selected"] = "Ausgewählt:"
    GRM_L["{name}(Still in Guild)"] = "{name} (in der Gilde)"
    GRM_L["(Still in Guild)"] = "(in der Gilde)"
    GRM_L["No Ban Reason Given"] = "Kein Grund angegeben"
    GRM_L["Reason:"] = "Grund:"                                         -- Context: As in, "Reason Banned"
    GRM_L["Total Banned:"] = "Gebannte Spieler:"
    GRM_L["Rank"] = "Rang"
    GRM_L["Ban Date"] = "Datum"
    GRM_L["No Players Have Been Banned from Your Guild"] = "Keine Spieler wurden aus der Gilde verbannt"
    GRM_L["Remove Ban"] = "Bann aufheben"
    GRM_L["Add Player to Ban List"] = "Spieler zur Bann-Liste hinzufügen"
    GRM_L["Server:"] = "Server:"
    GRM_L["Class:"] = "Klasse:"
    GRM_L["Reason:"] = "Grund:"
    GRM_L["It is |CFFFF0000CRITICAL|r the player's name and server are spelled correctly for accurate tracking and notifications."] = "|CFFFF0000EXTREM WICHTIG:|r Name und Server müssen unbedingt korrekt geschrieben sein!"
    GRM_L["Submit Ban"] = "Bannen"
    GRM_L["Confirm"] = "Bestätigen"
    GRM_L["Cancel"] = "Abbrechen"
    GRM_L["Add"] = "Hinzufügen"                                         -- Context: "Add" player to ban list
    GRM_L["Confirm Ban for the Following Player?"] = "Diesen Spieler wirklich bannen?"
    GRM_L["Please Enter a Valid Player Name"] = "Gültigen Spielernamen eingeben."            -- Player Name
    GRM_L["Please Enter a Valid Server Name"] = "Gültigen Servernamen eingeben."            -- Server Name
    GRM_L["Please Select a Player to Unban!"] = "Bitte einen Spieler auswählen."
    GRM_L["{name} - Ban List"] = "{name} - Bann-Liste"                           -- Context: "GuildName - Ban List"
    GRM_L["No Reason Given"] = "Kein Grund angegeben"

    -- ADDON USERS WINDOW
    GRM_L["SYNC USERS"] = "SYNC"
    GRM_L["Ok!"] = "Ok!"
    GRM_L["Their Rank too Low"] = "Rang ist zu niedrig"
    GRM_L["Your Rank too Low"] = "teilt nur mit höheren Rängen"
    GRM_L["Outdated Version"] = "Veraltete Version"
    GRM_L["You Need Updated Version"] = "Du musst GRM aktualisieren"
    GRM_L["Player Sync Disabled"] = "Spieler-Sync deaktiviert"
    GRM_L["No Guildie Online With Addon."] = "Keine Spieler mit Addon online"
    GRM_L["ONE Person is Online. Recommend It!"] = "EIN Spieler ist online. Empfiehl ihm GRM!"
    GRM_L["{num} others are Online! Recommend It!"] = "{num} andere sind online! Empfiehl ihnen GRM!"
    GRM_L["GRM Sync Info"] = "GRM Sync Info"
    GRM_L["Ver: {custom1}"] = "Version: {custom1}"                                 -- Context:  Ver: R1.125  - Ver is short for Version
    GRM_L["Name:"] = "Name"
    GRM_L["Version"] = "Version"
    GRM_L["Sync"] = "Sync"
    GRM_L["Your Sync is Currently Disabled"] = "Dein Sync ist momentan deaktiviert"

    -- OPTIONS WINDOW
    GRM_L["Add Join Date to:  |cffff0000Officer Note|r"] = "Füge Beitrittsdatum hinzu: |cffff0000Offiziersnotiz|r"        -- Context: Please keep |cffff0000 for color coding of the text, and the |r to signify the end of color change
    GRM_L["Add Join Date to:  Officer Note"] = "Füge Beitrittsdatum hinzu: Offiziersnotiz"
    GRM_L["Public Note"] = "Öffentliche Notiz"
    GRM_L["Scanning Roster:"] = "Scan:"
    GRM_L["Guild Rank Restricted:"] = "Durch Gildenrang beschränkte Einstellungen:"
    GRM_L["Sync:"] = "Synchronisation:"
    -- Options window -- of note, these are very concise statements. They may need to be adjusted properly in the Options window for proper spacing, so verify they look ok after translating.
    GRM_L["Slash Commands"] = "Befehle"
    GRM_L["Trigger scan for changes manually"] = "Starte manuellen Scan nach Änderungen"
    GRM_L["Trigger sync one time manually"] = "Starte einmalige manuelle Synchronisation"
    GRM_L["Centers all Windows"] = "Alle Fenster zentrieren"
    GRM_L["Slash command info"] = "Hilfe im Chatfenster"
    GRM_L["Resets ALL data"] = "ALLE Daten verwerfen"
    GRM_L["Report addon ver"] = "Ausgabe der installierten Version"                                    -- Ver is short for Version
    GRM_L["Resets Guild data"] = "Gilden-Daten verwerfen"
    GRM_L["Show at Logon"] = "Zeige beim Login"
    GRM_L["Only Show if Log Changes"] = "Nur bei Änderungen zeigen"

    GRM_L["Before Scan Timer"] = "Alle"               -- Context: "Scan for Changes Every 10 Seconds" -- There will be a number added here and may require custom positioning, so please provide full statement and Arkaan will allign
    GRM_L["After Scan Timer"] = "Sekunden nach Änderungen scannen"

    GRM_L["Before Inactive Timer"] = "Inaktivitätsmeldung ausgeben, wenn Spieler länger als"
    GRM_L["After Inactive Timer"] = "offline ist"

    GRM_L["Reactivating SCAN for Guild Member Changes..."] = "Scan für Gildenmitgliederänderungen AKTIVIEREN"
    GRM_L["Deactivating SCAN of Guild Member Changes..."] = "Scan für Gildenmitgliederänderungen DEAKTIVIEREN"
    GRM_L["Due to server data restrictions, a scan interval must be at least 10 seconds or more!"] = "Aufgrund von Serverbeschränkungen muss der Scanintervall mindestens 10 Sekunden sein!"
    GRM_L["Please choose an scan interval 10 seconds or higher!"] = "Bitte einen Scanintervall von mindestens 10 Sekunden wählen"
    GRM_L["{num} is too Low!"] = "{num} ist zu klein!"
    GRM_L["The Current Lvl Cap is {num}."] = "Das momentane Maximalevel ist {num}"
    GRM_L["Kick Inactive Player Reminder at"] = "Erinnerung zum Kicken inaktiver Spieler ab"        -- Context: "Kick Inactive Player Reminder at X Months" - Again, allignment will need to be adjusted for options UI, so please post
    GRM_L["Please choose a month between 1 and 99"] = "Bitte eine Zahl zwischen 1 und 99 wählen"
    GRM_L["Sync BAN List With Guildies at Rank"] = "Bann-Liste teilen: Rang"     -- Context: "Sync Ban List with Guildies at Rank [DROPDOWNMENU OF RANKS] or Higher" - Please show where dropdown menu should be pinned
    GRM_L["or Higher"] = "oder höher"                               -- Context: Look at the above statement. Show where this needs to go in regards to dropdown menu of rank selection in Options
    GRM_L["Restore Defaults"] = "Standardeinstellungen\nwiederherstellen"
    GRM_L["Please choose between 1 and 180 days!"] = "Bitte eine Zahl zwischen 1 und 180 auswählen!"
    GRM_L["Announce Events"] = "Ereignisse ankündigen"                         -- Context: "Announce Events X number of days in advance" -- the X is the editbox to modify number of days. Please include the location of where to pin that.
    GRM_L["Days in Advance"] = "Tage vorher"
    GRM_L["Please choose between 1 and 28 days!"] = "Bitte eine Zahl zwischen 1 und 28 auswählen!"
    GRM_L["Add Events to Calendar"] = "Ereignisse zum Kalender hinzufügen"
    GRM_L["SYNC Changes With Guildies at Rank"] = "Änderungen teilen: Rang"      -- Context: at Rank [DROPDOWNRANKSELECTION] or Higher. - Please note where to place dropdown box in the position of the sentence.
    GRM_L["Reactivating Data SYNC with Guildies..."] = "Daten teilen AKTIVIEREN"
    GRM_L["Deactivating Data SYNC with Guildies..."] = "Daten teilen DEAKTIVIEREN"
    GRM_L["Display Sync Update Messages"] = "Update-Meldungen für GRM anzeigen"
    GRM_L["Only Sync With Up-to-Date Addon Users"] = "Nur mit Mitgliedern synchronisieren, die die aktuelle Version von GRM haben"
    GRM_L["Only Announce Anniversaries if Listed as 'Main'"] = "Nur Jahrestage von 'Mains' anzeigen"
    GRM_L["Leveled"] = "Level"
    GRM_L["Min:"] = "Min:"                                    -- Context: As in, the Minimum level to report or announce when player levels up
    GRM_L["Inactive Return"] = "wieder aktiv"
    GRM_L["resetall"] = "resetall"
    GRM_L["resetguild"] = "resetguild"
    GRM_L["Notify When Players Request to Join the Guild"] = "Anzeigen, wenn die Gilde offene Bewerbungen hat"
    --Side chat/log controls - Of note, limited spacing
    GRM_L["Name Change"] = "Namensänderung"
    GRM_L["Rank Renamed"] = "Rang umbenannt"
    GRM_L["Event Announce"] = "Ereignis"
    GRM_L["Left"] = "Austritt"                        -- Context: As in, "Left" the guild...
    GRM_L["Recommendations"] = "Erinnerungen"
    GRM_L["Banned"] = "gebannt"
    GRM_L["To Chat:"] = "Im Chat"                    -- Context: "To Chat Message frame -- in regards to announcing events like when a player leveled"
    GRM_L["To Log:"] = "Im Log"                     -- Context: To show it in the guild log.
    GRM_L["Display Changes"] = "Änderungen zeigen"
    GRM_L["Syncing too fast may cause disconnects!"] = "Zu schnelles teilen kann Disconnects verursachen!"
    GRM_L["Speed:"] = "Geschwindigkeit"                      -- Context: Speed that the sync takes place.
    GRM_L["Show 'Main' Name in Chat"] = "Zeige 'Main' im Chat"

    -- AUDIT WINDOW
    GRM_L["AUDIT"] = "PRÜFUNG"                                               -- Audit Tab name
    GRM_L["No Date Set"] = "Kein Datum"
    GRM_L["Main"] = "Main"
    GRM_L["Main or Alt?"] = "Main oder Twink?"
    GRM_L["Alt"] = "Twink"
    GRM_L["Total Incomplete:"] = "Gesamt unvollständig"
    GRM_L["Mains:"] = "Mains:"                                                                              -- Context: Number of "main" toons
    GRM_L["Unique Accounts:"] = "Accounts:"
    GRM_L["Total Incomplete: {num} / {custom1}"] = "Gesamt unvollständig {num} / {custom1}"                 -- Context: Total Incomeplete: 50 / 100    (50 out of 100)
    GRM_L["Mains: {num}"] = "Mains: {num}"                                                                  -- Context: Number of "main" toons
    GRM_L["Unique Accounts: {num}"] = "Accounts: {num}"
    GRM_L["All Complete"] = "Alles komplett"                                                                -- Context: All dates have been added and are known, thus it states it is "All Complete"
    GRM_L["Set Incomplete to Unknown"] = "Ändere \"kein Datum\" zu \"unbekannt\""                           -- Context: Implied to set ALL incomplete to unknown
    GRM_L["Clear All Unknown"] = "Ändere \"unbekannt\" zu \"kein Datum\""
    GRM_L["Please Wait {num} more Seconds"] = "Bitte warte {num} Sekunden"
    GRM_L["Guild Data Audit"] = "Gilden-Daten-Überprüfung"
    GRM_L["Name"] = "Name"
    GRM_L["Join Date"] = "Beitritt"
    GRM_L["Promo Date"] = "Beförderung"
    GRM_L["Main/Alt"] = "Main/Twink"
    GRM_L["Click Player to Edit"] = "Klicke auf einen Spieler zum Ändern"
    GRM_L["Only Show Incomplete Guildies"] = "Nur unvollständige Einträge zeigen"

    -- ADDON SYSTEM MESSAGES
    GRM_L["Guild Roster Manager"] = "Guild Roster Manager"
    GRM_L["GRM:"] = "GRM:"                                                                -- Abbreviation for "Guild Roster Manager"
    GRM_L["(Ver:"] = "Version:"                                                               -- Ver: is short for Version:
    GRM_L["GRM Updated:"] = "GRM aktualisiert:"
    GRM_L["Configuring Guild Roster Manager for {name} for the first time."] = "Erstes Konfigurieren von Guild Roster Manager für {name}"
    GRM_L["Reactivating Auto SCAN for Guild Member Changes..."] = "Reaktivieren von Auto-Scan für Gildenmitgliederänderungen"
    GRM_L["Reactivating Data Sync..."] = "Reaktiviere Daten-Synchronisation"
    GRM_L["Notification Set:"] = "Benachrichtigung eingestellt:"
    GRM_L["Report When {name} is ACTIVE Again!"] = "Meldung, wenn {name} nicht mehr AFK ist!"
    GRM_L["Report When {name} Comes Online!"] = "Meldung, wenn {name} online kommt!"
    GRM_L["Report When {name} Goes Offline!"] = "Meldung, wenn {name} offline geht!"
    GRM_L["A new version of Guild Roster Manager is Available!"] = "Eine neue Version von Guild Roster Manager ist verfügbar!"
    GRM_L["Please Upgrade!"] = "Bitte aktualisieren!"
    GRM_L["Player Does Not Have a Time Machine!"] = "Spieler hat keine Zeitmaschine!"
    GRM_L["Please choose a valid DAY"] = "Bitte einen gültigen TAG wählen"
    GRM_L["{name} has been Removed from the Ban List."] = "{name} wurde von der Bann-Liste entfernt."
    GRM_L["{num} Players Have Requested to Join the Guild."] = "{num} Spieler haben eine Gildenanfrage gesendet."
    GRM_L["A Player Has Requested to Join the Guild."] = "Ein Spieler hat eine Gildenanfrage gesendet."
    GRM_L["Click Link to Open Recruiting Window:"] = "Hier klicken, um das Bewerbungsfenster zu öffnen"
    GRM_L["Guild Recruits"] = "Bewerbungen"
    GRM_L["Scanning for Guild Changes Now. One Moment..."] = "Scanne nach Gildenänderungen. Bitte warten..."
    GRM_L["Breaking current Sync with {name}."] = "Breche Synchronisation mit {name} ab."
    GRM_L["Breaking current Sync with the Guild..."] = "Breche Gildensynchronisation ab..."
    GRM_L["Initializing Sync Action. One Moment..."] = "Starte Sync. Bitte warten..."
    GRM_L["No Players Currently Online to Sync With..."] = "Es sind keine Spieler online, mit denen du synchronisieren kannst."
    GRM_L["No Addon Users Currently Compatible for FULL Sync."] = "Es sind keine kompatiblen Addonnutzer online, mit denen du synchronisieren kannst."
    GRM_L["SYNC is currently not possible! Unable to Sync with guildies when guild chat is restricted."] = "Synchronisation nicht möglich! Gildenchat ist eingeschränkt."
    GRM_L["There are No Current Applicants Requesting to Join the Guild."] = "Keine Bewerbungen"
    GRM_L["The Applicant List is Unavailable Without Having Invite Privileges."] = "Die Seite für Gildenbewerbungen ist nicht sichtbar, wenn du keine Rechte zum Einladen hast."
    GRM_L["Manual Scan Complete"] = "Manueller Scan abgeschlossen"
    GRM_L["Analyzing guild for the first time..."] = "Analysiere Gilde das erste Mal..."
    GRM_L["Building Profiles on ALL \"{name}\" members"] = "Erstelle Profile für ALLE \"{name}\" Mitglieder"                 -- {name} will be the Guild Name, for context
    GRM_L["NOTIFICATION:"] = "BENACHRICHTIGUNG:"                                               -- Context:  "Notification: Player is no longer AFK"
    GRM_L["{name} is now ONLINE!"] = "{name} ist jetzt ONLINE!"
    GRM_L["{name} is now OFFLINE!"] = "{name} ist jetzt OFFLINE!"
    GRM_L["{name} is No Longer AFK or Busy!"] = "{name} ist nicht mehr AFK!"
    GRM_L["{name} is No Longer AFK or Busy, but they Went OFFLINE!"] = "{name} ist nicht mehr AFK, nun aber OFFLINE!"
    GRM_L["{name} is Already in Your Group!"] = "{name} ist bereits in deiner Gruppe!"
    GRM_L["GROUP NOTIFICATION:"] = "Gruppenbenachrichtigung:"
    GRM_L["Players Offline:"] = "Offline:"
    GRM_L["Players AFK:"] = "AFK:"
    GRM_L["40 players have already been invited to this Raid!"] = "Es sind bereits 40 Spieler in der Raidgruppe!"
    GRM_L["Player should try to obtain group invite privileges."] = "Du hast keine Rechte, um jemanden einzuladen."
    GRM_L["{name}'s saved data has been wiped!"] = "Die gespeicherten Daten von {name} wurden gelöscht!"
    GRM_L["Re-Syncing {name}'s Guild Data..."] = "Wiederherstellen der Daten von {name}"
    GRM_L["Wiping all Saved Roster Data Account Wide! Rebuilding from Scratch..."] = "Alle gespeicherten Daten werden gelöscht! Kompletter Neuaufbau..."
    GRM_L["Wiping all saved Guild data! Rebuilding from scratch..."] = "Alle gespeicherten Gildendaten werden gelöscht! Kompletter Neuaufbau..."
    GRM_L["There are No Log Entries to Delete, silly {name}!"] = "Keine Log-Einträge zum löschen vorhanden, Dummerchen!"
    GRM_L["Guild Log has been RESET!"] = "Gildenlog wurde gelöscht!"
    GRM_L["{name} is now set as \"main\""] = "{name} ist nun als \"Main\" gesetzt"
    GRM_L["{name} is no longer set as \"main\""] = "{name} ist nicht mehr als \"Main\" gesetzt"
    GRM_L["Reset All of {name}'s Data?"] = "Alle Daten von {name} löschen?"
    
    -- /grm help
    GRM_L["Opens Guild Log Window"] = "Öffnet das Gildenlog-Fenster"
    GRM_L["Resets ALL saved data"] = "Löscht ALLE gespeicherten Daten"
    GRM_L["Resets saved data only for current guild"] = "Löscht ALLE Daten dieser Gilde"
    GRM_L["Re-centers the Log window"] = "Zentriert alle Fenster"
    GRM_L["Triggers manual re-sync if sync is enabled"] = "Starte manuelle Synchronisation"
    GRM_L["Does a one-time manual scan for changes"] = "Startet einmaligen Scan nach Änderungen"
    GRM_L["Displays current Addon version"] = "Zeigt installierte Addon-Version"
    GRM_L["Opens Guild Recruitment Window"] = "Öffnet Fenster für Bewerbungen"
    GRM_L["WARNING! complete hard wipe, including settings, as if addon was just installed."] = "WARNUNG! Komplette Löschung ALLER DATEN inklusive Einstellungen. Als ob das Addon gerade installiert wurde.";

    -- General Misc UI
    GRM_L["Really Clear All Account-Wide Saved Data?"] = "Wirklich alle accountweit gespeicherten Daten löschen?"
    GRM_L["Really Clear All Guild Saved Data?"] = "Wirklich alle Gilden-Daten löschen?"
    GRM_L["Yes!"] = "Ja!"
    GRM_L["Ban Player?"] = "Spieler bannen?"
    GRM_L["Ban the Player's {num} alts too?"] = "Auch die {num} Twinks bannen?"      -- Plural number of alts
    GRM_L["Ban the Player's {num} alt too?"] = "Auch den Twink bannen?"     -- Singular number of alts, just 1
    GRM_L["Please Click \"Yes\" to Ban the Player!"] = "Bitte drücke \"Ja\" um den Spieler zu bannen!"

    -- Sync Messages
    GRM_L["{name} updated {name2}'s Join Date."] = "{name} hat das Beitrittsdatum von {name2} aktualisiert"
    GRM_L["{name} updated {name2}'s Promotion Date."] = "{name} hat das Beförderungsdatum von {name2} aktualisiert"
    GRM_L["\"{custom1}\" event added to the calendar by {name}"] = "\"custom1\" Ereignis wurde von {name} im Kalender erstellt."
    GRM_L["{name} updated {name2}'s list of Alts."] = "{name} hat die Twinkliste von {name} aktualisiert"
    GRM_L["{name} removed {name2}'s from {custom1}'s list of Alts."] = "{name} hat {name2} von der Twinkliste von {custom1} entfernt."
    GRM_L["{name} set {name2} to be 'Main'"] = "{name} hat {name2} als Main gesetzt."
    GRM_L["{name} has changed {name2} to be listed as an 'alt'"] = "{name} hat {name2} als Twink gesetzt."
    GRM_L["{name} has Removed {name2} from the Ban List."] = "{name} hat {name2} von der Bann-Liste entfernt."
    GRM_L["{name} has been BANNED from the guild!"] = "{name} wurde aus der Gilde VERBANNT!"
    GRM_L["{name} has been UN-BANNED from the guild!"] = "{name} ist nicht länger aus der Gilde verbannt!"
    GRM_L["Initiating Sync with {name} Instead!"] = "Starte stattdessen Synchronisation mit {name}!"
    GRM_L["Sync Failed with {name}..."] = "Synchronisation mit {name} gescheitert..."
    GRM_L["The Player Appears to Be Offline."] = "Der Spieler scheint offline zu sein."
    GRM_L["There Might be a Problem With Their Sync"] = "Es könnte ein Problem mit der Synchronisation bestehen"
    GRM_L["While not ideal, Ask Them to /reload to Fix It and Please Report the Issue to Addon Creator"] = "Auch, wenn es keine Lösung ist; bitte sie einen /reload zu machen und informiere den Addon-Autor über den Fehler."
    GRM_L["Manually Syncing Data With Guildies Now... One Time Only."] = "Manuelle Synchronisation mit Mitgliedern läuft...einmalig."
    GRM_L["Syncing Data With Guildies Now..."] = "Synchronisiere jetzt mit Mitgliedern..."
    GRM_L["(Loading screens may cause sync to fail)"] = "(Ladebildschirme können den Sync abbrechen)"
    GRM_L["Sync With Guildies Complete..."] = "Synchronisation abgeschlossen!"
    GRM_L["Manual Sync With Guildies Complete..."] = "Manuelle Synchronisation abgeschlossen!"
    GRM_L["No Players Currently Online to Sync With. Re-Disabling Sync..."] = "Keine Spieler online, mit denen synchronisiert werden kann..."
    GRM_L["{name} tried to Sync with you, but their addon is outdated."] = "Spieler {name} hat versucht, mit dir zu synchronisieren, aber sein Addon ist veraltet."
    GRM_L["Remind them to update!"] = "Bitte erinnere ihn/sie, zu aktualisieren!"

        -- ERROR MESSAGES
    GRM_L["Notification Has Already Been Arranged..."] = "Benachrichtigung wurde bereits eingestellt..."
    GRM_L["Failed to add alt for unknown reason. Try closing Roster window and retrying!"] = "Twink hinzufügen ist fehlgeschlagen. Schließe das Fenster und versuche es erneut."
    GRM_L["{name} is Already Listed as an Alt."] = "{name} ist bereits als Twink eingetragen."
    GRM_L["{name} cannot become their own alt!"] = "{name} kann nicht sein eigener Twink sein!"
    GRM_L["Player Cannot Add Themselves as an Alt"] = "Spieler können sich nicht selbst als Twinks hinzufügen"
    GRM_L["Player Not Found"] = "Spieler nicht gefunden"
    GRM_L["Please try again momentarily... Updating the Guild Event Log as we speak!"] = "Bitte versuch es in einem Moment noch einmal. Aktualisiere gerade."
    GRM_L["Invalid Command: Please type '/grm help' for More Info!"] = "Ungültiger Befehl. Bitte gib '/grm help' für mehr Infos ein."
    GRM_L["{name} is not currently in a guild. Unable to Proceed!"] = "{name} ist momentan in einer Gilde. Kann nicht fortfahren!"
    GRM_L["Addon does not currently support more than 75 alts!"] = "Addon unterstützt momentan nicht mehr, als 75 Twinks. (o.O!)"
    GRM_L["Please choose a VALID character to set as an Alt"] = "Bitte einen gültigen Spieler auswählen"
    GRM_L["Please choose a character to set as alt."] = "Bitte einen Spieler auswählen, um ihn als Twink einzutragen."
    GRM_L["GRM ERROR:"] = "GRM FEHLER:"
    GRM_L["Com Message too large for server"] = "Nachricht ist zu lang für den Server"                    -- Context: "Com message" is short-hand for "Communications message" - this is a technical error on syncing data.
    GRM_L["Prefix:"] = "Präfix:"
    GRM_L["Msg:"] = "Nachricht:"                                                -- Context: Msg is short for Message
    GRM_L["Unable to register prefix > 16 characters: {name}"] = "Kann Präfix nicht registrieren, maximal 16 Buchstaben: {name}"   -- Context: The {name} is the string code for the prefix. This is for debugging.


    --SLASH COMMANDS
    -- These are generally written in general shorthand. The original commands will ALWAYS work, but if there is one that makes more sense in your language, please feel free to modify
    GRM_L["clearall"] = "clearall"                         -- Context: In regards, "Clear All" saved data account wide 
    GRM_L["clearguild"] = "clearguild"                     -- Context: In regards, "Clear All" saved data from ONLY the current guild.
    GRM_L["hardreset"] = "hardreset"                       -- Context: In regards, "Hard Reset" ALL data account wide, including wiping player settings
    GRM_L["help"] = "hilfe"                                -- Context: "help" with info on the how to use addon
    GRM_L["version"] = "version"                           -- Context: "version" of the addon
    GRM_L["center"] = "zentrieren"                         -- Context: "center" the movable addon window back to center of screen
    GRM_L["sync"] = "sync"                                 -- Context: "sync" the data between players one time now.
    GRM_L["scan"] = "scan"                                 -- Context: "scan" for guild roster changes one time now.
    GRM_L["clearall"] = "clearall"                         -- Context: In regards, "Clear All" saved data
    GRM_L["recruit"] = "bewerber"                          -- Context: Open the roster "recruit" window where people request to join guild

    -- CLASSES
    GRM_L["Deathknight"] = "Todesritter"
    GRM_L["Demonhunter"] = "Dämonenjäger"
    GRM_L["Druid"] = "Druide"
    GRM_L["Hunter"] = "Jäger"
    GRM_L["Mage"] = "Magier"
    GRM_L["Monk"] = "Mönch"
    GRM_L["Paladin"] = "Paladin"
    GRM_L["Priest"] = "Priester"
    GRM_L["Rogue"] = "Schurke"
    GRM_L["Shaman"] = "Schamane"
    GRM_L["Warlock"] = "Hexenmeister"
    GRM_L["Warrior"] = "Krieger"

-- TIME AND DATES
    GRM_L["1 Mar"] = "1 Mär"                           -- This date is used in a specific circumstance. If someone's anniversary/bday landed on a leap year (Feb 29th), it defaults to the 1st of March on non-leap year
    -- Full Month Name
    GRM_L["January"] = "Januar"
    GRM_L["February"] = "Februar"
    GRM_L["March"] = "März"
    GRM_L["April"] = "April"
    GRM_L["May"] = "Mai"
    GRM_L["June"] = "Juni" 
    GRM_L["July"] = "Juli"
    GRM_L["August"] = "August"
    GRM_L["September"] = "September"
    GRM_L["October"] = "Oktober"
    GRM_L["November"] = "November"
    GRM_L["December"] = "Dezember"
    -- Shorthand Month
    GRM_L["Jan"] = "Jan"
    GRM_L["Feb"] = "Feb"
    GRM_L["Mar"] = "Mär"
    GRM_L["Apr"] = "Apr"
    GRM_L["May"] = "Mai"
    GRM_L["Jun"] = "Jun"
    GRM_L["Jul"] = "Jul"
    GRM_L["Aug"] = "Aug"
    GRM_L["Sep"] = "Sep"
    GRM_L["Oct"] = "Okt"
    GRM_L["Nov"] = "Nov"
    GRM_L["Dec"] = "Dez"
    -- Time Notifcation
    GRM_L["Seconds"] = "Sekunden"
    GRM_L["Second"] = "Sekunde"
    GRM_L["Minutes"] = "Minuten"
    GRM_L["Minute"] = "Minute"
    GRM_L["Hours"] = "Stunden"
    GRM_L["Hour"] = "Stunde"
    GRM_L["Days"] = "Tage"
    GRM_L["Day"] = "Tag"
    GRM_L["Months"] = "Monate"
    GRM_L["Month"] = "Monat"
    GRM_L["Years"] = "Jahre"
    GRM_L["Year"] = "Jahr"
    GRM_L["HourBreak"] = ":"

    GRM_L["am"] = "am"
    GRM_L["pm"] = "pm"
    GRM_L["24HR_Notation"] = ""

    GRM_L["{num} year"] = "{num} Jahr"
    GRM_L["{num} years"] = "{num} Jahre"
    GRM_L["{num} month"] = "{num} Monat"
    GRM_L["{num} months"] = "{num} Monate"
    GRM_L["{num} day"] = "{num} Tag"
    GRM_L["{num} days"] = "{num} Tage"
    GRM_L["< 1 day"] = "< 1 Tag"
    
    GRM_L["{num} yr"] = "{num} J"
    GRM_L["{num} yrs"] = "{num} J"
    GRM_L["{num} mo"] = "{num} M"
    GRM_L["{num} mos"] = "{num} M"
    GRM_L["{num} hr"] = "{num} Std"
    GRM_L["{num} hrs"] = "{num} Std"
    GRM_L["< 1 hour"] = "< 1 Stunde"
    GRM_L["{num} {custom1}"] = true                 -- Context: This is a placeholder for ANY generic time data -- Ex:  "1 year" or "15 months" - - The translation is already set, this is just to set the orientation of the number properly.

    -- MISC Punctuation
    GRM_L[","] = ","                               -- I know in some Asia languages, a comma is not used, but something similar, for example.

    -- Updates 1.126
    GRM_L["General"] = "Allgemein"
    GRM_L["General:"] = "Allgemein:"
    GRM_L["Scan"] = "Scan"
    GRM_L["Help"] = "Hilfe"
    GRM_L["UI"] = "Interface"                              -- UI for User Interface. Abbreviation for changing custom UI featuers, like coloring of <M> main
    GRM_L["Officer"] = "Offizier"                        -- as in, "Officer" rank
    GRM_L["Open Addon Window"] = "Öffne Addon-Fenster"
    GRM_L["Sync Addon Settings on All Alts in Same Guild"] = "Addon-Einstellungen für alle Twinks in der gleichen Gilde übernehmen"
    GRM_L["Show Minimap Button"] = "Zeige Minimap-Knopf"
    GRM_L["Player is Not Currently in a Guild"] = "Spieler ist momentan in keiner Gilde"
    -- tooltips
    GRM_L["|CFFE6CC7FClick|r to open GRM"] = "|CFFE6CC7FKlicken|r, um GRM zu öffnen"                           -- Please maintain the color coding
    GRM_L["|CFFE6CC7FRight-Click|r and drag to move this button."] = "|CFFE6CC7FRechtsklicken|r und ziehen, um diesen Knopf zu verschieben"   -- Likewise, maintain color coding
    GRM_L["|CFFE6CC7FRight-Click|r to Reset to 100%"] = "|CFFE6CC7FRechtsklicken|r, um auf 100% zurückzusetzen"                -- for the Options slider tooltip
    GRM_L["|CFFE6CC7FRight-Click|r to Sync Join Date with Alts"] = "|CFFE6CC7FRechtsklicken|r, um Beitrittsdatum auf alle Twinks zu übertragen"
    GRM_L["|CFFE6CC7FRight-Click|r to Set Notification of Status Change"] = "|CFFE6CC7FRechtsklicken|r, um eine Benachrichtigung zu erhalten, wenn der Status sich ändert"
    -- tooltip end
    GRM_L["GRM"] = "GRM"
    GRM_L["Include Unknown as Incomplete"] = "Unbekannt als unvollständig anzeigen"                           -- Context: Unknown in the Audit Tab will be hidden if filtering out complete players
    GRM_L["You Do Not Have Permission to Add Events to Calendar"] = "Du hast keine Rechte, um Ereignisse im Kalender zu erstellen"
    GRM_L["Please Select Which Join Date to Sync"] = "Bitte Beitrittsdatum zum teilen auswählen"
    GRM_L["Sync All Alts to {name}'s Join Date"] = "Allen Twinks das Beitrittsdatum von {name} übertragen"
    GRM_L["Sync All Alts to the Earliest Join Date: {name}"] = "Allen Twinks das früheste Beitrittsdatum übertragen: {name}"
    GRM_L["Sync All Alts to {name}'s |cffff0000(main)|r Join Date"] = "Allen Twinks das Beitrittsdatum übertragen: {name}|cffff0000(Main)"   -- The coloring ensures that "(main)" maintains the RED color. Please keep it consistent if relevant to your language.
    GRM_L["Join Date of All Alts is Currently Synced"] = "Beitrittsdaten aller Twinks sind übertragen"

    -- Update 1.130
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Hide this Button."] = "|CFFE6CC7FSTRG-Shift-Klicken|r, um diesen Knopf zu verstecken"
    GRM_L["Invited By:"] = "Eingeladen von:"
    GRM_L["To avoid storage bloat, a maximum of 2 save points is currently possible. Please remove one before Continuing."] = "Um Datenmüll zu vermeiden, kannst du maximal 2 Backups erstellen. Bitte lösche einen anderen, um fortzufahren."
    GRM_L["Error: Guild Not Found..."] = "Fehler: Gilde nicht gefunden..."
    GRM_L["Debugger Start"] = "Starte Debugger";

    -- Update 1.136
    GRM_L["To avoid storage bloat, a maximum of 2 guild save points is currently possible. Please remove one before continuing"] = "Um Datenmüll zu vermeiden, kannst du maximal 2 Backups erstellen. Bitte lösche einen anderen, um fortzufahren."
    GRM_L["Backup Point Removed for Guild \"{name}\""] = "Backup für Gilde \"{name}\" entfernt"
    GRM_L["Backup Point Restored for Guild \"{name}\""] = "Backup für Gilde \"{name}\" wiederhergestellt"
    GRM_L["Backup Point Set for Guild \"{name}\""] = "Backup für Gilde \"{name}\" gesetzt"
    GRM_L["Backup"] = "Backup"
    GRM_L["Horde"] = "Horde"
    GRM_L["Alliance"] = "Allianz"
    GRM_L["Creation Date"] = "Erstellungsdatum"
    GRM_L["Members"] = "Mitglieder"
    GRM_L["Backup {num}:"] = "Backup {num}:"           -- As in, the number of backups... so "Backup 1:"
    GRM_L["None"] = "leer"
    GRM_L["Restore"] = "Wiederherstellen"
    GRM_L["Set Backup"] = "Backup erstellen"
    GRM_L["Memory Usage: {num} MB"] = "genutzter Speicher: {num} MB"          -- MB references the number of MegaBytes of memory used.

    -- Update 1.137
    GRM_L["GRM: Unable to Create Backup for a Guild With Unknown Creation Date! Log into that guild on any alt to update old database."] = "Kann kein Backup für eine Gilde ohne Erstellungsdatum anlegen. Bitte logge auf einen Char in der Gilde, um veraltete Daten zu aktualisieren."
    GRM_L["Enable Auto-Backup Once Every"] = "Aktiviere Auto-Backup alle"
    GRM_L["Auto {num}:"] = "Auto {num}:"
    GRM_L["Please Choose a Time Interval Between 1 and 99 Days!"] = "Bitte wähle einen Intervall zwischen 1 und 99 Tagen!"
    GRM_L["Really restore {name} Backup Point?"] = "Wirklich {name} wiederherstellen?"
    GRM_L["Check All"] = "Alle auswählen"

    -- Update 1.139
    GRM_L["Right-Click for options to remove this guild from the addon database completely"] = "Rechtsklicken, um diese Gilde komplett aus der Datenbank zu entfernen"
    GRM_L["Player Cannot Purge the Guild Data they are Currently In!!!"] = "Du kannst nicht die Daten einer Gilde aufräumen, in der du gerade drin bist!"
    GRM_L["To reset your current guild data type '/grm clearguild'"] = "Um deine momentanen Gildendaten zurückzusetzen, tippe '/grm clearguild'"
    GRM_L["Click Here to Remove all traces of this guild, or hit ESC"] = "Hier klicken, um alle Spuren dieser Gilde zu beseitigen, ansonsten ESC drücken"
    GRM_L["{name} has been removed from the database."] = "{name} wurde aus der Datenbank gelöscht."              -- The Guild Name has been removed from the database

    -- update 1.141
    GRM_L["You will still share your data with the guild, but you are currently only accepting incoming changes from rank \"{name}\" or higher"] = "Du wirst weiterhin deine Daten mit der Gilde teilen, aber du bekommst nur Daten von Rang \"{name}\" oder höher"    -- Reminder, the backslash before a quotation denotes the string NOT to close, but to include the quotation in display txt
    GRM_L["Only Restrict Incoming Player Data to Rank Threshold, not Outgoing"] = "Begrenze nur eingehende Spielerdaten mit dem Rang, nicht ausgehende"
    GRM_L["Total Entries: {num}"] = "Einträge: {num}"
    GRM_L["Search Filter"] = "Suche"

    -- update 1.142
    GRM_L["Choose Color:"] = "Farbe:"
    GRM_L["Format:"] = "Format:"
    GRM_L["RGB Values Must be Between 1 and 255."] = "RGB-Werte müssen zwischen 1 und 255 liegen."

    -- Update 1.143
    GRM_L["The Log is Currently Empty for This Guild"] = "Im Moment keine Einträge in dieser Gilde"
    GRM_L["Building Log for Export..."] = "Erstelle Log für Export"
    GRM_L["Open Log Tools"] = "Zeige Log-Werkzeuge"
    GRM_L["Hide Log Tools"] = "Verstecke Log-Werkzeuge"
    GRM_L["Numbered Lines"] = "Zeilen nummerieren"
    GRM_L["Export Log"] = "Exportiere Log"
    GRM_L["Clear Lines:"] = "Lösche Zeilen:"
    GRM_L["Enable Ctrl-Shift-Click Line Removal"] = "Erlaube STRG-Shift-Klick, um Zeilen zu löschen"
    GRM_L["To"] = "bis"                                      -- Clear Lines:  50 To 100     -- It stands between 2 edit boxes as its own fontstring, so work with that.
    GRM_L["Confirm Clear"] = "Löschen bestätigen"
    GRM_L["Please Select Range of Lines from the Log You Wish to Remove"] = "Wähle Zeilen aus, die du löschen möchtest"
    GRM_L["Please put the lowest number in the first box"] = "Bitte schreibe die niedrigere Zahl in das erste Feld"
    GRM_L["Line selection is not valid"] = "Ungültige Zeilenauswahl"
    GRM_L["Really Clear lines {custom1} to {custom2}?"] = "Wirklich Zeilen {custom1} bis {custom2} löschen?"
    GRM_L["Enabling Line Numbers... Please choose within the given range"] = "Aktiviere nummerierte Zeilen...Bitte wähle aus den Vorhandenen"
    GRM_L["Ctrl-C to Copy <> Ctrl-P to Paste <> Ctrl-A to Select All"] = "STRG+C zum Kopieren <> STRG+V zum Einfügen <> STRG+A un alles auszuwählen"
    GRM_L["Language Selection:"] = "Sprache:"
    GRM_L["{num} phrases still need translation to {name}"] = "{num} Sätze müssen noch übersetzt werden"                  -- Ex: 300 phrases still need translation to German

    -- update 1.145
    GRM_L["You currently are at {num} non-Battletag friends. To fully take advantage of all of GRM features, please consider clearing some room."] = "Du hast momentan {num} Freunde (nicht Battle-net Freunde!). Um alle Funktionen von GRM nutzen zu können, musst du bitte einen Freund entfernen."
    GRM_L["Clear Space on Friends List to Find Online Status"] = "Bitte mache Platz auf deiner Freundesliste, um den Online-Status von Bewerbern zu prüfen"
    GRM_L["Offline"] = "Offline"
    GRM_L["{name} has requested to join the guild and is currently ONLINE!"] = "{name} hat sich bei der Gilde beworben und ist gerade ONLINE!"

    -- Update 1.146
    GRM_L["Really Clear line {num}?"] = "Wirklich Zeile {num} löschen?"
    GRM_L["Font has been Reset to DEFAULT."] = "Schriftart zurückgesetzt"
    GRM_L["Font Selection:"] = "Schriftart:"
    GRM_L["Font Scale:"] = "Schriftgröße:"
    GRM_L["Example"] = "Beispiel"
    GRM_L["Right-Click to Reset to 100%"] = "Rechtsklicken, um auf 100% zurückzusetzen"

    -- Update 1.147
    GRM_L["|CFFE6CC7FClick|r to open Player Window"] = "|CFFE6CC7FKlicken|r, um Spielerfenster zu öffnen"
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Search the Log for Player"] = "|CFFE6CC7FSTRG-Shift-Klicken|r, um das Log nach diesem Spieler zu durchsuchen"

    -- Update 1.148
    GRM_L["Custom Notes:"] = "Eigene Notizen:"
    GRM_L["GRM Debugging Enabled."] = "GRM Debugging aktiviert"
    GRM_L["GRM Debugging Disabled."] = "GRM Debugging deaktiviert"
    GRM_L["Please type \"/grm debug 10\" to report 10 events (or any number)"] = "Gib \"/grm debug 10\" ein, um die letzten 10 Einträge auszugeben (oder jede andere Zahl)"        -- Please keep the \"/grm debug 10)\" in-tact for slash command to work
    GRM_L["Format: \"/grm debug 10\""] = "Format: \"/grm debug 10\""                                                                  -- "" Likewise
    GRM_L["Error: Debug Command not recognized."] = "Fehler: Debug-Befehl unbekannt"
    GRM_L["You may want to temporarily disable SYNC in the options if you are debugging another feature."] = "Deaktiviere eventuell den Sync, während du andere Inhalte debugst"
    GRM_L["Sync Custom Notes"] = "Teile eigene Notizen"
    GRM_L["Default Custom Note Rank Minimum"] = "Mindestrang zum Teilen:"
    GRM_L["Reset Default Custom Note Restrictions for ALL Guildies"] = "Setze Beschränkungen für ALLE Mitglieder auf Standard zurück"
    GRM_L["Reset to Default"] = "Auf Standard zurücksetzen"
    GRM_L["Reset"] = "zurücksetzen"
    GRM_L["|CFF00CCFFDefault Selection For All Players"] = "|CFF00CCFFStandardauswahl für alle Spieler"
    GRM_L["Each Guildie Can Still be Manually Configured"] = "Jedes Mitglied kann auch weiterhin einzeln konfiguriert werden"
    GRM_L["Does NOT apply to Ban List or Custom Note"] = "Wirkt sich NICHT auf die Einstellungen für die Bann-Liste oder eigene Notizen aus"
    GRM_L["Custom note Rank reset to default \"{name}\" (or higher)"] = "Eigene Notizen-Rang wurde zurückgesetzt: \"{name}\" (oder höher)"
    GRM_L["If sync was manually disabled for specific guildies, this does NOT enabled it."] = "Wenn der Sync für einzelne Mitglieder deaktiviert wurde, wird dies sie NICHT aktivieren."
    GRM_L["Custom note default settings for Rank and Sync have been reset."] = "Eigene Notizen-Einstellungen wurden auf Standard zurückgesetzt"
    GRM_L["Custom note Sync has been reset to default"] = "Eigene Notizen-Sync wurde auf Standard zurückgesetzt"
    GRM_L["Click here to set Custom Notes"] = "Klicke, um Eigene Notizen einzutragen"
    GRM_L["|CFF00CCFFCustom Note Defaults:"] = "|CFF00CCFFEigene Notizen Einstellungen:"
    GRM_L["|CFFE6CC7FLeft-Click|r to ONLY reset all to default rank"] = "|CFFE6CC7FKlicken|r, um auf Mindestrang zurückzusetzen"
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to reset BOTH sync and rank defaults"] = "|CFFE6CC7FSTRG-Shift-Klicken|r, um beides zurückzusetzen"
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r to re-enable custom note sync for all"] = "|CFFE6CC7FSTRG-Klicken|r, um Sync-Einstellung für eigene Notizen zurückzusetzen"
    GRM_L["Custom Note Sync Disabled in Settings"] = "Eigene Notizen-Sync ist deaktiviert"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Added"] = "{name} hat die eigenen Notizen von {name2} geändert: \"{custom1}\" hinzugefügt"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Removed"] = "{name} hat die eigenen Notizen von {name2} geändert: \"{custom1}\" gelöscht"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" to \"{custom2}\""] = "{name} hat die eigenen Notizen von {name2} geändert: \"{custom1}\" geändert zu \"{custom2}\""
    GRM_L["Custom Note"] = "Eigene Notiz"
    GRM_L["Syncing Outgoing Data."] = "Teile ausgehende Daten."
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction"] = "|CFFE6CC7FKlicken|r, um Rang-Beschränkungen zu ändern"
    GRM_L["|CFFE6CC7FClick|r to Change Day"] = "|CFFE6CC7FKlicken|r, um Tag zu ändern"
    GRM_L["|CFFE6CC7FClick|r to Change Month"] = "|CFFE6CC7FKlicken|r, um Monat zu ändern";
    GRM_L["|CFFE6CC7FClick|r to Change Year"] = "|CFFE6CC7FKlicken|r, um Jahr zu ändern";
    GRM_L["Edited by {name}"] = "Geändert von: {name}"
    GRM_L["Note Removed by {name}"] = "Notiz gelöscht von: {name}"
    GRM_L["|CFFFF0000Player No Longer in Guild"] = "|CFFFF0000Spieler nicht mehr in der Gilde"
    GRM_L["|CFF00CCFFMinimum Rank to Sync: Player Data, Custom Notes, Ban List"] = "|CFF00CCFFMinimaler Rang, um folgendes zu teilen: Spielerdaten, Eigene Notizen, Bann-Liste"
    GRM_L["Warning! Ban List rank threshold is below the overall sync rank. Changing from \"{name}\" to \"{name2}\""] = "Warnung! Bann-Listen-Rang-Beschränkung ist unter der Allgemeinen Rang-Beschränkung! Wechsle von \"{name}\" zu \"{name2}\""
    GRM_L["Warning! Custom Note rank threshold is below the overall sync rank. Changing default from \"{name}\" to \"{name2}\""] = "Warnung! Eigene Notizen-Rang-Beschränkung ist unter der Allgemeinen Rang-Beschränkung! Wechsle Standard von \"{name}\" zu \"{name2}\""
    GRM_L["Custom Note Default Rank is Also Being Set to \"{name}\""] = "Standard-Rang für Eigene Notizen wurde auch auf \"{name}\" gesetzt"
    GRM_L["|CFF00CCFFSync filter can be set tighter for the Ban List"] = "|CFF00CCFFSync-Filter für die Bann-Liste kann angepasst werden"
    GRM_L["Warning! Unable to select a Ban List rank below \"{name}\""] = "Warnung! Kann keinen Rang unter \"{name}\" für die Bann-Liste setzen"
    GRM_L["Warning! Custom Note rank filter must be below \"{name}\""] = "Warnung! Rang muss mindestens \"{name}\" sein"
    GRM_L["Setting to match core filter rank"] = "Zum Ändern muss der Rang zum Änderungen teilen (oben) zunächst geändert werden"
    GRM_L["Warning! \"{name}\" is the lowest rank that can receive this custom note.\nCheck the options menu to adjust overall settings."] = "Warnung! \"{name}\" ist der Minimalrang, um Eigene Notizen zu erhalten. \nÜberprüfe die Optionen, um die globalen Einstellungen anzupassen."

    -- R1.1482
    GRM_L["Shift-Click Name On Roster Also Works"] = "Shift-Klick auf einen Namen in der Liste geht auch"
    GRM_L["Tooltip Scale:"] = "Tooltip Skalierung"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Language"] = "|CFFE6CC7FKlicken|r, um die Sprache zu ändern"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change Display Format"] = "|CFFE6CC7FKlicken|r, um Anzeigeformat zu ändern"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Font"] = "|CFFE6CC7FKlicken|r, um die Schriftart zu ändern"
    GRM_L["Unfortunately each player's data will need to be manually reconfigured."] = "Unglücklicherweise müssen alle Spielerdaten manuell neu eingestellt werden."
    GRM_L["{num} custom {custom1} removed that matched text:"] = "Es wurden {num} Eigene {custom1} gelöscht, die den Text enthielten:"                           -- custom1 = "note" or the plural "notes"
    GRM_L["notes"] = "Notizen"
    GRM_L["Please add specific text, in quotations, to match"] = "Bitte füge einen Text in Anführungszeichen ein, um zu suchen"

    -- R1.1490
    GRM_L["You will still share some outgoing data with the guild"] = "Du teilst weiterhin ausgehende Daten mit der Gilde"
    GRM_L["Unable to properly locate guild for backup"] = "Kann keine Gilde für Backup finden"

    -- R1.1500
    GRM_L["It's almost time to celebrate {name}'s Birthday!"] = "Es ist fast soweit, um den Geburtstag von {name} zu feiern!"          -- Custom1 is the actual date.  Like "1 Mar '18"
    GRM_L["Unique accounts pull from the server is known to faulty"] = "Serverabfrage für die Accounts ist fehlerhaft"
    GRM_L["Use only as an estimate. Hopefully Blizz fixes this soon"] = "Nutze diese Zahl nur als Schätzung. Wir hoffen auf einen Fix von Blizz"
    GRM_L["{name}'s Anniversary!"] = "Jahrestag von {name}!"
    GRM_L["{name}'s Birthday!"] = "Geburtstag von {name}!"
    GRM_L["Guild member for over {num} year"] = "Gildenmitglied seit über {num} Jahr"
    GRM_L["Guild member for over {num} years"] = "Gildenmitglied seit über {num} Jahren"  -- the plural version!
    GRM_L["Add Upcoming Events to the Calendar"] = "Füge anstehende Ereignisse dem Kalender hinzu"
    GRM_L["Player rank unable to add events to calendar"] = "Gildenrang zu niedrig, um Ereignisse im Kalender anzulegen"
    GRM_L["Anniversaries, Birthdays, and Other Events can be added with permission"] = "Jahrestage, Geburtstage und andere Ereignisse können mit Erlaubnis angelegt werden"

    -- R1.1510
    GRM_L["Check the \"Sync Users\" tab to find out why!"] = "Schaue in den \"Sync-Tab\", um herauszufinden, warum"
    GRM_L["Time as Member:"] = "Zeit als Mitglied:"
    GRM_L["|CFFE6CC7FClick|r to select player event"] = "|CFFE6CC7FKlicken|r, um Spieler-Event auszuwählen"
    GRM_L["|CFFE6CC7FClick Again|r to open Player Window"] = "|CFFE6CC7FErneut klicken|r, um Spielerfenster zu öffnen"
    GRM_L["Timestamp Format:"] = "Datumsformat:"
    GRM_L["Hour Format:"] = "Zeitformat:"
    GRM_L["24 Hour"] = "24 Stunden"
    GRM_L["12 Hour (am/pm)"] = "12 Stunden"                             -- removed the am/pm due to spacing. Context prob just fine
    GRM_L["Confirm Custom Note"] = "Bestätige Eigene Notiz"
    GRM_L["Enable Fade on Tab Change"] = "Aktiviere Verblassen bei Tabwechsel"

    -- R1.1520
    GRM_L["A new rank has been added to the guild!"] = "Ein neuer Rang wurde der Gilde hinzugefügt!"
    GRM_L["{num} new ranks have been added to the guild!"] = "{num} neue Ränge wurden der Gilde hinzugefügt!"
    GRM_L["The guild has removed a rank!"] = "Ein Rang wurde der Gilde entfernt!"
    GRM_L["{num} guild ranks have been removed!" ] = "{num} Ränge wurden der Gilde entfernt!"
    GRM_L["Edit Ban"] = "Bann editieren"
    GRM_L["Please Select a Player to Edit their Ban!"] = "Bitte einen Spieler auswählen, um seinen Bann zu editieren!"
    GRM_L["Update Ban"] = "Bann aktualisiert"
    GRM_L["{name}'s Ban Info has Been Updated!"] = "Bann-Info von {name} aktualisiert!"

    -- R1.1530
    GRM_L["{name} plays the {custom1} class, not {custom2}."] = "{name} spielt {custom1},  nicht {custom2}."             -- Example: Arkaan plays the Hunter class, not Paladin.
    GRM_L["{num} Items Updated"] = "{num} Gegenstände aktualisiert"
    GRM_L["You Currently Have Disabled Adding Events to Calendar"] = "Du hast es momentan deaktiviert, Kalenderereignisse zu erstellen"

    -- R1.20
    GRM_L["|CFFE6CC7FHold Shift|r to view more alt details."] = "|CFFE6CC7FHalte Shift|r, um mehr Twink-Details zu sehen."               -- "Hold Shift to view more alt details" is the phrase, but the |CFF|r is the text coloring hex code. Please keep it in there on the keyboard command coloring
    GRM_L["|CFFE6CC7FClick|r to view more alt details."] = "|CFFE6CC7FKlicke|r, um mehr Twink-Details zu sehen."
    GRM_L["|CFFE6CC7FShift-Click|r to keep alt details open."] = "|CFFE6CC7FShift-Klicke|r, um die Twink-Details offen zu lassen"               -- The same can be said here. ^^
    GRM_L["|CFFE6CC7FClick|r to flip player name ordering"] = "|CFFE6CC7FKlicke|r, um die Sortierreihenfolge umzudrehen"                  -- and the reset...
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Newest"] = "|CFFE6CC7FKlicke|r, um Neueste Eintrittsdaten oben zu sehen"
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Oldest"] = "|CFFE6CC7FKlicke|r, um Älteste Eintrittsdaten oben zu sehen"
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Newest"] = "|CFFE6CC7FKlicke|r, um Neueste Beförderungen oben zu sehen"
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Oldest"] = "|CFFE6CC7FKlicke|r, um Älteste Beförderungen oben zu sehen"
    GRM_L["|CFFE6CC7FClick|r to sort all Mains first"] = "|CFFE6CC7FKlicke|r, um alle Mains zuerst zu sehen"
    GRM_L["|CFFE6CC7FClick|r to sort all Alts first."] = "|CFFE6CC7FKlicke|r, um alle Twinks zuerst zu sehen"
    GRM_L["{name}'s Profile is Being Built. One Moment..."] = "Profil von {name} wird erstellt. Einen Moment..."
    GRM_L["There are {num} players requesting to join your guild. You only have room for {custom1} more friends. Please consider cleaning up your friend and recruitment lists."] = "Deine Gilde hat {num} neue Anfragen. Du hast aber nur Plätze für {custom1} neue Freunde. Bitte mache Platz auf deiner Freundesliste, um den Online-Status von Bewerbern zu prüfen"
    GRM_L["{name}'s Alts"] = "Twinks von {name}"                                            -- Like "Arkaan's Alts"
    GRM_L["Online:  {num}/{custom1}"] = "Online: {num}/{custom1}"                           -- As in "Online: 3/59"
    GRM_L["Next"] = "Nächster"                                                              -- This means to Advance forward to the "next" one. It is used on recruitment window to move to NEXT online player.
    GRM_L["Previous"] = "Voriger"                                                           -- Same context as the "next" except this one goes back to the one before.
    GRM_L["There are currently no ONLINE recruits."] = "Momentan sind keine Bewerber online."
    GRM_L["There are currently no more players in that direction."] = "Es gibt keine Spieler mehr in dieser Richtung."
    GRM_L["You have reached the end of the list"] = "Du hast das Ende der Liste erreicht"
    GRM_L["You have reached the top of the list"] = "Du hast den Anfang der Liste erreicht"
    GRM_L["Auto Open Window"] = "Fenster automatisch öffnen"
    GRM_L["Only if a player is online and you are not in combat"] = "Nur, wenn ein Spieler online ist und du nicht im Kampf bist"
    GRM_L["Recruit window will open when combat ends."] = "Anfragen-Fenster wird geöffnet, wenn der Kampf zu Ende ist."
    GRM_L["GRM window will open when combat ends."] = "GRM wird geöffnet, wenn der Kampf zu Ende ist."

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

-- THANK YOU @Nehry for this full translation up to R1.20