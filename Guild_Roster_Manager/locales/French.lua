
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

-- French Defaults
GRML.French = function()
    ---------------------------------
    -- BEGIN TRANSLATION WORK HERE --
    ---------------------------------

    GRM_L["Guild"] = "Guilde"

    -- PLAYER MAIN ROSTER DETAILS WINDOW
    GRM_L["Level: "] = "Niveau"
    GRM_L["Level"] = "Niveau"
    GRM_L["Note:"] = "Note :"
    GRM_L["Note"] = "Note"
    GRM_L["Officer's Note:"] = "Note d'officier :"
    GRM_L["Officer's Note"] = "Note d'officier"
    GRM_L["Zone:"] = "Zone :"
    GRM_L["(main)"] = "(main)"
    GRM_L["( Main )"] = "( Main )"                                -- Context: This one is used on player data window, the other is smaller used in the alts list...
    GRM_L["Set as Main"] = "Définir comme Main"
    GRM_L["Set as Alt"] = "Définir comme Alt"
    GRM_L["Remove"] = "Supprimer"
    GRM_L["Please Type the Name of the alt"] = "Merci d'entrer le nom de l'Alt"
    GRM_L["Promoted:"] = "Promu :"
    GRM_L["Unknown"] = "Inconnue"                                                                 -- Context: The date of their promotion is "Unknown"
    GRM_L["Click here to set a Public Note"] = "Cliquer pour ajouter une note publique"
    GRM_L["Unable to Edit Public Note at Rank"] = "Impossible d'éditer la note publique avec ce grade"
    GRM_L["Click here to set an Officer's Note"] = "Cliquer pour ajouter une note d'officier"
    GRM_L["Unable to Edit Officer Note at Rank"] = "Impossible d'éditer la note d'officier avec ce grade"
    GRM_L["Unable to View Officer Note at Rank"] = "Impossible de voir la note d'officier avec ce grade"
    GRM_L["Online"] = "En ligne"
    GRM_L["( Active )"] = "Actif"                       -- I included the parentheses here as I am not sure if any languages abstain from them, or use other notation. Feel free to remove if necessary
    GRM_L["( AFK )"] = "AFK"
    GRM_L["( Busy )"] = "Occupé"
    GRM_L["( Mobile )"] = "Mobile"
    GRM_L["( Offline )"] = "Hors Ligne"
    GRM_L["Set Join Date"] = "Définir"
    GRM_L["Edit Promo Date"] = "Éditer date"
    GRM_L["Edit Join Date"] = "Éditer date d'entrée"
    GRM_L["Set Promo Date"] = "Définir"
    GRM_L["In Group"] = "En groupe"                            -- Context: "Player is already In Group with you"
    GRM_L["Group Invite"] = "Invitation de groupe"
    GRM_L["No Invite"] = "Pas d'invitation"
    GRM_L["Group Invite"] = "Invitation de groupe"
    GRM_L["Date Promoted?"] = "Date promotion ?"
    GRM_L["Last Online"] = "Vu en ligne"
    GRM_L["Time In:"] = "Depuis : "                            -- Context: "Time In" the current zone...
    GRM_L["Date Joined"] = "Date d'entrée"
    GRM_L["Join Date?"] = "Définir"
    GRM_L["Player Was Previously Banned!"] = "Joueur banni précédemment !"
    GRM_L["Ignore Ban"] = "Ignorer le ban"
    GRM_L["Player Alts"] = "Alts du joueur"
    GRM_L["Add Alt"] = "Ajouter Alt"
    GRM_L["Choose Alt"] = "Choisir Alt"
    GRM_L["(Press Tab)"] = "Appuyez sur TAB"
    GRM_L["Shift-Mouseover Name On Roster Also Works"] = "Maj + Survoler un nom dans la liste fonctionne également"
    GRM_L["Guild Log"] = "Journal de guilde"

    -- TOOLTIPS
    GRM_L["Rank History"] = "Historique des grades" 
    GRM_L["Time at Rank:"] = "Temps passé à ce grade :"
    GRM_L["Right-Click to Edit"] = "Clic-droit pour éditer"
    GRM_L["Left Guild"] = "A quitté la guilde"
    GRM_L["Membership History"] = "Historique des membres"
    GRM_L["Joined:"] = "Recruté le"                             -- as in "Joined" the guild
    GRM_L["Joined"] = "A rejoint"
    GRM_L["Left:"] = "A quitté :"                               -- as in, "Left" the guild
    GRM_L["Rejoined:"] = "a rejoint de nouveau :"                           -- as in, "Rejoined" the guild
    GRM_L["Reset Data!"] = "Réinitialiser les données !"
    GRM_L["Notify When Player is Active"] = "Notifier quand le joueur est Actif"
    GRM_L["Notify When Player Goes Offline"] = "Notifier quand le joueur se déconnecte"
    GRM_L["Notify When Player Comes Online"] = "Notifier quand le joueur se connecte"
    GRM_L["Edit Date"] = "Éditer date"
    GRM_L["Clear History"] = "Nettoyer l'historique"
    GRM_L["Options"] = "Options"
    GRM_L["Cancel"] = "Annuler"
            
    -- LOG
    GRM_L["LOG"] = "JOURNAL"                                                     -- Context - The guild Log shorthand for the tab
    GRM_L["Guild Roster Event Log"] = "Journal de guilde"
    GRM_L["Clear Log"] = "Nettoyer journal"
    GRM_L["Really Clear the Guild Log?"] = "Voulez-vous vraiment nettoyer le journal de guilde ?"
    GRM_L["{name} DEMOTED {name2}"] = "{name} a rétrogradé {name2}"
    GRM_L["{name} PROMOTED {name2}"] = "{name} a promu {name2}"
    GRM_L["{name} KICKED {name2} from the Guild!"] = "{name} a renvoyé {name2} de la guilde !"
    GRM_L["kicked"] = "renvoyé"
    GRM_L["{name} has Left the guild"] = "{name} a quitté la guilde"
    GRM_L["{name} INVITED {name2} to the guild."] = "{name} a invité {name2} dans la guilde."
    GRM_L["{name} has BANNED {name2} and all linked alts from the guild!"] = "{name} a banni {name2} et tous ses alts liés de la guilde !"
    GRM_L["{name} has BANNED {name2} from the guild!"] = "{name} a banni {name2} de la guilde !"
    GRM_L["Reason Banned:"] = "Raison du ban : "
    GRM_L["has Left the guild"] = "a quitté la guilde"                                      -- Context: PlayerName "has left the guild"
    GRM_L["ALTS IN GUILD:"] = "ALTS DANS LA GUILDE :"                                          -- Context: This appears If a person leaves the guild and there are still alts in the guild. It is like - "ALTS IN GUILD: Arkaan, Chris, Matt, and 4 others.""
    GRM_L["Player no longer on Server"] = "Le joueur a quitté le serveur"
    GRM_L["{name} PROMOTED {name2} from {custom1} to {custom2}"] = "{name} a promu {name2} de {custom1} à {custom2}"
    GRM_L["{name} has been PROMOTED from {custom1} to {custom2}"] = "{name} a été promu de {custom1} à {custom2}"
    GRM_L["{name} DEMOTED {name2} from {custom1} to {custom2}"] = "{name} a retrogradé {name2} de {custom1} à {custom2}"
    GRM_L["{name} has been DEMOTED from {custom1} to {custom2}"] = "{name} a été rétrogradé de {custom1} à {custom2}"
    GRM_L["(+ {num} More)"] = "(+ {num} autr(e)s)"                                          -- Context: Referencing num of alts if player leaves guild, that are stil in it. Example "ALTS IN GUILD: Christ, Matt, Sarah (and 4 more)"
    GRM_L["{name} has Been in the Guild {num} Times Before"] = "{name} a été dans la guilde {num} fois auparavant"
    GRM_L["{name} is Returning for the First Time."] = "{name} revient pour la première fois."
    GRM_L["None Given"] = "Néant"                                              -- Context: No reason given for player ban. This is displayed when a player was banned, but the addon users did not input a reason why.
    GRM_L["WARNING!"] = "AVERTISSEMENT !"                                                -- Context: WARNING - banned player rejoined the guild!
    GRM_L["{name} REJOINED the guild but was previously BANNED!"] = "{name} a rejoint la guilde alors qu'il a été banni !"
    GRM_L["(Invited by: {name})"] = "(Invité par : {name})"
    GRM_L["Invited By: {name}"] = "Invité par : {name}"
    GRM_L["Date of Ban:"] = "Date du ban :"
    GRM_L["Date Originally Joined:"] = "Première date d'entrée :"
    GRM_L["Old Guild Rank:"] = "Ancien grade de guilde :"
    GRM_L["Reason:"] = "Raison :"
    GRM_L["Additional Notes:"] = "Notes additionnelles :"
    GRM_L["{name} has REINVITED {name2} to the guild"] = "{name} a réinvité {name2} dans la guilde"
    GRM_L["(LVL: {num})"] = "(NIV: {num})"                                            -- Context: LVL means Player Level - so Ex: (LVL: 110)
    GRM_L["{name} has REJOINED the guild"] = "{name} a encore rejoint la guilde"
    GRM_L["{name} has JOINED the guild!"] = "{name} a rejoint la guilde !"
    GRM_L["Date Left:"] = "Date du départ :"
    GRM_L["{name} has Leveled to {num}"] = "{name} a atteint le niveau {num}"
    GRM_L["Leveled to"] = "a atteint le niveau"                                             -- For parsing the message, please include the string found in previous "has leveled to" message
    GRM_L["(+{num} levels)"] = "(+{num} niveaux)"                                         -- Context: Person gained more than one level, hence the plural
    GRM_L["(+{num} level)"] = "(+{num} niveau)"                                          -- Context: Person gains a level, just one level.
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Added"] = "Note publique de {name} ajoutée : \"{custom1}\""           -- Of note, the \" in the text here will just appear as " in-game. The \" notation is telling the program not to end the string, but to include quotation
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" was Removed"] = "Note publique de {name} retirée : \"{custom1}\""
    GRM_L["{name}'s PUBLIC Note: \"{custom1}\" to \"{custom2}\""] = "Note publique de {name} : \"{custom1}\" en \"{custom2}\""    -- Context: "Arkaan's PUBLIC Note: "ilvl 920" to "Beast Mode ilvl 960""  -- Changing of the note. custom1 = old note, custom2 = new note
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Added"] = "Note d'officier de {name} ajoutée : \"{custom1}\""
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" was Removed"] = "Note d'officier de {name} retirée : \"{custom1}\""
    GRM_L["{name}'s OFFICER Note: \"{custom1}\" to \"{custom2}\""] = "Note d'officier de {name} : \"{custom1}\" en \"{custom2}\""
    GRM_L["Guild Rank Renamed from {custom1} to {custom2}"] = "Grade de guilde renommé de {custom1} en {custom2}"
    GRM_L["{name} has Name-Changed to {name2}"] = "{name} a changé de nom pour {name2}"
    GRM_L["{name} has Come ONLINE after being INACTIVE for {num}"] = "{name} est En Ligne après avoir été Inactif pendant {num}"
    GRM_L["{name } Seems to Have Name-Changed, but their New Name was Hard to Determine"] = "{name } semble avoir changé de nom mais son nouveau nom est difficile à déterminer"
    GRM_L["It Could Be One of the Following:"] = "Ce pourrait être l'un des suivants :"
    GRM_L["{name} has been OFFLINE for {num}. Kick Recommended!"] = "{name} est Hors Ligne depuis {num}. Exclusion recommandée !"
    GRM_L["({num} ago)"] = "de cela"                                             -- Context: (5 minutes ago) or (5 months 24 days ago) -- the {num} will automatically include the time-passed date.
    GRM_L["{name}'s Guild has Name-Changed to \"{name2}\""] = "La guilde {name} a été renommée en \"{name2}\""
    GRM_L["{name} will be celebrating {num} year in the Guild! ( {custom1} )"] = "{name} célébrera {num} an dans la guilde ! ( {custom1} )"            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild! ( {custom1} )"] = "{name} célébrera {num} ans dans la guilde ! ( {custom1} )"           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["Promotions"] = "Promotions"
    GRM_L["Demotions"] = "Rétrogradations"

    -- EVENTS WINDOW
    GRM_L["EVENTS"] = "ÉVÉNEMENTS"                                          -- Events tab
    GRM_L["{name}'s Anniversary!"] = "Anniversaire de guilde de {name}"
    GRM_L["{name}'s Birthday!"] = "Date de naissance de {name} !"
    GRM_L["Please Select Event to Add to Calendar"] = "Sélectionner un événement à ajouter au calendrier"
    GRM_L["No Calendar Events to Add"] = "Aucun événement à ajouter"
    GRM_L["Event Calendar Manager"] = "Gestionnaire d'événements"
    GRM_L["Event:"] = "Événement : "
    GRM_L["Description:"] = "Description :"
    GRM_L["Add to\nCalendar"] = "Ajouter"
    GRM_L["Ignore Event"] = "Ignorer"
    GRM_L["No Player Event Has Been Selected"] = "Aucun joueur n'a été sélectionné"
    GRM_L["Event Added to Calendar: {custom1}"] = "Événement ajouté au calendrier : {custom1}"              -- Custom1 = the title of the event, like "Arkaan's Anniversary"
    GRM_L["Please Select Event to Add to Calendar"] = "Sélectionner un événement à ajouter au calendrier"
    GRM_L["No Calendar Events to Add"] = "Aucun événement à ajouter"
    GRM_L["{name}'s event has already been added to the calendar!"] = "L'événement de {name} a déjà été ajouté au calendrier !"
    GRM_L["Please wait {num} more seconds to Add Event to the Calendar!"] = "Merci de patienter {num} secondes avant d'ajouter l'événement au calendrier !"
    GRM_L["{name}'s Event Removed From the Que!"] = "L'événement de {name} a déjà été retiré de la file d'attente !"
    GRM_L["Full Description:"] = "Description complète :"

    -- BAN WINDOW
    GRM_L["BAN LIST"] = "LISTE BAN"                                        -- Ban List Tab
    GRM_L["Reason Banned?"] = "Raison du ban ?"
    GRM_L["Click \"YES\" When Done"] = "Cliquer \"OUI\" pour valider"                         -- Of note, the \" is how you notate for quotations to actually appear. Adjust as needed
    GRM_L["Select a Player"] = "Selectionner un joueur"
    GRM_L["Player Selected"] = "Joueur sélectionné"
    GRM_L["{name}(Still in Guild)"] = "{name}(Toujours en guilde)"
    GRM_L["No Ban Reason Given"] = "Aucune raison de ban donnée"
    GRM_L["Reason:"] = "Raison :"                                         -- Context: As in, "Reason Banned"
    GRM_L["Total Banned:"] = "Total Banni(s) :"
    GRM_L["Rank"] = "Grade"
    GRM_L["Ban Date"] = "Date du ban"
    GRM_L["No Players Have Been Banned from Your Guild"] = "Aucun joueur n'a été banni de votre guilde"
    GRM_L["Remove Ban"] = "Retirer"
    GRM_L["Add Player to Ban List"] = "Ajouter joueur à la liste"
    GRM_L["Server:"] = "Serveur :"
    GRM_L["Class:"] = "Classe :"
    GRM_L["Reason:"] = "Raison :"
    GRM_L["It is |CFFFF0000CRITICAL|r the player's name and server are spelled correctly for accurate tracking and notifications."] = "Les noms du joueur et de son serveur doivent être |CFFFF0000PARFAITEMENT|r orthographiés afin d'améliorer la précision du suivi et des notifications. "
    GRM_L["Submit Ban"] = "Soumettre"
    GRM_L["Confirm"] = "Confirmer"
    GRM_L["Cancel"] = "Annuler"
    GRM_L["Add"] = "Ajouter"                                         -- Context: "Add" player to ban list
    GRM_L["Confirm Ban for the Following Player?"] = "Confirmer le ban du joueur suivant ?"
    GRM_L["Please Enter a Valid Player Name"] = "Merci d'entrer un nom de joueur valide"            -- Player Name
    GRM_L["Please Enter a Valid Server Name"] = "Merci d'entrer un nom de serveur valide"            -- Server Name
    GRM_L["Please Select a Player to Unban!"] = "Merci de sélectionner le joueur à 'débannir' !"
    GRM_L["{name} - Ban List"] = "{name} - Liste ban"                           -- Context: "GuildName - Ban List"
    GRM_L["No Reason Given"] = "Aucune raison donnée"

    -- ADDON USERS WINDOW
    GRM_L["SYNC USERS"] = "SYNCHRO"
    GRM_L["Ok!"] = "OK !"
    GRM_L["Their Rank too Low"] = "Son grade est trop bas"
    GRM_L["Your Rank too Low"] = "Votre grade est trop bas"
    GRM_L["Outdated Version"] = "Version obsolète"
    GRM_L["You Need Updated Version"] = "Un version mise à jour est requise"
    GRM_L["Player Sync Disabled"] = "Synchronisation du joueur désactivée"
    GRM_L["No Guildie Online With Addon."] = "Aucun utilisateur connecté dans la guilde."
    GRM_L["ONE Person is Online. Recommend It!"] = "Un joueur est en ligne. Recommandez l'addon !"
    GRM_L["{num} others are Online! Recommend It!"] = "{num} autres sont en ligne ! Recommandez l'addon !"
    GRM_L["GRM Sync Info"] = "Info Synchro GRM"
    GRM_L["Ver: {custom1}"] = "Ver: {custom1}"                                  -- Context:  Ver: R1.125  - Ver is short for Version
    GRM_L["Name:"] = "Nom :"
    GRM_L["Version"] = "Version"
    GRM_L["Sync"] = "Synchronisation"
    GRM_L["Your Sync is Currently Disabled"] = "Votre synchro est actuellement désactivée"

    -- OPTIONS WINDOW
    GRM_L["Add Join Date to:  |cffff0000Officer Note|r"] = "Ajouter la date d'entrée à :  |cffff0000Note d'officier|r"         -- Context: Please keep |cffff0000 for color coding of the text, and the |r to signify the end of color change
    GRM_L["Add Join Date to:  Officer Note"] = "Ajouter la date d'entrée à :  Note d'officier"
    GRM_L["Public Note"] = "Note publique"
    GRM_L["Scanning Roster:"] = "Scan de la guilde :"
    GRM_L["Guild Rank Restricted:"] = "Réglages restreints par le grade : "
    GRM_L["Sync:"] = "Synchronisation :"
    -- Options window -- of note, these are very concise statements. They may need to be adjusted properly in the Options window for proper spacing, so verify they look ok after translating.
    GRM_L["Slash Commands"] = "Commandes slash"
    GRM_L["Trigger scan for changes manually"] = "Active manuellement la recherche de modifications"
    GRM_L["Trigger sync one time manually"] = "Active manuellement une seule synchronisation"
    GRM_L["Centers all Windows"] = "Centre toutes les fenêtres"
    GRM_L["Slash command info"] = "Information commandes slash"
    GRM_L["Resets ALL data"] = "Réinitialise toutes les données"
    GRM_L["Report addon ver"] = "Affiche la version de l'addon"                                    -- Ver is short for Version
    GRM_L["Resets Guild data"] = "Réinitialise les données de la guilde"
    GRM_L["Show at Logon"] = "Afficher au démarrage"
    GRM_L["Only Show if Log Changes"] = "Afficher seulement en cas de modifications"
    
    -- This do need to be translated still
    GRM_L["Before Scan Timer"] = "Rechercher des modifications toutes les"                  -- Context: "Scan for Changes Every 10 Seconds" -- There will be a number added here and may require custom positioning, so please provide full statement and Arkaan will allign
    GRM_L["After Scan Timer"] = "secondes"
    GRM_L["Before Inactive Timer"] = "Signaler 'Inactif' si le joueur est Hors Ligne depuis"
    GRM_L["After Inactive Timer"] = "jours"

    GRM_L["Reactivating SCAN for Guild Member Changes..."] = "Réactivation du scan de la guilde"
    GRM_L["Deactivating SCAN of Guild Member Changes..."] = "Désactivation du scan de la guilde"
    GRM_L["Due to server data restrictions, a scan interval must be at least 10 seconds or more!"] = "En raison de restrictions d'utilisation serveur, l'intervalle entre chaque scan doit être d'au moins 10 secondes."
    GRM_L["Please choose an scan interval 10 seconds or higher!"] = "Merci de choisir un intervalle de scan supérieur ou égal à 10 secondes !"
    GRM_L["{num} is too Low!"] = "{num}  est trop bas !"
    GRM_L["The Current Lvl Cap is {num}."] = "Le niveau maximum actuel est {num}."
    GRM_L["Kick Inactive Player Reminder at"] = "Suggérer le renvoi du joueur inactif après"        -- Context: "Kick Inactive Player Reminder at X Months" - Again, allignment will need to be adjusted for options UI, so please post
    GRM_L["Please choose a month between 1 and 99"] = "Merci de choisir un mois entre 1 et 99"
    GRM_L["Sync BAN List With Guildies at Rank"] = "Synchroniser la liste de bans avec les membres"     -- Context: "Sync Ban List with Guildies at Rank [DROPDOWNMENU OF RANKS] or Higher" - Please show where dropdown menu should be pinned
    GRM_L["or Higher"] = "ou supérieur"                               -- Context: Look at the above statement. Show where this needs to go in regards to dropdown menu of rank selection in Options
    GRM_L["Restore Defaults"] = "Réglages par défaut"
    GRM_L["Please choose between 1 and 180 days!"] = "Merci de choisir entre 1 et 180 jours !"
    GRM_L["Announce Events"] = "Annoncer les événements"                         -- Context: "Announce Events X number of days in advance" -- the X is the editbox to modify number of days. Please include the location of where to pin that.
    GRM_L["Days in Advance"] = "jours en avance"
    GRM_L["Please choose between 1 and 28 days!"] = "Merci de choisir entre 1 et 28 jours !"
    GRM_L["Add Events to Calendar"] = "Ajouter les événements au calendrier"
    GRM_L["SYNC Changes With Guildies at Rank"] = "Synchroniser les modifications avec les membres"      -- Context: at Rank [DROPDOWNRANKSELECTION] or Higher. - Please note where to place dropdown box in the position of the sentence.
    GRM_L["Reactivating Data SYNC with Guildies..."] = "Réactivation synchronisation des données avec les membres..."
    GRM_L["Deactivating Data SYNC with Guildies..."] = "Désactivation synchronisation des données avec les membres..."
    GRM_L["Display Sync Update Messages"] = "Afficher les messages de mise à jour de la synchronisation"
    GRM_L["Only Sync With Up-to-Date Addon Users"] = "Synchroniser seulement avec les utilisateurs dont l'addon est à jour"
    GRM_L["Only Announce Anniversaries if Listed as 'Main'"] = "Annoncer seulement les anniversaires si listés comme 'Main'"
    GRM_L["Leveled"] = "Niveau gagné"
    GRM_L["Min:"] = "Min : "                                    -- Context: As in, the Minimum level to report or announce when player levels up
    GRM_L["Inactive Return"] = "Inactif"
    GRM_L["resetall"] = "resetall"
    GRM_L["resetguild"] = "resetguild"
    GRM_L["Notify When Players Request to Join the Guild"] = "Notifier quand des joueurs demandent à rejoindre la guilde"
    --Side chat/log controls - Of note, limited spacing
    GRM_L["Name Change"] = "Changement nom"
    GRM_L["Rank Renamed"] = "Rang renommé"
    GRM_L["Event Announce"] = "Annonce événement"
    GRM_L["Left"] = "A quitté"                        -- Context: As in, "Left" the guild...
    GRM_L["Recommendations"] = "Recommandations"
    GRM_L["Banned"] = "Bannis"
    GRM_L["To Chat:"] = "Chat"                    -- Context: "To Chat Message frame -- in regards to announcing events like when a player leveled"
    GRM_L["To Log:"] = "Journal"                     -- Context: To show it in the guild log.
    GRM_L["Display Changes"] = "Afficher modifications dans"
    GRM_L["Syncing too fast may cause disconnects!"] = "Une synchronisation trop rapide peut causer des déconnexions !"
    GRM_L["Speed:"] = "Vitesse : "                      -- Context: Speed that the sync takes place.
    GRM_L["Show 'Main' Name in Chat"] = "Afficher 'Main' dans le Chat"

    -- AUDIT WINDOW
    GRM_L["AUDIT"] = "VÉRIFICATION"                                               -- Audit Tab name
    GRM_L["No Date Set"] = "Aucune donnée"
    GRM_L["Main"] = "Main"
    GRM_L["Main or Alt?"] = "Main ou Alt ?"
    GRM_L["Alt"] = "Alt"
    GRM_L["Total Incomplete: {num} / {custom1}"] = "A compléter : {num} / {custom1}"                 -- Context: Total Incomeplete: 50 / 100    (50 out of 100)
    GRM_L["Mains: {num}"] = "Mains : {num}"                                        -- Context: Number of "main" toons
    GRM_L["Unique Accounts: {num}"] = "Comptes uniques : {num}"
    GRM_L["All Complete"] = "Tous complétés"                                        -- Context: All dates have been added and are known, thus it states it is "All Complete"
    GRM_L["Set Incomplete to Unknown"] = "Définir la date comme inconnue"                           -- Context: Implied to set ALL incomplete to unknown
    GRM_L["Clear All Unknown"] = "Effacer tous les inconnus"
    GRM_L["Please Wait {num} more Seconds"] = "Merci de patienter {num} seconde(s) de plus"
    GRM_L["Guild Data Audit"] = "Vérification des données de guilde"
    GRM_L["Name"] = "Nom"
    GRM_L["Join Date"] = "Arrivée"
    GRM_L["Promo Date"] = "Promotion"
    GRM_L["Main/Alt"] = "Main/Alt"
    GRM_L["Click Player to Edit"] = "Cliquez sur un joueur pour modifier"
    GRM_L["Only Show Incomplete Guildies"] = "Afficher seulement fiches incomplètes"

    -- ADDON SYSTEM MESSAGES
    GRM_L["Guild Roster Manager"] = "Guild Roster Manager"
    GRM_L["GRM:"] = "GRM : "                                                                -- Abbreviation for "Guild Roster Manager"
    GRM_L["(Ver:"] = "(Ver:"                                                               -- Ver: is short for Version:
    GRM_L["GRM Updated:"] = "GRM mis à jour"
    GRM_L["Configuring Guild Roster Manager for {name} for the first time."] = "Configuration de Guild Roster Manager pour {name} pour la première fois."
    GRM_L["Reactivating Auto SCAN for Guild Member Changes..."] = "Réactivation du scan auto des modifications des membres"
    GRM_L["Reactivating Data Sync..."] = "Réactivation Synchronisation des données..."
    GRM_L["Notification Set:"] = "Notification définie :"
    GRM_L["Report When {name} is ACTIVE Again!"] = "Signaler quand {name} est ACTIF à nouveau !"
    GRM_L["Report When {name} Comes Online!"] = "Signaler quand {name} se connecte !"
    GRM_L["Report When {name} Goes Offline!"] = "Signaler quand {name} se déconnecte !"
    GRM_L["A new version of Guild Roster Manager is Available!"] = "Une nouvelle version de Guild Roster Manager est disponible !"
    GRM_L["Please Upgrade!"] = "Merci d'effectuer la mise à jour !"
    GRM_L["Player Does Not Have a Time Machine!"] = "Le joueur ne possède pas de machine à voyager dans le temps !"
    GRM_L["Please choose a valid DAY"] = "Merci de choisir un jour valide"
    GRM_L["{name} has been Removed from the Ban List."] = "{name} a été retiré de la liste de bans."
    GRM_L["{num} Players Have Requested to Join the Guild."] = "{num} joueurs ont demandé à rejoindre la guilde."
    GRM_L["A Player Has Requested to Join the Guild."] = "Un joueur a demandé à rejoindre la guilde."
    GRM_L["Click Link to Open Recruiting Window:"] = "Cliquez sur le lien pour ouvrir la fenêtre de recrutement : "
    GRM_L["Guild Recruits"] = "Postulants"
    GRM_L["Scanning for Guild Changes Now. One Moment..."] = "Recherche de modifications de guilde. Un moment..."
    GRM_L["Breaking current Sync with {name}."] = "Interruption de la synchronisation avec {name}."
    GRM_L["Breaking current Sync with the Guild..."] = "Interruption de la synchronisation avec la guilde..."
    GRM_L["Initializing Sync Action. One Moment..."] = "Initialisation de la synchronisation. Un moment..."
    GRM_L["No Players Currently Online to Sync With..."] = "Aucun joueur en ligne pour synchronisation..."
    GRM_L["No Addon Users Currently Compatible for FULL Sync."] = "Aucun utilisateur de GRM actuellement compatible pour une synchronisation totale."
    GRM_L["SYNC is currently not possible! Unable to Sync with guildies when guild chat is restricted."] = "Synchronisation des membres actuellement impossible : le canal de guilde est restreint."
    GRM_L["There are No Current Applicants Requesting to Join the Guild."] = "Aucun postulant n'a demandé à rejoindre la guilde."
    GRM_L["The Applicant List is Unavailable Without Having Invite Privileges."] = "La liste de postulants est indisponible sans avoir les droits d'invitation."
    GRM_L["Manual Scan Complete"] = "Scan manuel terminé"
    GRM_L["Analyzing guild for the first time..."] = "Analyse de la guilde pour la première fois..."
    GRM_L["Building Profiles on ALL \"{name}\" members"] = "Création du profil des membres de \"{name}\""                 -- {name} will be the Guild Name, for context
    GRM_L["NOTIFICATION:"] = "NOTIFICATION : "                                               -- Context:  "Notification: Player is no longer AFK"
    GRM_L["{name} is now ONLINE!"] = "{name} est En Ligne !"
    GRM_L["{name} is now OFFLINE!"] = "{name} est Hors Ligne !"
    GRM_L["{name} is No Longer AFK or Busy!"] = "{name} n'est plus AFK ou Occupé !"
    GRM_L["{name} is No Longer AFK or Busy, but they Went OFFLINE!"] = "{name} n'est plus AFK ou Occupé mais il s'est déconnecté !"
    GRM_L["{name} is Already in Your Group!"] = "{name} est déjà dans votre groupe !"
    GRM_L["GROUP NOTIFICATION:"] = "NOTIFICATION DE GROUPE : "
    GRM_L["Players Offline:"] = "Joueurs Hors Ligne :"
    GRM_L["Players AFK:"] = "Joueurs AFK :"
    GRM_L["40 players have already been invited to this Raid!"] = "40 joueurs ont déjà été invités à ce raid !"
    GRM_L["Player should try to obtain group invite privileges."] = "Le joueur doit obtenir les droits d'invitation au groupe"
    GRM_L["{name}'s saved data has been wiped!"] = "Les données sauvegardées de {name} ont été effacées !"
    GRM_L["Re-Syncing {name}'s Guild Data..."] = "Re-synchronisation des données de guilde de {name}..."
    GRM_L["Wiping all Saved Roster Data Account Wide! Rebuilding from Scratch..."] = "Effacement de toutes les données sauvegardées du compte ! Remise à zéro..."
    GRM_L["Wiping all saved Guild data! Rebuilding from scratch..."] = "Effacement de toutes les données de guilde sauvegardées! Remise à zéro..."
    GRM_L["There are No Log Entries to Delete, silly {name}!"] = "Il n'y a aucune entrée de journal à effacer, idiot de {name} !"
    GRM_L["Guild Log has been RESET!"] = "Journal de guilde RÉINITIALISÉ !"
    GRM_L["{name} is now set as \"main\""] = "{name} est défini comme \"main\""
    GRM_L["{name} is no longer set as \"main\""] = "{name} n'est plus défini comme \"main\""
    GRM_L["Reset All of {name}'s Data?"] = "Réinitialiser toutes les données de {name} ?"
    
    -- /grm help
    GRM_L["Opens Guild Log Window"] = "Ouvre le Journal de guilde"
    GRM_L["Resets ALL saved data"] = "Réinitialise toutes les données sauvegardées"
    GRM_L["Resets saved data only for current guild"] = "Réinitialise les données seulement pour cette guilde"
    GRM_L["Re-centers the Log window"] = "Recentre la fenêtre du Journal"
    GRM_L["Triggers manual re-sync if sync is enabled"] = "Lance la re-synchronisation manuelle si la synchronisation est activée"
    GRM_L["Does a one-time manual scan for changes"] = "Effectue une analyse manuelle ponctuelle des modifications"
    GRM_L["Displays current Addon version"] = "Afficher la version actuelle de l'addon"
    GRM_L["Opens Guild Recruitment Window"] = "Ouvre la fenêtre de recrutement"
    GRM_L["WARNING! complete hard wipe, including settings, as if addon was just installed."] = "AVERTISSEMENT ! Réinitialisation totale, réglages inclus, comme si l'addon venait d'être installé.";

    -- General Misc UI
    GRM_L["Really Clear All Account-Wide Saved Data?"] = "Voulez-vous vraiment supprimer les données sauvegardées de tout votre compte ?"
    GRM_L["Really Clear All Guild Saved Data?"] = "Voulez-vous vraiment supprimer toutes les données de guilde sauvegardées ?"
    GRM_L["Yes!"] = "Oui !"
    GRM_L["Ban Player?"] = "Bannir joueur ?"
    GRM_L["Ban the Player's {num} alts too?"] = "Bannir également les {num} alts du joueur ?"      -- Plural number of alts
    GRM_L["Ban the Player's {num} alt too?"] = "Bannir également {num} alt du joueur ?"     -- Singular number of alts, just 1
    GRM_L["Please Click \"Yes\" to Ban the Player!"] = "Merci de cliquer sur \"Oui\" pour bannir le joueur !"

    -- Sync Messages
    GRM_L["{name} updated {name2}'s Join Date."] = "{name} a mis à jour la date d'entrée de {name2}."
    GRM_L["{name} updated {name2}'s Promotion Date."] = "{name} a mis à jour la date de promotion de {name2}."
    GRM_L["\"{custom1}\" event added to the calendar by {name}"] = "Événement \"{custom1}\" ajouté au calendrier par {name}"
    GRM_L["{name} updated {name2}'s list of Alts."] = "{name} a mis à jour la liste d'Alts de {name2}."
    GRM_L["{name} removed {name2}'s from {custom1}'s list of Alts."] = "{name} a retiré {name2} de la liste d'Alts de {custom1}."
    GRM_L["{name} set {name2} to be 'Main'"] = "{name} a défini {name2} comme 'Main'"
    GRM_L["{name} has changed {name2} to be listed as an 'alt'"] = "{name} a changé {name2} en 'alt'"
    GRM_L["{name} has Removed {name2} from the Ban List."] = "{name} a retiré {name2} de la liste ban."
    GRM_L["{name} has been BANNED from the guild!"] = "{name} a été BANNI de la guilde !"
    GRM_L["{name} has been UN-BANNED from the guild!"] = "{name} n'est plus BANNI de la guilde !"
    GRM_L["Initiating Sync with {name} Instead!"] = "Initialisation synchronisation avec {name} !"
    GRM_L["Sync Failed with {name}..."] = "Échec de la synchronisation avec {name}..."
    GRM_L["The Player Appears to Be Offline."] = "Le joueur semble être Hors Ligne."
    GRM_L["There Might be a Problem With Their Sync"] = "Il doit y avoir un problème avec sa synchronisation"
    GRM_L["While not ideal, Ask Them to /reload to Fix It and Please Report the Issue to Addon Creator"] = "Solution alternative : Demandez lui de /reload pour corriger l'erreur et signalez le problème au créateur de l'addon"
    GRM_L["Manually Syncing Data With Guildies Now... One Time Only."] = "Synchronisation manuelle des données avec les membres de guilde... Une seule fois."
    GRM_L["Syncing Data With Guildies Now..."] = "Synchronisation des données avec les membres de guilde..."
    GRM_L["(Loading screens may cause sync to fail)"] = "(Les écrans de chargement peuvent provoquer l'échec de la synchronisation)"
    GRM_L["Sync With Guildies Complete..."] = "Synchronisation avec les membres de guilde terminée..."
    GRM_L["Manual Sync With Guildies Complete..."] = "Synchronisation manuelle avec les membres de guilde terminée..."
    GRM_L["No Players Currently Online to Sync With. Re-Disabling Sync..."] = "Aucun joueur en ligne pour une synchronisation. Désactivation synchronisation..."
    GRM_L["{name} tried to Sync with you, but their addon is outdated."] = "{name} a tenté de se synchroniser avec vous mais son addon est obsolète."
    GRM_L["Remind them to update!"] = "Conseiller de faire la mise à jour !"

    
    -- ERROR MESSAGES
    GRM_L["Notification Has Already Been Arranged..."] = "La notification a déjà été planifiée..."
    GRM_L["Failed to add alt for unknown reason. Try closing Roster window and retrying!"] = "Échec de l'enregistrement pour une raison inconnue. Merci de fermer la fenêtre et réessayer !"
    GRM_L["{name} is Already Listed as an Alt."] = "{name} est déjà enregistré comme Alt."
    GRM_L["{name} cannot become their own alt!"] = "{name} ne peut pas être son propre Alt !"
    GRM_L["Player Cannot Add Themselves as an Alt"] = "Le joueur ne peut pas s'ajouter lui-même comme Alt"
    GRM_L["Player Not Found"] = "Joueur introuvable"
    GRM_L["Please try again momentarily... Updating the Guild Event Log as we speak!"] = "Veuillez de réessayer dans un moment... Mise à jour du journal des événements de la guilde au moment où nous parlons !"
    GRM_L["Invalid Command: Please type '/grm help' for More Info!"] = "Commande invalide : taper '/grm help' pour plus d'infos !"
    GRM_L["{name} is not currently in a guild. Unable to Proceed!"] = "{name} n'est dans aucune guilde. Action impossible !"
    GRM_L["Addon does not currently support more than 75 alts!"] = "L'addon ne supporte pas plus de 75 Alts !"
    GRM_L["Please choose a VALID character to set as an Alt"] = "Sélectionner un personnage valide à définir comme Alt"
    GRM_L["Please choose a character to set as alt."] = "Sélectionner un personnage à définir comme Alt"
    GRM_L["GRM ERROR:"] = "ERREUR GRM"
    GRM_L["Com Message too large for server"] = "Com Message too large for server"                    -- Context: "Com message" is short-hand for "Communications message" - this is a technical error on syncing data.
    GRM_L["Prefix:"] = "Préfixe : "
    GRM_L["Msg:"] = "Msg : "                                                -- Context: Msg is short for Message
    GRM_L["Unable to register prefix > 16 characters: {name}"] = "Impossible d'enregistrer un préfixe > 16 caractères : {name}"   -- Context: The {name} is the string code for the prefix. This is for debugging.

    --SLASH COMMANDS
    -- These are generally written in general shorthand. The original commands will ALWAYS work, but if there is one that makes more sense in your language, please feel free to modify
    GRM_L["clearall"] = "clearall"                        -- Context: In regards, "Clear All" saved data account wide 
    GRM_L["clearguild"] = "clearguild"                      -- Context: In regards, "Clear All" saved data from ONLY the current guild.
    GRM_L["hardreset"] = "hardreset"                       -- Context: In regards, "Hard Reset" ALL data account wide, including wiping player settings
    GRM_L["help"] = "help"                            -- Context: "help" with info on the how to use addon
    GRM_L["version"] = "version"                         -- Context: "version" of the addon
    GRM_L["center"] = "center"                          -- Context: "center" the movable addon window back to center of screen
    GRM_L["sync"] = "sync"                            -- Context: "sync" the data between players one time now.
    GRM_L["scan"] = "scan"                            -- Context: "scan" for guild roster changes one time now.
    GRM_L["clearall"] = "clearall"                        -- Context: In regards, "Clear All" saved data
    GRM_L["recruit"] = "postulant"                         -- Context: Open the roster "recruit" window where people request to join guild

    -- CLASSES
    GRM_L["Deathknight"] = "Chevalier de la mort"
    GRM_L["Demonhunter"] = "Chasseur de démons"
    GRM_L["Druid"] = "Druide"
    GRM_L["Hunter"] = "Chasseur"
    GRM_L["Mage"] = "Mage"
    GRM_L["Monk"] = "Moine"
    GRM_L["Paladin"] = "Paladin"
    GRM_L["Priest"] = "Prêtre"
    GRM_L["Rogue"] = "Voleur"
    GRM_L["Shaman"] = "Chaman"
    GRM_L["Warlock"] = "Démoniste"
    GRM_L["Warrior"] = "Guerrier"

    -- TIME AND DATES
    GRM_L["1 Mar"] = "1 mar"                           -- This date is used in a specific circumstance. If someone's anniversary/bday landed on a leap year (Feb 29th), it defaults to the 1st of March on non-leap year
    -- Full Month Name
    GRM_L["January"] = "janvier"
    GRM_L["February"] = "février"
    GRM_L["March"] = "mars"
    GRM_L["April"] = "avril"
    GRM_L["May"] = "mai"
    GRM_L["June"] = "juin"
    GRM_L["July"] = "juillet"
    GRM_L["August"] = "août"
    GRM_L["September"] = "septembre"
    GRM_L["October"] = "octobre"
    GRM_L["November"] = "novembre"
    GRM_L["December"] = "décembre"
    -- Shorthand Month
    GRM_L["Jan"] = "jan"
    GRM_L["Feb"] = "fév"
    GRM_L["Mar"] = "mar"
    GRM_L["Apr"] = "avr"
    GRM_L["May"] = "mai"
    GRM_L["Jun"] = "jui"
    GRM_L["Jul"] = "juil"
    GRM_L["Aug"] = "aoû"
    GRM_L["Sep"] = "sep"
    GRM_L["Oct"] = "oct"
    GRM_L["Nov"] = "nov"
    GRM_L["Dec"] = "déc"
    -- Time Notifcation
    GRM_L["Seconds"] = "secondes"
    GRM_L["Second"] = "seconde"
    GRM_L["Minutes"] = "minutes"
    GRM_L["Minute"] = "minute"
    GRM_L["Hours"] = "heures"
    GRM_L["Hour"] = "heure"
    GRM_L["Days"] = "jours"
    GRM_L["Day"] = "jour"
    GRM_L["Months"] = "mois"
    GRM_L["Month"] = "mois"
    GRM_L["Years"] = "ans"
    GRM_L["Year"] = "an"
    GRM_L["HourBreak"] = "h"            -- Context, in English, and many languages, 11am = 11:00 -- or in French, 11h00   - the hour break is the ":" or the "h" 

    GRM_L["am"] = "am"
    GRM_L["pm"] = "pm"
    GRM_L["24HR_Notation"] = "";        -- if someone is using 24hr time notation in your country, instead of 12hr, how do you notate it? In English, there is no am/pm (though "hours" is technically right, but unnecessary)

    GRM_L["{num} year"] = "{num} an"
    GRM_L["{num} years"] = "{num} ans"
    GRM_L["{num} month"] = "{num} mois"
    GRM_L["{num} months"] = "{num} mois"
    GRM_L["{num} day"] = "{num} jour"
    GRM_L["{num} days"] = "{num} jours"
    GRM_L["< 1 day"] = "< 1 jour"

    GRM_L["{num} yr"] = "{num} an"
    GRM_L["{num} yrs"] = "{num} ans"
    GRM_L["{num} mo"] = "{num} mois"
    GRM_L["{num} mos"] = "{num} mois"
    GRM_L["{num} hr"] = "{num} hr"
    GRM_L["{num} hrs"] = "{num} hrs"
    GRM_L["< 1 hour"] = "< 1 heure"
    GRM_L["{num} {custom1}"] = "{num} {custom1}"     -- Context: This is a placeholder for ANY generic time data -- Ex:  "1 year" or "15 months" - The translation is set this is just to set the orientation of the number properly.

    -- MISC Punctuation
    GRM_L[","] = ","                               -- I know in some Asia languages, a comma is not used, but something similar, for example.

    -- Updates 1.126
    GRM_L["General"] = "Général"
    GRM_L["General:"] = "Général :"
    GRM_L["Scan"] = "Scan"
    GRM_L["Help"] = "Aide"
    GRM_L["UI"] = "Interface"                              -- UI for User Interface. Abbreviation for changing custom UI featuers, like coloring of <M> main
    GRM_L["Officer"] = "Officier"                         -- as in, "Officer" rank
    GRM_L["Open Addon Window"] = "Ouvrir la fenêtre de l'addon"
    GRM_L["Sync Addon Settings on All Alts in Same Guild"] = "Synchroniser les réglages de l'addon avec tous les alts d'une même guilde"
    GRM_L["Show Minimap Button"] = "Afficher le bouton minicarte"
    GRM_L["Player is Not Currently in a Guild"] = "Le joueur n'est pas dans une guilde actuellement"
    -- tooltips
    GRM_L["|CFFE6CC7FClick|r to open GRM"] = "|CFFE6CC7FClic|r pour ouvrir GRM"                           -- Please maintain the color coding
    GRM_L["|CFFE6CC7FRight-Click|r and drag to move this button."] = "|CFFE6CC7FClic-droit|r et tirer pour déplacer ce bouton."   -- Likewise, maintain color coding
    GRM_L["|CFFE6CC7FRight-Click|r to Reset to 100%"] = "|CFFE6CC7FClic-Droit|r pour réinitialiser à 100%"                -- for the Options slider tooltip
    GRM_L["|CFFE6CC7FRight-Click|r to Sync Join Date with Alts"] = "|CFFE6CC7FClic-droit|r pour synchroniser la date d'entrée avec les alts"
    GRM_L["|CFFE6CC7FRight-Click|r to Set Notification of Status Change"] = "|CFFE6CC7FClic-droit|r pour activer les notifications de changement de statut"
    -- tooltip end
    GRM_L["GRM"] = "GRM"
    GRM_L["Include Unknown as Incomplete"] = "Inclure la mention 'Inconnue' aux fiches incomplètes"                           -- Context: Unknown in the Audit Tab will be hidden if filtering out complete players
    GRM_L["You Do Not Have Permission to Add Events to Calendar"] = "Vous n'avez pas la permission d'ajouter un événement au calendrier"
    GRM_L["Please Select Which Join Date to Sync"] = "Sélectionner une date d'entrée à synchroniser"
    GRM_L["Sync All Alts to {name}'s Join Date"] = "Synchroniser tous les Alts sur la date d'entrée de {name}"
    GRM_L["Sync All Alts to the Earliest Join Date: {name}"] = "Synchroniser tous les Alts sur la date la plus récente :{name}"
    GRM_L["Sync All Alts to {name}'s |cffff0000(main)|r Join Date"] = "Synchroniser tous les Alts sur la date d'entrée du |cffff0000(main)|r de {name}"  -- The coloring ensures that "(main)" maintains the RED color. Please keep it consistent if relevant to your language.
    GRM_L["Join Date of All Alts is Currently Synced"] = "Date d'entrée de tous les Alts synchronisée"

    -- Update 1.130
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Hide this Button."] = "|CFFE6CC7FCtrl-Maj-Clic|r pour cacher ce bouton."
    GRM_L["Invited By:"] = "Invité par :"
    GRM_L["To avoid storage bloat, a maximum of 2 save points is currently possible. Please remove one before Continuing."] = "Afin de préserver le stockage, un maximum de 2 points de sauvegarde est autorisé. Merci d'en supprimer un pour continuer."
    GRM_L["Error: Guild Not Found..."] = "Erreur : Guilde non trouvée..."
    GRM_L["Debugger Start"] = "Démarrage du débogage";

    -- Update 1.136
    GRM_L["To avoid storage bloat, a maximum of 2 guild save points is currently possible. Please remove one before continuing"] = "Afin de préserver le stockage, un maximum de 2 points de sauvegarde de guilde est autorisé. Merci d'en supprimer un pour continuer."
    GRM_L["Backup Point Removed for Guild \"{name}\""] = "Point de sauvegarde de \"{name}\" supprimé"
    GRM_L["Backup Point Restored for Guild \"{name}\""] = "Point de sauvegarde de \"{name}\" restauré"
    GRM_L["Backup Point Set for Guild \"{name}\""] = "Point de sauvegarde de \"{name}\" enregistré"
    GRM_L["Backup"] = "Sauvegarde"
    GRM_L["Horde"] = "Horde"
    GRM_L["Alliance"] = "Alliance"
    GRM_L["Creation Date"] = "Date de création"
    GRM_L["Members"] = "Membres"
    GRM_L["Backup {num}:"] = "Sauvegarde {num} :"           -- As in, the number of backups... so "Backup 1:"
    GRM_L["None"] = "Aucune"
    GRM_L["Restore"] = "Restaurer"
    GRM_L["Set Backup"] = "Sauvegarder"
    GRM_L["Memory Usage: {num} MB"] = "Utilisation Mémoire : {num} MB"          -- MB references the number of MegaBytes of memory used.

    -- Update 1.137
    GRM_L["GRM: Unable to Create Backup for a Guild With Unknown Creation Date! Log into that guild on any alt to update old database."] = "Impossible de créer une sauvegarde pour une guilde avec une date de création inconnue! Connectez-vous à cette guilde sur n'importe quel Alt pour mettre à jour l'ancienne base de données."
    GRM_L["Enable Auto-Backup Once Every"] = "Activer Sauvegarde auto tous les"
    GRM_L["Auto {num}:"] = "Auto {num}:"
    GRM_L["Please Choose a Time Interval Between 1 and 99 Days!"] = "Choisir un intervalle de temps entre 1 et 99 jours !"
    GRM_L["Really restore {name} Backup Point?"] = "Voulez-vous vraiment restaurer le point de sauvegarde {name} ?"
    GRM_L["Check All"] = "Cocher tout"

    -- Update 1.139
    GRM_L["Right-Click for options to remove this guild from the addon database completely"] = "Clic-droit pour afficher l'option de supprimer complètement cette guilde de la base de données de l'addon"
    GRM_L["Player Cannot Purge the Guild Data they are Currently In!!!"] = "Le joueur ne peut pas purger les données de la guilde dans laquelle il se trouve !!!"
    GRM_L["To reset your current guild data type '/grm clearguild'"] = "Tapez /grm clearguild pour réinitialiser les données de votre guilde actuelle"
    GRM_L["Click Here to Remove all traces of this guild, or hit ESC"] = "Cliquez ici pour supprimer toutes les traces de cette guilde ou appuyez sur la touche Échap"
    GRM_L["{name} has been removed from the database."] = "{name} a été retirée de la base de données."              -- The Guild Name has been removed from the database

    -- update 1.141
    GRM_L["You will still share your data with the guild, but you are currently only accepting incoming changes from rank \"{name}\" or higher"] = "Vous partagerez toujours vos données avec la guilde mais vous n’acceptez actuellement que les modifications entrantes du grade \"{name}\" ou supérieur."    -- Reminder, the backslash before a quotation denotes the string NOT to close, but to include the quotation in display txt
    GRM_L["Only Restrict Incoming Player Data to Rank Threshold, not Outgoing"] = "Limiter, selon le grade, uniquement les données entrantes, pas les sortantes"
    GRM_L["Total Entries: {num}"] = "Entrées totales : {num}"
    GRM_L["Search Filter"] = "Filtre de recherche"

    -- update 1.142
    GRM_L["Choose Color:"] = "Choisir couleur :"
    GRM_L["Format:"] = "Format :"
    GRM_L["RGB Values Must be Between 1 and 255."] = "Les valeurs RVB doivent être comprises entre 1 et 255."

    -- Update 1.143
    GRM_L["The Log is Currently Empty for This Guild"] = "Le journal est actuellement vide pour cette guilde."
    GRM_L["Building Log for Export..."] = "Préparation de l'exportation du journal"
    GRM_L["Open Log Tools"] = "Ouvrir outils journal"
    GRM_L["Hide Log Tools"] = "Fermer outils journal"
    GRM_L["Numbered Lines"] = "Lignes numérotées"
    GRM_L["Export Log"] = "Exporter journal"
    GRM_L["Clear Lines:"] = "Effacer lignes :"
    GRM_L["Enable Ctrl-Shift-Click Line Removal"] = "Activer suppression par Ctrl-Maj-Clic"
    GRM_L["To"] = "à"                                      -- Clear Lines:  50 To 100     -- It stands between 2 edit boxes as its own fontstring, so work with that.
    GRM_L["Confirm Clear"] = "Confirmer suppression"
    GRM_L["Please Select Range of Lines from the Log You Wish to Remove"] = "Sélectionner la plage de lignes du journal à supprimer"
    GRM_L["Please put the lowest number in the first box"] = "Entrer le chiffre le plus bas dans la première case"
    GRM_L["Line selection is not valid"] = "Sélection de lignes invalide"
    GRM_L["Really Clear lines {custom1} to {custom2}?"] = "Confirmer suppression des lignes {custom1} à {custom2} ?"
    GRM_L["Enabling Line Numbers... Please choose within the given range"] = "Activation des les numéros de ligne ... Veuillez choisir dans la plage de données"
    GRM_L["Ctrl-C to Copy <> Ctrl-P to Paste <> Ctrl-A to Select All"] = "Ctrl-C pour Copier <> Ctrl-P pour Coller <> Ctrl-A pour Sélectionner Tout"
    GRM_L["Language Selection:"] = "Sélection Langue :"
    GRM_L["{num} phrases still need translation to {name}"] = "{num} phrases nécessitent une traduction en Français"  -- Ex: 300 phrases still need translation to German

    -- update 1.145
    GRM_L["You currently are at {num} non-Battletag friends. To fully take advantage of all of GRM features, please consider clearing some room."] = "Vous avez actuellement {num} amis non-Battletag. Pour profiter pleinement de toutes les fonctionnalités de GRM, envisagez de libérer de la place."
    GRM_L["Clear Space on Friends List to Find Online Status"] = "Nettoyer la liste d'amis pour trouver les statuts En Ligne"
    GRM_L["Offline"] = "Hors Ligne"
    GRM_L["{name} has requested to join the guild and is currently ONLINE!"] = "{name} a demandé à rejoindre la guilde et est actuellement EN LIGNE !"

    -- Update 1.146
    GRM_L["Really Clear line {num}?"] = "Effacer la ligne {num} ?"
    GRM_L["Font has been Reset to DEFAULT."] = "Police par défaut réinitialisée"
    GRM_L["Font Selection:"] = "Sélection Police :"
    GRM_L["Font Scale:"] = "Échelle de police :"
    GRM_L["Example"] = "Exemple"
    GRM_L["Right-Click to Reset to 100%"] = "Clic-droit pour réinitialiser à 100%"

    -- Update 1.147
    GRM_L["|CFFE6CC7FClick|r to open Player Window"] = "|CFFE6CC7FClic|r pour ouvrir la fenêtre du joueur"
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to Search the Log for Player"] = "|CFFE6CC7FCtrl-Maj-Clic|r pour chercher le joueur dans le journal"

    -- Update 1.1480
    GRM_L["Custom Notes:"] = "Note personnalisée :"
    GRM_L["GRM Debugging Enabled."] = "GRM Débogage Activé."
    GRM_L["GRM Debugging Disabled."] = "GRM Débogage Désactivé."
    GRM_L["Please type \"/grm debug 10\" to report 10 events (or any number)"] = "Veuillez taper \"/ grm debug 10 \" pour signaler 10 événements (ou n’importe quel nombre)"        -- Please keep the \"/grm debug 10)\" in-tact for slash command to work
    GRM_L["Format: \"/grm debug 10\""] = "Format : \"/grm debug 10\""                                                                  -- "" Likewise
    GRM_L["Error: Debug Command not recognized."] = "Erreur : Commande de débogage non reconnue."
    GRM_L["You may want to temporarily disable SYNC in the options if you are debugging another feature."] = "Vous pouvez désactiver temporairement la synchronisation dans les options si vous déboguez une autre fonctionnalité."
    GRM_L["Sync Custom Notes"] = "Synchroniser les notes personnalisées"
    GRM_L["Default Custom Note Rank Minimum"] = "Grade minimum pour synchroniser notes personnalisées"
    GRM_L["Reset Default Custom Note Restrictions for ALL Guildies"] = "Réinitialiser les restrictions pour tous les membres"
    GRM_L["Reset to Default"] = "Réinitialiser par défaut"
    GRM_L["Reset"] = "Réinitialiser"
    GRM_L["|CFF00CCFFDefault Selection For All Players"] = "|CFF00CCFFSélection par défaut pour tous les joueurs"
    GRM_L["Each Guildie Can Still be Manually Configured"] = "Chaque membre peut toujours être configuré manuellement"
    GRM_L["Does NOT apply to Ban List or Custom Note"] = "Ne s'applique PAS à la liste de bans ou à la note personnalisée"
    GRM_L["Custom note Rank reset to default \"{name}\" (or higher)"] = "Grade de note personnalisée réinitialisé : \"{name}\" (ou supérieur)"
    GRM_L["If sync was manually disabled for specific guildies, this does NOT enabled it."] = "Si la synchronisation a été désactivée manuellement pour des membres spécifiques, cela ne l’a PAS activée."
    GRM_L["Custom note default settings for Rank and Sync have been reset."] = "Les réglages des notes personnalisées pour les grades et la synchronisation ont été réinitialisés."
    GRM_L["Custom note Sync has been reset to default"] = "Synchronisation des notes personnalisées réinitialisée par défaut."
    GRM_L["Click here to set Custom Notes"] = "Cliquer pour ajouter une note personnalisée"
    GRM_L["|CFF00CCFFCustom Note Defaults:"] = "|CFF00CCFFNote personnalisée par défaut :"
    GRM_L["|CFFE6CC7FLeft-Click|r to ONLY reset all to default rank"] = "|CFFE6CC7FClic-gauche|r pour ne réinitialiser QUE le grade par défaut"
    GRM_L["|CFFE6CC7FCtrl-Shift-Click|r to reset BOTH sync and rank defaults"] = "|CFFE6CC7FCtrl-Maj-Clic|r pour réinitialiser la synchronisation ET le grade par défaut"
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r to re-enable custom note sync for all"] = "|CFFE6CC7FCtrl-Clic-Gauche|r pour réactiver la synchronisation des notes personnalisées pour tous"
    GRM_L["Custom Note Sync Disabled in Settings"] = "Synchro des notes personnalisées désactivée dans les réglages"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Added"] = "{name} a modifié la note personnalisée de {name2} : \"{custom1}\" a été ajouté"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" was Removed"] = "{name} a modifié la note personnalisée de {name2} : \"{custom1}\" a été retiré"
    GRM_L["{name} modified {name2}'s CUSTOM Note: \"{custom1}\" to \"{custom2}\""] = "{name} a modifié la note personnalisée de {name2} : \"{custom1}\" en \"{custom2}\""
    GRM_L["Custom Note"] = "Note personnalisée"
    GRM_L["Syncing Outgoing Data."] = "Données de synchronisation sortantes."
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction"] = "|CFFE6CC7FClic|r pour modifier la restriction de grade"
    GRM_L["|CFFE6CC7FClick|r to Change Day"] = "|CFFE6CC7FClic|r pour modifier le jour"
    GRM_L["|CFFE6CC7FClick|r to Change Month"] = "|CFFE6CC7FClic|r pour modifier le mois";
    GRM_L["|CFFE6CC7FClick|r to Change Year"] = "|CFFE6CC7FClic|r pour modifier l'année";
    GRM_L["Edited by {name}"] = "Édité par {name}"
    GRM_L["Note Removed by {name}"] = "Note supprimée par {name}"
    GRM_L["|CFFFF0000Player No Longer in Guild"] = "|CFFFF0000Le joueur n'est plus dans la guilde"
    GRM_L["|CFF00CCFFMinimum Rank to Sync: Player Data, Custom Notes, Ban List"] = "|CFF00CCFFGrade minimum pour synchro : Données joueur, Notes perso, Liste de bans"
    GRM_L["Warning! Ban List rank threshold is below the overall sync rank. Changing from \"{name}\" to \"{name2}\""] = "Avertissement ! Le grade requis pour accéder à la liste de bans est inférieur à celui de la synchronisation globale. Modification de \"{name}\" en \"{name2}\""
    GRM_L["Warning! Custom Note rank threshold is below the overall sync rank. Changing default from \"{name}\" to \"{name2}\""] = "Avertissement ! Le grade requis pour accéder aux notes personnalisées est inférieur à celui de la synchronisation globale. Modification de \"{name}\" en \"{name2}\""
    GRM_L["Custom Note Default Rank is Also Being Set to \"{name}\""] = "Le grade par défaut des notes personnalisées sera également défini sur \"{name}\""
    GRM_L["|CFF00CCFFSync filter can be set tighter for the Ban List"] = "|CFF00CCFFLe filtre de synchronisation peut être plus restrictif pour la liste de bans"
    GRM_L["Warning! Unable to select a Ban List rank below \"{name}\""] = "Avertissement ! Impossible de sélectionner un grade d'accès à la liste de bans inférieur à \"{name}\""
    GRM_L["Warning! Custom Note rank filter must be below \"{name}\""] = "Avertissement ! Le grade d'accès aux notes personnalisées doit être inférieur à \"{name}\""
    GRM_L["Setting to match core filter rank"] = "Réglage pour faire correspondre le grade au filtre principal"
    GRM_L["Warning! \"{name}\" is the lowest rank that can receive this custom note.\nCheck the options menu to adjust overall settings."] = "Avertissement ! \"{name}\" est le grade le plus bas qui puisse recevoir cette note personnalisée. \nConsultez le menu options pour ajuster les paramètres globaux."

    -- R1.1482
    GRM_L["Shift-Click Name On Roster Also Works"] = "Maj-Clic sur un nom dans la liste fonctionne également"
    GRM_L["Tooltip Scale:"] = "Échelle de l'infobulle :"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Language"] = "|CFFE6CC7FClic-gauche|r pour modifier la langue"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change Display Format"] = "|CFFE6CC7FClic-gauche|r pour modifier le format horaire"
    GRM_L["|CFFE6CC7FLeft-Click|r to Change the Font"] = "|CFFE6CC7FClic-gauche|r pour modifier la police"
    GRM_L["Unfortunately each player's data will need to be manually reconfigured."] = "Malheureusement, les données de chaque joueur devront être reconfigurées manuellement."
    GRM_L["{num} custom {custom1} removed that matched text:"] = "{num} {custom1} personnalisée(s) ont retiré le texte correspondant :"                            -- custom1 = "note" or the plural "notes"
    GRM_L["notes"] = "notes"
    GRM_L["Please add specific text, in quotations, to match"] = "Merci d'ajouter un texte spécifique, entre guillemets, pour correspondre"

    -- R1.1490
    GRM_L["You will still share some outgoing data with the guild"] = "Vous partagerez encore des données sortantes avec la guilde"
    GRM_L["Unable to properly locate guild for backup"] = "Impossible de localiser correctement la guilde pour restaurer"

    -- R1.1500
    GRM_L["It's almost time to celebrate {name}'s Birthday!"] = "Le jour de naissance de {name} approche !"          -- Custom1 is the actual date.  Like "1 Mar '18"
    GRM_L["Unique accounts pull from the server is known to faulty"] = "Les comptes uniques extraits du serveur sont connus pour être défectueux"
    GRM_L["Use only as an estimate. Hopefully Blizz fixes this soon"] = "A considérer seulement comme une estimation. Espérons que Blizz corrige cela bientôt"
    GRM_L["Guild member for over {num} year"] = "Membre de la guilde depuis plus d'{num} an"
    GRM_L["Guild member for over {num} years"] = "Membre de la guilde depuis plus de {num} ans"   -- the plural version!
    GRM_L["Add Upcoming Events to the Calendar"] = "Ajouter des événements à venir au calendrier"
    GRM_L["Player rank unable to add events to calendar"] = "Grade du joueur insuffisant pour ajouter des événements au calendrier"
    GRM_L["Anniversaries, Birthdays, and Other Events can be added with permission"] = "Les anniversaires, dates de naissance et autres événements peuvent être ajoutés avec une permission"

    -- R1.1510
    GRM_L["Check the \"Sync Users\" tab to find out why!"] = "Consultez l'onglet \"Utilisateurs Synchronisation\" pour trouver la raison !"
    GRM_L["Time as Member:"] = "Membre depuis :"
    GRM_L["|CFFE6CC7FClick|r to select player event"] = "|CFFE6CC7FClic|r pour sélectionner l'événement du joueur"
    GRM_L["|CFFE6CC7FClick Again|r to open Player Window"] = "|CFFE6CC7FCliquez encore|r pour ouvrir la fenêtre du joueur"
    GRM_L["Timestamp Format:"] = "Format de la date :"
    GRM_L["Hour Format:"] = "Format Horaire :"
    GRM_L["24 Hour"] = "24 heures"
    GRM_L["12 Hour (am/pm)"] = "12 heures am/pm"
    GRM_L["Enable Fade on Tab Change"] = "Activer le fondu lors du changement d'onglet"
    GRM_L["Confirm Custom Note"] = "Confirmer Note personnalisée"

    -- R1.1520
    GRM_L["A new rank has been added to the guild!"] = "Un nouveau grade a été ajouté à la guilde !"
    GRM_L["{num} new ranks have been added to the guild!"] = "{num} nouveaux grades ont été ajoutés à la guilde !"
    GRM_L["The guild has removed a rank!"] = "La guilde a supprimé un grade !"
    GRM_L["{num} guild ranks have been removed!" ] = "{num} grades de guilde ont été supprimés"
    GRM_L["Edit Ban"] = "Éditer"
    GRM_L["Please Select a Player to Edit their Ban!"] = "Merci de sélectionner un joueur pour éditer son ban !"
    GRM_L["Update Ban"] = "Mettre à jour ban"
    GRM_L["{name}'s Ban Info has Been Updated!"] = "Infos du ban de {name} mises à jour"

    -- R1.1530
    GRM_L["{name} plays the {custom1} class, not {custom2}."] = "{name} joue la classe {custom1} , pas {custom2}."             -- Example: Arkaan plays the Hunter class, not Paladin.
    GRM_L["{num} Items Updated"] = "{num} items mis à jour"
    GRM_L["You Currently Have Disabled Adding Events to Calendar"] = "La fonction 'Ajouter événements au calendrier' est actuellement désactivée"

    -- R1.20
    GRM_L["|CFFE6CC7FHold Shift|r to view more alt details."] = "|CFFE6CC7FMaintenir Maj|r pour voir plus de détails."                -- "Hold Shift to view more alt details" is the phrase, but the |CFF|r is the text coloring hex code. Please keep it in there on the keyboard command coloring
    GRM_L["|CFFE6CC7FClick|r to view more alt details."] = "|CFFE6CC7FClic|r pour voir plus de détails."
    GRM_L["|CFFE6CC7FShift-Click|r to keep alt details open."] = "|CFFE6CC7FMaj-Clic|r pour garder les détails ouverts."               -- The same can be said here. ^^
    GRM_L["|CFFE6CC7FClick|r to flip player name ordering"] = "|CFFE6CC7FClic|r pour inverser le tri des noms de joueurs"                  -- and the reset...
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Newest"] = "|CFFE6CC7FClic|r pour trier par dates d'entrée les plus récentes"
    GRM_L["|CFFE6CC7FClick|r to sort Join Dates by Oldest"] = "|CFFE6CC7FClic|r pour trier par dates d'entrée les plus anciennes"
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Newest"] = "|CFFE6CC7FClic|r pour trier par promotions les plus récentes"
    GRM_L["|CFFE6CC7FClick|r to sort Promotion Dates by Oldest"] = "|CFFE6CC7FClic|r pour trier par promotions les plus anciennes"
    GRM_L["|CFFE6CC7FClick|r to sort all Mains first"] = "|CFFE6CC7FClic|r pour afficher les 'Mains' en premier"
    GRM_L["|CFFE6CC7FClick|r to sort all Alts first."] = "|CFFE6CC7FClic|r pour afficher les 'Alts' en premier"
    GRM_L["{name}'s Profile is Being Built. One Moment..."] = "Profil de {name} en construction. Un moment..."
    GRM_L["There are {num} players requesting to join your guild. You only have room for {custom1} more friends. Please consider cleaning up your friend and recruitment lists."] = "{num} joueurs demandent à rejoindre votre guilde. Vous ne pouvez plus ajouter que {custom1} ami(s). Pensez à nettoyer vos listes d'amis et de recrutement.";
    GRM_L["{name}'s Alts"] = "Alts de {name}"                                   -- Like "Arkaan's Alts"
    GRM_L["Online:  {num}/{custom1}"] = "En ligne :  {num}/{custom1}"                         -- As in "Online: 3/59"
    GRM_L["Next"] = "Suivant"                                            -- This means to Advance forward to the "next" one. It is used on recruitment window to move to NEXT online player.
    GRM_L["Previous"] = "Précédent"                                        -- Same context as the "next" except this one goes back to the one before.
    GRM_L["There are currently no ONLINE recruits."] = "Aucun postulant en ligne."
    GRM_L["There are currently no more players in that direction."] = "Aucun joueur dans cette direction"
    GRM_L["You have reached the end of the list"] = "Vous avez atteint la fin de la liste"
    GRM_L["You have reached the top of the list"] = "Vous avez atteint le début de la liste"
    GRM_L["Auto Open Window"] = "Affichage automatique"
    GRM_L["Only if a player is online and you are not in combat"] = "Seulement si un joueur est en ligne et que vous êtes hors combat"
    GRM_L["Recruit window will open when combat ends."] = "La fenêtre de postulants s'ouvrira à la fin du combat."
    GRM_L["GRM window will open when combat ends."] = "La fenêtre GRM s'ouvrira à la fin du combat."

    -- R1.22
    GRM_L["Please manually select your guild to view player details"] = "Merci de sélectionner manuellement votre guilde pour afficher les détails des joueurs"

    -- R1.24
    GRM_L["This also will change the <Alt> format to match"] = "Cela changera aussi le format <Alt> pour correspondre"
    GRM_L["M"] = "M"                                           -- Of note, the "M" is short for "Main" and this is the reference to the main tag on alts in guild chat. For use in the Main tagging <M> (M) etc...
    GRM_L["A"] = "R"           
    GRM_L["<M>"] = "<M>"                                         -- <M> appears for "Main"
    GRM_L["<A>"] = "<R>"                                        -- This is the "Alt" tag on the Add Alt side window. For use in the Alt tagging <A> (A) etc...

    -- R1.25
    GRM_L["NG"] = "NG"                                          -- Stands for "Non-guildie" and can be in the context of calendar invites... it explains why some might have tags and others not... They might not be in your guild
    GRM_L["Include \"Joined:\" tag with the date."] = "Ajouter la mention \"Recruté le\" avec la date."                                          -- the \" is so you include the qutoations in the actual text. You need them or it closes the phrase.
    GRM_L["Joined: {name}"] = "Recruté le {name}"                                                                  -- {name} is actually in reference to the Data Format... So "Joined: 22 May '18"   {name} = "22 May '18"
    GRM_L["GRM Auto-Detect! {name} has joined the guild and will be set as Main"] = "Détection automatique GRM ! {name} a rejoint la guilde et sera défini comme 'Main'"            -- Main auto-detect message

    -- R1.26
    GRM_L["Click to Disable Sync of Custom Note"] = "Cliquer pour désactiver la synchronisation des notes personnalisées"
    GRM_L["Click to Enable Sync of Custom Note"] = "Cliquer pour activer la synchronisation des notes personnalisées"
    GRM_L["Sync is Currently Disabled"] = "Synchronisation désactivée"
    GRM_L["Custom Note Sync is Currently Disabled"] = "Synchronisation des notes personnalisées désactivée"
    GRM_L["|CFFE6CC7FRight-Click|r for Additional Options"] = "|CFFE6CC7FClic-Droit|r pour plus d'options"

    -- R1.27
    GRM_L["Show Border on Public, Officer, and Custom Notes"] = "Afficher la bordure des notes d'officier, publiques et personnalisées"

    -- R1.28
    GRM_L["Public Note:"] = "Note publique"
    GRM_L["Officer Note:"] = "Note d'officier"
    GRM_L["Public Note"] = "Note publique"
    GRM_L["Officer Note"] = "Note d'officier"
    GRM_L["Show Public and Officer Note of Left Player in the Log"] = "Afficher la note d'officier et publique du joueur qui a quitté la guilde dans le journal"
    GRM_L["Hard Reset"] = "Hard Reset"
    GRM_L["Hard reset of ALL GRM data, account-wide. Game will reload!"] = "Réinitialisation TOTALE de toutes les données GRM, pour tout le compte.\nLe jeu sera rechargé !"
    GRM_L["Reject\nAll"] = "Refuser\nTous"                     -- This is the same as "Reject All" it just forces the 2 words to be on 2 separate lines without me adjusting the text width
    GRM_L["{num} Applicants to the Guild have been denied"] = "{num} postulants à la guilde ont été refusés"
    GRM_L["Do you really want to reject all applicants?"] = "Voulez-vous vraiment refuser tous les postulants ?"
    GRM_L["Only recommend to kick if all player linked alts exceed max time"] = "Recommander l'exclusion seulement si tous les alts liés excèdent le temps maximal"
    GRM_L["Your Guild Leader Has Set Sync Restrictions to {name} or Higher"] = "Votre chef de guilde a restreint la synchronisation aux {name} ou supérieurs"
    GRM_L["Unable to Change Rank. Guild Leader has set restriction to {name} or higher"] = "Impossible de changer le grade. Le chef de guilde a défini une restriction aux {name} ou supérieurs"     -- Like Initiate or higher
    GRM_L["Unable to Change Rank. Guild Leader has set restriction level."] = "Impossible de changer le grade. Le chef de guilde a défini une restriction de niveau."
    GRM_L["Unify Control Settings for all guildies with 'g#^X' commands"] = "Unifier les paramètres de contrôle pour tous les membres avec les commandes 'g#^X'"
    GRM_L["CONTROL TAGS:"] = "BALISES DE CONTRÔLE"
    GRM_L["Force Settings with Guild Info Tags"] = "Forcer les paramètres avec les balises :"
    GRM_L["X = index of minimum rank. Example: 0 = {name} and {num} = {name2}"] = "X = index de grade minimum. Exemple: 0 = {name} et {num} = {name2}"
    GRM_L["'g2^X' - Establish minimum sync rank restriction for player details"] = "'g2^X' - Définit le grade minimum pour la synchronisation des détails des joueurs"
    GRM_L["'g3^X' - Establish minimum sync rank restriction for BAN info"] = "'g3^X' - Définit le grade minimum pour la synchronisation des infos de bans"
    GRM_L["'g4^X' - Establish minimum sync rank restriction for Custom Note info"] = "'g4^X' - Définit le grade minimum pour la synchronisation des notes personnalisées"
    GRM_L["'g8^+' - Warning, purge tool! All players will purge their data once except for Guild Leader"] = "'g8^+' - Avertissement, outils de purge ! Les données des joueurs seront purgées exceptées celles du chef de guilde"
    GRM_L["'g8^+/Playername-Servername/' - The given player will purge their data (case sensitive)"] = "'g8^+/Playername-Servername/' - Les données du joueur choisi seront purgées (Respecter la casse)"
    GRM_L["Warning! System messages are disabled! GRM cannot function fully without them. You must re-enable them in the chat settings."] = "Avertissement ! Messages système désactivés ! GRM ne peut pas fonctionner correctement sans eux. Vous devez les réactiver dans les réglages du Chat."
    GRM_L["Database Still Loading. GRM will open automatically when finished."] = "Base de données en cours de chargement. GRM s'ouvrira automatiquement une fois l'opération terminée."

    -- R1.29
    GRM_L["Do you really want to invite all applicants?"] = "Voulez-vous vraiment inviter tous les postulants ?"
    GRM_L["There are currently 0 players online to invite."] = "Il n'y a aucun joueur en ligne à inviter"
    GRM_L["It appears all players are now offline."] = "Il semble que tous les joueurs soient Hors Ligne"
    GRM_L["Invite\nAll"] = "Inviter\nTous"                             -- Just makes it 2 lines - they \n is the line break. You can remove if not necessary, or include.
    GRM_L["Include Message When Sending Invite"] = "Inclure un message lors de l'invitation"
    GRM_L["Click here to set custom invite message. Press Enter to save before sending invite!"] = "Cliquez pour définir un message d'invitation. Appuyez sur Entrée avant d'envoyer l'invitation !"
    GRM_L["The highlighted character is not valid for messages. Please remove."] = "Le caractère en surbrillance n'est pas valide pour les messages. Merci de le retirer."
    GRM_L["Not all characters are valid. Please remove any non-text characters."] = "Certains caractères sont invalides. Merci de retirer les caractères non-alphabétiques."
    GRM_L["Kick macro created. Press \"CTRL-SHIFT-K\" to kick all of {name}'s alts"] = "Macro 'Renvoi' créée. Appuyer sur \"CTRL-MAJ-K\" pour renvoyer tous les Alts de {name}"
    GRM_L["Kick the Player's {num} alts too?"] = "Renvoyer {num} alts du joueur également ?"       -- Plural
    GRM_L["Kick the Player's {num} alt too?"] = "Renvoyer {num} alt du joueur également ?"        -- Not Plural  - "Kick the Player's 1 alt too?"
    GRM_L["Ban and Kick the Player's {num} alts too?"] = "Bannir et renvoyer les {num} Alts du joueur également ?"
    GRM_L["Ban and Kick the Player's {num} alt too?"] = "Bannir et renvoyer {num} Alt du joueur également ?"

    -- R1.30
    GRM_L["Sync With {name} is Complete..."] = "Synchronisation avec {name} effectuée..."
    GRM_L["Database Still Loading. Please Wait..."] = "Chargement de la base de données. Merci de patienter..."
    GRM_L["|CFFE6CC7FLeft-Click|r and drag to move this button."] = "|CFFE6CC7FClic gauche|r et tirer pour déplacer ce bouton."
    GRM_L["|CFFE6CC7FCtrl-Left-Click|r and drag to move this button anywhere."] = "|CFFE6CC7FCtrl-Clic gauche|r et tirer pour déplacer ce bouton n'importe où."
    GRM_L["MOTD:"] = "Message du jour"       -- Message Of The Day = M.O.T.D = MOTD - 
    GRM_L["minimap"] = "Minicarte"

    -- R1.31
    GRM_L["Show 'Main' Tag on both Mains and Alts in Chat"] = "Afficher le tag 'Main' dans le Chat sur les Mains ET sur les Alts"

    -- R1.32
    GRM_L["Invites Currently Being Sent..."] = "Invitations envoyées..."
    GRM_L["GRM has moved the Guild Leader setting restriction codes to the Guild Info tab."] = "GRM a déplacé les réglages de restrictions de guilde dans l'onglet Infos guilde"
    GRM_L["Please make room for them and re-add."] = "Merci de faire de la pace et de les ajouter à nouveau."
    GRM_L["Your Guild Leader has pushed a reset of your data."] = "Votre chef de guilde a lancé une réinitialisation de vos données.";
    GRM_L["Your Guild Leader Has Set BAN Sync Restrictions to {name} or Higher"] = "Votre chef de guilde a défini une restriction de synchronisation des bans aux {name} ou supérieurs"
    GRM_L["Your Guild Leader Has Set CUSTOM NOTE Sync Restrictions to {name} or Higher"] = "Votre chef de guilde a défini une restriction de synchronisation des notes personnalisées aux {name} ou supérieurs"

    -- R1.33
    GRM_L["Invite all macro created. Press \"CTRL-SHIFT-K\" to invite all online recruits."] = "Macro 'Inviter tous' créée. Appuyer sur \"CTRL-MAJ-K\" pour inviter tous les postulants en ligne."
    GRM_L["Macro will auto-remove after {num} seconds."] = "Auto-suppression dans {num} secondes."
    GRM_L["UI"] = "UI"
    GRM_L["UI Controls"] = "Réglages UI"
    GRM_L["UI Configuration:"] = "Configuration Interface Utilisateur"
    GRM_L["|CFFE6CC7FClick|r to Change Rank Restriction for Custom Note"] = "|CFFE6CC7FClic|r pour modifier la restriction de grade de la note personnalisée"
    GRM_L["Sync restriction is unique to just {name}'s custom note"] = "Restriction de synchronisation uniquement pour la note personnalisée de {name}"
    GRM_L["Show Character Guild Reputation"] = "Afficher la réputation du personnage"
    GRM_L["Show Guild Member Birthdays"] = "Afficher la date de naissance des membres"
    GRM_L["Set Birthday"] = "Définir"
    GRM_L["Edit Birthday"] = "Éditer date de naissance"
    GRM_L["Remove Date"] = "Retirer date"             -- Clear Birthday shorthand
    GRM_L["Birthday"] = "Date naissance"
    GRM_L["Only Announce Birthdays and Anniversaries if Listed as 'Main'"] = "Annoncer seulement les dates de naissance et d'anniversaires si listés comme 'Main'"
    GRM_L["{name} will be celebrating {num} year in the Guild!"] = "{name} célèbrera {num} an dans la guilde !"            -- {custom1} will reference the DATE. Ex: "Arkaan will be celebrating 1 year in the Guild! ( 1 May )" - SINGULAR
    GRM_L["{name} will be celebrating {num} years in the Guild!"] = "{name} célèbrera {num} ans dans la guilde !"           -- Same thing but PLURAL - "years" in stead of "year"
    GRM_L["No player's currently available to sync {name}'s Guild Data..."] = "Aucun joueur disponible pour synchroniser les données de guilde de {name}..."
    GRM_L["{name} has set {name2}'s Birthday: {custom1}"] = "{name} a défini la date de naissance de {name2} : {custom1}"                   -- custom note is the date like "12 Dec"
    GRM_L["{name}'s Birthday has been set: {custom1}"] = "Date de naissance de {name} définie : {custom1}"
    GRM_L["Sync Birthdays"] = "Synchroniser les dates de naissance"

    -- R1.34
    GRM_L["Debugging Enabled"] = "Débogage activé"
    GRM_L["Debugging Disabled"] = "Débogage désactivé"
    GRM_L["{num} is not a valid day of the month! It must be a number between 1 and 31"] = "{num} n'est pas un jour valide du mois ! Ce nombre doit être compris entre 1 et 31"
    GRM_L["{num} is not a valid index of the month of the year! It must be a number between 1 and 12"] = "{num} n'est pas un mois valide de l'année ! Ce nombre doit être compris entre 1 et 12"
    GRM_L["The day cannot be {num}. It must be a number between 1 and 31"] = "Le jour ne peut être {num}. Il doit être compris entre 1 et 31"
    GRM_L["The month cannot be {num}. must be a number between 1 and 12"] = "Le mois ne peut être {num}. Il doit être compris entre 1 et 12"
    GRM_L["{num} birthdays have been reset."] = "{num} dates de naissance ont été réinitialisées."
    GRM_L["No player was found to have that birthday."] = "Aucun joueur ne correspond à cette date de naissance."

    -- R1.35
    GRM_L["\"{custom1}\" setting is not valid. Value must be between 1 and 3. Defaulting to set join date to officer note with \"g5^1\""] = "Le réglage \"{custom1}\" n'est pas valide. La valeur doit être comprise entre 1 et 3. Réglage par défaut de la date d'arrivée sur la note d'officier avec \"g5^1\""    -- The custom1 will be something like "g5^8" or something. It's to account for typos or error warnings.
    GRM_L["Your Guild Leader Has Set Join Dates to only be added to the {name}"] = "Votre chef de guilde a défini que les dates d'entrée ne peuvent être ajoutées qu'à la {name}"         -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["Warning - Global Controls:"] = "Avertissement - Contrôles globaux :"
    GRM_L["Sync Restrictions Globally Changed to {name} or Higher"] = "Restrictions de synchronisation modifiées globalement pour {name} ou supérieur"
    GRM_L["BAN Sync Restrictions Globally Changed to {name} or Higher"] = "Restrictions de synchronisation des bans modifiées globalement pour {name} ou supérieur"
    GRM_L["CUSTOM NOTE Sync Restrictions Globally Changed to {name} or Higher"] = "Restrictions de synchronisation des notes personnalisées modifiées globalement pour {name} ou supérieur"
    GRM_L["Join Dates Globally Changed to only be added to the {name}"] = "Ajouter dates d'entrée modifiées globalement seulement à : {name}"
    GRM_L["Unable to Modify. Global setting is set to the {name}"] = "Impossible de modifier. Le paramètre global est défini sur : {name}"                           -- The {name} will be the "Officer note" or "Public Note" or "Custom Note"  set, based on their settings...
    GRM_L["'g5^X' - Designate Join Date note destination. g5^1 = Officer, 2 = public, 3 = custom"] = "'g5^X' - Définit où la date d'entrée sera enregistrée :\nExemple : g5^1 = officier, 2 = publique, 3 = personnalisée"

    -- R1.37
    GRM_L["No Action Configured"] = "Aucune action configurée"
    GRM_L["OLD LOG"] = "MODIFICATIONS PRÉCÉDENTES"
    GRM_L["CHANGES"] = "MODIFICATIONS"
    GRM_L["Sync has failed to start. Please try again!"] = "La synchronisation a échoué. Merci de réessayer !"
    GRM_L["Please wait {num} more seconds before manually initiating the sync process again."] = "Merci de patienter {num} secondes de plus avant de relancer le processus de synchronisation manuelle."

   -- R1.39
    GRM_L["Only Report if there are no Active Alts in the Group"] = "Signaler seulement s'il n'y a aucun Alt actif dans le groupe"
    GRM_L["Level Filter Minimum:"] = "Niveau minimum"                                -- As in player level
    GRM_L["Report Milestones:"] = "Signaler paliers :"
    GRM_L["Report Level Up Changes"] = "Signaler modifications de niveaux"
    GRM_L["Reporting:"] = "Signalement :"
    GRM_L["Unable to disable level cap tracking. Please disable ALL tracking to turn off."] = "Impossible de désactiver le suivi de niveau. Merci de désactiver TOUT le suivi."
    GRM_L["No Levels to Report to Log"] = "Aucun niveau à signaler dans le journal"
    GRM_L["{name} has Surpassed their Level {num} Milestone and is Now {custom1}"] = "{name} a surpassé son palier de niveau {num} et est maintenant {custom1}"
    GRM_L["{name} has Reached their Level {num} Milestone"] = "{name} a atteint le palier de niveau {num}"
    GRM_L["{name}'s Ban has been Updated by {name2}!"] = "Le ban de {name} a été mis à jour par {name2}!"
    GRM_L["{name} has Updated {name2}'s BAN and also BANNED all linked alts from the guild!"] = "{name} a mis à jour le ban de {name2} et a également banni tous ses Alts de la guilde !"
    GRM_L["One moment, GRM is still being configured."] = "Un moment, GRM en cours de configuration."
    GRM_L["Press ENTER to complete"] = "Appuyez sur Entrée pour valider"
    GRM_L["Player Was Banned By: {name}"] = "Joueur banni par : {name}"
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED players are currently in the guild."] = "|cffff0000AVERTISSEMENT!!!|r {num} joueur BANNI est actuellement dans la guilde."     -- plural
    GRM_L["|cffff0000WARNING!!!|r {num} BANNED player is currently in the guild."] = "|cffff0000AVERTISSEMENT!!!|r {num} joueurs BANNIS sont actuellement dans la guilde."        -- Singular  -- please keep the color coding... this keeps the Warning in red    

    -- R1.41
    GRM_L["{num} metadata profiles are being built for people previously in the guild. The data is being requested, but this may take some time."] = "{num} profils de métadonnées en cours de création pour les joueurs précédemment dans la guilde. Les données ont été demandées mais cela peut prendre un moment."                   -- PLURAL
    GRM_L["One metadata profile is being built for a player previously in the guild. The data is being requested, but this may take some time."] = "Profil de métadonnées en cours de création pour les joueurs précédemment dans la guilde. Les données ont été demandées mais cela peut prendre un moment."           -- SINGULAR, same line.
    GRM_L["Sync will re-trigger one time, in a moment, to collect final data on these profiles."] = "La synchronisation se déclenchera à nouveau dans un moment pour collecter les dernières données de ces profils."
    GRM_L["Auto-Focus the search box"] = "Focus auto du champ de recherche à l'ouverture du journal"
    GRM_L["This will skip the first time if set to load on logon"] = "Si l'option 'Afficher au démarrage' est activée, le focus se fera à l'ouverture suivante"  -- Referring to the auto-focusing on the search box, this is a tooltip helper
    GRM_L["Please enter a valid level between 1 and {num}"] = "Merci d'entrée un niveau valide entre 1 et {num}"
    GRM_L["Player's Main: {name}"] = "'Main' du joueur : {name}"
    GRM_L["Player's main no longer in the guild: {name}"] = "'Main' du joueur qui n'est plus dans la guilde : {name}"

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