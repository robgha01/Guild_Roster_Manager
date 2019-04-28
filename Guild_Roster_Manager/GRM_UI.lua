-- Author: TheGenomeWhisperer (Arkaan)

-- Guild Roster Manager UI
-- Fully built in Lua, as to avoid building an XML UI. I initially started building it in Lua as a proof-of-concept to see how powerful the tools were. I was not disappointed.

------------------------
------ FRAMES ----------
------------------------
--------------------------------------
---- UI BUILDING COMPLETELY IN LUA ---
---- FRAMES, FONTS, STYLES, ETC. -----
--------------------------------------

--------------------------------------
--- INITIALIZING UI OBJECTS ----------
--------------------------------------

-- Contains the entire UI initialization of frames (no logic details yet)
GRM_UI = {};

-- Just controls for reloading in ElvUI in case of language chain which rebuilds the UI in new language.
GRM_UI.ElvUIReset = false;
GRM_UI.ElvUIReset2 = false;

-- Core Frame
GRM_UI.GRM_MemberDetailMetaData = CreateFrame( "Frame", "GRM_MemberDetailMetaData", GuildRosterFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaDataCloseButton = CreateFrame( "Button", "GRM_MemberDetailMetaDataCloseButton", GRM_UI.GRM_MemberDetailMetaData, "UIPanelCloseButton");
GRM_UI.GRM_MemberDetailMetaData:Hide();  -- Prevent error where it sometimes auto-loads.

-- Guild Member Detail Frame UI and Children
GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton = CreateFrame("Button", "GRM_SetPromoDateButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton.GRM_SetPromoDateButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:CreateFontString("GRM_SetPromoDateButtonText", "OVERLAY", "GameFontWhiteTiny");

GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected = CreateFrame("Frame", "GRM_DayDropDownMenuSelected", GRM_UI.GRM_MemberDetailMetaData, "InsetFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected.GRM_DayText = GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:CreateFontString("GRM_DayText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu = CreateFrame("Frame", "GRM_DayDropDownMenu", GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected, "InsetFrameTemplate");

GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected = CreateFrame("Frame", "GRM_YearDropDownMenuSelected", GRM_UI.GRM_MemberDetailMetaData, "InsetFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected.GRM_YearText = GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:CreateFontString("GRM_YearText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu = CreateFrame("Frame", "GRM_YearDropDownMenu", GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected, "InsetFrameTemplate");

GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected = CreateFrame("Frame", "GRM_MonthDropDownMenuSelected", GRM_UI.GRM_MemberDetailMetaData, "InsetFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected.GRM_MonthText = GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:CreateFontString("GRM_MonthText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu = CreateFrame("Frame", "GRM_MonthDropDownMenu", GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected, "InsetFrameTemplate");

-- SUBMIT BUTTONS
GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton = CreateFrame("Button", "GRM_DateSubmitButton", GRM_UI.GRM_MemberDetailMetaData, "UIPanelButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton = CreateFrame("Button", "GRM_DateSubmitCancelButton", GRM_UI.GRM_MemberDetailMetaData, "UIPanelButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt = GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:CreateFontString("GRM_DateSubmitButtonTxt", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButtonTxt = GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:CreateFontString("GRM_DateSubmitCancelButtonTxt", "OVERLAY", "GameFontWhiteTiny");
-- Fontstring for MemberRank History 
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton = CreateFrame("Button", "GRM_MemberDetailJoinDateButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:CreateFontString("GRM_MemberDetailJoinDateButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_JoinDateText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_JoinDateText", "OVERLAY", "GameFontWhiteTiny");
-- if player doesn't know their join date or promo date.
GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton = CreateFrame("Button", "GRM_SetUnknownButton", GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton.GRM_SetUnknownButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:CreateFontString("GRM_SetUnknownButtonText", "OVERLAY", "GameFontWhiteTiny");
-- Birthdays
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton = CreateFrame("Button", "GRM_MemberDetailBirthdayButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton.GRM_MemberDetailBirthdayButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:CreateFontString("GRM_MemberDetailBirthdayButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_BirthdayText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailBirthdayTitleText", "OVERLAY", "GameFontNormalSmall");

-- Normal frame translucent
GRM_UI.noteBackdrop = {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background" ,
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 18,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
}

-- Thinnner frame translucent template
GRM_UI.noteBackdrop2 = {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background" ,
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 9,
    insets = { left = 2, right = 2, top = 3, bottom = 2 }
}

-- Clear frame - no translucent background
GRM_UI.noteBackdrop3 = {
    bgFile = nil,
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 6,
    insets = { left = 2, right = 2, top = 3, bottom = 2 }
}

-- Notes of the 
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow = CreateFrame( "Frame", "GRM_PlayerNoteWindow", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1 = GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:CreateFontString("GRM_noteFontString1", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox = CreateFrame( "EditBox", "GRM_PlayerNoteEditBox", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow = CreateFrame( "Frame", "GRM_PlayerOfficerNoteWindow", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2 = GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:CreateFontString("GRM_noteFontString2", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox = CreateFrame( "EditBox", "GRM_PlayerOfficerNoteEditBox", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_NoteCount", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:Hide();

GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected = CreateFrame("Frame", "GRM_CustomNoteRankDropDownSelected", GRM_UI.GRM_MemberDetailMetaData, "InsetFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:CreateFontString("GRM_CustomDropDownSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu = CreateFrame("Frame", "GRM_CustomNoteRankDropDownMenu", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected, "InsetFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:Hide();

-- Custom NOTEBOX
-- Reason for the ban
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame = CreateFrame("Frame", "GRM_CustomNoteEditBoxFrame", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:CreateFontString("GRM_CustomNoteEditBoxText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:CreateFontString("GRM_CustomNoteTextCount", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox = CreateFrame("CheckButton", "GRM_CustomNoteSyncMetaCheckBox", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:CreateFontString("GRM_CustomNoteMetaCheckBoxText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox = CreateFrame( "EditBox", "GRM_CustomNoteEditBox", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame);
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetAutoFocus( false);
--CUSTOM NOTE SCROLL FRAME
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame = CreateFrame("ScrollFrame", "GRM_CustomNoteScrollFrame", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame);
-- SLIDER
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider = CreateFrame("Slider", "GRM_CustomNoteScrollFrameSlider", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextUp = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:CreateFontString("GRM_CustomNoteScrollFrameSliderOverlayTextUp", "OVERLAY");
GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextDown = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:CreateFontString("GRM_CustomNoteScrollFrameSliderOverlayTextDown", "OVERLAY");
-- Populating Frames with FontStrings
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNameText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailNameText", "OVERLAY", "GameFontNormalLarge");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailMainText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLevel = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailLevel", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailRankTxt", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailRankDateTxt", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailNoteTitle", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailONoteTitle", "OVERLAY", "GameFontNormalSmall");

-- LAST ONLINE
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailLastOnlineTitleTxt", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailLastOnlineTxt", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailDateJoinedTitleTxt", "OVERLAY", "GameFontNormalSmall");

-- STATUS TEXT
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailPlayerStatus", "OVERLAY", "GameFontNormalSmall");

-- ZONEINFORMATION
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailMetaZoneInfoText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoZoneText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailMetaZoneInfoZoneText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1 = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailMetaZoneInfoTimeText1", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText2 = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailMetaZoneInfoTimeText2", "OVERLAY", "GameFontWhiteTiny");

-- GROUP INVITE 
GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton = CreateFrame("Button", "GRM_GroupInviteButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton.GRM_GroupInviteButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton:CreateFontString("GRM_GroupInviteButtonText", "OVERLAY", "GameFontWhiteTiny");

-- Tooltips
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankToolTip = CreateFrame("GameTooltip", "GRM_MemberDetailRankToolTip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankToolTip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip = CreateFrame("GameTooltip", "GRM_MemberDetailJoinDateToolTip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailServerNameToolTip = CreateFrame("GameTooltip", "GRM_MemberDetailServerNameToolTip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNotifyStatusChangeTooltip = CreateFrame("GameTooltip", "GRM_MemberDetailNotifyStatusChangeTooltip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNotifyStatusChangeTooltip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNJDSyncTooltip = CreateFrame("GameTooltip", "GRM_MemberDetailNJDSyncTooltip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNJDSyncTooltip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip = CreateFrame("GameTooltip", "GRM_OfficerNoteTooltip", GuildInfoDetailsFrame, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:Hide();

--Sync Join Date Side Frame Options
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame = CreateFrame("Frame", "GRM_SyncJoinDateSideFrame", GRM_UI.GRM_MemberDetailMetaData, "TranslucentFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText = GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:CreateFontString("GRM_SyncJoinDateText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton = CreateFrame("Button", "GRM_JDMainButton", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame);
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton:CreateFontString("GRM_JDMainButtonText", "OVERLAY");
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton = CreateFrame("Button", "GRM_JDSelectedPlayerButton", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame);
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton:CreateFontString("GRM_JDSelectedPlayerButtonText", "OVERLAY");
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton = CreateFrame("Button", "GRM_JDOldestButton", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame);
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton:CreateFontString("GRM_JDOldestButtonText", "OVERLAY");
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton = CreateFrame("Button", "GRM_JDSyncCancelButton", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame);
GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton:CreateFontString("GRM_JDSyncCancelButtonText", "OVERLAY");

-- Custom Note Confirm and Cancel Buttons
GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton = CreateFrame("Button", "GRM_ConfirmCustomNoteButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:CreateFontString("GRM_ConfirmCustomNoteButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton = CreateFrame("Button", "GRM_CancelCustomNoteButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButtonText = GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:CreateFontString("GRM_CancelCustomNoteButtonText", "OVERLAY", "GameFontWhiteTiny");

-- Reputation Level
GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_ReputationLevelText", "OVERLAY", "GameFontWhiteTiny");

-- CUSTOM POPUPBOX FOR REUSE -- Avoids all possibility of UI Taint by just building my own, for those that use a lot of addons.
GRM_UI.GRM_PopupWindow = CreateFrame("Frame", "GRM_PopupWindow", StaticPopup1, "TranslucentFrameTemplate");
GRM_UI.GRM_PopupWindow:Hide() -- Prevents it from autopopping up on load like it sometimes will.
GRM_UI.GRM_PopupWindowCheckButton1 = CreateFrame("CheckButton", "GRM_PopupWindowCheckButton1", GRM_UI.GRM_PopupWindow, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_PopupWindowCheckButtonText = GRM_UI.GRM_PopupWindowCheckButton1:CreateFontString("GRM_PopupWindowCheckButtonText", "OVERLAY", "GameFontNormalSmall");

GRM_UI.GRM_PopupWindowCheckButton2 = CreateFrame("CheckButton", "GRM_PopupWindowCheckButton2", GRM_UI.GRM_PopupWindow, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_PopupWindowCheckButton2Text = GRM_UI.GRM_PopupWindowCheckButton2:CreateFontString("GRM_PopupWindowCheckButton2Text", "OVERLAY", "GameFontNormalSmall");

-- EDIT BOX FOR ANYTHING(like banned player note);
GRM_UI.GRM_MemberDetailEditBoxFrame = CreateFrame("Frame", "GRM_MemberDetailEditBoxFrame", GRM_UI.GRM_PopupWindow, "TranslucentFrameTemplate");
GRM_UI.GRM_MemberDetailEditBoxFrame:Hide();
GRM_UI.GRM_MemberDetailPopupEditBox = CreateFrame("EditBox", "GRM_MemberDetailPopupEditBox", GRM_UI.GRM_MemberDetailEditBoxFrame);

-- Banned Fontstring and Buttons
GRM_UI.GRM_MemberDetailBannedText1 = GRM_UI.GRM_MemberDetailMetaData:CreateFontString("GRM_MemberDetailBannedText1", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_MemberDetailBannedIgnoreButton = CreateFrame("Button", "GRM_MemberDetailBannedIgnoreButton", GRM_UI.GRM_MemberDetailMetaData, "GameMenuButtonTemplate");
GRM_UI.GRM_MemberDetailBannedIgnoreButton.GRM_MemberDetailBannedIgnoreButtonText = GRM_UI.GRM_MemberDetailBannedIgnoreButton:CreateFontString("GRM_MemberDetailBannedIgnoreButtonText", "OVERLAY", "GameFontWhiteTiny");

-- ALT FRAMES!!!
GRM_UI.GRM_CoreAltFrame = CreateFrame( "Frame", "GRM_CoreAltFrame", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_CoreAltFrame:Hide(); -- No need to show initially. Occasionally on init. it would popup the title text. Just keep hidden with init.
GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame = CreateFrame("ScrollFrame", "GRM_CoreAltScrollFrame", GRM_UI.GRM_CoreAltFrame);

-- CONTENT ALT FRAME (Child Frame)
GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollChildFrame = CreateFrame("Frame", "GRM_CoreAltScrollChildFrame");
-- SLIDER
GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider = CreateFrame("Slider", "GRM_CoreAltScrollFrameSlider", GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame, "UIPanelScrollBarTemplate");
-- ALT HEADER
GRM_UI.GRM_altFrameTitleText = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_altFrameTitleText", "OVERLAY", "GameFontNormalSmall");
-- ALT OPTIONSFRAME
GRM_UI.GRM_altDropDownOptions = CreateFrame("Frame", "GRM_altDropDownOptions", GRM_UI.GRM_MemberDetailMetaData);
GRM_UI.GRM_altDropDownOptions:Hide();
GRM_UI.GRM_altOptionsText = GRM_UI.GRM_altDropDownOptions:CreateFontString("GRM_altOptionsText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_altOptionsDividerText = GRM_UI.GRM_altDropDownOptions:CreateFontString("GRM_altOptionsDividerText", "OVERLAY", "GameFontWhiteTiny");
-- ALT BUTTONS
GRM_UI.GRM_AddAltButton = CreateFrame("Button", "GRM_AddAltButton", GRM_UI.GRM_CoreAltFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_AddAltButtonText = GRM_UI.GRM_AddAltButton:CreateFontString("GRM_AddAltButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_AddAltButton2 = CreateFrame("Button", "GRM_AddAltButton2", GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollChildFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_AddAltButton2Text = GRM_UI.GRM_AddAltButton2:CreateFontString("GRM_AddAltButton2Text", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_altSetMainButton = CreateFrame("Button", "GRM_altSetMainButton", GRM_UI.GRM_altDropDownOptions);
GRM_UI.GRM_altSetMainButtonText = GRM_UI.GRM_altSetMainButton:CreateFontString("GRM_altSetMainButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_altRemoveButton = CreateFrame("Button", "GRM_altRemoveButton", GRM_UI.GRM_altDropDownOptions);
GRM_UI.GRM_altRemoveButtonText = GRM_UI.GRM_altRemoveButton:CreateFontString("GRM_altRemoveButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_altFrameCancelButton = CreateFrame("Button", "GRM_altFrameCancelButton", GRM_UI.GRM_altDropDownOptions);
GRM_UI.GRM_altFrameCancelButtonText = GRM_UI.GRM_altFrameCancelButton:CreateFontString("GRM_altFrameCancelButtonText", "OVERLAY", "GameFontWhiteTiny");
-- ALT NAMES (If I end up running short on FontStrings, I may need to convert to use static buttons.)
GRM_UI.GRM_CoreAltFrame.GRM_AltName1 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName1", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName2 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName3 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName3", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName4 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName4", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName5 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName5", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName6 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName6", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName7 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName7", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName8 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName8", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName9 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName9", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName10 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName10", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName11 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName11", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AltName12 = GRM_UI.GRM_CoreAltFrame:CreateFontString("GRM_AltName12", "OVERLAY", "GameFontNormalSmall");
-- ADD ALT EDITBOX Frame
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame = CreateFrame("Frame", "GRM_AddAltEditFrame", GRM_UI.GRM_CoreAltFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Hide();
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:CreateFontString("GRM_AddAltTitleText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox = CreateFrame("EditBox", "GRM_AddAltEditBox", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame, "InputBoxTemplate");
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameTextBottom = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:CreateFontString("GRM_AddAltEditFrameTextBottom", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:CreateFontString("GRM_AddAltEditFrameHelpText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2 = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:CreateFontString("GRM_AddAltEditFrameHelpText2", "OVERLAY", "GameFontWhiteTiny");

GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame = CreateFrame("ScrollFrame", "GRM_AddAltScrollFrame", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame);
-- CONTENT FRAME (Child Frame)
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollChildFrame = CreateFrame("Frame", "GRM_AddAltScrollChildFrame");
-- SLIDER
GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider = CreateFrame("Slider", "GRM_AddAltScrollFrameSlider", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame, "UIPanelScrollBarTemplate");


-- CORE GUILD LOG EVENT FRAME!!!
GRM_UI.GRM_RosterChangeLogFrame = CreateFrame("Frame", "GRM_RosterChangeLogFrame", UIParent, "BasicFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame:Hide();
-- Log Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame = CreateFrame("Frame", "GRM_LogFrame", GRM_UI.GRM_RosterChangeLogFrame);
-- Options Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame = CreateFrame("Frame", "GRM_OptionsFrame", GRM_UI.GRM_RosterChangeLogFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame = CreateFrame("Frame", "GRM_SyncOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame = CreateFrame("Frame", "GRM_ScanningOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame = CreateFrame("Frame", "GRM_OfficerOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame = CreateFrame("Frame", "GRM_HelpOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame = CreateFrame("Frame", "GRM_GeneralOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame = CreateFrame("Frame", "GRM_UIOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame = CreateFrame("Frame", "GRM_UXOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame);
--Options Frame Sub-Tabs
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab = CreateFrame("Button", "GRM_GeneralTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab = CreateFrame("Button", "GRM_ScanTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab = CreateFrame("Button", "GRM_SyncTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab = CreateFrame("Button", "GRM_HelpTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab = CreateFrame("Button", "GRM_OfficerTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab = CreateFrame("Button", "GRM_UITab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab = CreateFrame("Button", "GRM_UXTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab = CreateFrame("Button", "GRM_HordeTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTabText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:CreateFontString("GRM_HordeTabText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab = CreateFrame("Button", "GRM_AllianceTab", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "TabButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTabText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:CreateFontString("GRM_AllianceTabText", "OVERLAY", "GameFontNormal");

-- Addon Users Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame = CreateFrame("Frame", "GRM_AddonUsersFrame", GRM_UI.GRM_RosterChangeLogFrame);
-- Add Event Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame = CreateFrame("Frame", "GRM_EventsFrame", GRM_UI.GRM_RosterChangeLogFrame);
-- Ban List Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame = CreateFrame("Frame", "GRM_CoreBanListFrame", GRM_UI.GRM_RosterChangeLogFrame);
-- Audit Frame
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame = CreateFrame("Frame", "GRM_AuditFrame", GRM_UI.GRM_RosterChangeLogFrame);

--TAB BUTTONS
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab = CreateFrame("Button", "GRM_OptionsTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab = CreateFrame("Button", "GRM_LogTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab = CreateFrame("Button", "GRM_AddonUsersTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab = CreateFrame("Button", "GRM_AddEventTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab = CreateFrame("Button", "GRM_BanListTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab = CreateFrame("Button", "GRM_GuildAuditTab", GRM_UI.GRM_RosterChangeLogFrame, "GameMenuButtonTemplate");

-- CALENDAR ADD EVENT FRAMES
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameTitleText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameTitleText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameDateText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameStatusMessageText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameStatusMessageText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameToAddText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:CreateFontString("GRM_EventsFrameNameToAddTitleText", "OVERLAY", "GameFontNormal");   -- Will never be displayed, just a frame txt holder
-- Set and Ignore Buttons
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton = CreateFrame("Button", "GRM_EventsFrameSetAnnounceButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton:CreateFontString("GRM_EventsFrameSetAnnounceButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton = CreateFrame("Button", "GRM_EventsFrameIgnoreButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton:CreateFontString("GRM_RosterChangeLogFrame.GRM_EventsFrameIgnoreButtonText", "OVERLAY", "GameFontWhiteTiny");
-- SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame = CreateFrame("ScrollFrame", "GRM_AddEventScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollBorderFrame = CreateFrame("Frame", "GRM_AddEventScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, "TranslucentFrameTemplate");
-- CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame = CreateFrame("Frame", "GRM_AddEventScrollChildFrame");
-- SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider = CreateFrame("Slider", "GRM_AddEventScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame, "UIPanelScrollBarTemplate");

-- CHECKBOX FRAME
GRM_UI.GRM_RosterCheckBoxSideFrame = CreateFrame("Frame", "GRM_RosterCheckBoxSideFrame", GRM_UI.GRM_RosterChangeLogFrame, "TranslucentFrameTemplate");
-- CHECKBOXES
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton = CreateFrame("CheckButton", "GRM_RosterLoadOnLogonCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:CreateFontString("GRM_RosterLoadOnLogonCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton = CreateFrame("CheckButton", "GRM_RosterLoadOnLogonChangesCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:CreateFontString("GRM_RosterLoadOnLogonChangesCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton = CreateFrame("CheckButton", "GRM_RosterShowMainTagCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:CreateFontString("GRM_RosterShowMainTagCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains = CreateFrame("CheckButton", "GRM_ShowMainTagOnMains", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:CreateFontString("GRM_RosterShowMainTagCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton = CreateFrame("CheckButton", "GRM_ShowMinimapButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:CreateFontString("GRM_ShowMinimapButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton = CreateFrame("CheckButton", "GRM_SyncAllSettingsCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton:CreateFontString("GRM_SyncAllSettingsCheckButtonText", "OVERLAY", "GameFontNormalSmall");
-- Color Select
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame = CreateFrame("Frame", "GRM_ColorSelectOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame.GRM_OptionsTexture = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:CreateTexture(nil, "Background", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorPickerOptionsText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_ColorPickerOptionsText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_MainTagFormatText", "OVERLAY", "GameFontNormalSmall");
-- Main Name Format
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected = CreateFrame("Frame", "GRM_MainTagFormatSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:CreateFontString("GRM_TagText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu = CreateFrame("Frame", "GRM_MainTagFormatMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected, "InsetFrameTemplate");
-- Color Picker Editboxes
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR = CreateFrame("EditBox", "GRM_ColorPickerR", ColorPickerFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG = CreateFrame("EditBox", "GRM_ColorPickerG", ColorPickerFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB = CreateFrame("EditBox", "GRM_ColorPickerB", ColorPickerFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR.GRM_R_Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:CreateFontString("GRM_R_Text", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:CreateFontString("GRM_G_Text", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:CreateFontString("GRM_B_Text", "OVERLAY", "GameFontWhiteTiny");
-- Language Selection
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_LanguageSelectionText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_LanguageCountText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected = CreateFrame("Frame", "GRM_LanguageSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected.GRM_LanguageSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:CreateFontString("GRM_LanguageSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu = CreateFrame("Frame", "GRM_LanguageDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected, "InsetFrameTemplate");

-- Font Selection
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_FontText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected = CreateFrame("Frame", "GRM_FontSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected.GRM_FontSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:CreateFontString("GRM_FontSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu = CreateFrame("Frame", "GRM_FontDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected, "InsetFrameTemplate");

-- Timestamp Selection
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_TimestampSelectionText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected = CreateFrame("Frame", "GRM_TimestampSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:CreateFontString("GRM_TimestampSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu = CreateFrame("Frame", "GRM_TimestampSelectedDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected, "InsetFrameTemplate");

-- 24 or 12hr timescale Selection
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_24HrText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected = CreateFrame("Frame", "GRM_24HrSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:CreateFontString("GRM_24HrSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu = CreateFrame("Frame", "GRM_24HrSelectedDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected, "InsetFrameTemplate");

-- Tab Fade options
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton = CreateFrame("CheckButton", "GRM_FadeCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton:CreateFontString("GRM_FadeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
-- Borders option
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton = CreateFrame("CheckButton", "GRM_NoteBordersButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton:CreateFontString("GRM_NoteBordersButtonText", "OVERLAY", "GameFontNormalSmall");
-- No Reputation
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton = CreateFrame("CheckButton", "GRM_ReputationToggleButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton:CreateFontString("GRM_ReputationToggleButtonText", "OVERLAY", "GameFontNormalSmall");
-- Birthday
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton = CreateFrame("CheckButton", "GRM_BirthdayToggleButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton:CreateFontString("GRM_ReputationToggleButtonText", "OVERLAY", "GameFontNormalSmall");
-- Display options
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterPromotionChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:CreateFontString("GRM_RosterPromotionChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterDemotionChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:CreateFontString("GRM_RosterDemotionChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterLeveledChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:CreateFontString("GRM_RosterLeveledChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterNoteChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:CreateFontString("GRM_RosterNoteChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterOfficerNoteChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:CreateFontString("GRM_RosterOfficerNoteChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterCustomNoteChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:CreateFontString("GRM_RosterOfficerNoteChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton = CreateFrame("CheckButton", "GRM_RosterJoinedCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:CreateFontString("GRM_RosterJoinedCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton = CreateFrame("CheckButton", "GRM_RosterLeftGuildCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:CreateFontString("GRM_RosterLeftGuildCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton = CreateFrame("CheckButton", "GRM_RosterInactiveReturnCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:CreateFontString("GRM_RosterInactiveReturnCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton = CreateFrame("CheckButton", "GRM_RosterNameChangeCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:CreateFontString("GRM_RosterNameChangeCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton = CreateFrame("CheckButton", "GRM_RosterEventCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:CreateFontString("GRM_RosterEventCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton = CreateFrame("CheckButton", "GRM_RosterRankRenameCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:CreateFontString("GRM_RosterRankRenameCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton = CreateFrame("CheckButton", "GRM_RosterRecommendationsButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:CreateFontString("GRM_RosterRecommendationsButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton = CreateFrame("CheckButton", "GRM_RosterBannedPlayersButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:CreateFontString("GRM_RosterBannedPlayersButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButton = CreateFrame("CheckButton", "GRM_RosterCheckAllLogButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButton:CreateFontString("GRM_RosterCheckAllLogButtonText", "OVERLAY", "GameFontNormalSmall");

-- CHAT BOX CONFIRM CHECKBOXES
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton = CreateFrame("CheckButton", "GRM_RosterJoinedChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton = CreateFrame("CheckButton", "GRM_RosterLeveledChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton = CreateFrame("CheckButton", "GRM_RosterInactiveReturnChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton = CreateFrame("CheckButton", "GRM_RosterPromotionChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton = CreateFrame("CheckButton", "GRM_RosterDemotionChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton = CreateFrame("CheckButton", "GRM_RosterNoteChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton = CreateFrame("CheckButton", "GRM_RosterCustomNoteChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton = CreateFrame("CheckButton", "GRM_RosterOfficerNoteChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton = CreateFrame("CheckButton", "GRM_RosterNameChangeChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton = CreateFrame("CheckButton", "GRM_RosterRankRenameChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton = CreateFrame("CheckButton", "GRM_RosterEventChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton = CreateFrame("CheckButton", "GRM_RosterLeftGuildChatCheckButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton = CreateFrame("CheckButton", "GRM_RosterRecommendationsChatButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton = CreateFrame("CheckButton", "GRM_RosterBannedPlayersButtonChatButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCheckAllChatButton = CreateFrame("CheckButton", "GRM_RosterCheckAllChatButton", GRM_UI.GRM_RosterCheckBoxSideFrame, "OptionsSmallCheckButtonTemplate");
-- Fontstrings for side frame
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_TitleSideFrameText = GRM_UI.GRM_RosterCheckBoxSideFrame:CreateFontString("GRM_TitleSideFrameText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnLogSideFrameText = GRM_UI.GRM_RosterCheckBoxSideFrame:CreateFontString("GRM_ShowOnLogSideFrameText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnChatSideFrameText = GRM_UI.GRM_RosterCheckBoxSideFrame:CreateFontString("GRM_ShowOnChatSideFrameText", "OVERLAY", "GameFontNormalSmall");

-- SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame = CreateFrame("ScrollFrame", "GRM_RosterChangeLogScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollBorderFrame = CreateFrame("Frame", "GRM_RosterChangeLogScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "TranslucentFrameTemplate");
-- CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollChildFrame = CreateFrame("Frame", "GRM_RosterChangeLogScrollChildFrame");
-- SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider = CreateFrame("Slider", "GRM_RosterChangeLogScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider.MaxValue = 0;
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider.ScrollCount = 50;
-- BUTTONS -- NO LONGER NECESSARY WHEN MINIMAP BUTTON IS CREATED
GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton = CreateFrame( "Button", "GRM_LoadLogButton", GuildRosterFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:CreateFontString("GRM_LoadLogButtonText", "OVERLAY", "GameFontWhiteTiny");
-- TITTLE
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:CreateFontString("GRM_RosterChangeLogFrameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:CreateFontString("GRM_RosterChangeLogFrameNumEntriesText", "OVERLAY", "GameFontNormal");
-- Edit Box
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox = CreateFrame( "EditBox", "GRM_LogEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame);

-- OPTIONS PANEL BUTTONS(in the Roster Log Frame)
-- CORE ADDON OPTIONS CONTROLS LISTED HERE!
-- BACKUP OPTIONS
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox = CreateFrame("CheckButton", "GRM_AutoBackupCheckBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:CreateFontString("GRM_MemoryUsageText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:CreateFontString("DaysOnAutoBackupText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:CreateFontString("DaysOnAutoBackupText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame = CreateFrame("ScrollFrame", "GRM_CoreBackupScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame = CreateFrame("Frame", "GRM_CoreBackupScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox = CreateFrame( "EditBox", "GRM_AutoBackupTimeEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote = CreateFrame("Frame", "GRM_AutoBackupTimeOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:CreateFontString("GRM_AutoBackupTimeOverlayNoteText", "OVERLAY", "GameFontNormalSmall");

-- CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame = CreateFrame("Frame", "GRM_CoreBackupScrollChildFrame");
-- SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider = CreateFrame("Slider", "GRM_CoreBackupScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CreationDateText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:CreateFontString("GRM_CreationDateText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNumMembersText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:CreateFontString("GRM_GuildNumMembersText", "OVERLAY", "GameFontNormal");
-- Tooltip and custom Right-Click frame on Backup window in options...
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip = CreateFrame("GameTooltip", "GRM_GuildNameTooltip", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "GameTooltipTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption = CreateFrame("Frame", "GRM_BackupPurgeGuildOption", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton = CreateFrame("Button", "GRM_BackupPurgeGuildOptionButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton:CreateFontString("GRM_BackupPurgeGuildOptionText", "OVERLAY", "GameFontWhiteTiny");

-- Options Panel Checkboxes
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton = CreateFrame("CheckButton", "GRM_RosterAddTimestampCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:CreateFontString("GRM_RosterAddTimestampCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:CreateFontString("GRM_RosterAddTimestampCheckButtonText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:CreateFontString("GRM_RosterAddTimestampCheckButtonText3", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1 = CreateFrame("CheckButton", "GRM_RosterAddTimestampRadioButton1", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "UIRadioButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2 = CreateFrame("CheckButton", "GRM_RosterAddTimestampRadioButton2", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "UIRadioButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3 = CreateFrame("CheckButton", "GRM_RosterAddTimestampRadioButton3", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "UIRadioButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton = CreateFrame("CheckButton", "GRM_AddJoinedTagButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:CreateFontString("GRM_AddJoinedTagButtonText", "OVERLAY", "GameFontNormalSmall");
--OPTIONS PANEL FONTSTRING DESCRIPTION ON OPTIONS CONTROLS
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsHeaderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsHeaderText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsHeaderText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:CreateFontString("GRM_SyncOptionsFrame.OptionsSyncHeaderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:CreateFontString("GRM_GeneralOptionsFrameText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsRankRestrictHeaderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsScanDetailsText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_OptionsFrame.OptionsSlashCommandText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:CreateFontString("OptionsUnifySettingsHeaderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:CreateFontString("GRM_OptionsUXText", "OVERLAY", "GameFontNormal");
--SLASH COMMAND FONTSTRINGS
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText4 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText4", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText5 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText5", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText6 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText6", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText7 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText7", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText8 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText8", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText9 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText9", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText10 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText10", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText11 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:CreateFontString("GRM_SlashCommandText11", "OVERLAY", "GameFontNormal");
-- Kick Recommendation Options
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton = CreateFrame("CheckButton", "GRM_RosterRecommendKickCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:CreateFontString("GRM_RosterRecommendKickCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:CreateFontString("GRM_RosterRecommendKickCheckButtonText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox = CreateFrame( "EditBox", "GRM_RosterKickRecommendEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote = CreateFrame("Frame", "GRM_RosterKickOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:CreateFontString("GRM_RosterKickOverlayNoteText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed = CreateFrame("CheckButton", "GRM_AllAltsOfflineTimed", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:CreateFontString("GRM_AllAltsOfflineTimedText", "OVERLAY", "GameFontNormalSmall");


-- Time Interval to Check for Changes
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton = CreateFrame("CheckButton", "GRM_RosterTimeIntervalCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:CreateFontString("GRM_RosterTimeIntervalCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:CreateFontString("GRM_RosterTimeIntervalCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox = CreateFrame( "EditBox", "GRM_RosterTimeIntervalEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote = CreateFrame("Frame", "GRM_RosterTimeIntervalOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:CreateFontString("GRM_RosterTimeIntervalOverlayNoteText", "OVERLAY", "GameFontNormalSmall");
-- Report Inactive Options
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton = CreateFrame("CheckButton", "GRM_RosterReportInactiveReturnButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton:CreateFontString("GRM_RosterReportInactiveReturnButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton:CreateFontString("GRM_RosterReportInactiveReturnButtonText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton = CreateFrame("CheckButton", "GRM_ReportInactivesOnlyIfAllButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:CreateFontString("GRM_ReportInactivesOnlyIfAllButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox = CreateFrame( "EditBox", "GRM_ReportInactiveReturnEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote = CreateFrame("Frame", "GRM_ReportInactiveReturnOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:CreateFontString("GRM_ReportInactiveReturnOverlayNoteText", "OVERLAY", "GameFontNormalSmall");
-- Report Upcoming Events
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton = CreateFrame("CheckButton", "GRM_RosterReportUpcomingEventsCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:CreateFontString("GRM_RosterReportUpcomingEventsCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:CreateFontString("GRM_RosterReportUpcomingEventsCheckButtonText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox = CreateFrame( "EditBox", "GRM_RosterReportUpcomingEventsEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote = CreateFrame("Frame", "GRM_RosterReportUpcomingEventsOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:CreateFontString("GRM_RosterReportUpcomingEventsOverlayNoteText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton = CreateFrame("CheckButton", "GRM_RosterReportAddEventsToCalendarButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:CreateFontString("GRM_RosterReportAddEventsToCalendarButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:CreateFontString("GRM_UnifySettingsCoreText", "OVERLAY", "GameFontNormalSmall");
-- Share changes with ONLINE guildies
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton = CreateFrame("CheckButton", "GRM_RosterSyncCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:CreateFontString("GRM_RosterSyncCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:CreateFontString("GRM_RosterSyncCheckButtonText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton = CreateFrame("CheckButton", "GRM_RosterNotifyOnChangesCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:CreateFontString("GRM_RosterSyncCheckButtonText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton = CreateFrame("CheckButton", "GRM_SyncAllRestrictReceiveButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:CreateFontString("GRM_SyncAllRestrictReceiveButtonText", "OVERLAY", "GameFontNormalSmall");
-- Options RankDropDown
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected = CreateFrame("Frame", "GRM_RosterSyncRankDropDownSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:CreateFontString("GRM_RosterSyncRankDropDownSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu = CreateFrame("Frame", "GRM_RosterSyncRankDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected, "InsetFrameTemplate");

-- SYNC with players with outdated versions
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton = CreateFrame("CheckButton", "GRM_SyncOnlyCurrentVersionCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton:CreateFontString("GRM_SyncOnlyCurrentVersionCheckButtonText", "OVERLAY", "GameFontNormalSmall");

-- SYNC with players ban lists
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList = CreateFrame("CheckButton", "GRM_RosterSyncBanList", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:CreateFontString("GRM_RosterSyncBanListText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:CreateFontString("GRM_RosterSyncBanListText3", "OVERLAY", "GameFontNormalSmall");

-- Birthday sync with players
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox = CreateFrame("CheckButton", "GRM_BDaySyncCheckBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:CreateFontString("GRM_BDaySyncCheckBoxText", "OVERLAY", "GameFontNormalSmall");

-- Custom Note Sync option
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox = CreateFrame("CheckButton", "GRM_CustomNoteSyncCheckBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:CreateFontString("GRM_RosterSyncBanListText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:CreateFontString("GRM_DefaultCustomRankText", "Overlay", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:CreateFontString("GRM_DefaultCustomRankText2", "Overlay", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected = CreateFrame("Frame", "GRM_DefaultCustomSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:CreateFontString("GRM_DefaultCustomSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu = CreateFrame("Frame", "GRM_DefaultCustomRankDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected, "InsetFrameTemplate");

GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton = CreateFrame("Button", "GRM_CustomRankResetButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:CreateFontString("GRM_CustomRankResetButtonText", "OVERLAY", "GameFontWhiteTiny");

-- Options Sync Ban List Drop Down
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected = CreateFrame("Frame", "GRM_RosterBanListDropDownSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:CreateFontString("GRM_RosterBanListDropDownSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu = CreateFrame("Frame", "GRM_RosterBanListDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected, "InsetFrameTemplate");

-- Options Scan Announce events for Main only
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton = CreateFrame("CheckButton", "GRM_RosterMainOnlyCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:CreateFontString("GRM_RosterMainOnlyCheckButtonText", "OVERLAY", "GameFontNormalSmall");

-- Show officer and public notes in the log when a player leaves the guild
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton = CreateFrame("CheckButton", "GRM_ShowNotesOnLeavingPlayerButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton:CreateFontString("GRM_ShowNotesOnLeavingPlayerButtonText", "OVERLAY", "GameFontNormalSmall");

-- Level filters

-- Minimum level to scan
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox = CreateFrame("EditBox", "GRM_RosterMinLvlEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote = CreateFrame("Frame", "GRM_RosterMinLvlOverlayNote", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:CreateFontString("GRM_RosterMinLvlOverlayNoteText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton = CreateFrame("CheckButton", "GRM_LevelRecordButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton:CreateFontString("GRM_MinLevelText", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:CreateFontString("GRM_MinLevelText2", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:CreateFontString("GRM_MinLevelText3", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:CreateFontString("GRM_LevelRange", "OVERLAY", "GameFontNormalSmall");

GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button = CreateFrame("CheckButton", "GRM_LevelFilter1Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button:CreateFontString("GRM_LevelFilter1Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button = CreateFrame("CheckButton", "GRM_LevelFilter2Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:CreateFontString("GRM_LevelFilter2Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button = CreateFrame("CheckButton", "GRM_LevelFilter3Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:CreateFontString("GRM_LevelFilter3Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button = CreateFrame("CheckButton", "GRM_LevelFilter4Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:CreateFontString("GRM_LevelFilter4Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button = CreateFrame("CheckButton", "GRM_LevelFilter5Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:CreateFontString("GRM_LevelFilter5Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button = CreateFrame("CheckButton", "GRM_LevelFilter6Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:CreateFontString("GRM_LevelFilter6Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button = CreateFrame("CheckButton", "GRM_LevelFilter7Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:CreateFontString("GRM_LevelFilter7Text", "OVERLAY", "GameFontNormalSmall");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button = CreateFrame("CheckButton", "GRM_LevelFilter8Button", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:CreateFontString("GRM_LevelFilter8Text", "OVERLAY", "GameFontNormalSmall");

-- Option to notify when players request to join
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton = CreateFrame("CheckButton", "GRM_RecruitNotificationCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:CreateFontString("GRM_RecruitNotificationCheckButtonText", "OVERLAY", "GameFontNormalSmall");
-- Option to auto popup the recruit window
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton= CreateFrame("CheckButton", "GRM_RecruitNotificationAutoPopButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:CreateFontString("GRM_RecruitNotificationAutoPopButtonText", "OVERLAY", "GameFontNormalSmall");
-- Slash command Buttons in Options
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton = CreateFrame("Button", "GRM_ScanOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton = CreateFrame("Button", "GRM_SyncOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton = CreateFrame("Button", "GRM_CenterOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton = CreateFrame("Button", "GRM_HelpOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton = CreateFrame("Button", "GRM_ClearAllOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton = CreateFrame("Button", "GRM_ClearGuildOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton = CreateFrame("Button", "GRM_VersionOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton = CreateFrame("Button", "GRM_HardResetButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, "UIPanelButtonTemplate");

-- Reset Defaults Button
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton = CreateFrame("Button", "GRM_ResetDefaultOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:CreateFontString("GRM_ResetDefaultOptionsButtonText", "OVERLAY", "GameFontWhiteTiny");

-- SYNC speed slider
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider = CreateFrame("Slider", "GRM_SyncSpeedSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, "OptionsSliderTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:CreateFontString("GRM_SyncSpeedSliderText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:CreateFontString("GRM_SyncSpeedSliderText2", "OVERLAY", "GameFontWhiteTiny");

-- OPTIONS font size slider
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider = CreateFrame("Slider", "GRM_FontSizeSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSliderTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:CreateFontString("GRM_FontSizeSliderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:CreateFontString("GRM_FontSizeSliderText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:CreateFontString("GRM_FontSizeSliderText3", "OVERLAY", "GameFontNormal");

-- OPTIONS font size slider
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider = CreateFrame("Slider", "GRM_TooltipScaleSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, "OptionsSliderTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:CreateFontString("GRM_TooltipScaleSliderText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:CreateFontString("GRM_TooltipScaleSliderText2", "OVERLAY", "GameFontNormal");

-- Guild Event Log Frame Confirm Details.
GRM_UI.GRM_RosterConfirmFrame = CreateFrame("Frame", "GRM_RosterConfirmFrame", UIPanel, "BasicFrameTemplate");
GRM_UI.GRM_RosterConfirmFrameText = GRM_UI.GRM_RosterConfirmFrame:CreateFontString("GRM_RosterConfirmFrameText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterConfirmYesButton = CreateFrame("Button", "GRM_RosterConfirmYesButton", GRM_UI.GRM_RosterConfirmFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterConfirmYesButtonText = GRM_UI.GRM_RosterConfirmYesButton:CreateFontString("GRM_RosterConfirmYesButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterConfirmCancelButton = CreateFrame("Button", "GRM_RosterConfirmCancelButton", GRM_UI.GRM_RosterConfirmFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterConfirmCancelButtonText = GRM_UI.GRM_RosterConfirmCancelButton:CreateFontString("GRM_RosterConfirmCancelButtonText", "OVERLAY", "GameFontWhiteTiny");

-- ADDON USERS FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:CreateFontString("GRM_AddonUsersCoreFrameText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:CreateFontString("GRM_AddonUsersCoreFrameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:CreateFontString("GRM_AddonUsersCoreFrameTitleText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:CreateFontString("GRM_AddonUsersCoreFrameTitleText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:CreateFontString("GRM_AddonUsersSyncEnabledText", "OVERLAY", "GameFontNormal");

-- SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame = CreateFrame("ScrollFrame", "GRM_AddonUsersScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame = CreateFrame("Frame", "GRM_AddonUsersScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, "TranslucentFrameTemplate");
-- CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame = CreateFrame("Frame", "GRM_AddonUsersScrollChildFrame");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame.GRM_AddonUsersCoreFrameTitleText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame:CreateFontString("GRM_AddonUsersCoreFrameTitleText2", "OVERLAY", "GameFontNormal");
-- SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider = CreateFrame("Slider", "GRM_AddonUsersScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame, "UIPanelScrollBarTemplate");
--TOOLTIP
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersTooltip = CreateFrame("GameTooltip", "GRM_AddonUsersTooltip", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, "GameTooltipTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersTooltip:Hide();

-- CORE BANLIST FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameTitleText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameTitleText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText4 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameTitleText4", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameSelectedNameText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameNumBannedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:CreateFontString("GRM_CoreBanListFrameNumBannedText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameNumBannedText:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:Hide();

-- BANLIST SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame = CreateFrame("ScrollFrame", "GRM_CoreBanListScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame:CreateFontString("GRM_CoreBanListFrameAllOfflineText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame = CreateFrame("Frame", "GRM_CoreBanListScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "TranslucentFrameTemplate");
-- BANLIST CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollChildFrame = CreateFrame("Frame", "GRM_CoreBanListScrollChildFrame");
-- BANLIST SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider = CreateFrame("Slider", "GRM_CoreBanListScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "UIPanelScrollBarTemplate");
-- Add and Remove BUTTONS
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton = CreateFrame("Button", "GRM_BanListRemoveButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton:CreateFontString("GRM_BanListRemoveButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton = CreateFrame("Button", "GRM_BanListAddButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton:CreateFontString("GRM_BanListAddButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton = CreateFrame("Button", "GRM_BanListEditButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton:CreateFontString("GRM_BanListEditButtonText", "OVERLAY", "GameFontWhiteTiny");
-- Add player ban window
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame = CreateFrame( "Frame", "GRM_AddBanFrame", UIPanel, "BasicFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_AddBanTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_CompleteBanEntryText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_CompleteBanEntryText2", "OVERLAY", "GameFontNormal");

GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_AddBanNameSelectionWarningText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_AddBanNameSelectionWarningText2", "OVERLAY", "GameFontWhiteTiny");
-- Name selection to add ban
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox = CreateFrame( "EditBox", "GRM_AddBanNameSelectionEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "InputBoxTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:CreateFontString("GRM_AddBanNameSelectionText", "OVERLAY", "GameFontNormal");
-- Server selection to add ban
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanServerSelectionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:CreateFontString("GRM_AddBanServerSelectionText", "OVERLAY", "GameFontNormal");
-- Ban player's server selection
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected = CreateFrame("Frame", "GRM_BanServerSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:CreateFontString("GRM_BanServerSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu = CreateFrame("Frame", "GRM_BanServerDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected, "InsetFrameTemplate");
-- Reason for the ban
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox = CreateFrame( "EditBox", "GRM_AddBanReasonEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:CreateFontString("GRM_AddBanReasonEditBoxText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame = CreateFrame("Frame", "GRM_AddBanReasonEditBoxFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame);
-- Add Ban CLASS selection dropdown
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanClassSelectionText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:CreateFontString("GRM_AddBanClassSelectionText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected = CreateFrame("Frame", "GRM_AddBanDropDownClassSelected", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "InsetFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:CreateFontString("GRM_AddBanDropDownClassSelectedText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu = CreateFrame("Frame", "GRM_AddBanDropDownMenu", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected, "InsetFrameTemplate");
-- Submit button
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton = CreateFrame("Button", "GRM_AddBanConfirmButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton:CreateFontString("GRM_AddBanConfirmButtonText", "OVERLAY", "GameFontWhiteTiny");
-- ADD BAN MEMBER CONFIRM FRAME UNIQUE
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame = CreateFrame("Frame", "GRM_PopupWindowConfirmFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:CreateFontString("GRM_PopupWindowConfirmFrameText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:CreateFontString("GRM_PopupWindowConfirmFrameText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton = CreateFrame("Button", "GRM_PopupWindowConfirmFrameYesButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton:CreateFontString("GRM_PopupWindowConfirmFrameYesButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton = CreateFrame("Button", "GRM_PopupWindowConfirmFrameCancelButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton:CreateFontString("GRM_PopupWindowConfirmFrameCancelButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox = CreateFrame("CheckButton", "GRM_BanAllAltsCheckbox", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, "OptionsSmallCheckButtonTemplate")
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:CreateFontString("GRM_BanAllAltsCheckboxText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:CreateFontString("GRM_ReasonCountText", "OVERLAY", "GameFontNormal");

GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame = CreateFrame("ScrollFrame", "GRM_AddBanScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollChildFrame = CreateFrame("Frame", "GRM_AddBanScrollChildFrame");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider = CreateFrame("Slider", "GRM_AddBanScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:CreateFontString("GRM_BanFrameHelperText", "OVERLAY", "GameFontWhiteTiny");
-- Ban Tooltips
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanHeaderTooltip = CreateFrame("GameTooltip", "GRM_BanHeaderTooltip", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "GameTooltipTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanHeaderTooltip:Hide();

-- AUDIT FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameTitleText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameTitleText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText1 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText1", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText3", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText4", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText5 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText5", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText6", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText7", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8 = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:CreateFontString("GRM_AuditFrameText8", "OVERLAY", "GameFontNormal");
-- AUDIT FRAME SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame = CreateFrame("ScrollFrame", "GRM_AuditScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame);
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame = CreateFrame("Frame", "GRM_AuditScrollBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "TranslucentFrameTemplate");
-- BANLIST CONTENT FRAME (Child Frame)
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollChildFrame = CreateFrame("Frame", "GRM_AuditScrollChildFrame");
-- BANLIST SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider = CreateFrame("Slider", "GRM_AuditScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider.MaxValue = 0;
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider.ScrollCount = 51;
-- CHECKBOXES
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox = CreateFrame("CheckButton", "GRM_AuditFrameShowAllCheckbox", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox:CreateFontString("GRM_AudtFrameCheckBoxText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox = CreateFrame("CheckButton", "GRM_AuditFrameIncludeUnknownCheckBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox:CreateFontString("GRM_AuditFrameIncludeUnknownCheckBoxText", "OVERLAY", "GameFontNormal");
-- BUTTONS
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton = CreateFrame("Button", "GRM_SetJoinUnkownButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton:CreateFontString("GRM_SetJoinUnkownButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton = CreateFrame("Button", "GRM_SetPromoUnkownButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton:CreateFontString("GRM_SetJoinUnkownButtonText", "OVERLAY", "GameFontWhiteTiny");

-- MINIMAP BUTTON
GRM_UI.GRM_MinimapButton = CreateFrame("Button", "GRM_MinimapButton", Minimap);
GRM_UI.GRM_MinimapButton.GRM_MinimapButtonIcon = GRM_UI.GRM_MinimapButton:CreateTexture("GRM_MinimapButtonIcon", "BORDER");
GRM_UI.GRM_MinimapButton.GRM_MinimapButtonBorder = GRM_UI.GRM_MinimapButton:CreateTexture("GRM_MinimapButtonBorder", "OVERLAY");

-- LOG EXPORT AND TOOLS
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame = CreateFrame("Frame", "GRM_ExportLogBorderFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_BorderFrameCloseButton = CreateFrame("Button", "GRM_BorderFrameCloseButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame, "UIPanelCloseButton");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLogText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:CreateFontString("GRM_ExportLogText", "OVERLYA", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox = CreateFrame("EditBox", "GRM_ExportLogFrameEditBox", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame);
-- SCROLL FRAME
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame = CreateFrame("ScrollFrame", "GRM_ExportLogScrollFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame);
-- CONTENT FRAME (Child Frame)
-- SLIDER
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider = CreateFrame("Slider", "GRM_ExportLogScrollFrameSlider", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLoadingText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:CreateFontString("GRM_ExportLoadingText", "OVERLAY", "GameFontNormal");

-- Log Frame OPTIONS BOX
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame = CreateFrame("Frame", "GRM_LogExtraOptionsFrame", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "TranslucentFrameTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton = CreateFrame("Button", "GRM_LogExtraOptionsButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton:CreateFontString("GRM_LogExtraOptionsButtonText", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton, "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton = CreateFrame("Button", "GRM_LogExportButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton.GRM_ExportButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton:CreateFontString("GRM_ExportButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton = CreateFrame("CheckButton", "GRM_LogShowLinesCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:CreateFontString("GRM_LogShowLinesCheckButtonText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton = CreateFrame("CheckButton", "GRM_SearchAutoFocusCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:CreateFontString("GRM_SearchAutoFocusCheckButtonText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton = CreateFrame("CheckButton", "GRM_LogEnableRmvClickCheckButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "OptionsSmallCheckButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton:CreateFontString("GRM_LogEnableRmvClickCheckButtonText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText1 = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:CreateFontString("GRM_LogExtraText1", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText2 = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:CreateFontString("GRM_LogExtraText2", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton = CreateFrame("Button", "GRM_ConfirmClearButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton.GRM_ConfirmClearButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton:CreateFontString("GRM_ConfirmClearButtonText", "OVERLAY", "GameFontWhiteTiny");
-- Clear Log Button
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton = CreateFrame( "Button", "GRM_RosterClearLogButton", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "UIPanelButtonTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButtonText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton:CreateFontString("GRM_RosterClearLogButtonText", "OVERLAY", "GameFontWhiteTiny");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1 = CreateFrame("EditBox", "GRM_LogExtraEditBox1", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "InputBoxTemplate");
GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2 = CreateFrame("EditBox", "GRM_LogExtraEditBox2", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "InputBoxTemplate");

-- MISC UI EVENTS TEXT
GRM_UI.GRM_GroupInfo = CreateFrame("Frame");
GRM_UI.GRM_GroupInfo.InvisFontStringWidthCheck = GRM_UI.GRM_GroupInfo:CreateFontString("InvisFontStringWidthCheck");
GRM_UI.GRM_GroupInfo.GRM_NumGuildiesText = GRM_UI.GRM_GroupInfo:CreateFontString("GRM_NumGuildiesText", "OVERLAY", "GameFontNormalSmall");

-- MOUSEOVER alt grouping window...
-- AUDIT FRAME SCROLL FRAME
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame = CreateFrame("Frame", "GRM_AltGroupingScrollBorderFrame", UIPanel, "TranslucentFrameTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameTitle = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingScrollBorderFrameTitle", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameCloseButton = CreateFrame( "Button", "GRM_AltGroupingScrollBorderFrameCloseButton", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "UIPanelCloseButton");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame = CreateFrame("ScrollFrame", "GRM_AltGroupingScrollFrame", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame);
-- BANLIST CONTENT FRAME (Child Frame)
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame = CreateFrame("Frame", "GRM_AltGroupingScrollChildFrame");
-- BANLIST SLIDER
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider = CreateFrame("Slider", "GRM_AltGroupingScrollFrameSlider", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame, "UIPanelScrollBarTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_MainTag = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame:CreateFontString("GRM_MainTag", "OVERLAY", "GameFontWhiteTiny");
-- Fontstrings
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingName = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingName", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingLevel", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingRank", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingMain = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingMain", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline = GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:CreateFontString("GRM_AltGroupingLastOnline", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupHeaderTooltip = CreateFrame("GameTooltip", "GRM_AltGroupHeaderTooltip", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupHeaderTooltip:Hide();

-- Tooltip
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip = CreateFrame("GameTooltip", "GRM_AltGroupingTooltip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:Hide();
GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayTooltip = CreateFrame("GameTooltip", "GRM_BirthdayTooltip", GRM_UI.GRM_MemberDetailMetaData, "GameTooltipTemplate");
GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayTooltip:Hide();


-- General use popup for any feature of the addon, just rebuild the script handlers each time.
GRM_UI.GRM_GeneralPopupWindow = CreateFrame("Frame", "GRM_GeneralPopupWindow", UIPanel, "TranslucentFrameTemplate");
GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText = GRM_UI.GRM_GeneralPopupWindow:CreateFontString("GRM_GeneralPopupWindowText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton = CreateFrame("Button", "GRM_GeneralPopupWindowYesButton", GRM_UI.GRM_GeneralPopupWindow, "UIPanelButtonTemplate");
GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButtonText = GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton:CreateFontString("GRM_GeneralPopupWindowYesButtonText", "OVERLAY", "GameFontNormal");
GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton = CreateFrame("Button", "GRM_GeneralPopupWindowNoButton", GRM_UI.GRM_GeneralPopupWindow, "UIPanelButtonTemplate");
GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButtonText = GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton:CreateFontString("GRM_GeneralPopupWindowNoButtonText", "OVERLAY", "GameFontNormal");


--------------------------------------
--- INITIALIZING COMPLETED -----------
--------------------------------------

-- GRM_UI LOCAL GLOBALS
local AllClasses = { "Deathknight", "Demonhunter", "Druid", "Hunter", "Mage", "Monk", "Paladin", "Priest", "Rogue", "Shaman", "Warlock", "Warrior" };

-----------------------------------------------
--------- UI CONTROLS -------------------------
--------- AND PARAMETERS ----------------------
-----------------------------------------------

-- Frame modifications
GRM_UI.SetDynamicWidth = function(fontstring, spacingOnEachSide)
    local result = -1;
    if fontstring ~= nil and fontstring:GetObjectType() == "FontString" then
        result = fontstring:GetWidth() +(spacingOnEachSide * 2);
    end
    return result; 
end

-- Frame modification to scale a fontstring down.
GRM_UI.ScaleFontStringToObjectSize = function(isWidth, size, fontstring, spacingOnEachSide)
    local spacing = spacingOnEachSide * 2;
    local _, currentFontSize = fontstring:GetFont();
    
    if isWidth then
        while fontstring:GetWidth() + spacing > size do
            currentFontSize = currentFontSize - 1;
            fontstring:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + currentFontSize);
        end
    else
        while fontstring:GetStringHeight() + spacing > size do
            currentFontSize = currentFontSize - 1;
            fontstring:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + currentFontSize);        
        end
    end
end

-- Method:          GRM_UI.ReloadAllFrames()
-- What it Does:    Reloads all of the frames in case there have been modifications to them, in one big batch, like if the language was changed.
-- Purpose:         Management of UI text and font formatting and localization controls.
GRM_UI.ReloadAllFrames = function( isManualUpdate)
    if not isManualUpdate then
        GRM_UI.PreAddonLoadUI();
    end
    GRM_UI.MetaDataInitializeUIrosterLog1( isManualUpdate);
    GRM_UI.MetaDataInitializeUIrosterLog2();
    if GRM_G.FramesInitialized then
        GRM_UI.GR_MetaDataInitializeUIFirst( isManualUpdate);
        GRM_UI.GR_MetaDataInitializeUISecond( isManualUpdate);
        GRM_UI.GR_MetaDataInitializeUIThird( isManualUpdate);
    end
    if GuildRosterFrame  and GuildMemberDetailFrame and GuildMemberDetailFrame:IsVisible() then
        GuildMemberDetailFrame:Hide();
    end
    if GRM_UI.GRM_MemberDetailMetaData and GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
        GRM.PopulateMemberDetails(GRM_G.currentName);
    end
    if GRM_UI.GRM_RosterChangeLogFrame:IsVisible() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:Click();
    end
end

-------------------------------------
------- VARIOUS UI CONTROLS ---------
-------------------------------------

-- Method:          GRM_UI.SetTooltipScale()
-- What it Does:    Stores the current gametooltip scale, changes it to the save value. Default value is 0.9
-- Purpose:         So the addon can have customizable tooltip sizing, without overriding default values. It restores when finished.
GRM_UI.SetTooltipScale = function()
    GRM_G.toolTipScale = GameTooltip:GetScale();
    GameTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50]);
end

-- Method:          GRM_UI.RestoreTooltipScale()
-- What it Does:    Restores the tooltip
-- Purpose:         Maintain UI scaling to just be a feature of this addon.
GRM_UI.RestoreTooltipScale = function()
    GameTooltip:SetScale(GRM_G.toolTipScale);
end

-- Method:          GRM_UI.NewTooltipScale
-- What it Does:    It resets the scale to the new value of all the custom tooltips
-- Purpose:         Tooltip scaling functionality
GRM_UI.NewTooltipScale = function()
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankToolTip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] + 0.05);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] + 0.05);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailServerNameToolTip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNotifyStatusChangeTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNJDSyncTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] + 0.05);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupHeaderTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanHeaderTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] + 0.05);
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.15)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersTooltip:SetScale(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] + 0.05);
end


-----------------------------------------------
---------- CORE RELOAD AND VALUE CONTROLS -----
-----------------------------------------------


-- Method:          GR_MetaDataInitializeUIFirst( boolean)
-- What it Does:    Initializes "some of the frames" for an on-demand use... preserves heavy loading on login and only loads as necessary.
-- Purpose:         Should only initialize as needed. Kept as local for speed
GRM_UI.GR_MetaDataInitializeUIFirst = function( isManualUpdate)
    
    -- Frame Control
    GRM_UI.GRM_MemberDetailMetaData:EnableMouse(true);
    GRM_UI.GRM_MemberDetailMetaData:SetToplevel(true);

    -- Placement and Dimensions
    GRM_UI.GRM_MemberDetailMetaData:SetPoint("TOPLEFT", GuildRosterFrame, "TOPRIGHT", 1, 5) -- 22.5, 5);
    GRM_UI.GRM_MemberDetailMetaData:SetSize( 300, 330);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaDataCloseButton:SetPoint( "TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData, 3, 3); 
    
    GRM_UI.GRM_MemberDetailMetaData:SetScript("OnUpdate", GRM.MemberDetailToolTips);

    -- Logic handling: If pause is set, this unpauses it. If it is not paused, this will then hide the window.
    GRM_UI.GRM_MemberDetailMetaData:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_MemberDetailMetaData:SetPropagateKeyboardInput(true);
        if key == "ESCAPE" then
            GRM_UI.GRM_MemberDetailMetaData:SetPropagateKeyboardInput(false);
            if not GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                if GRM_G.pause then
                    GRM_G.pause = false;
                else
                    GRM_UI.GRM_MemberDetailMetaData:Hide();
                end
            else
                GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
            end
        end
    end);

    -- For Fontstring logic handling, particularly of the alts.
    GRM_UI.GRM_MemberDetailMetaData:SetScript("OnMouseDown", function(_, button) 
        if button == "RightButton" then
            GRM_G.selectedAlt = GRM.GetCoreFontStringClicked(); -- Setting to global the alt name chosen.
            if GRM_G.selectedAlt[1] ~= nil then
                if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:IsMouseOver(2, -2, -2, 2) and not GRM.PlayerHasAltsOrIsMain(GRM_G.currentName) then
                    -- DO nothing... as no alts are register.
                else
                    GRM_G.pause = true;
                end

                -- Positioning
                if not GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:IsMouseOver(2, -2, -2, 2) then
                    local cursorX, cursorY = GetCursorPosition();
                    GRM_UI.GRM_altDropDownOptions:ClearAllPoints();
                    GRM_UI.GRM_altDropDownOptions:SetPoint( "TOPLEFT", UIParent, "BOTTOMLEFT", cursorX, cursorY);
                    GRM_UI.GRM_altOptionsText:SetText(GRM.SlimName(GRM_G.selectedAlt[2]));

                    GRM_UI.GRM_altSetMainButton:SetPoint ("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -22);
                    GRM_UI.GRM_altSetMainButton:SetSize(60, 20);
                    GRM_UI.GRM_altRemoveButton:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -36);
                    GRM_UI.GRM_altRemoveButton:SetSize(60, 20);
                    GRM_UI.GRM_altOptionsDividerText:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -55);
                    GRM_UI.GRM_altOptionsDividerText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
                    GRM_UI.GRM_altOptionsDividerText:SetText ("__");
                    GRM_UI.GRM_altFrameCancelButton:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -65);
                    GRM_UI.GRM_altFrameCancelButton:SetSize(60, 20);
                    GRM_UI.GRM_altFrameCancelButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
                    
                    if GRM_G.selectedAlt[1] == GRM_G.selectedAlt[2] then -- Clicking current focus player's own details, not an alt.
                        -- Configure which fontstring we are over.
                        GRM.ConfigureRightClickPlayerWindow();
                        -- Let's hide the tooltips just in case...
                        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankToolTip:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailServerNameToolTip:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNotifyStatusChangeTooltip:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayTooltip:Hide();

                        if GRM_G.editFocusPlayer then
                            if GRM_G.selectedAlt[3] ~= true then    -- player is not the main.
                                GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Set as Main"));
                            else -- player IS the main... place option to Demote From Main rahter than set as main.
                                GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Set as Alt"));
                            end
                            GRM_UI.GRM_altRemoveButtonText:SetText(GRM.L("Reset Data!"));
                            GRM_UI.GRM_altRemoveButton:Show();
                        elseif GRM_G.editStatusNotify then
                            GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Notify When Player is Active"));
                            GRM_UI.GRM_altRemoveButtonText:SetText(GRM.L("Notify When Player Goes Offline"));
                            GRM_UI.GRM_altRemoveButton:SetSize(120, 20);
                            GRM_UI.GRM_altSetMainButton:SetSize(120, 20);
                            GRM_UI.GRM_altRemoveButton:Show();
                        elseif GRM_G.editOnlineStatus  then
                            if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:GetText() == GRM.L("( Active )") then
                                GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Notify When Player Goes Offline"));
                            else
                                GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Notify When Player Comes Online"));
                            end
                            GRM_UI.GRM_altSetMainButton:SetSize(120, 20);
                            GRM_UI.GRM_altRemoveButton:Hide();
                            GRM_UI.GRM_altOptionsDividerText:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -40);
                            GRM_UI.GRM_altFrameCancelButton:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -55);
                        else
                            GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Edit Date"));
                            if GRM_G.editBirthday then
                                GRM_UI.GRM_altRemoveButtonText:SetText(GRM.L("Remove Date"));
                            else
                                GRM_UI.GRM_altRemoveButtonText:SetText(GRM.L("Clear History"));
                            end
                            GRM_UI.GRM_altRemoveButton:Show();
                        end
                    else
                        if GRM_G.selectedAlt[3] ~= true then    -- player is not the main.
                            GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Set as Main"));
                        else -- player IS the main... place option to Demote From Main rahter than set as main.
                            GRM_UI.GRM_altSetMainButtonText:SetText(GRM.L("Set as Alt"));
                        end
                        GRM_UI.GRM_altRemoveButtonText:SetText(GRM.L("Remove"));
                        GRM_UI.GRM_altRemoveButton:Show();
                    end
                    local width = 70;
                    if GRM_UI.GRM_altOptionsText:GetStringWidth() + 15 > width then       -- For scaling the frame based on size of player name.
                        width = GRM_UI.GRM_altOptionsText:GetStringWidth() + 15;
                    end
                    if GRM_UI.GRM_altSetMainButtonText:GetStringWidth() + 15 > width then
                        width = GRM_UI.GRM_altSetMainButtonText:GetStringWidth() + 15;
                    end
                    if GRM_UI.GRM_altRemoveButtonText:GetStringWidth() + 15 > width then
                        width = GRM_UI.GRM_altRemoveButtonText:GetStringWidth() + 15;
                    end
                    if GRM_UI.GRM_altFrameCancelButtonText:GetStringWidth() + 15 > width then
                        width = GRM_UI.GRM_altFrameCancelButtonText:GetStringWidth() + 15;
                    end
                    GRM_UI.GRM_altDropDownOptions:SetSize(width, 92);
                    GRM_UI.GRM_altDropDownOptions:Show();
                else
                    -- Special Logic for sync dates.
                    -- Don't want to mess with the logic here if the date submit buttons are already up...
                    if not GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() and not GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:IsVisible() and GRM.PlayerOrAltHasJD(GRM_G.currentName) and not GRM.IsAltJoinDatesSynced( GRM_G.currentName) then
                        -- Hide the other custom frame...
                        GRM_UI.GRM_altDropDownOptions:Hide();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Show();
                    end
                end
            end
        elseif button == "LeftButton" then
            if not IsShiftKeyDown() then
                if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailServerNameToolTip:IsVisible() and not GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNameText:IsMouseOver(2, -2, -2, 2) then
                    -- This makes the main window the alt that was clicked on! TempAltName is saved when mouseover action occurs.
                    if GRM_G.tempAltName ~= "" then
                        GRM.SelectPlayerOnRoster(GRM_G.tempAltName);
                    end
                end
            else
                if GRM_UI.GRM_altFrameTitleText:IsMouseOver( 1, -1, -1, 1) then
                    GRM_G.pause = true;
                    GRM_G.AltSideWindowFreeze = true;
                else
                    if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNameText:IsMouseOver(2, -2, -2, 2) then
                        GRM_G.tempAltName = GRM_G.currentName;
                    end
                    if GRM_G.tempAltName ~= "" then
                        GRM.GR_Roster_Click(GRM_G.tempAltName);
                        GRM_G.tempAltName = "";
                    end
                end
            end
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData:SetScript("OnHide", function()
        GRM.ClearAllFrames( false);
    end);

    -- Keyboard Control for easy ESC closeButtons
    -- tinsert( UISpecialFrames, "GRM_UI.GRM_MemberDetailMetaData");

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData, "TOPRIGHT", -7, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetSize(315, 130);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame, 0, -22);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9, "THICKOUTLINE");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText:SetText(GRM.L("Please Select Which Join Date to Sync"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText:SetWidth(285);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_SyncJoinDateText, "BOTTOM", 0, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton:SetSize(275, 20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButtonText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton, "LEFT", 10, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton, "BOTTOMLEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton:SetSize(275, 20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButtonText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton, "LEFT", 10, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDMainButton, "BOTTOMLEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton:SetSize(275, 20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButtonText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButton, "LEFT", 10, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSelectedPlayerButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame, "BOTTOMLEFT", 10, 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton:SetSize(275, 20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButtonText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton, "LEFT", 10, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButtonText:SetText(GRM.L("Cancel"));

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDSyncCancelButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            GRM.PopulateMemberDetails(GRM_G.currentName);
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
        end
    end);

    -- Do not want to give player the option to sync JD data if they remove all their alts or reset JD data whilst this frame is open... close it if changes. Check every 2 seconds.
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetScript("OnUpdate", function(self, elapsed)
        GRM_G.SyncJDTimer = GRM_G.SyncJDTimer + elapsed;
        if GRM_G.SyncJDTimer > 2 then
            if not GRM.PlayerOrAltHasJD(GRM_G.currentName) then
                self:Hide();
            end
            GRM_G.SyncJDTimer = 0;
        end
    end)
    -- Logic for syncing JDs...
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame.GRM_JDOldestButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            GRM.SyncJoinDateUsingEarliest();
            GRM.PopulateMemberDetails(GRM_G.currentName);
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
        end
    end);
    

    -- Logic for when the sync frame loads up...
    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetScript("OnShow", function(self)
        -- True for each of the buttons... which will depend on the logic of what to show.
        local count = 0;
        local mainName = "";
        local playerHasJD = GRM.PlayerHasJoinDate(GRM_G.currentName)[1];
        local oldestPlayerAndDate = GRM.GetAltWithOldestJoinDate(GRM_G.currentName);
        local mainHasJD = {};
        -- Ok, need this data in case we want to sync to the main. But we don't want to ask the player that if main has no date set...
        if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText:IsVisible() then
            mainName = GRM_G.currentName;
        else
            mainName = GRM.GetPlayerMain(GRM_G.currentName);
        end
        -- Get Main info...
        if mainName ~= nil and mainName ~= GRM_G.currentName then
            mainHasJD = GRM.PlayerHasJoinDate(mainName)[1];
        end

        -- First Button
        self.GRM_JDOldestButtonText:SetText(">  " .. GRM.L("Sync All Alts to the Earliest Join Date: {name}", GRM.GetClassifiedName(oldestPlayerAndDate[1], true)));

        -- Second Button
        if mainName ~= nil and mainName ~= GRM_G.currentName and oldestPlayerAndDate[1] ~= mainName and mainHasJD then
            self.GRM_JDMainButtonText:SetText(">  " .. GRM.L("Sync All Alts to {name}'s |cffff0000(main)|r Join Date", GRM.GetClassifiedName(mainName, true)));
            -- Set the script to proper button
            self.GRM_JDMainButton:SetScript("OnClick", function(self, button)
                if button == "LeftButton" then
                    GRM.SyncJoinDateUsingMain();
                    GRM.PopulateMemberDetails(GRM_G.currentName);
                    self:Hide();
                end
            end);
            self.GRM_JDMainButton:Show();
            count = count + 1;
        elseif oldestPlayerAndDate[1] ~= GRM_G.currentName and playerHasJD then
            self.GRM_JDMainButtonText:SetText(">  " .. GRM.L("Sync All Alts to {name}'s Join Date", GRM.GetClassifiedName(GRM_G.currentName, true)));
            self.GRM_JDMainButton:SetScript("OnClick", function(self, button)
                if button == "LeftButton" then
                    GRM.SyncJoinDateUsingCurrentSelected();
                    GRM.PopulateMemberDetails(GRM_G.currentName);
                    self:Hide();
                end
            end);
            self.GRM_JDMainButton:Show();
            count = count + 2;
        end

        -- Third Button
        -- If the 2nd button wasn't filled, well, neither will the third... hide both the 2nd and 3rd buttons
        if count == 0 then
            self.GRM_JDMainButton:Hide();
            self.GRM_JDSelectedPlayerButton:Hide();
            -- transform logic to size for just 1 button
            self:SetSize(315, 85)

        -- This means that the potential 3rd position was filled to the 2nd, thus we can hide the 3rd button.
        elseif count == 2 then
            self.GRM_JDSelectedPlayerButton:Hide();
            -- transform logic to size for just 2 buttons
            self:SetSize(315, 105)
        -- this means that the first button was filled, the 2nd button was filled, now let's determine if the 3rd button will also be filled.
        elseif count == 1 then
            -- No need to repeat this, since the oldest will permanently be on button 1
            if oldestPlayerAndDate[1] ~= GRM_G.currentName and playerHasJD then
                self:SetSize(315, 130);
                self.GRM_JDSelectedPlayerButtonText:SetText(">  " .. GRM.L("Sync All Alts to {name}'s Join Date", GRM.GetClassifiedName(GRM_G.currentName, true)));
                self.GRM_JDSelectedPlayerButton:SetScript("OnClick", function(self, button)
                    if button == "LeftButton" then
                        GRM.SyncJoinDateUsingCurrentSelected();
                        GRM.PopulateMemberDetails(GRM_G.currentName);
                        self:Hide();
                    end
                end);
                self.GRM_JDSelectedPlayerButton:Show();
            else
                self:SetSize(315, 105)
                self.GRM_JDSelectedPlayerButton:Hide();
            end
        end
    end);
    

    GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);

    -- Day Dropdown
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetSize(30, 18);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected, "RIGHT", 5, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected, "BOTTOM");
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetWidth(34);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetFrameStrata("HIGH");

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected.GRM_DayText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected.GRM_DayText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetScript("OnShow", function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale()
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Day"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();
            else
                GRM.InitializeDropDownDay();
                GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Show();
                GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
                GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
            end
        end
    end);

    -- Month dropdown
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetSize(83, 18);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt, "BOTTOM", -60, -4);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected, "BOTTOM");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetWidth(80);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetFrameStrata("HIGH");
    
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected.GRM_MonthText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected.GRM_MonthText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetScript("OnShow", function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Month"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
            else
                GRM.InitializeDropDownMonth();
                GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Show();
                GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();
                GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
            end
        end
    end);

    -- Year Dropdown
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetSize(83, 18);
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenuSelected, "RIGHT", 5, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected, "BOTTOM");
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetWidth(52);
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetFrameStrata("HIGH");

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected.GRM_YearText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected);
    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected.GRM_YearText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetScript("OnShow", function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Year"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenuSelected:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
            else
                GRM.InitializeDropDownYear();
                GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Show();
                GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
                GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();
            end
        end
    end);

    --Rank Drop down submit and cancel
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:SetSize(90, 18);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt, "BOTTOM", 0, -4);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton.GRM_SetPromoDateButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton.GRM_SetPromoDateButtonText:SetText(GRM.L("Date Promoted?"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton.GRM_SetPromoDateButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.ScaleFontStringToObjectSize(true, GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:GetWidth(), GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton.GRM_SetPromoDateButtonText, 2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:SetScript( "OnClick", function(self, button)
        if button == "LeftButton" then
            self:Hide();
            GRM.SetDateSelectFrame("PromoRank");  -- Position, Frame, ButtonName
            GRM_G.pause = true;
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton, "RIGHT", 6, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:SetWidth( 74);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton.GRM_SetUnknownButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton.GRM_SetUnknownButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton.GRM_SetUnknownButtonText:SetText(GRM.L("Unknown"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" and not GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:IsVisible() then
            local buttonText = GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:GetText();
            if buttonText == GRM.L("Set Join Date") or buttonText == GRM.L("Edit Join Date") then
                GRM.ClearJoinDateHistory(GRM_G.currentName, true);
                GRM.DateSubmitCancelResetLogic( true, "join", false, nil);
            elseif buttonText == GRM.L("Set Promo Date") or buttonText == GRM.L("Edit Promo Date") then
                GRM.ClearPromoDateHistory( GRM_G.currentName, true);
                GRM.DateSubmitCancelResetLogic( true, "promo", false, nil);
            end

            if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                GRM.RefreshAuditFrames( GRM_G.AuditSortType);
            end
        end    
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton.GRM_SetUnknownButtonText:GetText());
        GameTooltip:Show();
    end)
    GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    
  
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" and not GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:IsVisible() then
            GRM.DateSubmitCancelResetLogic( false, nil, false, nil);
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButtonTxt:GetText());
        GameTooltip:Show();
    end)
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Name Text
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNameText:SetPoint( "TOP", 0, -20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNameText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 16);

    -- LEVEL Text
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLevel:SetPoint("TOP", 0, -38);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLevel:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 9);

    -- Rank promotion date text
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt:SetPoint("TOP", 0, -54);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt:SetTextColor(0.90, 0.80, 0.50, 1.0);

    -- Reputation text
    GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText:SetPoint("BOTTOM", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt, "TOP", -2, 1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 8);

    -- "MEMBER SINCE"
    GRM_UI.GRM_MemberDetailMetaData.GRM_JoinDateText:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt, "BOTTOM", -3, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_JoinDateText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);

    -- "LAST ONLINE" 
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData, 16, -22);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt:SetText(GRM.L("Last Online"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9, "THICKOUTLINE");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTitleTxt, "BOTTOM", -2, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt:SetWidth(65);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt:SetJustifyH("CENTER");
    
    -- PLAYER STATUS
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailLastOnlineTxt, "BOTTOM", 0, - 18);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:SetWidth(75);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:SetJustifyH("CENTER");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:SetWordWrap(false);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailPlayerStatus:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);

    -- ZONE
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData, 18, 60);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9, "THICKOUTLINE");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText:SetText(GRM.L("Zone:"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoZoneText:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText, "RIGHT", 2, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoZoneText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText, "BOTTOM", 10, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1:SetText(GRM.L("Time In:") .. " ");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText2:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1, "RIGHT", 2, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    
    -- Is Main Note!
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData, 0, -12);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText:SetText(GRM.L("( Main )"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMainText:SetTextColor(1.0, 0.0, 0.0, 1.0);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:SetTextColor(1, 1, 1, 1.0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankTxt, "BOTTOM", 0, -4);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    
    -- Join Date Button Logic for visibility
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetPoint("TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData, -10, -22);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetText(GRM.L("Date Joined"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetWidth(80);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetJustifyH("CENTER");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9, "THICKOUTLINE");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt, "BOTTOM", -2, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:SetSize(80, 17);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButtonText:SetText(GRM.L("Join Date?"))
    GRM_UI.ScaleFontStringToObjectSize(true, GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:GetWidth(), GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButtonText, 2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            self:Hide();
            if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:Hide();
            elseif GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:Hide();
            end
            GRM.SetDateSelectFrame("JoinDate");  -- Position, Frame, ButtonName
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
            GRM_G.pause = true;
        end
    end);

    -- Birthday Button and text
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailDateJoinedTitleTxt, "BOTTOM", 0, -20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:SetText(GRM.L("Birthday"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9, "THICKOUTLINE");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText, "BOTTOM", -2, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:SetSize(80, 14);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton.GRM_MemberDetailBirthdayButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton.GRM_MemberDetailBirthdayButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton.GRM_MemberDetailBirthdayButtonText:SetText(GRM.L("Set Birthday"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText, "BOTTOM", -1.5, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:SetWidth(67);
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:SetJustifyH("CENTER");
    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:Hide();

    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            self:Hide();
            if GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:Hide();
            elseif GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:Hide();
            end
            GRM.SetDateSelectFrame("Birthday");  -- Position, Frame, ButtonName
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
            GRM_G.pause = true;
        end 
    end);

    -- GROUP INVITE BUTTON
    GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData, 16, 13)
    GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton:SetSize(88, 19);
    GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton.GRM_GroupInviteButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton.GRM_GroupInviteButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);

    
    if not isManualUpdate then

        GuildMemberDetailFrame:SetScript("OnShow", function( self)
            if not IsShiftKeyDown() then
                GRM_G.pause = true;
                self:SetPoint("TOPLEFT", GuildRosterFrame, "TOPRIGHT", 34, 0);
                GRM_UI.GRM_MemberDetailMetaData:SetPoint("TOPLEFT", self, "TOPRIGHT", -4, 5);
            else
                self:Hide();
            end
        end);
    
        GuildMemberDetailFrame:SetScript("OnHide", function()
            GRM_UI.GRM_PopupWindow:Hide();
            GRM.RemoveRosterButtonHighlights();
            GRM_UI.GRM_MemberDetailMetaData:SetPoint("TOPLEFT", GuildRosterFrame, "TOPRIGHT", 22.5, 5);
            if not GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                GRM_G.pause = false;
            end
        end);
    
        GuildMemberDetailFrame:SetScript("OnKeyDown", function(self, key)
            self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
            if key == "ESCAPE" then
                self:SetPropagateKeyboardInput(false);
                self:Hide();
            end
        end);

        GuildMemberRemoveButton:HookScript("OnClick", function()
            GRM_UI.GRM_PopupWindow:Show();
        end);
        
        GuildRosterShowOfflineButton.GRM_MemberCount = GuildRosterShowOfflineButton:CreateFontString("GRM_MemberCount", "OVERLAY", "GameFontNormal");
        GuildRosterShowOfflineButton.GRM_MemberCount:SetPoint("RIGHT", GuildFrameMembersCountLabel, "LEFT", -5, 0);
        GuildRosterShowOfflineButton.GRM_MemberCount:SetFont(GuildFrameMembersCount:GetFont(), select(2, GuildFrameMembersCount:GetFont()));

        -- Method:          GRM_UI.OnlineUsersTextUpdate()
        -- What it Does:    Updates the fontstring to the number of online players on the main member roster tab
        -- Purpose:         Blizz default UI only shows roster online count on the chat window, not the member list window.
        -- GRM_UI.OnlineUsersTextUpdate = function()
        --     if CommunitiesFrame.RosterTab:GetChecked() then
        --         local numOnlineMembers = 0;
        --         for i, memberInfo in ipairs(CommunitiesFrame.MemberList.allMemberList) do
        --             if memberInfo.presence == Enum.ClubMemberPresence.Online or
        --                 memberInfo.presence == Enum.ClubMemberPresence.Away or
        --                 memberInfo.presence == Enum.ClubMemberPresence.Busy then
        --                 numOnlineMembers = numOnlineMembers + 1;
        --             end
        --         end
        --         COMMUNITIES_MEMBER_LIST_MEMBER_COUNT_FORMAT = "%s/%s Online";
        --         GuildRosterShowOfflineButton.GRM_MemberCount:SetText(COMMUNITIES_MEMBER_LIST_MEMBER_COUNT_FORMAT:format(AbbreviateNumbers(numOnlineMembers), AbbreviateNumbers(0)));
        --         C_Timer.After(1, GRM_UI.OnlineUsersTextUpdate);
        --     end
        -- end

        -- -- Initiate the on-Update check if this button shows...
        -- GuildRosterShowOfflineButton:HookScript("OnShow", GRM_UI.OnlineUsersTextUpdate);

        -- Need to hook script on each of these.
        -- CommunitiesFrame.ChatTab:HookScript("OnClick", function(_, button)
        --     if button == "LeftButton" then
        --         GRM.ClearResetFramesOnTabChange();
        --     end
        -- end);

        -- CommunitiesFrame.RosterTab:HookScript("OnClick", function(_, button)
        --     if button == "LeftButton" then
        --         GRM.ClearResetFramesOnTabChange();
        --     end
        -- end);

        -- CommunitiesFrame.GuildBenefitsTab:HookScript("OnClick", function(_, button)
        --     if button == "LeftButton" then
        --         GRM.ClearResetFramesOnTabChange();
        --     end
        -- end);

        -- CommunitiesFrame.GuildInfoTab:HookScript("OnClick", function(_, button)
        --     if button == "LeftButton" then
        --         GRM.ClearResetFramesOnTabChange();
        --     end
        -- end);

        --CommunitiesFrame:HookScript("OnShow", GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate);
    end
        
    
    -- player note edit box and font string (31 characters)
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, "TOPLEFT", 5, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetText(GRM.L("Note:"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetWidth(120);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetWordWrap(false);

    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow, "TOPLEFT", 5, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetText(GRM.L("Officer's Note:"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetWidth(120);
    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetWordWrap(false);

    -- OFFICER AND PLAYER NOTES
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetPoint( "LEFT", GRM_UI.GRM_MemberDetailMetaData, 15, 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, 8, -7);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetWordWrap(true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetSpacing(1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetWidth(108);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetMaxLines(3);

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] then
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetBackdrop(GRM_UI.noteBackdrop);
    end
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetSize(125, 40);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetPoint( "TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, "TOP", 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetPoint( "BOTTOM", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, "BOTTOM", 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetSize(125, 45);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetTextInsets( 8, 9, 9, 8);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetMaxLetters(31);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetMultiLine( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetSpacing(1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:EnableMouse( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetPoint ("TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, -6, 8);

    -- Officer Note
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetPoint( "RIGHT", GRM_UI.GRM_MemberDetailMetaData, -15, 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow, 8, -7);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetWordWrap(true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetSpacing(1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetWidth(108);
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetMaxLines(3);

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] then
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetBackdrop(GRM_UI.noteBackdrop);
    end
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetSize(125, 40);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetPoint( "TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow, "TOP", 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetPoint( "BOTTOM", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow, "BOTTOM", 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetSize(125, 45);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetTextInsets( 8, 9, 9, 8);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetMaxLetters(31);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetMultiLine( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetSpacing(1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:EnableMouse( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetFrameStrata("HIGH");

    -- Tooltip only for guild leader!!!
    if not isManualUpdate and CanEditMOTD() then
        local officerTooltipTimer = 0;
        GuildInfoEditDetailsButton:HookScript("OnUpdate", function( self, elapsed)
            officerTooltipTimer = officerTooltipTimer + elapsed;
            if officerTooltipTimer > 0.05 then
                if self:IsMouseOver() and not GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:IsVisible() and not GuildTextEditBox:HasFocus() then
                    -- Get officer note.
                    local notes = GetGuildInfoText();
                    if notes ~= nil and #notes > 0 then
                        -- Build the header...
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:SetOwner(self, "ANCHOR_CURSOR");
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine("|CFFE6CC7F" .. GRM.L("GRM:") .. " " .. GRM.L("Unify Control Settings for all guildies with 'g#^X' commands"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("X = index of minimum rank. Example: 0 = {name} and {num} = {name2}", GuildControlGetRankName(1), GuildControlGetRankName( GuildControlGetNumRanks()), GuildControlGetNumRanks() - 1));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine("|CFFE6CC7F" .. GRM.L("CONTROL TAGS:"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("'g1^X' - Establish a universal timestamp format based on dropdown selection position"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("'g2^X' - Establish minimum sync rank restriction for player details"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("'g3^X' - Establish minimum sync rank restriction for BAN info"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("'g4^X' - Establish minimum sync rank restriction for Custom Note info"));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("'g5^X' - Designate Join Date note destination. g5^1 = Officer, 2 = public, 3 = custom"));
                        -- GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:AddLine(GRM.L("g2^{num} would force sync to {name} and higher.", GuildControlGetRankName(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15] + 1), nil, GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15]));
                        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:Show();
                end
                elseif not self:IsMouseOver() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:Hide();
                end
                officerTooltipTimer = 0;
            end
        end);
    end
    
    -- Due to sizing and spacing... don't want to allow font manipulation of the edits...
    if not isManualUpdate then
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 9);
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 9);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailONoteTitle:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNoteTitle:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 9);
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 9);
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
    end

    -- Script handlers on Note Edit Boxes
    local defNotes = {};
    defNotes.defaultNote = GRM.L("Click here to set a Public Note");
    defNotes.defaultONote = GRM.L("Click here to set an Officer's Note");
    defNotes.tempNote = "";
    defNotes.finalNote = "";

    -- Script handlers on Note Frames
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetScript("OnMouseDown", function(self, button) 
        if button == "LeftButton" and(CanEditPublicNote() or GRM_G.currentName == GRM_G.addonPlayerName) then 
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetPoint ("TOPRIGHT", self, -6, 8);
            GRM_G.pause = true;
            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:ClearFocus();
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
            defNotes.tempNote = GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:GetText();
            if defNotes.tempNote ~= defNotes.defaultONote and defNotes.tempNote ~= "" then
                defNotes.finalNote = defNotes.tempNote;
            else
                defNotes.finalNote = "";
            end
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetText( defNotes.finalNote);
            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:Show();
            GRM_G.CharCount = #GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:GetText();

            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText( #GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:GetText() .. "/31");
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:Show();
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Show();
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:Hide();
        end 
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetScript("OnMouseDown", function(self, button) 
        if button == "LeftButton" and CanEditOfficerNote() then
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetPoint ("TOPRIGHT", self, -6, 8);
            GRM_G.pause = true;
            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:ClearFocus();
            defNotes.tempNote = GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:GetText();
            if defNotes.tempNote ~= defNotes.defaultNote and defNotes.tempNote ~= "" then
                defNotes.finalNote = defNotes.tempNote;
            else
                defNotes.finalNote = "";
            end
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetText( defNotes.finalNote);
            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:Show();
            GRM_G.CharCount = #GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:GetText()

             -- How many characters initially
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText( #GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:GetText() .. "/31");
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:Show();
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Show();
            GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:Hide();

            -- Clear the Tooltip
            if GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:Hide();
            end
        end 
    end);

    -- Method:          GRM_UI.PlayerPublicNoteEditBox()
    -- What it Does:    Performs the exit note logic where it does not save the public note
    -- Purpose:         Repeat use, clean logic use
    GRM_UI.PlayerPublicNoteEditBox = function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
        defNotes.tempNote = GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:GetText();
        if defNotes.tempNote ~= defNotes.defaultNote and defNotes.tempNote ~= "" then
            defNotes.finalNote = defNotes.tempNote;
        else
            defNotes.finalNote = "";
        end
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetText(defNotes.finalNote);
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:Show();
        if GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() ~= true then            -- Does not unpause if the date still needs to be selected or canceled.
            GRM_G.pause = false;
        end
    end

    -- Cancels editing in Note editbox
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnEscapePressed", GRM_UI.PlayerPublicNoteEditBox);

    -- Edit focus lost logic on both editboxes
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnEditFocusLost", function( self)
        self:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:Show();
    end);
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnEditFocusLost", function( self)
        self:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:Show();
    end);

    -- Updates char count as player types.
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnChar", function(self) 
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText(#self:GetText() .. "/31");
    end);

    -- Update on backspace/delte changes too  
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnKeyDown", function(self, text)  -- While technically this one script handler could do all, this is more process efficient to have 2.
        if(text == "BACKSPACE" and self:GetCursorPosition() ~= 0) or(text == "DELETE" and self:GetCursorPosition() ~= GRM_G.CharCount) then
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText(#self:GetText() -1 .. "/31");
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnKeyUp", function(self)
        GRM_G.CharCount = #self:GetText(); 
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText(#self:GetText() .. "/31");
    end);

    -- Updating the new information to Public Note
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:SetScript("OnEnterPressed", function(self) 
        local playerDetails = {};
        playerDetails.newNote = self:GetText();
        playerDetails.name = GRM_G.currentName;
        
        for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == playerDetails.name then         -- Player Found and Located.
                -- -- First, let's add the change to the official server-sde note
                for h = 1, GRM.GetNumGuildies() do
                    local playerName ,_,_,_,_,_, publicNote = GetGuildRosterInfo( h);
                    if playerName == playerDetails.name and publicNote ~= playerDetails.newNote and(CanEditPublicNote() or GRM_G.currentName == GRM_G.addonPlayerName) then      -- No need to update old note if it is the same.
                        GRM_G.changeHappenedExitScan = true;

                        -- Saving the changes!
                        GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][7] = playerDetails.newNote;          -- Metadata
                        GuildRosterSetPublicNote(h, playerDetails.newNote);                                                                 -- Server Side

                        -- To metadata reporting
                        local logReport = "";
                        local simpleName = GRM.GetStringClassColorByName(playerDetails.name) .. GRM.SlimName(playerDetails.name) .. "|r";
                        if publicNote == "" then
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s PUBLIC Note: \"{custom1}\" was Added", simpleName, nil, nil, playerDetails.newNote));
                        elseif playerDetails.newNote == "" then
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s PUBLIC Note: \"{custom1}\" was Removed", simpleName, nil, nil, publicNote));
                        else
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s PUBLIC Note: \"{custom1}\" to \"{custom2}\"", simpleName, nil, nil, publicNote, playerDetails.newNote));
                        end

                        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][6] then
                            GRM.PrintLog(4, logReport, false);
                        end
                        -- Also adding it to the log!
                        GRM.AddLog(4, logReport);

                        -- Set the note
                        local theNote = "";
                        if #playerDetails.newNote == 0 then
                            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetText(defNotes.defaultNote);
                            theNote = defNotes.defaultNote;
                        else
                            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:SetText(playerDetails.newNote);
                            theNote = playerDetails.newNote;
                        end
                        -- update the edit box
                        self:SetText( playerDetails.newNote);

                        -- If the memberdetailframe is open, set it as well...
                        if GuildMemberDetailFrame:IsVisible() then
                            if GRM.SlimName(GuildMemberDetailFrame.Name:GetText()) == GRM.SlimName(GRM_G.currentName) then
                                GuildMemberDetailFrame.NoteBackground.PersonalNoteText:SetText( theNote);
                            end
                        end

                        -- and if the event log window is open, might as well build it!
                        GRM.BuildLogComplete( true);
                        break;
                    end
                end
                break;
            end
        end

        self:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString1:Show();
        if GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() ~= true then            -- Does not unpause if the date still needs to be selected or canceled.
            GRM_G.pause = false;
        end
    end);

    -- Method:          GRM_UI.EscapeOfficerNoteEditBox ()
    -- What it Does:    Holds the logic for the editbox
    -- Purpose:         For repeat use...
    GRM_UI.EscapeOfficerNoteEditBox = function ()
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
        defNotes.tempNote = GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:GetText();
        if defNotes.tempNote ~= defNotes.defaultONote and defNotes.tempNote ~= "" then
            defNotes.finalNote = defNotes.tempNote;
        else
            defNotes.finalNote = "";
        end
        GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetText( defNotes.finalNote);
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:Show();
        if GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() ~= true then            -- Does not unpause if the date still needs to be selected or canceled.
            GRM_G.pause = false;
        end
    end

    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnEscapePressed", GRM_UI.EscapeOfficerNoteEditBox);
    
    -- Updates char count as player types.
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnChar", function(self) 
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText( #self:GetText() .. "/31");
    end);

    -- Update on backspace/delte changes too  
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnKeyDown", function(self, text)  -- While technically this one script handler could do all, this is more process efficient to have 2.
        if(text == "BACKSPACE" and self:GetCursorPosition() ~= 0) or(text == "DELETE" and self:GetCursorPosition() ~= GRM_G.CharCount) then
            GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText(#self:GetText() - 1 .. "/31");
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnKeyUp", function(self)
        GRM_G.CharCount = #self:GetText(); 
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:SetText(#self:GetText() .. "/31");
    end);

     -- Updating the new information to Public Note
    GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:SetScript("OnEnterPressed", function(self) 
        local playerDetails = {};
        playerDetails.newNote = self:GetText();
        playerDetails.name = GRM_G.currentName;
        
        for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == playerDetails.name then         -- Player Found and Located.
                -- -- First, let's add the change to the official server-sde note
                for h = 1, GRM.GetNumGuildies() do
                    local playerName ,_,_,_,_,_,_, officerNote = GetGuildRosterInfo( h);
                    if playerName == playerDetails.name and officerNote ~= playerDetails.newNote and CanEditOfficerNote() then      -- No need to update old note if it is the same.
                        GRM_G.changeHappenedExitScan = true;

                        -- Saving the new note details!
                        GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][8] = playerDetails.newNote;      -- to addon metadata
                        GuildRosterSetOfficerNote(h, playerDetails.newNote);
                        
                        -- To metadata reporting
                        local logReport = "";
                        local simpleName = GRM.GetStringClassColorByName(playerDetails.name) .. GRM.SlimName(playerDetails.name) .. "|r";
                        if officerNote == "" then
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s OFFICER Note: \"{custom1}\" was Added", simpleName, nil, nil, playerDetails.newNote));
                        elseif playerDetails.newNote == "" then
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s OFFICER Note: \"{custom1}\" was Removed", simpleName, nil, nil, officerNote));
                        else
                            logReport =(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. GRM.L("{name}'s OFFICER Note: \"{custom1}\" to \"{custom2}\"", simpleName, nil, nil, officerNote, playerDetails.newNote));
                        end
                        
                        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][7] then
                            GRM.PrintLog(5, logReport, false);
                        end
                        -- Also adding it to the log!
                        GRM.AddLog(5, logReport);
                        
                        local theNote = "";
                        if #playerDetails.newNote == 0 then
                            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetText(defNotes.defaultONote);
                            theNote = defNotes.defaultONote;
                        else
                            GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:SetText(playerDetails.newNote);
                            theNote = playerDetails.newNote;
                        end
                        self:SetText( playerDetails.newNote);

                        if GuildMemberDetailFrame:IsVisible() then
                            if GRM.SlimName(GuildMemberDetailFrame.Name:GetText()) == GRM.SlimName(GRM_G.currentName) then
                                GuildMemberDetailFrame.OfficerNoteBackground.OfficerNoteText:SetText( theNote);
                            end
                        end

                        -- and if the event log window is open, might as well build it!
                        GRM.BuildLogComplete( true);
                        break;
                    end
                end
                break;
            end
        end

        self:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_noteFontString2:Show();
        if GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() ~= true then            -- Does not unpause if the date still needs to be selected or canceled.
            GRM_G.pause = false;
        end
    end);

    
    -- CUSTOM NOTE WINDOW DETAILS
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "TOPRIGHT", -5, 1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:Hide();
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "TOPLEFT", 5, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetText(GRM.L("Custom Notes:"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetWidth(123);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetWordWrap(false);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "TOPLEFT", 2, -1.5);
    -- GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOMLEFT", 2, 1.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetSize(120, 80);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetTextInsets( 7, 7, 6, 6);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetMaxLetters(150);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:EnableMouse( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetMultiLine( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetSpacing(1);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:ClearFocus();
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText, "RIGHT", 0, -1.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetSize(20, 20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOMLEFT", 2, -2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetText("Sync:");
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetWordWrap(false);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetJustifyH("LEFT");

    if not isManualUpdate then
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 9);
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier - GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] + 8);
    end

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                    if self:GetChecked() then
                        GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][1] = true;
                        GRM_UI.ResetCustomNoteSyncTooltip();
                    else
                        GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][1] = false;
                        GRM_UI.ResetCustomNoteSyncTooltip();
                    end
                    break;
                end
            end            
        end
    end);

    GRM_UI.ResetCustomNoteSyncTooltip = function()
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox, "ANCHOR_CURSOR");
        local script = "";
        if GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:GetChecked() then
            script = GRM.L("Click to Disable Sync of Custom Note");
        else
            script = GRM.L("Click to Enable Sync of Custom Note");
        end
        GameTooltip:AddLine( script);
        GameTooltip:Show();
    end

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetScript("OnEnter", GRM_UI.ResetCustomNoteSyncTooltip);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnEditFocusGained", function(self)
        GRM_G.OriginalEditBoxValue = self:GetText();
        GRM_UI.GRM_MemberDetailMetaData.GRM_NoteCount:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
        GRM_G.pause = true;
        if self:GetText() == GRM.L("Click here to set Custom Notes") then
            self:SetText( "");
        end
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:SetText(self:GetNumLetters() .. "/150");
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:Show();

        -- Group Invite button may need to temporarily be turned off.
        GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:Show();
        GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:Show();
    end);


    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnEditFocusLost", function ()
        GRM_UI.CustomNoteEditBoxOnFocusLost();
    end);

    local MaxValue = 0;
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnTextChanged", function( self)
        if self:HasFocus() then
            local numLetters = self:GetNumLetters();
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:SetText(numLetters .. "/150");

            GRM.BuildCustomNoteScrollFrame( self:GetText());
            local _, max = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:GetMinMaxValues();
            if max > 0 and numLetters > 0 then
                local cursorPosition = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:GetCursorPosition();
                if cursorPosition == numLetters then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetValue(max);
                else
                    if max - MaxValue > 15 then
                        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetValue( math.floor(( cursorPosition / GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:GetMaxLetters()) * max));
                    end
                end
            end
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnEscapePressed", function()
        GRM_UI.CustomNoteEditBoxOnFocusLost();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnEnterPressed", function()
        -- Store the update.
        local newString = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:GetText();
        local cursorPosition = GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:GetCursorPosition();
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetText(string.sub(newString, 1, cursorPosition) .. "\n" .. string.sub(newString, cursorPosition + 1));
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetCursorPosition(cursorPosition + 1);
    end)

    -- EditBox tooltip
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnEnter", function( self)
        if not self:HasFocus() then
            for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then

                    -- No need to bother with tooltip if there is no editor.
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][3] ~= "" then
                        local tempGuild = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ];
                        local isFound = false;
                        -- Need to check if the person who edited is still in the guild
                        for j = 2, #tempGuild do
                            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][3] == tempGuild[j][1] then
                                isFound = true;
                                break;
                            end
                        end
                        GRM_UI.SetTooltipScale();
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                        -- if still in the guild
                        local noteDisplay = "";
                        if isFound then
                            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][6] == "" then
                                noteDisplay = GRM.L("Note Removed by {name}", GRM.GetClassifiedName(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][3], false));
                            else
                                noteDisplay = GRM.L("Edited by {name}", GRM.GetClassifiedName(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][3], false));
                            end
                            GameTooltip:AddLine( noteDisplay);
                        else
                            GameTooltip:AddLine( GRM.L("Edited by {name}", GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][3] .. " (" .. GRM.L( "|CFFFF0000Player No Longer in Guild") .. ")" ));
                        end
                        GameTooltip:AddLine(GRM.FormatTimeStamp(GRM.EpochToDateFormat(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][2]), false));
                        GameTooltip:Show();
                    end
                    break;
                end
            end           
        end    
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    

    -- SCROLL FRAME
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] then
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetBackdrop(GRM_UI.noteBackdrop);
    end
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetSize(125, 85);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:EnableMouse(true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:Show();
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetFocus();
        end
    end);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame:SetScrollChild(GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame:SetSize(123, 74);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame:SetPoint( "Bottom", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOM", 1, 5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame:EnableMouseWheel( true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetOrientation("VERTICAL");
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetSize(12, 51)
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "TOPRIGHT", 2, -17.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetValue(0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextUp:SetPoint("CENTER", GRM_CustomNoteScrollFrameSliderScrollUpButton, 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextUp:SetFont([[Interface\AddOns\Guild_Roster_Manager\media\fonts\Arial.TTF]], 12)
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextUp:SetText ("▲");
    GRM_CustomNoteScrollFrameSliderScrollUpButton:SetNormalTexture(nil);
    GRM_CustomNoteScrollFrameSliderScrollUpButton:SetBackdrop(GRM_UI.noteBackdrop3);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextDown:SetPoint("CENTER", GRM_CustomNoteScrollFrameSliderScrollDownButton, 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextDown:SetFont([[Interface\AddOns\Guild_Roster_Manager\media\fonts\Arial.TTF]], 12)
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSliderOverlayTextDown:SetText ("▼");
    GRM_CustomNoteScrollFrameSliderScrollDownButton:SetNormalTexture(nil);
    GRM_CustomNoteScrollFrameSliderScrollDownButton:SetBackdrop(GRM_UI.noteBackdrop3);
    GRM_CustomNoteScrollFrameSliderThumbTexture:SetAlpha(0.45);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetScript("OnValueChanged", function(self)
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrame:SetVerticalScroll(self:GetValue());          
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteScrollFrameSlider:SetScript("OnShow", function( self)
        local tempVal = self:GetValue();
        if tempVal == 0 then
            self:SetValue( 20);
            self:SetValue(tempVal);
        else
            self:SetValue( 0);
            self:SetValue(tempVal);
        end
    end);
    
    -- Confirm Custom Note
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButtonText:SetText(GRM.L("Confirm"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:SetPoint("TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOM", -2.5, -17);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:SetSize(60, 17);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            -- Store the update.
            GRM.SetCustomNote();
        end
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Confirm Custom Note"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    -- Cancel Custom Note
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9)
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButtonText:SetText(GRM.L("Cancel"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOM", 2.5, -17);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:SetSize(60, 17);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" and not GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:IsVisible() then
            -- Store the update.
            GRM_UI.CustomNoteEditBoxOnFocusLost();
        end
    end)
    
    -- LOGIC HANDLING ON MODIFYING THE CUSTOM NOTE!!!!!!

    -- Method:          GRM_UI.CustomNoteEditBoxOnFocusLost()
    -- What it Does:    It resets to original value stored when player gained editbox focus
    -- Purpose:         Reusuable tool for many locations... avoid code bloat.
    GRM_UI.CustomNoteEditBoxOnFocusLost = function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:SetText(GRM_G.OriginalEditBoxValue);
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:ClearFocus();
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteTextCount:Hide();

        -- Check if group invite button is necessary to come back.
        GRM_UI.GRM_MemberDetailMetaData.GRM_ConfirmCustomNoteButton:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_CancelCustomNoteButton:Hide();

        if GRM_G.currentName ~= GRM_G.addonPlayerName then
            for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][33] then
                        GRM.SetGroupInviteButton(GRM_G.currentName);
                        GRM_UI.GRM_MemberDetailMetaData.GRM_GroupInviteButton:Show();
                    end
                    break;
                end
            end
        end
        
        GRM.BuildCustomNoteScrollFrame(GRM_G.OriginalEditBoxValue);
        if GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:IsVisible() ~= true then            -- Does not unpause if the date still needs to be selected or canceled.
            GRM_G.pause = false;
        end
    end

    -- Rank Drop Down for Options Frame
    -- rank drop down 
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetPoint("TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame, "BOTTOMRIGHT", 0, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetSize( 75, 15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:EnableMouse(true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetFrameStrata("HIGH");           -- Why is this needed to be high? It does, but I can't figure out why it is being set behind the parent frame.
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText:SetWidth(130);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected, "BOTTOM");
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:SetWidth(75);
    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:Hide();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetScript("OnMouseDown", function( self, button) 
        if button == "LeftButton" then
            if  GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:Hide();
                    GRM_G.pause = false;
            else
                GRM_G.pause = true;
                GRM.CreateRankDropDownMenu(self, GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu, 7, 7, GRM_UI.CustomNotePlayerRankRestriction);
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:Show();
                GameTooltip:Hide();
            end
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Rank Restriction for Custom Note"));
            GameTooltip:AddLine(GRM.L("Sync restriction is unique to just {name}'s custom note", GRM.SlimName(GRM_G.currentName)));
            if not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] then
                GameTooltip:AddLine( GRM.L("Sync is Currently Disabled"));
            elseif not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] then
                GameTooltip:AddLine( GRM.L("Custom Note Sync is Currently Disabled"));
            end
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    -- Method:          GRM_UI.CustomNotePlayerRankRestriction(buttonObject)
    -- What it Does:    used for the logic of the custom note rank selection and storing the selected change
    -- Purpose:         To insert into the generic dropdown menu creation logic.
    GRM_UI.CustomNotePlayerRankRestriction = function( button, buttontext)
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText:SetText(buttontext:GetText());
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected:Show();

        for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then

                -- First, let's parse out the button numbber
                local parsedNumber = 0;
                local nameOfButton = button:GetName();
                for j = 1, #nameOfButton do
                    if tonumber(string.sub(nameOfButton, j, j)) ~= nil then
                        -- NUM FOUND! Let's pull that number from the buttons and we'll know what class it is!
                        parsedNumber = tonumber(string.sub(nameOfButton, j));
                        break
                    end
                end
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][4] = parsedNumber - 1;
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][5] = true;
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownSelected.GRM_CustomDropDownSelectedText:SetText(GuildControlGetRankName(parsedNumber));

                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15] < GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][4] then
                    GRM.Report(GRM.L("Warning! \"{name}\" is the lowest rank that can receive this custom note.\nCheck the options menu to adjust overall settings.", GuildControlGetRankName(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15] + 1)));
                end
                break;
            end
        end
        
    end
end

-- Method:                  GR_MetaDataInitializeUISecond( boolean)
-- What it Does:            Initializes "More of the frames values/scripts"
-- Purpose:                 Just more contorls to control certain loads. The firist initialization was the core frame, this is 2ndary frames.
GRM_UI.GR_MetaDataInitializeUISecond = function( isManualUpdate)

    -- CUSTOM 
    GRM_UI.GRM_PopupWindow:SetPoint("TOP", StaticPopup1, "BOTTOM", 0, 1);
    GRM_UI.GRM_PopupWindow:EnableMouse(true);
    GRM_UI.GRM_PopupWindow:EnableKeyboard(true);
    GRM_UI.GRM_PopupWindow:SetToplevel(true);
    GRM_UI.GRM_PopupWindow:SetFrameStrata("HIGH");

    GRM_UI.GRM_PopupWindowCheckButton1:SetPoint("TOPLEFT", GRM_UI.GRM_PopupWindow, 15, -10);
    GRM_UI.GRM_PopupWindowCheckButtonText:SetPoint("RIGHT", GRM_UI.GRM_PopupWindowCheckButton1, 65, 0);
    GRM_UI.GRM_PopupWindowCheckButtonText:SetText(GRM.L("Ban Player?"));
    GRM_UI.GRM_PopupWindowCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_PopupWindowCheckButtonText:SetTextColor(1, 0, 0, 1);

    GRM_UI.GRM_PopupWindowCheckButton2:SetPoint("TOP", GRM_UI.GRM_PopupWindowCheckButton1, "BOTTOM", 0, 0);
    GRM_UI.GRM_PopupWindowCheckButton2Text:SetPoint("TOPLEFT", GRM_UI.GRM_PopupWindowCheckButtonText, "BOTTOMLEFT", 0, -15);
    GRM_UI.GRM_PopupWindowCheckButton2Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_PopupWindowCheckButton2Text:SetTextColor(1, 0, 0, 1);

    GRM_UI.GRM_PopupWindowCheckButton2:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() ~= true then
                GRM_G.isChecked2 = false;
            else
                GRM_G.isChecked2 = true;
            end
        end
    end);

    GRM_UI.GRM_PopupWindow:SetScript( "OnShow", function() 
        GRM_UI.GRM_PopupWindowCheckButton1:SetChecked(false);
        GRM_UI.GRM_PopupWindowCheckButton2:SetChecked(false);
        GRM_UI.GRM_MemberDetailEditBoxFrame:Hide();
        GRM_G.isChecked = false;
        GRM_G.isChecked2 = false;
        GRM_G.pause = true;
    end);

    if not isManualUpdate then
        StaticPopup1:HookScript("OnHide", function()
            if GRM_UI.GRM_PopupWindow:IsVisible() then
                GRM_UI.GRM_PopupWindow:Hide();
            end
        end);
    end

    -- Popup EDIT BOX
    GRM_UI.GRM_MemberDetailEditBoxFrame:SetPoint("TOP", GRM_UI.GRM_PopupWindow, "BOTTOM", 0, 3);
    GRM_UI.GRM_MemberDetailEditBoxFrame:SetSize(320, 73);

    GRM_UI.GRM_MemberDetailPopupEditBox:SetPoint( "CENTER", GRM_UI.GRM_MemberDetailEditBoxFrame);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetSize(224, 63);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetMaxLetters(75);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetTextColor(1, 1, 1, 1);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetFrameStrata("HIGH");
    GRM_UI.GRM_MemberDetailPopupEditBox:EnableMouse( true);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetMultiLine( true);
    GRM_UI.GRM_MemberDetailPopupEditBox:SetSpacing(1);

    -- Script handler for General popup editbox.
    GRM_UI.GRM_MemberDetailPopupEditBox:SetScript("OnEscapePressed", function ()
        GRM_UI.GRM_MemberDetailEditBoxFrame:Hide();
        GRM_UI.GRM_PopupWindowCheckButton1:Click();
        GRM_UI.GRM_PopupWindowCheckButton2:SetChecked(false);
        GRM_UI.GRM_PopupWindowCheckButton2:Hide();
        GRM_UI.GRM_PopupWindow:SetSize(320, 45);
    end);

    GRM_UI.GRM_PopupWindowCheckButton1:SetScript("OnHide", function ()
        C_Timer.After(3, function()
            GRM_G.isChecked = false;
            GRM_G.isChecked2 = false;
        end);
    end);

    GRM_UI.GRM_PopupWindowCheckButton1:SetScript("OnShow", function ()
        -- Check if player has alts
        for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
            if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                local numAlts = #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][11];
                if numAlts > 0 then
                    GRM_UI.GRM_PopupWindowCheckButton2Text:SetTextColor(1.0, 0.82, 0.0, 1.0);
                    GRM_UI.GRM_PopupWindow:SetSize(320, 70);
                    if numAlts > 1 then
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Kick the Player's {num} alts too?", nil, nil, numAlts));
                    else
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Kick the Player's {num} alt too?", nil, nil, numAlts));
                    end
                    GRM_UI.GRM_PopupWindowCheckButton2:Show();
                else
                    GRM_UI.GRM_PopupWindowCheckButton2:Hide();
                    GRM_UI.GRM_PopupWindow:SetSize(320, 45);
                end
                break;
            end
        end
    end);
    

    GRM_UI.GRM_PopupWindowCheckButton1:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            -- Let's quickly determine if there are a number of alts.
            local numAlts = 0;
            if GRM_UI.GRM_PopupWindowCheckButton2:IsVisible() then
                for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                        numAlts = #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][11];
                        break;
                    end
                end
            end
            if self:GetChecked() ~= true then
                GRM_UI.GRM_MemberDetailEditBoxFrame:Hide();
                GRM_G.isChecked = false;
                if GRM_UI.GRM_PopupWindowCheckButton2:IsVisible() then
                    GRM_UI.GRM_PopupWindowCheckButton2Text:SetTextColor(1.0, 0.82, 0.0, 1.0);
                    if numAlts > 1 then
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Kick the Player's {num} alts too?", nil, nil, numAlts));
                    else
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Kick the Player's {num} alt too?", nil, nil, numAlts));
                    end
                end
            else
                GRM_G.isChecked = true;
                GRM_UI.GRM_MemberDetailPopupEditBox:SetText(GRM.L("Reason Banned?") .. "\n" .. GRM.L("Click \"YES\" When Done"));
                GRM_UI.GRM_MemberDetailPopupEditBox:HighlightText(0);
                GRM_UI.GRM_MemberDetailEditBoxFrame:Show();
                GRM_UI.GRM_MemberDetailPopupEditBox:Show();

                if GRM_UI.GRM_PopupWindowCheckButton2:IsVisible() then
                    GRM_UI.GRM_PopupWindowCheckButton2Text:SetTextColor(1.0, 0.0, 0.0, 1.0);
                    if numAlts > 1 then
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Ban and Kick the Player's {num} alts too?", nil, nil, numAlts));
                    else
                        GRM_UI.GRM_PopupWindowCheckButton2Text:SetText(GRM.L("Ban and Kick the Player's {num} alt too?", nil, nil, numAlts));
                    end  
                end
            end
        end
    end);

    GRM_UI.GRM_MemberDetailPopupEditBox:SetScript("OnEnterPressed", function(_)
        -- If kick alts button is checked...
        GRM.Report(GRM.L("Please Click \"Yes\" to Ban the Player!"));
    end);

    -- Heads-up text if player was previously banned
    GRM_UI.GRM_MemberDetailBannedText1:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData, "TOPLEFT", 13, -2);
    GRM_UI.GRM_MemberDetailBannedText1:SetWordWrap(true);
    GRM_UI.GRM_MemberDetailBannedText1:SetJustifyH("LEFT");
    GRM_UI.GRM_MemberDetailBannedText1:SetTextColor(1.0, 0.0, 0.0, 1.0);
    GRM_UI.GRM_MemberDetailBannedText1:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8.0);
    GRM_UI.GRM_MemberDetailBannedText1:SetWidth(300);
    GRM_UI.GRM_MemberDetailBannedText1:SetText(GRM.L("WARNING!") .. "\n" .. GRM.L("Player Was Previously Banned!"));
    GRM_UI.GRM_MemberDetailBannedIgnoreButton:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData, 11, -5);
    GRM_UI.GRM_MemberDetailBannedIgnoreButton:SetWidth(85);
    GRM_UI.GRM_MemberDetailBannedIgnoreButton:SetHeight(15);
    GRM_UI.GRM_MemberDetailBannedIgnoreButton.GRM_MemberDetailBannedIgnoreButtonText:SetPoint("CENTER", GRM_UI.GRM_MemberDetailBannedIgnoreButton);
    GRM_UI.GRM_MemberDetailBannedIgnoreButton.GRM_MemberDetailBannedIgnoreButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8.5);
    GRM_UI.GRM_MemberDetailBannedIgnoreButton.GRM_MemberDetailBannedIgnoreButtonText:SetText(GRM.L("Ignore Ban"));
    
    
    -- ALT FRAME DETAILS!!!
    GRM_UI.GRM_CoreAltFrame:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_MemberDetailMetaData, -13.5, 16);
    GRM_UI.GRM_CoreAltFrame:SetSize(128, 140);
    GRM_UI.GRM_CoreAltFrame:SetParent(GRM_UI.GRM_MemberDetailMetaData);
       -- ALT FRAME SCROLL OPTIONS
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame:SetSize(128, 105);
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_MemberDetailMetaData, -13.5, 33);
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame:SetScrollChild(GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider:SetSize( 12, 86);
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider:SetPoint( "TOPLEFT", GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame, "TOPRIGHT", -10, -10);
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider:SetValue( 0);
    GRM_CoreAltScrollFrameSliderScrollUpButton:SetSize(12, 10);
    GRM_CoreAltScrollFrameSliderScrollDownButton:SetSize(12, 10);
    GRM_CoreAltScrollFrameSliderThumbTexture:SetSize(12, 14);
    GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_CoreAltFrame.GRM_CoreAltScrollFrame:SetVerticalScroll( self:GetValue())
    end);

    GRM_UI.GRM_altFrameTitleText:SetPoint("TOP", GRM_UI.GRM_CoreAltFrame, 3, -4);
    GRM_UI.GRM_altFrameTitleText:SetText(GRM.L("Player Alts"));    
    GRM_UI.GRM_altFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11, "THICKOUTLINE");

    GRM_UI.GRM_AddAltButton:SetSize(70, 17);
    GRM_UI.GRM_AddAltButtonText:SetPoint("CENTER", GRM_UI.GRM_AddAltButton);
    GRM_UI.GRM_AddAltButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_AddAltButtonText:SetText( GRM.L("Add Alt")) ;
    GRM_UI.ScaleFontStringToObjectSize(true, GRM_UI.GRM_AddAltButton:GetWidth(), GRM_UI.GRM_AddAltButtonText, 2);

    GRM_UI.GRM_AddAltButton2:SetSize(70, 17);
    GRM_UI.GRM_AddAltButton2Text:SetPoint("CENTER", GRM_UI.GRM_AddAltButton2);
    GRM_UI.GRM_AddAltButton2Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_AddAltButton2Text:SetText( GRM.L("Add Alt")) ;
    GRM_UI.ScaleFontStringToObjectSize(true, GRM_AddAltButton2:GetWidth(), GRM_UI.GRM_AddAltButton2Text  , 2);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName1:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -20);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName1:SetWidth(63);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName1:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName1:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName2:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -20);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName2:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName2:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName3:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -37);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName3:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName3:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName4:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -37);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName4:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName4:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName4:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName5:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -54);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName5:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName5:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName5:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName6:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -54);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName6:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName6:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName6:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName7:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -71);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName7:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName7:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName7:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName8:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -71);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName8:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName8:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName8:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName9:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -88);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName9:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName9:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName9:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName10:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -88);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName10:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName10:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName10:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName11:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame, 1, -105);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName11:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName11:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName11:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    GRM_UI.GRM_CoreAltFrame.GRM_AltName12:SetPoint("TOPRIGHT", GRM_UI.GRM_CoreAltFrame, 0, -105);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName12:SetWidth(60);
    GRM_UI.GRM_CoreAltFrame.GRM_AltName12:SetJustifyH("CENTER");
    GRM_UI.GRM_CoreAltFrame.GRM_AltName12:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.5);

    -- ALT DROPDOWN OPTIONS
    GRM_UI.GRM_altDropDownOptions:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_MemberDetailMetaData, 15, 0);
    GRM_UI.GRM_altDropDownOptions:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_altDropDownOptions:SetFrameStrata("FULLSCREEN_DIALOG");
    GRM_UI.GRM_altOptionsText:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -13);
    GRM_UI.GRM_altOptionsText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_altOptionsText:SetText(GRM.L("Options"));
    GRM_UI.GRM_altSetMainButton:SetPoint ("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -22);
    GRM_UI.GRM_altSetMainButton:SetSize(60, 20);
    GRM_UI.GRM_altSetMainButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_altSetMainButtonText:SetPoint("LEFT", GRM_UI.GRM_altSetMainButton);
    GRM_UI.GRM_altSetMainButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_altRemoveButton:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -36);
    GRM_UI.GRM_altRemoveButton:SetSize(60, 20);
    GRM_UI.GRM_altRemoveButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_altRemoveButtonText:SetPoint("LEFT", GRM_UI.GRM_altRemoveButton);
    GRM_UI.GRM_altRemoveButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_altRemoveButtonText:SetText( GRM.L("Remove"));
    GRM_UI.GRM_altOptionsDividerText:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -55);
    GRM_UI.GRM_altOptionsDividerText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_altOptionsDividerText:SetText ("__");
    GRM_UI.GRM_altFrameCancelButton:SetPoint("TOPLEFT", GRM_UI.GRM_altDropDownOptions, 7, -65);
    GRM_UI.GRM_altFrameCancelButton:SetSize(60, 20);
    GRM_UI.GRM_altFrameCancelButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
    GRM_UI.GRM_altFrameCancelButtonText:SetPoint("LEFT", GRM_UI.GRM_altFrameCancelButton);
    GRM_UI.GRM_altFrameCancelButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_altFrameCancelButtonText:SetText(GRM.L("Cancel"));
end

-- Method:                  GR_MetaDataInitializeUIThird( boolean)
-- What it Does:            Initializes "More of the frames values/scripts"
-- Purpose:                 Can only have 60 "up-values" in one function. This splits it up.
GRM_UI.GR_MetaDataInitializeUIThird = function( isManualUpdate)

    --ADD ALT FRAME
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData, "BOTTOMRIGHT",  -7, 0);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetSize(130 +(#GRM_G.realmName * 3.5), 170);                -- Slightly wider for larger guild names.
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetToplevel(true);

    -- Scroll Frame Details
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame:SetSize(GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:GetWidth() - 10, 84);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame:SetPoint("TOP", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox, "BOTTOM", 2, 0);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame:SetScrollChild(GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetSize(20, 75);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame, "TOPRIGHT", -2.5, -9);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrame:SetVerticalScroll( self:GetValue())
    end);

    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText:SetPoint("TOP", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame, 0, - 20);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11, "THICKOUTLINE");
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText:SetText(GRM.L("Choose Alt"));
    
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameTextBottom:SetPoint("TOP", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame, -18, -146);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameTextBottom:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameTextBottom:SetTextColor(0.5, 0.5, 0.5, 1.0);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameTextBottom:SetText(GRM.L("(Press Tab)"));
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetPoint("CENTER", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetWidth(110);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetWordWrap(true);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:SetSpacing(1);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetPoint("BOTTOM", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame, 0, 30);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetText(GRM.L("Shift-Click Name On Roster Also Works"));
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetWidth(110);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetWordWrap(true);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText2:SetSpacing(1);
        
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetPoint( "TOP", GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltTitleText, "BOTTOM", 0, -5);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetSize(95 +(#GRM_G.realmName * 3.5), 25);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetMaxLetters(40);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:EnableMouse( true);
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetAutoFocus( false);

    GRM_UI.AddAltButtonControls = function(_, button)
        if button == "LeftButton" then
            -- Let's see if player is at hard cap first!
            for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do  -- Scanning through all entries
                if GRM_G.currentName == GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] then
                    if #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][11] >= 75 then
                        GRM.Report(GRM.L("Addon does not currently support more than 75 alts!"));
                    else
                        GRM_G.pause = true;
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetAutoFocus( true);
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetText( "");
                        GRM.AddAltAutoComplete();
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Show();
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetAutoFocus( false);
                    end
                    break;
                end
            end
        end
    end

    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetScript("OnHide", function()
        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(0);
        GRM_G.currentHighlightIndex = 0;
    end);

    -- ALT EDIT BOX LOGIC
    GRM_UI.GRM_AddAltButton:SetScript("OnClick", GRM_UI.AddAltButtonControls);
    GRM_UI.GRM_AddAltButton2:SetScript("OnClick", GRM_UI.AddAltButtonControls);

    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetScript("OnEscapePressed", function( self)
        self:ClearFocus();    
    end);

    -- Updating with each character typed
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetScript("OnChar", function () 
        GRM.AddAltAutoComplete();
    end);

    -- When pressing backspace.
    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetScript("OnKeyDown", function(self, key)
        if key == "BACKSPACE" then
            local text = self:GetText();
            if text ~= nil and #text > 0 then
                self:SetText(string.sub(text, 0, #text - 1)); -- Bring it down by 1 for function, then return to normal.
            end
            GRM.AddAltAutoComplete();
            self:SetText( text); -- set back to normal for normal Backspace upkey function... if I do not do this, it will delete 2 characters.
        elseif key == "DOWN" or key == "UP" or key == "TAB" then
            GRM_UI.AddAltSelectionControls(self, key);
        end
    end);

    -- GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetScript("OnTabPressed", GRM_UI.AddAltSelectionControls);

    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Hide();
        end
    end);

    GRM_UI.AddAltSelectionControls = function( _, key)
        local notSet = true;
        local buttons = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollChildFrame.AllButtons;
        local i = GRM_G.currentHighlightIndex;

        if key == "DOWN" or(key ~= "UP" and not IsShiftKeyDown()) then
            if i == 1 and notSet then
                if(i + 1) <= #buttons and buttons[i + 1][1]:IsVisible() then
                    GRM_G.currentHighlightIndex = 2;
                    buttons[i][1]:UnlockHighlight();
                    buttons[i + 1][1]:LockHighlight();
                    notSet = false;
                end
            else
                if(i + 1) <= #buttons and buttons[i + 1][1]:IsVisible() then
                    GRM_G.currentHighlightIndex = i + 1;
                    buttons[i][1]:UnlockHighlight();
                    buttons[i + 1][1]:LockHighlight();
                    notSet = false;
                    -- local maxValue = select(2, GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:GetMinMaxValues());
                    GRM_UI.SetAddAltSliderValue();
                else
                    GRM_G.currentHighlightIndex = 1;
                    buttons[i][1]:UnlockHighlight();
                    buttons[1][1]:LockHighlight();          -- Set it back to the first one...
                    notSet = false;
                    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(0);
                end
            end

        elseif key == "UP" or(key ~= "DOWN" and IsShiftKeyDown()) then
            -- -- if at position 1... shift-tab goes back to any position.
            if i == 1 and notSet then
                if buttons[GRM_G.NumberAltInSelection][1]:IsVisible() then
                    GRM_G.currentHighlightIndex = GRM_G.NumberAltInSelection;
                    buttons[i][1]:UnlockHighlight();
                    buttons[GRM_G.NumberAltInSelection][1]:LockHighlight();
                    notSet = false;
                    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(select(2, GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:GetMinMaxValues()));
                end
            else
                GRM_G.currentHighlightIndex = i - 1;
                buttons[i][1]:UnlockHighlight();
                buttons[i - 1][1]:LockHighlight();          -- Set it back to the first one...
                notSet = false;
                GRM_UI.SetAddAltSliderValue();
            end
        end
    end

    -- Method:          GRM_UI.SetAddAltSliderValue()
    -- What it Does:    Controls the points at which the slider is stationed when tab OR shift-tabbing
    -- Purpose:         Quality of Life controls for UI
    GRM_UI.SetAddAltSliderValue = function ()
        if GRM_G.currentHighlightIndex < 7 then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(0);
        elseif GRM_G.currentHighlightIndex > 6 and GRM_G.currentHighlightIndex < 13 then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(84);
        elseif GRM_G.currentHighlightIndex > 12 and GRM_G.currentHighlightIndex < 19 then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(168);
        elseif GRM_G.currentHighlightIndex > 18 and GRM_G.currentHighlightIndex < 25 then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(252);
        elseif GRM_G.currentHighlightIndex > 24 and GRM_G.currentHighlightIndex < 31 then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:SetValue(select(2, GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollFrameSlider:GetMinMaxValues()));
        end
    end

    GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetScript("OnEnterPressed", function( self)
        if self:HasFocus() then
            local currentText = self:GetText();
            if GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:IsVisible() and(GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:GetText() == GRM.L("Player Not Found") or GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrameHelpText:GetText() == GRM.L("Player Cannot Add Themselves as an Alt")) then
                if GRM.SlimName(GRM_G.currentName) == currentText or GRM_G.currentName == currentText then
                    GRM.Report(GRM.L("Player Cannot Add Themselves as an Alt"));
                end
                GRM.Report(GRM.L("Please choose a VALID character to set as an Alt"));
            else
                if currentText ~= nil and currentText ~= "" then
                    local result = GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltScrollChildFrame.AllButtons[GRM_G.currentHighlightIndex][2]:GetText();
                    result = GRM.RemoveMainAltTags(result);
                    if self:GetText() ~= result then
                        self:SetText(result);
                    else
                        -- Refresh alt frames
                        -- Add the alt here, Hide the frame
                        GRM.AddAlt(GRM_G.currentName, self:GetText(), false, 0);
                        GRM.SyncBirthdayWithNewAlt(self:GetText());

                        if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                            GRM.RefreshAuditFrames( GRM_G.AuditSortType);
                        end
                        if GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                            GRM.BuildAltGroupingScrollFrame();
                        end

                        -- Communicate the changes!
                        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] then
                            local syncRankFilter = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15];
                            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] then
                                syncRankFilter = GuildControlGetNumRanks() - 1;
                            end
                            GRMsync.SendMessage("GRM_SYNC", GRM_G.PatchDayString .. "?GRM_ADDALT?" .. syncRankFilter .. "?" .. GRM_G.currentName .. "?" .. self:GetText() .. "?" .. tostring(time()), "GUILD");
                        end

                        self:ClearFocus();
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Hide();
                    end
                else
                    GRM.Report(GRM.L("Please choose a character to set as alt."));
                end
            end
        end
    end);

    
    -- ALT FRAME LOGIC
    GRM_UI.GRM_altSetMainButton:SetScript("OnClick", function(_, button)
        
        if button == "LeftButton" then
            local altDetails = GRM_G.selectedAlt;
            local buttonName = GRM_UI.GRM_altSetMainButtonText:GetText();

            if buttonName == GRM.L("Set as Main") then
                GRM.SetAltAsMainDropDownMenuLogic(altDetails);

            elseif buttonName == GRM.L("Set as Alt") then
                GRM.DemoteMainToAltDropDownMenuLogic(altDetails);

            elseif buttonName == GRM.L("Edit Date") then
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankDateTxt:Hide();
                if GRM_G.editPromoDate then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_SetPromoDateButton:Click();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetText(GRM.L("Edit Promo Date"));
                elseif GRM_G.editJoinDate then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_JoinDateText:Hide();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateButton:Click();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetText(GRM.L("Edit Join Date"));
                elseif GRM_G.editBirthday then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:Hide();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:Click();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetText(GRM.L("Edit Birthday"));
                end

            elseif buttonName == GRM.L("Notify When Player is Active") then
                GRM.AddPlayerStatusCheck(altDetails[1], 1);
                GRM_G.pause = false;
            elseif buttonName == GRM.L("Notify When Player Comes Online") then
                GRM.AddPlayerStatusCheck(altDetails[1], 2);
                GRM_G.pause = false;
            elseif buttonName == GRM.L("Notify When Player Goes Offline") then
                GRM.AddPlayerStatusCheck(altDetails[1], 3);
                GRM_G.pause = false;
            end
            GRM_UI.GRM_altDropDownOptions:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
        end
    end);

    -- Also functions to clear history...
    GRM_UI.GRM_altRemoveButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            local buttonName = GRM_UI.GRM_altRemoveButtonText:GetText();
            local altDetails = GRM_G.selectedAlt;

            if buttonName == GRM.L("Remove") then
                GRM.RemoveAlt(altDetails[1], altDetails[2], false, 0, false);
                -- Send comm out of the changes!
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                    GRM.RefreshAuditFrames( GRM_G.AuditSortType);
                end
                if GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                    GRM.BuildAltGroupingScrollFrame();
                end
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] then
                    local syncRankFilter = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15];
                    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] then
                        syncRankFilter = GuildControlGetNumRanks() - 1;
                    end
                    GRMsync.SendMessage("GRM_SYNC", GRM_G.PatchDayString .. "?GRM_RMVALT?" .. syncRankFilter .. "?" .. altDetails[1] .. "?" .. altDetails[2] .. "?" .. tostring(time()), "GUILD");
                end

            elseif buttonName == GRM.L("Clear History") then
                if GRM_G.editPromoDate then
                    GRM.ClearPromoDateHistory(altDetails[1], false);
                elseif GRM_G.editJoinDate then
                    GRM.ClearJoinDateHistory(altDetails[1], false);
                end
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                    GRM.RefreshAuditFrames( GRM_G.AuditSortType);
                end

            elseif buttonName == GRM.L("Reset Data!") then
                GRM_UI.GRM_RosterConfirmFrameText:SetText( GRM.L("Reset All of {name}'s Data?", GRM.GetClassifiedName(altDetails[1], true)));
                GRM_UI.GRM_RosterConfirmYesButtonText:SetText(GRM.L("Yes!"));
                GRM_UI.GRM_RosterConfirmYesButton:SetScript("OnClick", function( _, button)
                    if button == "LeftButton" then
                        GRM.ResetPlayerMetaData(altDetails[1]);
                        GRM_UI.GRM_RosterConfirmFrame:Hide();
                        if GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then
                            GRM.RefreshAuditFrames( GRM_G.AuditSortType);
                        end
                    end
                end);
                GRM_UI.GRM_RosterConfirmFrame:Show();

            -- For birthdays
            elseif buttonName == GRM.L("Remove Date") then
                GRM.ResetBirthdayForAltGroup(altDetails[1], false, 0, nil);

            -- For player online and active status
            elseif buttonName == GRM.L("Notify When Player Goes Offline") then
                GRM.AddPlayerOfflineStatusCheck(altDetails[1]);
            end
            GRM_UI.GRM_altDropDownOptions:Hide();
            GRM_UI.GRM_MemberDetailMetaData.GRM_SyncJoinDateSideFrame:Hide();
        end
    end);

    GRM_UI.GRM_altFrameCancelButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            GRM_UI.GRM_altDropDownOptions:Hide();
            GRM_G.pause = false;
        end
    end);

    GRM_UI.GRM_altDropDownOptions:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_altDropDownOptions:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_altDropDownOptions:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_altDropDownOptions:Hide();
        end
    end);

    
    -- BUTTONS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:SetSize(90, 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:SetPoint("BOTTOMRIGHT", GuildRosterFrame, "TOPRIGHT", 0, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButtonText:SetText(GRM.L("Guild Log"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame:Hide();
            else
                GRM_UI.GRM_RosterChangeLogFrame:Show();
            end
        end
    end);

    if not isManualUpdate then

        -- These should not compete. Only one or the other will be visible.
        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:SetScript("OnShow", function()
            if GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
            end
        end);

        GuildRosterFrame:HookScript("OnShow", function ()
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:Show();
            GRM.ClearAllFrames(true);
            GRM_G.pause = false;
            GuildMemberDetailFrame:Hide();
            GRM_G.clubID = 0 --CommunitiesFrame:GetSelectedClubId();            -- Establish the clubID immediately...
        end);

        -- Show button on window open
        GuildRosterFrame:HookScript("OnHide", function ()
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LoadLogButton:Hide();
        end);

        -- Close Meta data window
        GuildRosterFrame:HookScript("OnHide", function ()
            GRM.ClearAllFrames( true);
            GRM_UI.GRM_MemberDetailMetaData:Hide();
        end);
        
        GuildRosterContainerScrollChild:HookScript("OnHide", function()
            GRM.ClearAllFrames( true);
            GRM_UI.GRM_MemberDetailMetaData:Hide();
        end);


        -- GUILD INFO AND MOTD NOTE COUNTS

        GuildInfoEditMOTDButton:HookScript("OnClick", function( _, button)
            if button == "LeftButton" then
                GuildTextEditBox:HighlightText( 0);
                GuildTextEditFrame.GuildMOTDcharCount:SetText( #GuildTextEditBox:GetText() .. "/" .. GuildTextEditBox:GetMaxLetters());
                GuildTextEditFrame.GuildMOTDcharCount:Show();
            end
        end);

        GuildTextEditBox:HookScript("OnEditFocusLost", function()
            GuildTextEditFrame.GuildMOTDcharCount:Hide();
        end);

        GuildTextEditBox:HookScript("OnEditFocusGained", function()
            GuildTextEditFrame.GuildMOTDcharCount:Show();
        end);

        GuildTextEditBox:HookScript("OnTextChanged", function( self)
            GuildTextEditFrame.GuildMOTDcharCount:SetText( #self:GetText() .. "/" .. self:GetMaxLetters());
        end)
        
        GuildInfoEditDetailsButton:HookScript("OnClick", function( _, button)
            if button == "LeftButton" then
                GuildTextEditFrame.GuildMOTDcharCount:SetText( #GuildTextEditBox:GetText() .. "/" .. GuildTextEditBox:GetMaxLetters());
                GuildTextEditFrame.GuildMOTDcharCount:Show();
            end
        end);
    end
    
    -- -- Needs to be initialized AFTER guild frame first logs or it will error, so only making it here now.
    GuildTextEditFrame.GuildMOTDcharCount = GuildTextEditFrame:CreateFontString("GuildMOTDcharCount", "OVERLAY", "GameFontNormalSmall");
    GuildTextEditFrame.GuildMOTDcharCount:SetPoint("TOPRIGHT", GuildTextEditFrame, -33, -18)
    GuildTextEditFrame.GuildMOTDcharCount:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);

    GuildTextEditFrame:HookScript("OnHide", function()
        GRM.UpdateGuildLeaderPermissions( true);
    end);
end

-- Method:          GRM.PreAddonLoadUI()
-- What it Does:    Initializes the core Log Frame before the addon loads
-- Purpose:         One cannot use methods like "SetUserPlaced" to carry over between sessions sunless the frame is initalized BEFORE "ADDON_LOADED" event fires.
GRM_UI.PreAddonLoadUI = function()
    GRM_UI.GRM_RosterChangeLogFrame:SetPoint("CENTER", UIParent);
    GRM_UI.GRM_RosterChangeLogFrame:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame:EnableMouse(true);
    GRM_UI.GRM_RosterChangeLogFrame:SetMovable(true);
    GRM_UI.GRM_RosterChangeLogFrame:SetUserPlaced(true);
    GRM_UI.GRM_RosterChangeLogFrame:SetToplevel(true);
    -- GRM_UI.GRM_RosterChangeLogFrame:SetResizable(true);
    GRM_UI.GRM_RosterChangeLogFrame:RegisterForDrag("LeftButton");
    GRM_UI.GRM_RosterChangeLogFrame:SetScript("OnDragStart", GRM_UI.GRM_RosterChangeLogFrame.StartMoving);
    GRM_UI.GRM_RosterChangeLogFrame:SetScript("OnDragStop", GRM_UI.GRM_RosterChangeLogFrame.StopMovingOrSizing);

    -- OPTIONS TAB FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:SetAlpha(0);

    -- LOG TAB FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:SetSize(600, 465);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:SetScript("OnHide", function( self)
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
        if self.GRM_RosterChangeLogScrollFrameSlider.ScrollCount > 1000 then                                                -- Only reset if it hits Blizz's internal limits...
            self.GRM_RosterChangeLogScrollFrameSlider.MaxValue = 0;
            self.GRM_RosterChangeLogScrollFrameSlider.ScrollCount = 50;
            self.GRM_RosterChangeLogScrollFrameSlider:SetValue(0);
        end

        -- The new info / old log headers to be added or not.
        GRM_G.FirstTimeViewed = false;
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:SetScript("OnShow", function()
        GRM.BuildLogComplete( false);
        GRM_G.SearchFocusControl = true;
    end);

    -- ADDON USERS FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:SetAlpha(0);

    -- EVENTS TO ADD FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:SetAlpha(0);

    -- BAN LIST FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:SetAlpha(0);

    -- AUDIT FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetSize(600, 465);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetAlpha(0);

    -- TAB BUTTONS
    -- Change Log Tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetText(GRM.L("LOG"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:Show();
                GRM_UI.GRM_RosterCheckBoxSideFrame:Show()
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(GRM_UI.GRM_RosterCheckBoxSideFrame, nil, false);
            end
        end
    end);
    -- Event to add tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetText(GRM.L("EVENTS"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:Show();
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(nil, GRM_UI.GRM_RosterCheckBoxSideFrame, false);
            end
        end
    end);
    
    -- Add Event Frame
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetScript("OnUpdate", function( self, elapsed)
        GRM_G.eventTimer = GRM_G.eventTimer + elapsed;
        if GRM_G.eventTimer >= 2 then
            if GRM_G.saveGID ~=0 then
                if #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] > 1 and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][8] and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][12] then
                    self:SetText(GRM.L("EVENTS") .. ": " .. #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] - 1);     -- First index will be nil.
                else
                    self:SetText(GRM.L("EVENTS"));
                end
                GRM_UI.ScaleFontStringToObjectSize(true, 95, self:GetFontString(), 2);
            end
            GRM_G.eventTimer = 0;
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        if CanEditGuildEvent() then
            GameTooltip:AddLine( GRM.L("Add Upcoming Events to the Calendar"));
        else
            GameTooltip:AddLine( GRM.L("Player rank unable to add events to calendar"), 1, 0, 0);
            GameTooltip:AddLine( GRM.L("Anniversaries, Birthdays, and Other Events can be added with permission"));
        end
        GameTooltip:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- ban list tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetText(GRM.L("BAN LIST"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:Show();
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(nil, GRM_UI.GRM_RosterCheckBoxSideFrame, false);
            end
        end
    end);

    -- Method:          GRM_UI.UpdateBanTabCurrentlyInGuild()
    -- What it Does:    Updates the text on the ban list tab
    -- Purpose:         A good reminder to check if there are people in the guild still but are banned.
    GRM_UI.UpdateBanTabCurrentlyInGuild = function()
        GRM_G.numberInGuildBans = GRM.GetNumberOfPlayerSBannedCurrentlyInGuild();
        if GRM_G.numberInGuildBans > 0 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetText(GRM.L("BAN LIST") .. ": " .. GRM_G.numberInGuildBans);     -- First index will be nil.
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetText(GRM.L("BAN LIST"));
        end
        GRM_UI.ScaleFontStringToObjectSize(true, 95, GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:GetFontString(), 2);
    end
    
    -- Add Event Frame
    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetScript("OnUpdate", function( self, elapsed)
        GRM_G.banListTimer = GRM_G.banListTimer + elapsed;
        if GRM_G.banListTimer >= 60 then
            if GRM_G.saveGID ~= 0 then
                GRM_UI.UpdateBanTabCurrentlyInGuild();
            end
            GRM_G.banListTimer = 0;
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetScript("OnEnter", function( self)
        if GRM_G.numberInGuildBans > 0 then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            if GRM_G.numberInGuildBans > 1 then
                GameTooltip:AddLine( GRM.L("|cffff0000WARNING!!!|r {num} BANNED players are currently in the guild.", nil, nil, GRM_G.numberInGuildBans));
            else
                GameTooltip:AddLine( GRM.L("|cffff0000WARNING!!!|r {num} BANNED player is currently in the guild.", nil, nil, GRM_G.numberInGuildBans));
            end
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    
    -- Audit Tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetText(GRM.L("AUDIT"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:Show();
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(nil, GRM_UI.GRM_RosterCheckBoxSideFrame, false);
            end
        end
    end);
    -- Current Addon Users Tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetText(GRM.L("SYNC USERS"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:Show();
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(nil, GRM_UI.GRM_RosterCheckBoxSideFrame, false);
            end
        end
    end);
    -- Options Tab
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetSize(99.2, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetFrameStrata("MEDIUM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetText(string.upper(GRM.L("Options")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:IsVisible() then -- Since the height is a double, returns it as an int using math.floor
                GRM.DisableTabButtons(true);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame:Show();
                GRM_UI.GRM_RosterCheckBoxSideFrame:Show()
                GRM.FrameTransition(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, GRM.GetTransitionFrameToFade(), true);
                GRM.FrameTransition(GRM_UI.GRM_RosterCheckBoxSideFrame, nil, false);
            end
        end
    end);

    -- Initialize the Minimap
    GRM_UI.GRM_MinimapButton:EnableMouse(true);
    GRM_UI.GRM_MinimapButton:SetMovable(false);
    GRM_UI.GRM_MinimapButton:SetFrameStrata("HIGH");
    GRM_UI.GRM_MinimapButton:SetWidth(33);
    GRM_UI.GRM_MinimapButton:SetHeight(33);
    GRM_UI.GRM_MinimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight");
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonIcon:SetWidth(20);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonIcon:SetHeight(20);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonIcon:SetPoint("CENTER", GRM_UI.GRM_MinimapButton, -2, 1);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonIcon:SetTexture("Interface\\Icons\\garrison_building_magetower");
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonBorder:SetWidth(52);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonBorder:SetHeight(52);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonBorder:SetPoint("TOPLEFT", GRM_UI.GRM_MinimapButton);
    GRM_UI.GRM_MinimapButton.GRM_MinimapButtonBorder:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder");


    GRM_UI.GRM_MinimapButtonInit  = function()
        -- Initialise defaults if not present
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][32] == false then
            GRM_UI.GRM_MinimapButton:Hide()
        else
            GRM_UI.GRM_MinimapButton:Show()
        end
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] or 78;
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25] = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25] or 345;
        
        GRM_UI.GRM_MinimapButtonUpdatePos()
    end

    GRM_UI.GRM_MinimapButtonUpdatePos = function()
        if not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][63] then
            GRM_UI.GRM_MinimapButton:ClearAllPoints();
            GRM_UI.GRM_MinimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 54 -(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] * cos(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25])) ,(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] * sin(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25])) - 55);
        else
            GRM_UI.GRM_MinimapButton:ClearAllPoints();
            GRM_UI.GRM_MinimapButton:SetPoint(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][64][1], UIParent, GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][64][2], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25]);
        end
    end

    -- Method:          GRM_UI.ResetMinimapPositionToDefault()
    -- What it Does:    Sets the minimap icon back to default position.
    GRM_UI.ResetMinimapPositionToDefault = function()
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] = 78;
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25] = 345;
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][63] = false;
        GRM_UI.GRM_MinimapButtonUpdatePos();
    end

    -- Thanks to Yatlas for this code
    GRM_UI.GRM_MinimapButtonDuringDrag = function()
        local x, y = GetCursorPosition()
        local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom();

        x = xmin - x / UIParent:GetScale() + 70;
        y = y / UIParent:GetScale() - ymin - 70;

        local vector = math.deg(math.atan2(y, x));
        if vector < 0 then
            vector = vector + 360
        end
        if GRM_G.setPID == 0 then
            for i = 2, #GRM_AddonSettings_Save[GRM_G.FID] do
                if GRM_AddonSettings_Save[GRM_G.FID][i][1] == GRM_G.addonPlayerName then
                    GRM_G.setPID = i;
                    break;
                end
            end
        end
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25] = vector;
        GRM_UI.GRM_MinimapButtonUpdatePos();
    end

    GRM_UI.MinimapOnLeave = function ()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end
 
    GRM_UI.GRM_MinimapButton:RegisterForDrag("LeftButton");
    GRM_UI.GRM_MinimapButton:SetScript("OnDragStart", function(self)
        if not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][63] and not IsControlKeyDown() then
            -- Circular motion.
            self:SetScript("OnUpdate", GRM_UI.GRM_MinimapButtonDuringDrag);
        elseif not IsControlKeyDown() then
            -- Reset Position
            GRM_UI.ResetMinimapPositionToDefault();
        else
            -- Draggable anywhere.
            GRM_UI.GRM_MinimapButton:SetMovable(true);
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][63] = true;
            self:StartMoving();
        end
    end);
    GRM_UI.GRM_MinimapButton:SetScript("OnDragStop", function(self)
        self:SetScript("OnUpdate", nil);
        self:StopMovingOrSizing();
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][63] then
            local side1, _, side2, point1, point2 = GRM_UI.GRM_MinimapButton:GetPoint();
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][64][1] = side1;
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][64][2] = side2;
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][26] = point1;
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][25] = point2;
        end
        GRM_UI.GRM_MinimapButton:SetMovable(false);
    end)
    GRM_UI.GRM_MinimapButton:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_LEFT");
        GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("GRM") .. " " .. string.sub(GRM_G.Version, string.find(GRM_G.Version, "R") + 1));
        GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to open GRM"));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FLeft-Click|r and drag to move this button."));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FCtrl-Left-Click|r and drag to move this button anywhere."));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FCtrl-Shift-Click|r to Hide this Button."));

        local MOTD = GetGuildRosterMOTD();
        if MOTD ~= "" and MOTD ~= nil then
            MOTD = GRM.Trim(MOTD);          -- Cleans it up since I noticed in some cases Blizz doesn't.
            local maxLength = 65;
            -- Logic to split the MOTD if necessary...
            if #MOTD > maxLength then
                local breakIndex = 1;
                -- Check if space before, and if so, set break point.
                if string.find(string.sub(string.sub( MOTD, 1, maxLength), maxLength - 25), " ", -25) ~= nil then
                    for i = maxLength, maxLength - 25, -1 do
                        if string.sub(MOTD, i, i) == " " then
                            breakIndex = i;
                            break;
                        end
                    end
                else
                    -- Set break point any point after...
                    if string.find(string.sub(MOTD, maxLength + 1), " ") ~= nil then
                        breakIndex = string.find(string.sub(MOTD, maxLength + 1), " ");
                    end
                end
                if breakIndex ~= 1 then
                    MOTD = string.sub(MOTD, 1, breakIndex - 1) .. "\n" .. string.sub(MOTD, breakIndex + 1);
                end
            end
            GameTooltip:AddLine("|CFFFF0000" .. GRM.L("MOTD:"));
            GameTooltip:AddLine(MOTD);
        end
        GameTooltip:Show();
    end)

    GRM_UI.GRM_MinimapButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if IsShiftKeyDown() and IsControlKeyDown() then
                self:Hide();
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][32] = false;
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton ~= nil and GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:IsVisible() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:SetChecked(false);
                end
            else
                if GRM_UI.GRM_RosterChangeLogFrame:IsVisible() then
                    GRM_UI.GRM_RosterChangeLogFrame:Hide();
                else
                    if IsInGuild() then
                        if(time() - GRMsyncGlobals.timeAtLogin) > 5 or GRM_G.MinimapOk then
                            if not GRM_G.minmapButtonDelay then
                                GRM.DelayMinimapButtonOpen(false, false);
                            end
                        else
                            GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("One moment, GRM is still being configured."));
                        end
                    else
                        GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("Player is Not Currently in a Guild"));
                    end
                end
            end
        end
    end)

    GRM_UI.GRM_MinimapButton:SetScript("OnLeave", GRM_UI.MinimapOnLeave);
end


-- Method           GRM.MetaDataInitializeUIrosterLog1( boolean)
-- What it Does:    Keeps the log initialization separate and part of the UIParent, so it can load upon logging in
-- Purpose:         Resource control. This loads upon login, but keeps the rest of the addon UI initialization from occuring unless as needed.
--                  In other words, this can be loaded upon logging, but the rest will only load if the guild roster window loads.
GRM_UI.MetaDataInitializeUIrosterLog1 = function( isManualUpdate)

    -- TOOLTIP INIT rescaling -- potentially add scalable tooltip option
    if not isManualUpdate then
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailRankToolTip:SetScale(0.85);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailJoinDateToolTip:SetScale(0.85);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailServerNameToolTip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_OfficerNoteTooltip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNotifyStatusChangeTooltip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailNJDSyncTooltip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupHeaderTooltip:SetScale(0.65);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanHeaderTooltip:SetScale(0.65);
        GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayTooltip:SetScale(0.65);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip:SetScale(0.85);
    end

    -- Gotta update the tabs
    if isManualUpdate then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:SetText(GRM.L("LOG"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_AddEventTab:SetText(GRM.L("EVENTS"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_BanListTab:SetText(GRM.L("BAN LIST"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_GuildAuditTab:SetText(GRM.L("AUDIT"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersTab:SetText(GRM.L("SYNC USERS"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsTab:SetText(string.upper(GRM.L("Options")));
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 1 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  |cffff0000Officer Note|r"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
        elseif GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 2 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText("|cffff0000" .. GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
        elseif GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 3 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText("|cffff0000" .. GRM.L("Custom Note"));
        end
    end

    -- Popup window to confirm!
    GRM_UI.GRM_RosterConfirmFrame:Hide();
    GRM_UI.GRM_RosterConfirmFrame:SetPoint("CENTER", UIPanel, 0, 200);
    GRM_UI.GRM_RosterConfirmFrame:SetSize(275, 90);
    GRM_UI.GRM_RosterConfirmFrame:SetFrameStrata("FULLSCREEN_DIALOG");
    GRM_UI.GRM_RosterConfirmFrameText:SetPoint("CENTER", GRM_UI.GRM_RosterConfirmFrame, 0, 10);
    GRM_UI.GRM_RosterConfirmFrameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterConfirmFrameText:SetWidth(265);
    GRM_UI.GRM_RosterConfirmFrameText:SetSpacing(1);
    GRM_UI.GRM_RosterConfirmFrameText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterConfirmYesButton:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterConfirmFrame, 15, 5);
    GRM_UI.GRM_RosterConfirmYesButton:SetSize(70, 35);
    GRM_UI.GRM_RosterConfirmYesButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterConfirmYesButton);
    GRM_UI.GRM_RosterConfirmYesButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);

    GRM_UI.GRM_RosterConfirmCancelButton:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterConfirmFrame, -15, 5);
    GRM_UI.GRM_RosterConfirmCancelButton:SetSize(70, 35);
    GRM_UI.GRM_RosterConfirmCancelButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterConfirmCancelButton);
    GRM_UI.GRM_RosterConfirmCancelButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterConfirmCancelButtonText:SetText(GRM.L("Cancel"));
    GRM_UI.ScaleFontStringToObjectSize(true, 70, GRM_UI.GRM_RosterConfirmCancelButtonText, 4);
    GRM_UI.GRM_RosterConfirmCancelButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            GRM_UI.GRM_RosterConfirmFrame:Hide();
        end
    end);
    GRM_UI.GRM_RosterConfirmFrame:SetScript("OnHide", function ()
        GRM_UI.GRM_RosterChangeLogFrame:EnableMouse(true);
        GRM_UI.GRM_RosterChangeLogFrame:SetMovable(true);
    end);

    -- MAIN GUILD LOG FRAME!!!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameTitleText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame, 0, - 3.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameTitleText:SetText(GRM.L("Guild Roster Event Log"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame, "TOPRIGHT", -20, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText:SetWidth(180);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogFrameNumEntriesText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterCheckBoxSideFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPRIGHT", -3, 3);
    GRM_UI.GRM_RosterCheckBoxSideFrame:SetSize(200, 418); 
    -- Scroll Frame Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollBorderFrame:SetSize(584, 450);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollBorderFrame:SetPoint("Bottom", GRM_UI.GRM_RosterChangeLogFrame, "BOTTOM", -10, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame:SetSize(566, 427);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame:SetPoint( "Bottom", GRM_UI.GRM_RosterChangeLogFrame, "BOTTOM", -3, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetOrientation("VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetSize(20, 405);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame, "TOPRIGHT", -2.5, -12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetValue(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrameSlider:SetScript("OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollFrame:SetVerticalScroll(self:GetValue());
        if GRM.InfiniteScrollNeeeded(self) then
            GRM.BuildLog();
        end
    end);

    -- Log window Editbox Logic
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetSize(175, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "TOPLEFT", 13, -2.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetMaxLetters(30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetAutoFocus( false)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetText(GRM.L("Search Filter"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnEscapePressed", function( self)
        self:ClearFocus();
        self:SetText(GRM.L("Search Filter"));
        GRM.BuildLogComplete( true);
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnEditFocusGained", function( self)
        if self:GetText() == GRM.L("Search Filter") then
            self:SetText("");
        else
            self:HighlightText(0);
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnEditFocusLost", function( self)
        if self:GetText() == "" then
            self:SetText(GRM.L("Search Filter"));
        else
            self:HighlightText(0, 0);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnEnterPressed", function( self)
        if self:GetText() == "" then
            self:SetText(GRM.L("Search Filter"));
            GRM.BuildLogComplete( true);
        end
        self:ClearFocus();
    end);

    -- Method:          GRM_UI.LogEditBoxTimingControl()
    -- What it Does:    Slows the repeat asks to rebuild the log 
    -- Purpose:         to prevent spammy disconnect and needless resource wastage
    GRM_UI.LogEditBoxTimingControl = function()
        if time() - GRM_G.logTimer >= 0.2 then
            GRM_G.logTimer = time();
            GRM.BuildLogComplete( true);
        else
            C_Timer.After(0.2, GRM_UI.LogEditBoxTimingControl);
        end
    end
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnTextChanged", GRM_UI.LogEditBoxTimingControl);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetScript("OnShow", function(self)
        if self:GetText() == "" then
            self:SetText(GRM.L("Search Filter"));
        end
    end);

    -- LOG TOOLS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "BOTTOMLEFT", -4, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:SetSize(608, 155);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton:SetSize(80, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:Hide();
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:Show();
            end
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetText(GRM.L("Open Log Tools"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetWidth(70);
    GRM_UI.ScaleFontStringToObjectSize(false, 40, GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText, 3);
    GRM_UI.ScaleFontStringToObjectSize(true, 80, GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText, 2);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:SetScript("OnHide", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetText(GRM.L("Open Log Tools"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:SetScript("OnShow", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsButton.GRM_LogExtraOptionsButtonText:SetText(GRM.L("Hide Log Tools"));
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][36] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:SetChecked(true);
        end
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][37] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton:SetChecked(true);
        end
    end);

    -- Export Frames and their logic...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "TOPLEFT", 15, -15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButtonText:SetText(GRM.L("Numbered Lines"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][36] = true;
                GRM.BuildLogComplete( true);
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][36] = false;
                GRM.BuildLogComplete( true);
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton, "BOTTOMLEFT", 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButtonText:SetText(GRM.L("Auto-Focus the search box"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][66] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][66] = false;
            end
            GRM.SyncSettings();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("This will skip the first time if set to load on logon"));
        GameTooltip:Show();
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Export Button
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "TOP", 0, -15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton:SetSize(80, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:Show();
            local searchText = GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:GetText();
            if searchText == "" or searchText == GRM.L("Search Filter") then
                searchText = nil;
            end
            GRM.BuildExportLogFrame(GRM_G.guildName, 2, -1, searchText);
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton.GRM_ExportButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton.GRM_ExportButtonText:SetText(GRM.L("Export Log"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton.GRM_ExportButtonText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton.GRM_ExportButtonText:SetWidth(70);

    -- Clear Log Button
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton:SetSize(80, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame, "TOPRIGHT", -15, -15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton, 0, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButtonText:SetWidth(78);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButtonText:SetText(GRM.L("Clear Log"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_RosterClearLogButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM_UI.GRM_RosterChangeLogFrame:EnableMouse( false);
            GRM_UI.GRM_RosterChangeLogFrame:SetMovable( false);
            GRM_UI.GRM_RosterConfirmFrameText:SetText( GRM.L("Really Clear the Guild Log?"));
            GRM_UI.GRM_RosterConfirmYesButtonText:SetText(GRM.L("Yes!"));
            GRM_UI.GRM_RosterConfirmYesButton:SetScript("OnClick", function( _, button)
                if button == "LeftButton" then
                    GRM.ResetLogReport();       --Resetting!
                    GRM_UI.GRM_RosterConfirmFrame:Hide();
                end
            end);
            GRM_UI.GRM_RosterConfirmFrame:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton, "BottomLeft", 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButtonText:SetText(GRM.L("Enable Ctrl-Shift-Click Line Removal"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][37] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][37] = false;
        end
        GRM.SyncSettings();
    end);


    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText1:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogEnableRmvClickCheckButton, "BOTTOMLEFT", 6, -14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText1:SetText(GRM.L("Clear Lines:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText1:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11.5);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1, "RIGHT", 8, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText2:SetText(GRM.L("To"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText2:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11.5);

    -- Extra Log Options Editboxes
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetSize(50, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText1, "RIGHT", 12, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetMaxLetters(4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetAutoFocus( false)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetText("0");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetSize(50, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraText2, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetMaxLetters(4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetAutoFocus( false)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetText("0");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton:SetSize(80, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExportButton, "BOTTOM", 0, -40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton.GRM_ConfirmClearButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton.GRM_ConfirmClearButtonText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton.GRM_ConfirmClearButtonText:SetText(GRM.L("Confirm Clear"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton.GRM_ConfirmClearButtonText:SetWidth(70);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_ConfirmClearButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            local numBox1 = tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:GetText());
            local numBox2 = tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:GetText());
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:ClearFocus();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:ClearFocus();
            if numBox1 == 0 and numBox1 == numBox2 then
               GRM.Report(GRM.L("Please Select Range of Lines from the Log You Wish to Remove"));
            elseif numBox1 > numBox2 then
                GRM.Report(GRM.L("Please put the lowest number in the first box"));
            elseif numBox1 > GRM_G.FinalCountVisible then
                GRM.Report(GRM.L("Line selection is not valid"));
                if not GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:GetChecked() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogShowLinesCheckButton:SetChecked(true);
                    GRM.Report(GRM.L("Enabling Line Numbers... Please choose within the given range"));
                    GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][36] = true;
                    GRM.BuildLogComplete( true);
                end
            else
                GRM_UI.GRM_RosterChangeLogFrame:EnableMouse( false);
                GRM_UI.GRM_RosterChangeLogFrame:SetMovable( false);
                if numBox2 > GRM_G.FinalCountVisible then
                    numBox2 = GRM_G.FinalCountVisible;
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetText(numBox2);
                end
                if numBox1 == numBox2 then 
                    GRM_UI.GRM_RosterConfirmFrameText:SetText( GRM.L("Really Clear line {num}?", nil, nil, numBox1));
                else
                    GRM_UI.GRM_RosterConfirmFrameText:SetText( GRM.L("Really Clear lines {custom1} to {custom2}?", nil, nil, nil, numBox1, numBox2));
                end
                GRM_UI.GRM_RosterConfirmYesButtonText:SetText(GRM.L("Yes!"));
                GRM_UI.GRM_RosterConfirmYesButton:SetScript("OnClick", function( _, button)
                    if button == "LeftButton" then
                        GRM.ClearVisibleLogLinesWithinRange(numBox1, numBox2);
                        GRM_UI.GRM_RosterConfirmFrame:Hide();
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetText("0");
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetText("0");
                        GRM.BuildLogComplete( true);
                    end
                end);
                GRM_UI.GRM_RosterConfirmFrame:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetScript("OnEscapePressed", function( self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetScript("OnEditFocusGained", function(self)
        self:HighlightText( 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetScript("OnEditFocusLost", function(self)
        self:HighlightText( 0, 0);
        if self:GetText() == "" then
            self:SetText("0");
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetScript("OnTabPressed", function(self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetFocus();
        GRM_G.LogNumbersColorUpdate = true;
        GRM.BuildLogComplete( true);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetScript("OnEnterPressed", function( self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
        GRM_G.LogNumbersColorUpdate = true;
        GRM.BuildLogComplete( true);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetScript("OnEscapePressed", function( self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetScript("OnEditFocusGained", function(self)
        self:HighlightText( 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetScript("OnEditFocusLost", function(self)
        if tonumber(self:GetText()) ~= nil and tonumber(self:GetText()) > GRM_G.FinalCountVisible then
            self:SetText(GRM_G.FinalCountVisible);
        end
        self:HighlightText( 0, 0);
        if self:GetText() == "" then
            self:SetText("0");
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetScript("OnTabPressed", function(self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetFocus();
        GRM_G.LogNumbersColorUpdate = true;
        GRM.BuildLogComplete( true);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetScript("OnEnterPressed", function( self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText("0");
        end
        GRM_G.LogNumbersColorUpdate = true;
        GRM.BuildLogComplete( true);
    end);

    -- Log One Click Behavior
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_RosterChangeLogScrollChildFrame:SetScript("OnMouseDown", function(self, button) 
        if button == "LeftButton" and IsControlKeyDown() and IsShiftKeyDown() and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][37] and not GRM_UI.GRM_RosterConfirmFrame:IsVisible() then
            for i = 1, #self.allFontStrings do
                if self.allFontStrings[i][1]:IsMouseOver(1, -1, -1, 1) then
                    GRM.RemoveItemFromLog(self.allFontStrings[i][1]:GetText(), true);
                    break;
                end
            end
        end
    end);


    -- LOG EXPORT 
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetPoint("CENTER", UIPanel);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetSize(463, 500);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetFrameStrata("DIALOG");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetToplevel(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetMovable(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:EnableMouse(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:RegisterForDrag("LeftButton");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetScript("OnDragStart", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.StartMoving);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetScript("OnDragStop", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.StopMovingOrSizing);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_BorderFrameCloseButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame, "TOPRIGHT", 2, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_BorderFrameCloseButton:SetWidth(30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLogText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame, 0, -25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLogText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLogText:SetText(GRM.L("Ctrl-C to Copy <> Ctrl-P to Paste <> Ctrl-A to Select All"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLoadingText:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLoadingText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLoadingText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame.GRM_ExportLoadingText:SetText(GRM.L("Building Log for Export..."));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetSize(430, 428);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetAutoFocus(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetMultiLine(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:EnableMouse(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetSpacing(2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetTextInsets(2, 3, 3, 2);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame:SetSize(440, 433);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame:SetPoint( "Bottom", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame, "BOTTOM", 3, 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetOrientation("VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetSize(20, 403)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame, "TOPRIGHT", 4, -15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetValue(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrameSlider:SetScript("OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogScrollFrame:SetVerticalScroll(self:GetValue());          
    end);

    -- Export Frames and their logic...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogBorderFrame:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetScript("OnEscapePressed", function(self)
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetScript("OnEditFocusGained", function(self)
        self:HighlightText( 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_ExportLogFrameEditBox:SetScript("OnEditFocusLost", function(self)
        self:HighlightText( 0, 0);
    end);

    -- OPTIONS TABS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2, "BOTTOMLEFT", 1, 7);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetText(GRM.L("General"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetScript("OnShow", function()
        local count = GRML.GetNumberUntranslatedLines(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][43]);
        if GRM_G.Region == "enUS" then
            count = count - 10;
        end
        if count > 0 and not GRML.TranslationStatusEnum[ GRML.Languages [ GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][43] ] ] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetText(GRM.L("{num} phrases still need translation to {name}", GRML.Languages[GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][43]], nil, count));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:Show();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:Hide();
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("General"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetText(GRM.L("Scan"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Scan"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanTab, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetText(GRM.L("Sync"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Sync"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3, "BOTTOMRIGHT", -1, 7);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetText(GRM.L("Help"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Help"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab, "BOTTOM", 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetText(GRM.L("UI"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("UI Controls"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetPoint("RIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpTab, "LEFT", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetText(GRM.L("Backup"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Hide();

                -- Now load the correct frame as well...
                if not GRM_G.BackupLoadedOnce then
                    GRM_G.BackupLoadedOnce = true;
                    if GRM_G.FID == 1 then
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:LockHighlight();
                        GRM_G.selectedFID = 1;
                        GRM.BuildBackupScrollFrame(1);
                    else
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:LockHighlight();
                        GRM_G.selectedFID = 2;
                        GRM.BuildBackupScrollFrame(2);
                    end
                end
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Backup"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetPoint("RIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UITab, "LEFT", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetSize(76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetText(GRM.L("Officer"));
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab, nil, 76, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:IsVisible() then
                self:LockHighlight();
                GRM.OptionTabFrameControl(self);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:Show();
            end
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Officer"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerTab:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);
    
    -- Options Frames
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:SetSize(600, 410);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:SetSize(600, 410);
    
    -- no need to reset the frames if the UI is already loaded.
    if not GRM_G.UIIsLoaded then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralTab:LockHighlight();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:SetAlpha(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame:Hide();
    end
   

    -- OPTIONS TEXT INFO
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame, 0, - 30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText:SetText(string.upper(GRM.L("Options")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame, "TOPLEFT", 10, - 35);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2:SetText("_____________________");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame, "TOPRIGHT", -10, - 35);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3:SetText("_____________________");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame, 18, - 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText:SetText(GRM.L("Scanning Roster:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame, 18, -12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText:SetText(GRM.L("Guild Rank Restricted:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton, "BOTTOMLEFT", 7, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText:SetText(GRM.L("Force Settings with Guild Info Tags"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame, 18, - 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText:SetText(GRM.L("Sync:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame, 18, - 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText:SetText(GRM.L("General:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame, 18, - 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText:SetText(GRM.L("UI Configuration:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    -- BACKUP OPTIONS FRAME
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText2, "BOTTOMLEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][34] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][34] = false;
        end
        GRM.SyncSettings();
    end);

    -- Backup Frame tooltip setup
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip:SetWidth(300);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNameTooltip:SetFrameStrata("DIALOG");
    -- Backup Right click dropdown
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetWidth(230);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetText(GRM.L("Click Here to Remove all traces of this guild, or hit ESC"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOptionText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:SetSize(250, 55);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:SetFrameStrata("FULLSCREEN_DIALOG");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton:SetSize(235, 40);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");   
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption, "LEFT", 8, 0);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption.GRM_BackupPurgeGuildOptionButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            GRM_G.changeHappenedExitScan = true;
            local faction = "Horde";
            if GRM_G.selectedFID == 2 then
                faction = "Alliance";
            end
            GRM.PurgeGuildFromDatabase(GRM_G.BackupFrameSelectDetails[2], GRM_G.BackupFrameSelectDetails[3], faction);
            -- Need to set IDs again!
            GRM.EstablishDatabasePoints(true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:Hide();
            GRM_UI.GRM_MemberDetailMetaData:Hide();
            GRM.BuildBackupScrollFrame( GRM_G.selectedFID);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetScript("OnUpdate", GRM.BuildBackupFrameTooltip);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetScript("OnShow", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:Hide();
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame:SetScript("OnMouseDown", function(self, button)
        if button == "RightButton" and GRM.GetClickedStringFromBackupFrameDetails() then
            if self.GRM_BackupPurgeGuildOption:IsVisible() then
                self.GRM_BackupPurgeGuildOption:Hide();
            else
                self.GRM_BackupPurgeGuildOption:ClearAllPoints();
                self.GRM_BackupPurgeGuildOption:SetPoint( "RIGHT", self.GRM_CoreBackupScrollChildFrame.AllBackupButtons[GRM_G.BackupFrameSelectDetails[1]][1], "LEFT", -19, 0);

                self.GRM_BackupPurgeGuildOption:Show();
                self.GRM_GuildNameTooltip:Hide();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_BackupPurgeGuildOption:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);
       
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.OptionsHeaderText3, "BOTTOMRIGHT", -10, -27)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_MemoryUsageText:SetJustifyH("LEFT");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupCheckBox, "RIGHT", 1, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText:SetText(GRM.L("Enable Auto-Backup Once Every"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText, "RIGHT", 32, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetJustifyH("LEFT");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText, "RIGHT", 1.0, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:SetSize(30, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNoteText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText, "RIGHT", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetSize(40, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetTextInsets(8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetMaxLetters(2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:EnableMouse(true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:IsEnabled() then
                self:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetText("");
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:Show()
            end
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetScript("OnEnterPressed", function( self)
        local numDays = tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:GetText());
        if numDays >= 1 and numDays < 100 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][41] = numDays;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNoteText:SetText(numDays);
            if numDays > 1 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetText(GRM.L("Days"));
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.DaysOnAutoBackupText2:SetText(GRM.L("Day"));
            end
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:Show();
            GRM.SyncSettings();
        else
            GRM.Report(GRM.L("Please Choose a Time Interval Between 1 and 99 Days!"));
        end      
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeEditBox:SetScript("OnEditFocusLost", function( self) 
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AutoBackupTimeOverlayNote:Show();
    end)
   

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame:SetSize(584, 352);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame, "BOTTOMLEFT", -2, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame:SetSize(566, 329);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame, "BOTTOMLEFT", 0, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetOrientation("VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetSize(20, 310);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame, "TOPRIGHT", 13.5, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetValue(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrameSlider:SetScript("OnValueChanged", function(self)
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollFrame:SetVerticalScroll(self:GetValue());          
    end);
    -- Options Backup Horde/Ally Tabs
    -- OPTIONS TABS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame, "TOPLEFT", 5, -1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:SetSize(100, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTabText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab, 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTabText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTabText:SetText(GRM.L("Horde"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTabText:SetTextColor(0.61, 0.14, 0.137);
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab, nil, 100, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            GRM_G.selectedFID = 1;
            self:LockHighlight();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:UnlockHighlight();
            GRM.BuildBackupScrollFrame(1);
        end
    end)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:SetSize(100, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTabText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab, 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTabText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTabText:SetText(GRM.L("Alliance"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTabText:SetTextColor(0.078, 0.34, 0.73);
    PanelTemplates_TabResize(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab, nil, 100, 25);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_AllianceTab:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            GRM_G.selectedFID = 2;
            self:LockHighlight();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_HordeTab:UnlockHighlight();
            GRM.BuildBackupScrollFrame(2);
        end
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CreationDateText:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame, "TOP", 57.5, -3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CreationDateText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CreationDateText:SetText(GRM.L("Creation Date"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNumMembersText:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_CoreBackupScrollBorderFrame, "TOPRIGHT", -37, -3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNumMembersText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UIOptionsFrame.GRM_GuildNumMembersText:SetText(GRM.L("Members"));


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame, 18, - 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText:SetText(GRM.L("Slash Commands") .. ":");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText:SetTextColor(0.0, 0.8, 1.0, 1.0);

    -- SLASH COMMAND STRINGS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.OptionsSlashCommandText, "BOTTOMLEFT", 0, - 5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText:SetSpacing(8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText:SetText("/roster or /grm - |cffff0000" .. GRM.L("Open Addon Window"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText2:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText2:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText2:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText2:SetText( "|cffff0000" .. GRM.L("Trigger scan for changes manually"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText3:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText3:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText3:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText3:SetText( "|cffff0000" .. GRM.L("Trigger sync one time manually"));
    

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText4:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText4:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText4:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText4:SetText( "|cffff0000" .. GRM.L("Centers all Windows"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText5:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText5:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText5:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText5:SetText( "|cffff0000" .. GRM.L("Slash command info"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText6:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText6:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText6:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText6:SetText( "|cffff0000" .. GRM.L("Resets ALL data"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText7:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText7:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText7:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText7:SetText( "|cffff0000" .. GRM.L("Report addon ver"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText10:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText10:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText10:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText10:SetText( "|cffff0000" .. GRM.L("Resets Guild data"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText11:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton, "TOPRIGHT", 1, - 4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText11:SetFont(GRM_G.FontChoice, 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText11:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText11:SetText( "|cffff0000" .. GRM.L("Hard reset of ALL GRM data, account-wide. Game will reload!"));

    GRM_UI.GRM_RosterCheckBoxSideFrame:SetScript("OnHide", function ()
        if GRM_UI.GRM_RosterConfirmFrameText:GetText() == GRM.L("Really Clear the Guild Log?") then
            GRM_UI.GRM_RosterConfirmFrame:Hide();
        end
    end);

    if not isManualUpdate then
        GRM_UI.GRM_RosterCheckBoxSideFrame:HookScript("OnShow", function()
            GRM_UI.BuildLogFilterSideFrame();
        end);
    end


    -- CORE OPTIONS
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_GeneralOptionsFrameText, "BOTTOMLEFT", -4, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButtonText:SetText(GRM.L("Show at Logon"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:SetScript("OnClick", function()
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][2] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][2] = false;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButtonText:SetText(GRM.L("Show 'Main' Name in Chat"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][29] = true;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetTextColor(1.0, 0.82, 0.0, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:Enable();
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][29] = false;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetTextColor(0.5, 0.5, 0.5, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:Disable();
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetText(GRM.L("Show 'Main' Tag on both Mains and Alts in Chat"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][65] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][65] = false;
            end
            GRM.SyncSettings();
        end
    end);
    
    -- COLOR PICKER!!!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorPickerOptionsText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButtonText, "RIGHT", 18, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorPickerOptionsText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorPickerOptionsText:SetText("|cffff0000<>|r " .. GRM.L("Choose Color:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorPickerOptionsText, "RIGHT", 5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:SetSize(18, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:SetBackdrop (
        {
            bgFile = nil,
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 9,
            insets = { left = -2, right = -2, top = -3, bottom = -2 }
        }
 );
    -- color box texture
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:SetScript("OnShow", function( self)
        self.GRM_OptionsTexture:SetPoint("CENTER", self);
        self.GRM_OptionsTexture:SetSize( 15, 15);
        self.GRM_OptionsTexture:SetColorTexture(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][1], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][2], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][3], 1.0);
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            GRM.ShowCustomColorPicker(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][1], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][2], GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46][3], 1.0, function() end);
            if IsAddOnLoaded("ColorPickerPlus") then
                OpacitySliderFrame:Hide();
                ColorPickerFrame:SetSize(380, 380);
            elseif IsAddOnLoaded("ColorPickerAdvanced") then
                ColorPickerFrame.hasOpacity = true;
                ColorPickerFrame.opacity = 1;
            elseif IsAddOnLoaded("ElvUI") then
                ColorPickerFrame:SetSize(345, 240);
            else
                OpacitySliderFrame:Hide();
                ColorPickerFrame:SetWidth(305);
            end
        end
    end);

    -- Main Format settings
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame, "RIGHT", 18, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatText:SetText("|cffff0000<>|r " .. GRM.L("Format:"));
    
    -- Rank Drop Down for Options Frame
    -- rank drop down 
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatText, "RIGHT", 1.0, 1.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetSize( 90, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:SetWidth(90);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:SetFrameStrata("DIALOG");


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:Hide();
    end)
   
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:Hide();
            else
                GRM.PopulateMainTagDropdown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:IsVisible() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FLeft-Click|r to Change Display Format"));
            GameTooltip:AddLine( GRM.L("This also will change the <Alt> format to match"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    if not isManualUpdate then
        ColorPickerOkayButton:HookScript("OnClick", function ()
            if GRM_G.MainTagColor then
                GRM_G.MainTagColor = false;
                ColorPickerFrame.func = nil;
                ColorPickerFrame.opacityFunc = nil;
                ColorPickerFrame.cancelFunc = nil;
                local r, g, b = ColorPickerFrame:GetColorRGB();
                ColorPickerFrame.previousValues = { r, g, b, 1 };
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46] = { r, g, b };
                GRM.RefreshMainTagHexCode();
                -- Update the dropdown window color too
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText:SetTextColor(r, g, b, 1);
                GRM.SyncSettings();
            end
        end);
    
        ColorPickerFrame:HookScript("OnHide", function()
            C_Timer.After(0.1, function()
                if GRM_G.MainTagColor then
                    GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][46] = { ColorPickerFrame.previousValues[1], ColorPickerFrame.previousValues[2], ColorPickerFrame.previousValues[3] };
                    GRM.RefreshMainTagHexCode();
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ColorSelectOptionsFrame.GRM_OptionsTexture:SetColorTexture(ColorPickerFrame.previousValues[1], ColorPickerFrame.previousValues[2], ColorPickerFrame.previousValues[3], ColorPickerFrame.previousValues[4]);
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_MainTagFormatSelected.GRM_TagText:SetTextColor(ColorPickerFrame.previousValues[1], ColorPickerFrame.previousValues[2], ColorPickerFrame.previousValues[3], ColorPickerFrame.previousValues[4]);
                    GRM.SyncSettings();
                end
            end);
            -- Just need a slight delay for previous action to execute.
            C_Timer.After(0.2, function()
                GRM_G.MainTagColor = false;
                ColorPickerFrame.func = nil;
                ColorPickerFrame.opacityFunc = nil;
                ColorPickerFrame.cancelFunc = nil;
            end);
        end);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame:SetScript("OnHide", function()
            ColorPickerFrame:Hide();
        end);
    
        -- Color window... let's make it moveable!
        ColorPickerFrame:EnableMouse(true);
        ColorPickerFrame:SetMovable(true);
        ColorPickerFrame:RegisterForDrag("LeftButton");
        ColorPickerFrame:SetScript("OnDragStart", function()
            if ColorPickerFrameHeader:IsMouseOver( 0.5, -0.5, -0.5, 0.5) and not ColorPickerWheel:IsMouseOver( 1, -1, -1, 1) then
                ColorPickerFrame:StartMoving();
            end
        end);
        ColorPickerFrame:SetScript("OnDragStop", ColorPickerFrame.StopMovingOrSizing);
    
        -- Fill in the edit boxes
        ColorPickerFrame:HookScript("OnShow", function()
            -- Make the editboxes visible too
            if IsAddOnLoaded("ColorPickerAdvanced") or IsAddOnLoaded("ColorPickerPlus") or IsAddOnLoaded("ElvUI") then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:Hide();
            else
                local r, g, b = ColorPickerFrame:GetColorRGB();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetText(math.floor(r * 255));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:Show();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetText(math.floor(g * 255));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:Show();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetText(math.floor(b * 255));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:Show();
            end
        end);
    
        local colorTimer = 0;
        ColorPickerFrame:HookScript("OnUpdate", function(_, elapsed)
            colorTimer = colorTimer + elapsed;
            if colorTimer > 0.01 and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:HasFocus() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:HasFocus() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:HasFocus() then
                GRM.ColorSelectMainName();
                colorTimer = 0;
            end
        end);
    
        ColorPickerFrame:HookScript("OnMouseDown", function()
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:IsMouseOver( 1, -1, -1, 1) and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:IsMouseOver( 1, -1, -1, 1) and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:IsMouseOver( 1, -1, -1, 1) then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:ClearFocus();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:ClearFocus();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:ClearFocus();
            end
        end);
    end
    

    -- Colorpicker window RGB editboxes!
    -- Let's also establish the RGB editboxes
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text:SetPoint("BOTTOM", ColorPickerCancelButton, "TOP", -6, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text:SetText("B");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text, "TOP", 0, 5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text:SetText("G");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR.GRM_R_Text:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text, "TOP", 0, 5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR.GRM_R_Text:SetText("R");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR.GRM_R_Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetSize(42, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetPoint("Left", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR.GRM_R_Text, "RIGHT", 3, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetAutoFocus(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetTextInsets( 5, 5, 3, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetBackdrop(GRM_UI.noteBackdrop2);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetScript("OnEscapePressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetScript("OnEnterPressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
            GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("RGB Values Must be Between 1 and 255."));
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetScript("OnEditFocusGained", function( self)
        self:HighlightText(0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetScript("OnEditFocusLost", function( self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:HighlightText(0, 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetScript("OnTabPressed", function(self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        GRM.ColorSelectMainName();
        if IsShiftKeyDown() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetFocus();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetFocus();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetSize(42, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetPoint("Left", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB.GRM_B_Text, "RIGHT", 3, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetAutoFocus(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetTextInsets( 5, 5, 3, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetBackdrop(GRM_UI.noteBackdrop2);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetScript("OnEscapePressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetScript("OnEnterPressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
            GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("RGB Values Must be Between 1 and 255."));
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetScript("OnEditFocusGained", function( self)
        self:HighlightText(0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetScript("OnEditFocusLost", function( self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:HighlightText(0, 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetScript("OnTabPressed", function(self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        GRM.ColorSelectMainName();
        if IsShiftKeyDown() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetFocus();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetFocus();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetSize(42, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetPoint("Left", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG.GRM_G_Text, "RIGHT", 3, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetAutoFocus(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:ClearFocus();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetTextInsets( 5, 5, 3, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetBackdrop(GRM_UI.noteBackdrop2);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetScript("OnEscapePressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetScript("OnEnterPressed", function(self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
            GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("RGB Values Must be Between 1 and 255."));
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetScript("OnEditFocusGained", function( self)
        self:HighlightText(0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetScript("OnEditFocusLost", function( self)
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        self:HighlightText(0, 0);
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:SetScript("OnTabPressed", function(self)
        self:ClearFocus();
        if self:GetText() == "" then
            self:SetText( "0");
        elseif tonumber(self:GetText()) > 255 then
            self:SetText( "255");
        end
        ColorPickerFrame:SetColorRGB(tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerG:GetText()) / 255, tonumber(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:GetText()) / 255, 1);
        GRM.ColorSelectMainName();
        if IsShiftKeyDown() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerR:SetFocus();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ColorPickerB:SetFocus();
        end
    end);

    -- LANGUAGE SELECTION
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton, "BOTTOMLEFT", 5, -12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText:SetText(GRM.L("Language Selection:"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected, "TOPRIGHT", 1, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetWidth(290);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageCountText:SetWordWrap(false);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText, "RIGHT", 8, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetSize( 115, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected.GRM_LanguageSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected.GRM_LanguageSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected.GRM_LanguageSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:Hide();
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:Hide();
                GRM.PopulateLanguageDropdown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:IsVisible() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FLeft-Click|r to Change the Language"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    -- FONT SELECTION
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelectionText, "BOTTOMLEFT", 0, -16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontText:SetText(GRM.L("Font Selection:"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageSelected, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetSize( 115, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected.GRM_FontSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected.GRM_FontSelectedText:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected.GRM_FontSelectedText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:Hide();
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:Hide();
                GRM.PopulateFontDropdown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FLeft-Click|r to Change the Font"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    -- Timestamp Selection
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectionText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText, "BOTTOMLEFT", 0, -17);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectionText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectionText:SetText(GRM.L("Timestamp Format:"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider, "BOTTOM", 0, -12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetSize( 115, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText:SetWidth(110);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText:SetWordWrap(false);GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected.GRM_TimestampSelectedText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" and not GRM_G.GlobalControl5 then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:Hide();
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:Hide();
                GRM.PopulateTimestampFormatDropDown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelectedDropDownMenu:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetScript("OnEnter", function(self)
        local isRestricted, index = GRM.IsSyncRankGuildLeaderRestricted(0, "g1^");
        if isRestricted then
            GRM_G.GlobalControl5 = true;
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine(GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("Warning - Global Controls:")));
            GameTooltip:AddLine(GRM.L("Unable to Modify. Global setting is set to :   {name}", self.GRM_TimestampSelectedText:GetText()));
            GameTooltip:Show();
        else
            GRM_G.GlobalControl5 = false;
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- 24Hr Time Selection
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TimestampSelected, "RIGHT", 25, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrText:SetText(GRM.L("Hour Format:"));
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrText, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:SetSize( 115, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText:SetWidth(110);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText:SetWordWrap(false);GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected.GRM_24HrSelectedText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:Hide();
            else
                GRM.Populate24HrDropDown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_24HrSelectedDropDownMenu:Show();
            end
        end
    end);
    
    -- -- FONT SLIDER
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSelected, "RIGHT", 20, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText:SetText(GRM.L("Font Scale:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetMinMaxValues(75, 125);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetObeyStepOnDrag(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetValueStep(5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText3:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider, "TOP", 0, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText3:SetText(GRM.L("Example"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText3:SetTextColor(1, 0.82, 0, 1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetScript("OnValueChanged", function( self, value)
        self.GRM_FontSizeSliderText2:SetText(math.floor(value + 0.5) .. "%");
        self.GRM_FontSizeSliderText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12 +(( math.floor(value + 0.5) - 100 ) / 10));
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            self:SetValue(100);
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] ~= 0 then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] = 0;
                GRML.SetNewFont(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][44]);
                GRM.SyncSettings();
            end
        elseif button == "LeftButton" then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] =(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:GetValue() - 100) / 10;
            GRML.SetNewFont(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][44]);
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Right-Click to Reset to 100%"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetScript("OnLeave", function ()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontText, "BOTTOMLEFT", 0, -18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText:SetText(GRM.L("Tooltip Scale:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText, "RIGHT", 38, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetMinMaxValues(50, 150);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetObeyStepOnDrag(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetValueStep(5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetScript("OnValueChanged", function( self, value)
        self.GRM_TooltipScaleSliderText2:SetText(math.floor(value + 0.5) .. "%");
        GameTooltip:SetScale(((GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:GetValue() - 50) / 5) * 0.02 + 0.8);
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            self:SetValue(100);
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] = 1.0;
            GRM.SyncSettings();
        elseif button == "LeftButton" then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] =(((GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:GetValue() - 50) / 5) * 0.02 + 0.8);
            GRM_UI.NewTooltipScale();
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetScript("OnEnter", function(self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_LanguageDropDownMenu:IsVisible() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("Right-Click to Reset to 100%"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetScript("OnLeave", function ()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Minimap Button!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButtonText:SetText(GRM.L("Show Minimap Button"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][32] = true;
                GRM_UI.GRM_MinimapButton:Show();
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][32] = false;
                GRM_UI.GRM_MinimapButton:Hide();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButtonText:SetText(GRM.L("Sync Addon Settings on All Alts in Same Guild"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][31] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][31] = false;
            end
            GRM.SyncSettings();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_OptionsUXText, "BOTTOMLEFT", -4, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButtonText:SetText(GRM.L("Enable Fade on Tab Change"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][52] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][52] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButtonText:SetText(GRM.L("Show Border on Public, Officer, and Custom Notes"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] = true;
                GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetBackdrop(GRM_UI.noteBackdrop);
                GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetBackdrop(GRM_UI.noteBackdrop);
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetBackdrop(GRM_UI.noteBackdrop);
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] = false;
                GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteWindow:SetBackdrop(nil);
                GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteWindow:SetBackdrop(nil);
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame:SetBackdrop(nil);
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButtonText:SetText(GRM.L("Show Character Guild Reputation"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][53] = true;
                if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText:SetText(GRM.GetReputationTextLevel(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][GRM_G.currentNameIndex][31]));
                    GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText:Show();
                end
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][53] = false;
                GRM_UI.GRM_MemberDetailMetaData.GRM_ReputationLevelText:Hide();
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButtonText:SetText(GRM.L("Show Guild Member Birthdays"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][67] = true;
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:Show();
                if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                    local i = GRM.PlayerQuery(GRM_G.currentName);
                    if i ~= nil then
                        if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][22][2][1][1] ~= 0 then
                            GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:Hide();
                            GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:SetText(GRM.FormatTimeStamp(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][22][2][3], false, true));
                            GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:Show();
                        else
                            GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:Show();
                            GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:Hide();
                        end
                    end
                end
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][67] = false;
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayButton:Hide();
                GRM_UI.GRM_MemberDetailMetaData.GRM_BirthdayText:Hide();
                GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailBirthdayTitleText:Hide();
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButtonText, "RIGHT", 6, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetText(GRM.L("Only Show if Log Changes"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][28] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][28] = false;
        end
        GRM.SyncSettings();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsRankRestrictHeaderText, "BOTTOMLEFT", -4, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText, "RIGHT", 2, -1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1, "RIGHT", 4, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2, "RIGHT", 2, -1);    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText, "RIGHT", 2, -1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2, "RIGHT", 4, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3, "RIGHT", 2, -1);  
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:SetScript("OnClick", function( self)              
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][7] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(true);
            end
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][7] = false;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        end
        GRM.SyncSettings();
    end);

    -- Configuration for the tooltip of the 3 radial buttons in the officer options tab for join date destination.
    GRM_UI.RadialButtonTooltipGlobalControlsConfig = function(frame, tag)
        frame:SetScript("OnEnter", function()
            GRM_G.IsRadialChecked = frame:GetChecked();
            local isRestricted, index = GRM.IsSyncRankGuildLeaderRestricted(0, tag);
            if isRestricted then
                GRM_G.GlobalControl4 = true;
                GRM_UI.SetTooltipScale();
                GameTooltip:SetOwner(frame, "ANCHOR_TOP");
                GameTooltip:AddLine(GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("Warning - Global Controls:")));
                local location = "";
                if index == 1 then
                    location = GRM.L("Officer Note");
                elseif index == 2 then
                    location = GRM.L("Public Note");
                else
                    location = GRM.L("Custom Note");
                end
                GameTooltip:AddLine(GRM.L("Unable to Modify. Global setting is set to the {name}", location));
                GameTooltip:Show();
            else
                GRM_G.GlobalControl4 = false;
            end
        end);
        frame:SetScript("OnLeave", function()
            GRM_UI.RestoreTooltipScale();
            GameTooltip:Hide();
        end);
    end
    
    GRM_UI.RadialButtonTooltipGlobalControlsConfig(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1, "g5^");
    GRM_UI.RadialButtonTooltipGlobalControlsConfig(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2, "g5^");
    GRM_UI.RadialButtonTooltipGlobalControlsConfig(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3, "g5^");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetScript("OnClick", function( self, button)
        if button == "LeftButton" and not GRM_G.GlobalControl4 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] = 1;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  |cffff0000Officer Note|r"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetChecked(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetChecked(false);
            self:SetChecked(true);
            GRM.SyncSettings();
        elseif GRM_G.GlobalControl4 then
            if GRM_G.IsRadialChecked then
                self:SetChecked(true);
            else
                self:SetChecked(false);
            end
        end
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetScript("OnClick", function( self, button)
        if button == "LeftButton" and not GRM_G.GlobalControl4 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] = 2;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText("|cffff0000" .. GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetChecked(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetChecked(false);
            self:SetChecked(true);
            GRM.SyncSettings();
        elseif GRM_G.GlobalControl4 then
            if GRM_G.IsRadialChecked then
                self:SetChecked(true);
            else
                self:SetChecked(false);
            end
        end
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetScript("OnClick", function( self, button)
        if button == "LeftButton" and not GRM_G.GlobalControl4 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] = 3;
            GRM.SyncSettings();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText("|cffff0000" .. GRM.L("Custom Note"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetChecked(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetChecked(false);
            self:SetChecked(true);
        elseif GRM_G.GlobalControl4 then
            if GRM_G.IsRadialChecked then
                self:SetChecked(true);
            else
                self:SetChecked(false);
            end
        end
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetText(GRM.L("Include \"Joined:\" tag with the date."));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetScript("OnClick", function( self)              
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] = false;
        end
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] then
            GameTooltip:AddLine( GRM.L("Joined: {name}", GRM.FormatTimeStamp(GRM.GetTimestamp(), false)));
        else
            GameTooltip:AddLine( GRM.FormatTimeStamp(GRM.GetTimestamp()));
        end
        GameTooltip:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetScript("OnLeave", function ()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Time Interval Controls on checking for changes!!!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.OptionsScanDetailsText, "BOTTOMLEFT", -4, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText:SetText(GRM.L("Before Scan Timer"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText, "RIGHT", 37.5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText2:SetText(GRM.L("After Scan Timer"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:SetScript("OnClick", function()
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][18] = true;
            GRM.Report(GRM.L("Reactivating SCAN for Guild Member Changes..."));

            GuildRoster();
            C_Timer.After(5, GRM.TriggerTrackingCheck);     -- 5 sec delay necessary to trigger server call.
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][18] = false;
            GRM_G.changeHappenedExitScan = true;
            GRM_G.CurrentlyScanning = false;
            GRM.Report(GRM.L("Deactivating SCAN of Guild Member Changes..."));
        end
        GRM.SyncSettings();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText, "RIGHT", 1.0, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:SetSize(35, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][6]);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButtonText, "RIGHT", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetSize(40, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetTextInsets(8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:EnableMouse(true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:IsEnabled() then
                self:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetText("");
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:Show()
            end
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetScript("OnEnterPressed", function( self)
        local numSeconds = tonumber(self:GetText());
        if numSeconds >= 10 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][6] = numSeconds;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetText(numSeconds);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:Show();

            GuildRoster();
            GRM.SyncSettings();
            C_Timer.After(5, GRM.TriggerTrackingCheck);     -- 5 sec delay necessary to trigger server call.
        else
            GRM.Report("\n" .. GRM.L("Due to server data restrictions, a scan interval must be at least 10 seconds or more!") .. "\n" .. GRM.L("Please choose an scan interval 10 seconds or higher!") .. " " .. GRM.L("{num} is too Low!", nil, nil, numSeconds));
        end      
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:SetScript("OnEditFocusLost", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalEditBox:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNote:Show();
    end)

    -- Level filtering
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3, "RIGHT", 1.0, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:SetSize(35, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3, "RIGHT", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetSize(40, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetTextInsets(8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetTextColor(0, 0.82, 1, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:EnableMouse(true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:IsEnabled() then
                self:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetText("");
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:Show()
            end
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:Show();
    end);

    GRM_UI.AllLevelFiltersOff = function()
        local result = true;
        for i = 1, #GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47] do
            if not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][i] then
                result = false;
                break;
            end
        end
        return result;
    end

    GRM_UI.SetLevelLogOptions = function()
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][56] then
            -- Enable
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(1.0, 0.82, 0, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(1.0, 0.82, 0, 1);
            
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 60 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 70 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 80 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 85 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 90 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 100 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 110 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 120 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(1.0, 0, 0, 1);
            end
        else
            -- Disable
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.5, 0.5, 0.5, 1);
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
    end

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetScript("OnEnterPressed", function( self)
        local level = tonumber(self:GetText());
        if level ~= nil then
            if level < 2 then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] = 1;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetText(1);
                GRM_UI.SetLevelLogOptions();
            elseif level > GRM_G.LvlCap then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] = GRM_G.LvlCap;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetText(GRM_G.LvlCap);
                GRM_UI.SetLevelLogOptions();
                GRM.Report(GRM.L("The Current Lvl Cap is {num}.", nil, nil, GRM_G.LvlCap));
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] = level;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetText(level);
                GRM_UI.SetLevelLogOptions();
            end
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:Show();
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        else
            GRM.Report(GRM.L("Please enter a valid level between 1 and {num}", nil, nil, GRM_G.LvlCap));
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlEditBox:SetScript("OnEditFocusLost", function( self) 
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNote:Show();
    end)

    -- Kick Recommendation!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText:SetText(GRM.L("Kick Inactive Player Reminder at"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText, "RIGHT", 32, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2:SetText(GRM.L("Months"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:SetScript("OnClick", function()
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][10] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][10] = false;
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText:SetText(GRM.L("Only recommend to kick if all player linked alts exceed max time"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:SetScript("OnClick", function()
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][60] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][60] = false;
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText, "RIGHT", 1.0, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:SetSize(30, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][9]);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText, "RIGHT", -0.5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetSize(35, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetTextInsets(8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetMaxLetters(2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:EnableMouse(true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:IsEnabled() then
                self:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetText("");
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:Show()
            end
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetScript("OnEnterPressed", function( self)
        local numMonths = tonumber(self:GetText());
        if numMonths > 0 and numMonths < 100 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][9] = numMonths;
            GRM_G.NumberOfHoursTilRecommend = GRM.GetNumHoursTilRecommend(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][9]);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetText(numMonths);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:Show();
            GRM.SyncSettings();
        else
            GRM.Report(GRM.L("Please choose a month between 1 and 99"));
        end      
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:SetScript("OnEditFocusLost", function( self) 
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:Show();
    end)

    -- Report Inactive Recommendation.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText:SetText(GRM.L("Before Inactive Timer"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText, "RIGHT", 32, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText2:SetText(GRM.L("After Inactive Timer"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][11] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][11] = false;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton, "BOTTOMRIGHT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][55] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][55] = false;
        end
        GRM.SyncSettings();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetText(GRM.L("Only Report if there are no Active Alts in the Group"));


    -- Options Slash command buttons
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SlashCommandText, "BOTTOMLEFT", -2, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton:SetText(GRM.L("scan"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            if IsInGuild() then
                GRM.SlashCommandScan();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ScanOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton:SetText(GRM.L("sync"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            if IsInGuild() then
                GRM.SyncCommandScan();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_SyncOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton:SetText(GRM.L("center"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.SlashCommandCenter();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_CenterOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton:SetText(GRM.L("help"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.SlashCommandHelp();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HelpOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton:SetText(GRM.L("version"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.SlashCommandVersion();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_VersionOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton:SetText(GRM.L("resetall"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.SlashCommandClearAll();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearAllOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton:SetText(GRM.L("resetguild"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.SlashCommandClearGuild();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_ClearGuildOptionsButton, "BOTTOMLEFT", 0, -8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton:SetSize(85, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton:SetText(GRM.L("Hard Reset"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_HelpOptionsFrame.GRM_HardResetButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.HardReset();
        end
    end);

    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame, "BOTTOMRIGHT", -15, 5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:SetSize(130, 30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText:SetText(GRM.L("Restore Defaults"));
    GRM_UI.ScaleFontStringToObjectSize(true, 130, GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButtonText, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ResetDefaultOptionsButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM.ResetDefaultSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText, "RIGHT", 0.5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:SetSize(30, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetText(math.floor(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][4] / 24));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetPoint( "LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButtonText, "RIGHT", -5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetSize(45, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetTextInsets( 8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetMaxLetters(3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:EnableMouse( true);


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetText("");
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:Show();
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetScript("OnEnterPressed", function( self)
        local numDays = tonumber(self:GetText());
        if numDays > 0 and numDays < 181 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][4] = numDays * 24;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetText(numDays);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:Show();
            GRM.SyncSettings();
        else
            GRM.Report(GRM.L("Please choose between 1 and 180 days!"));
        end      
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:SetScript("OnEditFocusLost", function( self) 
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:Show();
    end)

    -- Add Event Options on Announcing...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText:SetText(GRM.L("Announce Events"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText, "RIGHT", 32, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText2:SetText(GRM.L("Days in Advance"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][12] = true;
            if CanEditGuildEvent() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Enable();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Disable();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
            end
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][12] = false;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
            if CanEditGuildEvent() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Enable();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Disable();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
            end
        end
        GRM.SyncSettings();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText, "RIGHT", 0.5, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:SetSize(30, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][5]) ;
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetPoint( "LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButtonText, "RIGHT", -0.5, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetSize(35, 22);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetTextInsets( 8, 9, 9, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetMaxLetters(2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetNumeric(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetTextColor(1.0, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:EnableMouse( true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:SetScript("OnMouseDown", function( self, button)
        if button == "LeftButton" then
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetText("");
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:Show();
        end    
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetScript("OnEscapePressed", function( self)
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetScript("OnEnterPressed", function( self)
        local numDays = tonumber(self:GetText());
        if numDays > 0 and numDays < 29 then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][5] = numDays;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetText(numDays);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:Show();
            GRM.SyncSettings();
        else
            GRM.Report(GRM.L("Please choose between 1 and 28 days!"));
        end      
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:SetScript("OnEditFocusLost", function( self) 
        self:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:Show();
    end)


    -- Add Event Options Button to add events to calendar
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetText(GRM.L("Add Events to Calendar"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][8] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][8] = false;
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.OptionsUnifySettingsHeaderText, "BOTTOMLEFT", 0 , -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_UnifySettingsCoreText:SetText(
        GRM.L("X = index of minimum rank. Example: 0 = {name} and {num} = {name2}", GuildControlGetRankName(1), GuildControlGetRankName( GuildControlGetNumRanks()), GuildControlGetNumRanks() - 1) .. "\n" ..
        GRM.L("'g1^X' - Establish a universal timestamp format based on dropdown selection position") .. "\n" ..
        GRM.L("'g2^X' - Establish minimum sync rank restriction for player details") .. "\n" ..
        GRM.L("'g3^X' - Establish minimum sync rank restriction for BAN info") .. "\n" ..
        GRM.L("'g4^X' - Establish minimum sync rank restriction for Custom Note info") .. "\n" ..
        GRM.L("'g5^X' - Designate Join Date note destination. g5^1 = Officer, 2 = public, 3 = custom")
 );
    -- SYNC WITH OTHER PLAYERS!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton, 27, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText:SetText(GRM.L("SYNC Changes With Guildies at Rank") .. " ");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected, "RIGHT", 1.5, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText2:SetText(GRM.L("or Higher"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM.Report(GRM.L("Reactivating Data SYNC with Guildies..."));
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);

            -- need to disable or enable these...
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(1.0, 0.82, 0.0, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(1.0, 0.82, 0.0, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Enable();
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(0.5, 0.5, 0.5, 1);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(0.5, 0.5, 0.5, 1);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Disable();
            end

            if GRM_UI.GRM_MemberDetailMetaData:IsVisible() and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] then
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:Enable();
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            end

            if  GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][16] then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:SetChecked( true);
            end
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and not GRMsyncGlobals.currentlySyncing and GRM_G.HasAccessToGuildChat then
                GRMsync.TriggerFullReset();
                -- Now, let's add a brief delay, 3 seconds, to trigger sync again
                GRMsync.Initialize();
            end
        else
            GRM.Report(GRM.L("Deactivating Data SYNC with Guildies..."));
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] = false;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:Show();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
            
            if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:Disable();
                GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
            end

            if GRMsync.MessageTracking ~= nil then
                GRMsync.MessageTracking:UnregisterAllEvents()
            end
            GRMsync.ResetDefaultValuesOnSyncReEnable();         -- Reset values to default, so that it resyncs if player re-enables.
        end
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton, "BOTTOMRIGHT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetText(GRM.L("Only Restrict Incoming Player Data to Rank Threshold, not Outgoing"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] = false;
        end
        GRM.SyncSettings();
    end);

    -- For tooltip
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_LEFT", 0, -28);
        GameTooltip:AddLine( GRM.L("Does NOT apply to Ban List or Custom Note"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Rank Drop Down for Options Frame
        -- rank drop down 
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButtonText, "RIGHT", 1.0, 1.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetSize( 130, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelectedText:SetTextColor(0, 0.8, 1, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:Hide();
    end)

    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" and not GRM_G.GlobalControl1 then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:Hide();
           else
               GRM.PopulateOptionsRankDropDown();
               GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:Show();
               GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Hide();
               GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Hide();
                GRM_UI.RestoreTooltipScale();
               GameTooltip:Hide();
           end
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            local isRestricted, index = GRM.IsSyncRankGuildLeaderRestricted(0, "g2^");
            if not isRestricted then
                GRM_G.GlobalControl1 = false;
                GameTooltip:AddLine(GRM.L("|CFF00CCFFMinimum Rank to Sync: Player Data, Custom Notes, Ban List"));
                GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Rank Restriction"));
            else
                GRM_G.GlobalControl1 = true;
                GameTooltip:AddLine(GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("Warning - Global Controls:")));
                GameTooltip:AddLine(GRM.GetRankRestrictionText(index));
            end
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    -- Sync Ban list
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetText(GRM.L("Sync BAN List With Guildies at Rank") .. " ");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][21] = true;
            -- Now, let's resync it up!
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and not GRMsyncGlobals.currentlySyncing and GRM_G.HasAccessToGuildChat then
                GRMsync.TriggerFullReset();
                -- Now, let's add a brief delay, 3 seconds, to trigger sync again
                C_Timer.After(3, GRMsync.Initialize);
            end        
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][21] = false;
        end
        GRM.SyncSettings();
    end);

    -- SYNC WITH OTHER PLAYERS!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected, "RIGHT", 1.5, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetText(GRM.L("or Higher"));
    -- Sync Ban List Drop Down
        -- rank drop down 
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText, "RIGHT", 0, 1.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetSize( 130, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelectedText:SetTextColor(0, 0.8, 1, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Hide();
    end)


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" and not GRM_G.GlobalControl2 then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Hide();
           else
                GRM.PopulateBanListOptionsDropDown();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Show();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:Hide();
                GRM_UI.RestoreTooltipScale();
                GameTooltip:Hide();
           end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:IsVisible() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            local isRestricted, index = GRM.IsSyncRankGuildLeaderRestricted(0, "g3^");
            if not isRestricted then
                GRM_G.GlobalControl2 = false;
                GameTooltip:AddLine(GRM.L("|CFF00CCFFSync filter can be set tighter for the Ban List"));
                GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to Change Rank Restriction"));
            else
                GRM_G.GlobalControl2 = true;
                GameTooltip:AddLine(GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("Warning - Global Controls:")));
                GameTooltip:AddLine(GRM.GetRankRestrictionText(index));
            end
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)


    -- CUSTOM NOTE OPTIONS...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetText(GRM.L("Sync Custom Notes"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] = true;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(1.0, 0.82, 0.0, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(1.0, 0.82, 0.0, 1.0);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Enable();
                if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:Enable();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);
                end
                
                -- Now, let's resync it up!
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and not GRMsyncGlobals.currentlySyncing and GRM_G.HasAccessToGuildChat then
                    GRMsync.TriggerFullReset();
                    -- Now, let's add a brief delay, 3 seconds, to trigger sync again
                    C_Timer.After(3, GRMsync.Initialize);
                end        
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] = false;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(0.5, 0.5, 0.5, 1);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(0.5, 0.5, 0.5, 1);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Disable();
                if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:Disable();
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox.GRM_CustomNoteMetaCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
                end
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2, "BOTTOMLEFT", -1, -13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetText(GRM.L("Sync Birthdays"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][68] = true;                
                -- Now, let's resync it up!
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and not GRMsyncGlobals.currentlySyncing and GRM_G.HasAccessToGuildChat then
                    GRMsync.TriggerFullReset();
                    -- Now, let's add a brief delay, 3 seconds, to trigger sync again
                    C_Timer.After(3, GRMsync.Initialize);
                end        
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][68] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox, "BOTTOMRIGHT", 1, -11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetText(GRM.L("Default Custom Note Rank Minimum"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText, "RIGHT", 0, 1.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetSize( 130, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText:SetTextColor(0, 0.8, 1, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" and not GRM_G.GlobalControl3 then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Hide();
            else
                GRM.PopulateDefaultDropDownRankMenu();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:Show();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncRankDropDownMenu:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:Hide();
                GRM_UI.RestoreTooltipScale();
                GameTooltip:Hide();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:IsVisible() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterBanListDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_TOP");
            local isRestricted, index = GRM.IsSyncRankGuildLeaderRestricted(0, "g4^");
            if not isRestricted then
                GRM_G.GlobalControl3 = false;
                GameTooltip:AddLine( GRM.L("|CFF00CCFFDefault Selection For All Players"));
                GameTooltip:AddLine( GRM.L("Each Guildie Can Still be Manually Configured"));
            else
                GRM_G.GlobalControl3 = true;
                GameTooltip:AddLine(GameTooltip:AddLine("|CFF00CCFF" .. GRM.L("Warning - Global Controls:")));
                GameTooltip:AddLine(GRM.GetRankRestrictionText(index));
            end
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText, "BOTTOMLEFT", 1, -20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetText(GRM.L("Reset Default Custom Note Restrictions for ALL Guildies"));


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2, "RIGHT", 3, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:SetSize(130, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetWidth(125);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButtonText:SetText(GRM.L("Reset"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" and not(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:IsMouseOver(1, -1, -1, 1) and GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankDropDownMenu:IsVisible()) then
            if IsControlKeyDown() and IsShiftKeyDown() then
                for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][1] = true;
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][4] = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][49];
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][5] = false;
                    if GRM_UI.GRM_MemberDetailMetaData:IsVisible() and GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetChecked( true);
                    end
                end
                GRM.Report(GRM.L("Custom note default settings for Rank and Sync have been reset."));
            elseif not IsControlKeyDown() then
                for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][4] = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][49];
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][5] = false;
                end
                GRM.Report(GRM.L("Custom note Rank reset to default \"{name}\" (or higher)", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomSelectedText:GetText()));
            else
                for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][23][1] = true;
                    if GRM_UI.GRM_MemberDetailMetaData:IsVisible() and GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.currentName then
                        GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteSyncMetaCheckBox:SetChecked( true);
                    end
                end
                GRM.Report(GRM.L("Custom note Sync has been reset to default"));
            end           
        end
    end);

    -- For tooltip
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("|CFF00CCFFCustom Note Defaults:"));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FLeft-Click|r to ONLY reset all to default rank"));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FCtrl-Left-Click|r to re-enable custom note sync for all"));
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FCtrl-Shift-Click|r to reset BOTH sync and rank defaults"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);


    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetText(GRM.L("Display Sync Update Messages"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][16] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][16] = false;
        end
        GRM.SyncSettings();
    end);

    -- Sync options - Restrict sync to current addon users only.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText, "BOTTOMLEFT", -4, -14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton, 27, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButtonText:SetText(GRM.L("Only Sync With Up-to-Date Addon Users"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][19] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][19] = false;
        end
        GRM.SyncSettings();
    end);

    -- Only announce Anniversaries of Player who is designated "main"
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton, 27, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetText(GRM.L("Only Announce Birthdays and Anniversaries if Listed as 'Main'"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][17] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][17] = false;
        end
        GRM.SyncSettings();
    end);

    -- Show public/officer ntoe on joining and leaving players.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton, 27, 0)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButtonText:SetText(GRM.L("Show Public and Officer Note of Left Player in the Log"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][59] = true;
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][59] = false;
        end
        GRM.SyncSettings();
    end);

    -- Leveling filters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][56] = true;

            -- Enable
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(1.0, 0.82, 0, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(1.0, 0.82, 0, 1);
            
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 60 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 70 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 80 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 85 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 90 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 100 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 110 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(1.0, 0, 0, 1);
            end

            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 120 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
            else
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(1.0, 0, 0, 1);
            end
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][56] = false;

            -- Disable
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.5, 0.5, 0.5, 1);
        end
        GRM.SyncSettings();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText:SetText(GRM.L("Report Level Up Changes"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText, "BOTTOMLEFT", 1, -20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetText(GRM.L("Level Filter Minimum:"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3, "BOTTOMLEFT", -1, -20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetText(GRM.L("Report Milestones:"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3, "RIGHT", 43, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetTextColor(1.0, 0, 0, 1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetText("60");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 60 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetText("70");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 70 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetText("80");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 80 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetText("85");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 85 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetText("90");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 90 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetText("100");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 100 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetText("110");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 110 then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button, "RIGHT", 4, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetText("120");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text, "RIGHT", -2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:Disable();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetScript("OnClick", function( self)
        if self:GetChecked() then
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] = true;
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] = false;
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] > 120 or(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] == GRM_G.LvlCap and GRM_UI.AllLevelFiltersOff) then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(1.0, 0, 0, 1);
            end
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Unable to disable level cap tracking. Please disable ALL tracking to turn off."));
        GameTooltip:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Need to make new checkbox option to choose to record levels or not.

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.OptionsSyncHeaderText, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText:SetText(GRM.L("Speed:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText:SetTextColor(1, 0, 0, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetMinMaxValues(10, 120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetValue(100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText2:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText2:SetText("100%");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider.GRM_SyncSpeedSliderText2:SetTextColor(1, 0, 0, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetScript("OnValueChanged", function( self, value)
        local value2 = math.floor(value + 0.5);
        if value > 100.1 then
            self.GRM_SyncSpeedSliderText2:SetText(value2 .. "%" .. "  " .. GRM.L("Syncing too fast may cause disconnects!"));
        else
            self.GRM_SyncSpeedSliderText2:SetText(value2 .. "%");
        end
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][24] =(value2 / 100); -- The new syncCap number for speed throttling...
        if GRMsyncGlobals.reloadControl then
            GRMsyncGlobals.ThrottleCap = GRMsyncGlobals.normalMessage;
        else
            GRMsyncGlobals.ThrottleCap = GRMsyncGlobals.burstMessage;
        end
        GRMsyncGlobals.ThrottleCap = GRMsyncGlobals.ThrottleCap * GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][24];
        GRM.SyncSettings();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetScript("OnMouseUp", function(self, button) 
        if button == "RightButton" then
            self:SetValue(100);
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetScript("OnEnter", function(self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("|CFFE6CC7FRight-Click|r to Reset to 100%"));
        GameTooltip:Show();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetScript("OnLeave", function ()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenuSelected, "BOTTOM", -20, -3);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetWidth( 74);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:SetWidth( 74);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton:SetPoint("LEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_SetUnknownButton, "RIGHT", 6, 0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButtonTxt:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButtonTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitCancelButtonTxt:SetText(GRM.L("Cancel"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetPoint("CENTER", GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7.9);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetText(GRM.L("Set Join Date"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetSpacing(0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:SetWordWrap(true);
    GRM_UI.ScaleFontStringToObjectSize(true, GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:GetWidth(), GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt, 12);
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetScript("OnShow", function()
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoText:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoZoneText:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText1:Hide();
        GRM_UI.GRM_MemberDetailMetaData.GRM_MemberDetailMetaZoneInfoTimeText2:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButtonTxt:GetText());
        GameTooltip:Show();
    end)
    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end)

    GRM_UI.GRM_MemberDetailMetaData.GRM_DateSubmitButton:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            GRM.ClearAllFrames( false);
            GRM.PopulateMemberDetails(GRM_G.currentName);
        end
    end);
end


-- Method           GRM_UI.MetaDataInitializeUIrosterLog2( boolean)
-- What it Does:    Keeps the log initialization separate and part of the UIParent, so it can load upon logging in
-- Purpose:         Resource control. This loads upon login, but keeps the rest of the addon UI initialization from occuring unless as needed.
--                  In other words, this can be loaded upon logging, but the rest will only load if the guild roster window loads.
GRM_UI.MetaDataInitializeUIrosterLog2 = function()

    GRM_UI.GRM_GroupInfo:SetFrameStrata("High");
    GRM_UI.GRM_GroupInfo.GRM_NumGuildiesText:SetPoint("TOP", RaidFrame, 0, -32);
    GRM_UI.GRM_GroupInfo.GRM_NumGuildiesText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_GroupInfo.GRM_NumGuildiesText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_GroupInfo.InvisFontStringWidthCheck:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);

    -- CHECKBUTTONS for Logging Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterCheckBoxSideFrame, 14, -45);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame, -14, -45);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetTextColor(0.5, 1.0, 0.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetText(GRM.L("Joined"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][1] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][1] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][1] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][1] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetTextColor(0.0, 0.44, 0.87, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetText(GRM.L("Leveled") .. " ");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetWidth(50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][2] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][2] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][2] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][2] = false;
            end
            GRM.SyncSettings();
        end
    end);


    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetTextColor(0.0, 1.0, 0.87, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetText(GRM.L("Inactive Return"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][3] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][3] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][3] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][3] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetTextColor(1.0, 0.914, 0.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetText(GRM.L("Promotions"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][4] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][4] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][4] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][4] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetTextColor(0.91, 0.388, 0.047, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetText(GRM.L("Demotions"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][5] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][5] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][5] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][5] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetTextColor(1.0, 0.6, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetText(GRM.L("Note"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][6] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][6] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][6] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][6] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetTextColor(1.0, 0.094, 0.93, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetText(GRM.L("Officer's Note"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][7] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][7] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][7] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][7] = false;
            end
            GRM.SyncSettings();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetTextColor(0.24, 0.69, 0.49, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetText(GRM.L("Custom Note"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][14] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][14] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][14] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][14] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetTextColor(0.90, 0.82, 0.62, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetText(GRM.L("Name Change"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][8] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][8] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][8] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][8] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetTextColor(0.64, 0.102, 0.102, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetText(GRM.L("Rank Renamed"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][9] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][9] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][9] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][9] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetText(GRM.L("Event Announce"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][10] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][10] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][10] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][10] = false;
            end
            GRM.SyncSettings();
        end
    end);
     
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetText(GRM.L("Left"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][11] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][11] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][11] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][11] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetTextColor(0.65, 0.19, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetText(GRM.L("Recommendations"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][12] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][12] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][12] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][12] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton, 27, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetTextColor(1.0, 0.0, 0.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetText(GRM.L("Banned"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetWidth(120);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButtonText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][13] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][13] = false;
            end
            GRM.BuildLogComplete( true);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetScript("OnClick", function( self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][13] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][13] = false;
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButtonText:SetPoint("BOTTOM", GRM_UI.GRM_RosterCheckBoxSideFrame, 0, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButtonText:SetText("<  " .. GRM.L("Check All") .. "  >");
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCheckAllChatButton:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton, "BOTTOMRIGHT", 0, 2);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCheckAllChatButton:SetHitRectInsets(0, 0, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCheckAllLogButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            for i = 1, #GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3] do
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][i] = true;
            end
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:SetChecked( true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:SetChecked(true);
        else
            for i = 1, #GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3] do
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][i] = false;
            end
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:SetChecked( false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:SetChecked(false);
        end
        GRM.BuildLogComplete( true);
        GRM.SyncSettings();
    end);

    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCheckAllChatButton:SetScript("OnClick", function( self)
        if self:GetChecked() then
            for i = 1, #GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13] do
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][i] = true;
            end
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetChecked( true);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetChecked(true);
        else
            for i = 1, #GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13] do
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][i] = false;
            end
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetChecked( false);
            GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetChecked(false);
        end
        GRM.BuildLogComplete( true);
        GRM.SyncSettings();
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton, "BOTTOMLEFT", 0, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText:SetText(GRM.L("Notify When Players Request to Join the Guild"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][27] = true;
                GRM.ReportGuildJoinApplicants();
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][27] = false;
            end
            GRM.SyncSettings();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText, "RIGHT", 8, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButtonText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButtonText:SetText(GRM.L("Auto Open Window"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] = true;
                if GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton and GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:IsVisible() then
                    GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetChecked(true);
                end
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] = false;
                if GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton and GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:IsVisible() then
                    GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetChecked(false);
                end
            end
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetScript("OnEnter", function( self)
        GRM_UI.SetTooltipScale();
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
        GameTooltip:AddLine( GRM.L("Only if a player is online and you are not in combat"));
        GameTooltip:Show();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

     -- Propagate for keyboard control of the frames!!!
    GRM_UI.GRM_RosterChangeLogFrame:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame:SetPropagateKeyboardInput(false);
            if GRM_UI.GRM_MemberDetailMetaData:IsVisible() then

                -- Edit Boxes
                if GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox ~= nil and GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerOfficerNoteEditBox:HasFocus() then
                    GRM_UI.EscapeOfficerNoteEditBox();
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox ~= nil and GRM_UI.GRM_MemberDetailMetaData.GRM_PlayerNoteEditBox:HasFocus() then
                    GRM_UI.PlayerPublicNoteEditBox();
                elseif GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox ~= nil and GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:IsVisible() then
                    if GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:HasFocus() then
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:SetText( "");
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame.GRM_AddAltEditBox:ClearFocus();
                    else
                        GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Hide();
                    end
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox ~= nil and GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:IsVisible() and GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteEditBoxFrame.GRM_CustomNoteEditBox:HasFocus() then
                    GRM_UI.CustomNoteEditBoxOnFocusLost();

                -- Drop down menus
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_CustomNoteRankDropDownMenu:Hide();
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_MonthDropDownMenu:Hide();
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_YearDropDownMenu:Hide();
                elseif GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:IsVisible() then
                    GRM_UI.GRM_MemberDetailMetaData.GRM_DayDropDownMenu:Hide();

                -- Blizz default frame
                elseif GuildMemberDetailFrame ~= nil and GuildMemberDetailFrame:IsVisible() then
                    GuildMemberDetailFrame:Hide();
                    GRM_G.pause = true;

                else
                    GRM_G.pause = false;
                    GRM_UI.GRM_MemberDetailMetaData:Hide();
                end
            else
                GRM_UI.GRM_RosterChangeLogFrame:Hide();
            end
            
        end
    end);

    GRM_UI.GRM_RosterConfirmFrame:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterConfirmFrame:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterConfirmFrame:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterConfirmFrame:Hide();
        end
    end);

    -- Build Log Frames Function
    GRM_UI.GRM_RosterChangeLogFrame:SetScript("OnShow", function()
        GRM_UI.BuildLogFrames();
        -- GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetText( GRM.L("Search Filter"));
        if not GRM_G.MinimapOk then
            C_Timer.After(1, function()
                GRM_G.MinimapOk = true;
            end);
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame:SetScript("OnHide", function()
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][31] then
            GRM.SyncAddonSettings();
        end
        GRM_G.banListTimer = 60;         -- Just resetting this timer since it is on an internal 60 second clock but I want it to start at zero when refreshing...
        GRM_G.SearchFocusControl = false;
    end);

    --Side frame for reporting controls
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_TitleSideFrameText:SetPoint("TOP", GRM_UI.GRM_RosterCheckBoxSideFrame, 0, -12);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_TitleSideFrameText:SetText(GRM.L("Display Changes"));
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_TitleSideFrameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnChatSideFrameText:SetPoint("TOPRIGHT", GRM_UI.GRM_RosterCheckBoxSideFrame, -14, -28);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnChatSideFrameText:SetText(GRM.L("To Chat:"));
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnLogSideFrameText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterCheckBoxSideFrame, 14, -28);
    GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_ShowOnLogSideFrameText:SetText(GRM.L ("To Log:"));

    -- User with addon installed...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, 0, - 3.8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameText:SetText(GRM.L("GRM Sync Info") .. "    (" .. GRM.L("Ver: {custom1}", nil, nil, nil, string.sub(GRM_G.Version, string.find(GRM_G.Version, "R", -8), #GRM_G.Version)) .. ")");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame, "TOPLEFT", 20, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText:SetText(string.upper(GRM.L("Name:")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText2:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame, "TOP", 0, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText2:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText2:SetText(string.upper(GRM.L("Sync")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame, "TOPRIGHT", -7, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3:SetWidth(125);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3:SetText(string.upper(GRM.L("Version")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersCoreFrameTitleText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame.GRM_AddonUsersCoreFrameTitleText2:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame.GRM_AddonUsersCoreFrameTitleText2:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame.GRM_AddonUsersCoreFrameTitleText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, 0, 45) ;
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 13);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:SetText(string.upper(GRM.L("Your Sync is Currently Disabled")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersSyncEnabledText:SetTextColor(1, 0, 0, 1);
    
    -- Scroll Frame Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame:SetSize(584, 420);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollBorderFrame:SetPoint("Bottom", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, -10, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame:SetSize(566, 397);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame, -3, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetSize(20, 378);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame, "TOPRIGHT", -2.5, -9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersScrollFrame:SetVerticalScroll( self:GetValue())
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:SetScript("OnShow", function()
        GRM.RefreshAddonUserFrames();
     end);

    -- The mouseover tooltip for the addon users window!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersTooltip:SetWidth(300);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame.GRM_AddonUsersTooltip:SetFrameStrata("DIALOG");
    -- Tooltip logic for on update
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AddonUsersFrame:SetScript("OnUpdate", function(self, elapsed)
        GRM_G.usersTimerTooltip = GRM_G.usersTimerTooltip + elapsed;
        if GRM_G.usersTimerTooltip >= 0.1 then
            local isOver = false;
            for i = 1, #self.GRM_AddonUsersScrollChildFrame.AllFrameFontstrings do
                if self.GRM_AddonUsersScrollChildFrame.AllFrameFontstrings[i][1]:IsMouseOver(2, -2, -2, 2) then
                    isOver = true;
                    if not self.GRM_AddonUsersTooltip:IsVisible() then
                        local classColorRGB = GRM.GetClassColorRGB(GRM.GetPlayerClass(GRM_G.currentAddonUsers[i][1]));
                        self.GRM_AddonUsersTooltip:SetOwner( self.GRM_AddonUsersScrollChildFrame.AllFrameFontstrings[i][1], "ANCHOR_CURSOR");
                        self.GRM_AddonUsersTooltip:AddLine( GRM_G.currentAddonUsers[i][1], classColorRGB[1], classColorRGB[2], classColorRGB[3], true);
                        self.GRM_AddonUsersTooltip:Show();
                    end
                    break
                end
            end
            if not isOver then
                self.GRM_AddonUsersTooltip:Hide();
            end
            GRM_G.usersTimerTooltip = 0;
        end
        -- Update the refresh frames...
        GRM_G.timer5 = GRM_G.timer5 + elapsed;
        if GRM_G.timer5 >= 5 then
            GRM.RegisterGuildAddonUsersRefresh ();
            GRM_G.timer5 = 0;
        end
    end);

    -- AUDIT FRAME VALUES
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameTitleText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, 0, - 3.8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameTitleText:SetText(GRM.L("Guild Data Audit"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText1:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame, "TOPLEFT", 20, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText1:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText1:SetText(string.upper(GRM.L("Name")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText1:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame, "TOP", -87, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2:SetText(string.upper(GRM.L("Join Date")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame, "TOP", 43, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3:SetText(string.upper(GRM.L("Promo Date")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3:SetWidth(115);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame, "TOPRIGHT", -10, -6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4:SetText(string.upper(GRM.L("Main/Alt")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4:SetWidth(115)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText5:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "TOPLEFT", 7, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText5:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText5:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText5:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7, "TOP", 0, 6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetWidth(140);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetText(GRM.L("Click Player to Edit"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText6:SetTextColor(1, 0, 0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8, "TOP", 0, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText7:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText4, "TOP", 0, 3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText8:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, "TOPLEFT", 11, -24);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText:SetText(GRM.L("Only Show Incomplete Guildies"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox.GRM_AudtFrameCheckBoxText:SetWidth( 170);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][30] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][30] = false;
            end
            GRM.SetGuildInfoDetails();
            GRM.RefreshAuditFrames( GRM_G.AuditSortType);
            GRM.SyncSettings();
        end
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox, "BOTTOMLEFT", 0, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox, "RIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText:SetText(GRM.L("Include Unknown as Incomplete"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox.GRM_AuditFrameIncludeUnknownCheckBoxText:SetWidth( 170);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][33] = true;
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][33] = false;
            end
            GRM.SetGuildInfoDetails();
            GRM.RefreshAuditFrames( GRM_G.AuditSortType);
            GRM.SyncSettings();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText2, "TOP", 0, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton:SetSize(100, 45);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText:SetWidth(90);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton.GRM_SetJoinUnkownButtonText:SetSpacing(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            GRM.SetAllIncompleteJoinUnknown();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameText3, "TOP", 0, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton:SetSize(100, 45);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText:SetWidth(90);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton.GRM_SetPromoUnkownButtonText:SetSpacing(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            GRM.SetAllIncompletePromoUnknown();
        end
    end);
    
    -- Scroll Frame Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame:SetSize(584, 380);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollBorderFrame:SetPoint("Bottom", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, -10, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame:SetSize(566, 355);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame, -3, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetSize(20, 336);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame, "TOPRIGHT", -2.5, -9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollFrame:SetVerticalScroll( self:GetValue());
        if GRM.InfiniteScrollNeeeded(self) then
            GRM.RefreshAuditFrames( GRM_G.AuditSortType);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetScript("OnShow", function()
        GRM.SetGuildInfoDetails();
        GRM.RefreshAuditFrames( GRM_G.AuditSortType);
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][30] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameShowAllCheckbox:SetChecked(true);
        end
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][33] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditFrameIncludeUnknownCheckBox:SetChecked(true);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetScript("OnHide", function( self)
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
        if self.GRM_AuditScrollFrameSlider.ScrollCount > 499 then                                                -- Only reset if it hits Blizz's internal limits...
            self.GRM_AuditScrollFrameSlider.MaxValue = 0;
            self.GRM_AuditScrollFrameSlider.ScrollCount = 51;
            self.GRM_AuditScrollFrameSlider:SetValue(0);
        end
    end);

    -- For tooltip on the audit frame...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame:SetScript("OnUpdate", function(self, elapsed)
        GRM_G.auditTimer = GRM_G.auditTimer + elapsed;
        if GRM_G.auditTimer > 0.05 then
            if self:IsMouseOver() then
                local isOverAFrame = false;
                if self.GRM_AuditScrollBorderFrame:IsMouseOver() then
                    for i = 1, #self.GRM_AuditScrollChildFrame.AllFrameFontstrings do
                        if self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][1]:IsVisible() then
                            if self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][1]:IsMouseOver(3, -3, -3, 3) or self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][2]:IsMouseOver(3, -3, -3, 3) or self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][3]:IsMouseOver(3, -3, -3, 3) or self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][4]:IsMouseOver(3, -3, -3, 3) then
                                isOverAFrame = true;
                                if GRM_G.currentAuditFontstringIndex ~= i then        -- This is just checking if need to reprocess tooltip
                                    GRM_G.currentAuditFontstringIndex = i;
                                    GRM_UI.SetTooltipScale();
                                    GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                                    GameTooltip:AddLine(GRM.GetClassifiedName(self.GRM_AuditScrollChildFrame.AllFrameFontstrings[i][1]:GetText(), false));
                                    GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to open Player Window"));
                                    GameTooltip:AddLine( GRM.L("|CFFE6CC7FCtrl-Shift-Click|r to Search the Log for Player"));
                                    GameTooltip:Show();
                                end
                                break;
                            end
                        else
                            break;      -- No need to keep scanning through once we get to a fontstring list that isn't visible...
                        end
                    end
                end
                if not isOverAFrame then
                    if self.GRM_AuditFrameText7:IsMouseOver(2, -2, -2, 2) then
        
                        GRM_UI.SetTooltipScale();
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                        GameTooltip:AddLine(GRM.L("WARNING!"), 0.9, 0.8, 0.5);
                        GameTooltip:AddLine(GRM.L("Unique accounts pull from the server is known to faulty"));
                        GameTooltip:AddLine( GRM.L("Use only as an estimate. Hopefully Blizz fixes this soon"));
                        GameTooltip:Show();
                    elseif self.GRM_AuditFrameText1:IsMouseOver(2, -2, -2, 2) then
                        if IsMouseButtonDown(1) and(time() - GRM_G.sortRestrictionTimer) > 1 then                                     -- For triggering the sorting
                            if GRM_G.AuditSortType == 1 then
                                GRM_G.AuditSortType = 2;
                            else
                                GRM_G.AuditSortType = 1;
                            end
                            GRM_G.sortRestrictionTimer = time();
                            GRM.TriggerRefreshAuditReset();
                        else                                                                -- for the tooltip
                            GRM_UI.SetTooltipScale();
                            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                            GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to flip player name ordering"));
                            GameTooltip:Show();
                        end
                    elseif self.GRM_AuditFrameText2:IsMouseOver(2, -2, -2, 2) then
                        if IsMouseButtonDown(1) and(time() - GRM_G.sortRestrictionTimer) > 1 then                                     -- For triggering the sorting
                            if GRM_G.AuditSortType == 3 then
                                GRM_G.AuditSortType = 4;
                            else
                                GRM_G.AuditSortType = 3;
                            end
                            GRM_G.sortRestrictionTimer = time();
                            GRM.TriggerRefreshAuditReset();
                        else                
                            GRM_UI.SetTooltipScale();
                            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                            if GRM_G.AuditSortType ~= 3 then
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort Join Dates by Newest"));
                            else
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort Join Dates by Oldest"));
                            end
                            GameTooltip:Show();
                        end
                    elseif self.GRM_AuditFrameText3:IsMouseOver(2, -2, -2, 2) then
                        if IsMouseButtonDown(1) and(time() - GRM_G.sortRestrictionTimer) > 1 then                                     -- For triggering the sorting
                            if GRM_G.AuditSortType == 5 then
                                GRM_G.AuditSortType = 6;
                            else
                                GRM_G.AuditSortType = 5;
                            end
                            GRM_G.sortRestrictionTimer = time();
                            GRM.TriggerRefreshAuditReset();
                        else                
                            GRM_UI.SetTooltipScale();
                            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                            if GRM_G.AuditSortType ~= 5 then
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort Promotion Dates by Newest"));
                            else
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort Promotion Dates by Oldest"));
                            end
                            GameTooltip:Show();
                        end
                    elseif self.GRM_AuditFrameText4:IsMouseOver(2, -2, -2, 2) then
                        if IsMouseButtonDown(1) and(time() - GRM_G.sortRestrictionTimer) > 1 then                                     -- For triggering the sorting
                            if GRM_G.AuditSortType == 7 then
                                GRM_G.AuditSortType = 8;
                            else
                                GRM_G.AuditSortType = 7;
                            end
                            GRM_G.sortRestrictionTimer = time();
                            GRM.TriggerRefreshAuditReset();
                        else                
                            GRM_UI.SetTooltipScale();
                            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                            if GRM_G.AuditSortType ~= 7 then
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort all Mains first"));
                            else
                                GameTooltip:AddLine(GRM.L("|CFFE6CC7FClick|r to sort all Alts first."));
                            end
                            GameTooltip:Show();
                        end
                    else
                        GRM_G.currentAuditFontstringIndex = 0;
                        if GameTooltip:GetOwner() ~= nil and GameTooltip:GetOwner():GetName() == "GRM_AuditFrame" then
                            GRM_UI.RestoreTooltipScale();
                            GameTooltip:Hide();
                        end
                    end
                end
            elseif GameTooltip:IsVisible() and GameTooltip:GetOwner() ~= nil and GameTooltip:GetOwner():GetName() == "GRM_AuditFrame" then
                GRM_G.currentAuditFontstringIndex = 0;
                GRM_UI.RestoreTooltipScale();
                GameTooltip:Hide();
            end
            GRM_G.auditTimer = 0;
        end   
    end);

    
    -- On Click -- to bring up the roster window and the player specifically
    GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_AuditScrollChildFrame:SetScript("OnMouseDown", function(self, button) 
        if button == "LeftButton" and not GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetJoinUnkownButton:IsMouseOver (1, -1, -1, 1) and not GRM_UI.GRM_RosterChangeLogFrame.GRM_AuditFrame.GRM_SetPromoUnkownButton:IsMouseOver (1, -1, -1, 1) and GRM_G.currentAuditFontstringIndex > 0 then

            local playerName = self.AllFrameFontstrings[GRM_G.currentAuditFontstringIndex][1]:GetText();
            if IsShiftKeyDown() and IsControlKeyDown() then
                GRM_UI.RestoreTooltipScale();
                GameTooltip:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_LogTab:Click();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogEditBox:SetText( GRM.SlimName(playerName));
            else
                if GuildRosterFrame == nil or(GuildRosterFrame ~= nil and not GuildRosterFrame:IsVisible()) then
                    GuildMicroButton:Click();
                    --CommunitiesFrame:Show();
                end

                -- if CommunitiesFrame:GetSelectedClubId() ~= GRM_G.gClubID then
                --     GRM.Report(GRM.L("Please manually select your guild to view player details"));
                -- else
                    -- local displayMode = CommunitiesFrame:GetDisplayMode();
                    -- if displayMode == COMMUNITIES_FRAME_DISPLAY_MODES.ROSTER or displayMode == COMMUNITIES_FRAME_DISPLAY_MODES.CHAT then
                    GRM_G.currentName = playerName;
                    GRM_G.pause = false;
                    GRM.ClearAllFrames( true);
                    GRM.PopulateMemberDetails(playerName);
                    GRM_UI.GRM_MemberDetailMetaData:Show();
                    GuildMemberDetailFrame:Hide();
                    GRM_G.pause = true;
                    -- end
                -- end                
            end
        end
    end);

    -- BAN LIST FRAME LOGIC AND INITIALIZATION DETAILS!!!
    -- User with addon installed...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, 0, - 3.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText2:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame, "TOPLEFT", 20, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText2:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText2:SetText(string.upper(GRM.L("Name:")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText3:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame, "TOP", 68, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText3:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText3:SetText(string.upper(GRM.L("Rank")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText4:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame, "TOP", 215, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText4:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText4:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText4:SetText(string.upper(GRM.L("Ban Date")));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton, "RIGHT", 10, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetWidth(100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText, "RIGHT", 30, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameNumBannedText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, 8, - 6);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameNumBannedText:SetTextColor(0.0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameNumBannedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetTextColor(0.64, 0.102, 0.102);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetWidth(275);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameAllOfflineText:SetText(GRM.L("No Players Have Been Banned from Your Guild"));
    -- Scroll Frame Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame:SetSize(584, 375);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollBorderFrame:SetPoint("Bottom", GRM_UI.GRM_RosterChangeLogFrame, -10, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame:SetSize(566, 353);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame, -3, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetSize( 20, 334);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame, "TOPRIGHT", -2.5, -9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetFrameStrata("HIGH");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollFrame:SetVerticalScroll( self:GetValue())
    end);
    --Add and Remove Ban Buttons
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame, "TOPLEFT", 25, -28);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton:SetSize(80, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetWidth(70);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetText(GRM.L("Remove Ban"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButtonText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton, "RIGHT", 25, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton:SetSize(80, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButtonText:SetText(GRM.L("Add"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButtonText :SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.ScaleFontStringToObjectSize(true, 80, GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButtonText, 5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton, "RIGHT", 25, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton:SetSize(80, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButtonText:SetText(GRM.L("Edit Ban"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButtonText :SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.ScaleFontStringToObjectSize(true, 80, GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButtonText, 5);

    -- Add Ban Frame and details..
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetPoint("CENTER", UIPanel);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetSize(330, 250);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetFrameStrata("DIALOG");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetToplevel(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:EnableMouse(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetMovable(true);    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:RegisterForDrag("LeftButton");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetScript("OnDragStart", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.StartMoving);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetScript( "OnDragStop", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.StopMovingOrSizing);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanTitleText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanTitleText:SetText(GRM.L("Add Player to Ban List"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanTitleText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText:SetPoint("RIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton, "LEFT", -17, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText:SetWidth(75);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText:SetText(GRM.L("Press ENTER to complete"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText:SetWordWrap(true);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2:SetPoint("RIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText, "LEFT", -17, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2:SetWidth(90);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2:SetText(GRM.L("Click or Press TAB to cycle through each step."));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_CompleteBanEntryText2:SetWordWrap(true);


    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "TOPLEFT", 18, -35);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText:SetText(GRM.L("Name:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    -- Edit Box Values
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText, "RIGHT", 20, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetSize(125, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetMaxLetters(12);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetAutoFocus( false);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox, "BOTTOMLEFT", -5, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetSize(130, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetFrameStrata("FULLSCREEN");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetWordWrap(false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:SetFrameStrata("FULLSCREEN_DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:SetScript("OnShow", function()
        -- Cleanup
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu.Buttons ~= nil then
            for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu.Buttons do
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu.Buttons[i][2]:GetText() == GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:GetText() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu.Buttons[i][1]:LockHighlight();
                    GRM_G.DropDownHighlightLockIndex = i;
                else
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu.Buttons[i][1]:UnlockHighlight();
                end
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:Show();
        elseif key == "TAB" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
            GRM_UI.TabNextDropDown(self, false);
        elseif key == "ENTER" then
            self:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetText(self.Buttons[GRM_G.DropDownHighlightLockIndex][2]:GetText());
            GRM_UI.CheckForBanPlayerAutoSelect(true, true);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:Show();
            self:Hide();
        elseif key == "UP" then
            self:SetPropagateKeyboardInput(false);
            GRM_UI.TabNextDropDown(self, true);
        elseif key == "DOWN" then
            self:SetPropagateKeyboardInput(false);
            GRM_UI.TabNextDropDown(self, false);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetScript("OnShow", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
    end)

    GRM_UI.GRM_BanServerSelectedClick = function( isCarryOver)
        local serverNames = GRM.GetAllConnectedRealms();
        if #serverNames > 1 then
            if  GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:IsVisible() then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
                if isCarryOver then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Show();
                end
            else
                GRM.CreateServerSelectionDropdown(serverNames);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Show();
            end
        elseif isCarryOver then
            -- Server Names not greater than 1 but should open class selection
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Show();
        end
    end

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            GRM_UI.GRM_BanServerSelectedClick( false);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetScript("OnEnter", function( self)
        local serverNames = GRM.GetAllConnectedRealms();
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:IsVisible() and #serverNames > 1 then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to select player's realm."));
            GameTooltip:AddLine( GRM.L("All Connected Realms are available to choose."));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected:SetScript("OnLeave", function()
        if GameTooltip:IsVisible() then
            GRM_UI.RestoreTooltipScale();
            GameTooltip:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected, "BOTTOMLEFT", 0, -3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame:SetBackdrop(GRM_UI.noteBackdrop2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame:SetSize(130, 60);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame:EnableMouse(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame, "TOPLEFT", 2, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetSize(127, 60);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetTextInsets( 2, 3, 3, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetMaxBytes(76);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:EnableMouse( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetAutoFocus( false);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetMultiLine( true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetSpacing(1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanServerSelectionText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionText, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanServerSelectionText:SetText(GRM.L("Server:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanServerSelectionText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanClassSelectionText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanServerSelectionText, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanClassSelectionText:SetText(GRM.L("Class:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanClassSelectionText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanClassSelectionText, "BOTTOMLEFT", 0, -10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxText:SetText(GRM.L("Reason:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, 0, 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetText(GRM.L("It is |CFFFF0000CRITICAL|r the player's name and server are spelled correctly for accurate tracking and notifications."));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetWidth(250);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetTextColor(0, 0.8, 1, 1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionWarningText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 11);

    -- Editbox controls
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnEscapePressed", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnEnterPressed", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton:Click();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnCursorChanged", function( self)
        if self:GetHeight() > 56 then
            local text =  self:GetText();
            self:SetText(string.sub(text, 1, #text - 1));
        end
    end);

    -- Confirm Button Values
    -- Bring up the window for the ban list!!!
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton:SetSize(80, 30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame, "BOTTOMRIGHT", 20, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetWidth(75);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetSpacing(1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnEnterPressed", function( self)
        if self:GetText() == "" or not GRM.IsValidName( self:GetText()) then
            GRM.Report(GRM.L("Please Enter a Valid Player Name"));
            return
        end
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnEscapePressed", function( self)
        if self:GetText() == "" or not GRM.IsValidName( self:GetText()) then
            GRM.Report(GRM.L("Please Enter a Valid Player Name"));
        end
        GRM_G.EscapeControl = true;
        C_Timer.After(1, function()
            GRM_G.EscapeControl = false;
        end);
        self:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnTabPressed", function( self)
        if self:GetText() == "" or not GRM.IsValidName( self:GetText()) then
            GRM.Report(GRM.L("Please Enter a Valid Player Name"));
            return
        end
        -- Let's format the name properly...
        self:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        if IsShiftKeyDown() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
        else
            -- Open dropdown
            local serverNames = GRM.GetAllConnectedRealms();
            if #serverNames > 1 then
                if not(#self:GetText() > 0 and GRM.IsValidName( self:GetText())) then
                    GRM_UI.GRM_BanServerSelectedClick( false);
                end
            end
        end
    end);

    GRM_UI.BanFrameOnTextChanged = function( isWaiting)
        if GetTime() - GRM_G.AutoCompleteThrottle > 0.2 then
            GRM_G.AutoCompleteThrottle = GetTime();
            isWaiting = false;
            
            -- Let's populate the scrollframe!
            GRM.BuildAutoCompleteBanNames(GRM.GetAutoCompleteMatches(GRM_G.autoCompleteBanList, GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText()));

        elseif not isWaiting then
            C_Timer.After(0.5 -(GetTime() - GRM_G.AutoCompleteThrottle), function()
                GRM_UI.BanFrameOnTextChanged(true)
            end);
        end
    end
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnTextChanged", function(self)
        if not GRM_G.InitiatingBanEdit then
            GRM_UI.BanFrameOnTextChanged(false);
        end
    end);

    GRM_UI.CheckForBanPlayerAutoSelect = function( playerNameBoxExit, isServerSelection)
        local name = GRM.FormatInputName(GRM.Trim( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText()));
        if #GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText() > 0 and GRM.IsValidName( name) then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetText(name);
            if isServerSelection then
                name = name .. "-" .. GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:GetText();
            end
            -- Now, we check the class...
            local isFound = false;
            local foundInfo = {};
            for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                if(isServerSelection and GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == name) or(not isServerSelection and GRM.SlimName(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1]) == name) then
                    isFound = true;
                    table.insert(foundInfo, { GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1], GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9] });
                    if isServerSelection and isFound then       -- No need to keep scanning if name-server already determined.
                        break;
                    end
                end
            end

            if(isServerSelection and not isFound) or not isServerSelection then
                for j = 2, #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if(isServerSelection and GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == name) or(not isServerSelection and GRM.SlimName(GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1]) == name) then
                        isFound = true;
                        table.insert(foundInfo, { GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1], GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9] });
                        if isServerSelection and isFound then
                            break;
                        end
                    end
                end
            end
            -- /run local g=GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ];table.insert(g, g[2]);g[#g][1]="Arkaan-Fizzcrank";
            if isFound and #foundInfo == 1 then
                -- Setting global use of the selected ban class
                GRM_G.tempAddBanClass = foundInfo[1][2];

                local indexOfClass = 1;
                -- Set the index                
                for i = 1, #AllClasses do
                    if string.lower(AllClasses[i]) == string.lower(GRM_G.tempAddBanClass) then
                        indexOfClass = i;
                        break;
                    end
                end

                -- Auto selecting the class
                local colors = GRM.GetClassColorRGB(string.upper(AllClasses[indexOfClass]));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetText( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[indexOfClass][2]:GetText());
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetTextColor(colors[1], colors[2], colors[3], 1);

                -- Selecting the server
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetText(string.sub(foundInfo[1][1], string.find(foundInfo[1][1], "-") + 1));

                if playerNameBoxExit then
                    -- Skipping Class selection
                    C_Timer.After(0.1, function()
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:HighlightText(0);
                    end);
                else
                    C_Timer.After(0.1, function()
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:HighlightText(0);
                    end);
                end
            elseif #foundInfo > 1 then
                GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("{num} players were found to have the same name. Please manually select which connected realm the player you wish to ban is on.", nil, nil, #foundInfo));
                GRM_UI.GRM_BanServerSelectedClick( false);
            elseif not isFound then
                GRM_UI.GRM_BanServerSelectedClick( true);
            end
        elseif not(#GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText() > 0 and GRM.IsValidName( name)) then
            GRM_UI.GRM_BanServerSelectedClick( true);
        end
    end

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnEditFocusLost", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:Hide();
        if not GRM_G.EscapeControl then
            GRM_UI.CheckForBanPlayerAutoSelect( true, false);
        end
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:Hide();
    end);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetScript("OnEditFocusGained", function( self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        if #self:GetText() > 0 then
            GRM_UI.BanFrameOnTextChanged(false);
        end
    end);

    -- Method:          GRM_UI.TabNextDropDown(ArrayOfButtons, boolean)
    -- What it Does:    To control the tab-through on any dropdown list, for for tab and shit-tab backwards.
    -- Purpose:         Provide UI flexibility and code time-saving opportunities.
    GRM_UI.TabNextDropDown = function(dropDown, isUp)
        local buttons = dropDown.Buttons
        if not IsShiftKeyDown() and not isUp then
            if GRM_G.DropDownHighlightLockIndex ~= #buttons then
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex][1]:UnlockHighlight();
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex + 1][1]:LockHighlight();
                GRM_G.DropDownHighlightLockIndex = GRM_G.DropDownHighlightLockIndex + 1;
            else
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex][1]:UnlockHighlight();
                dropDown.Buttons[1][1]:LockHighlight();
                GRM_G.DropDownHighlightLockIndex = 1;
            end
        else
            if GRM_G.DropDownHighlightLockIndex ~= 1 then
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex][1]:UnlockHighlight();
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex - 1][1]:LockHighlight();
                GRM_G.DropDownHighlightLockIndex = GRM_G.DropDownHighlightLockIndex - 1;
            else
                dropDown.Buttons[GRM_G.DropDownHighlightLockIndex][1]:UnlockHighlight();
                dropDown.Buttons[#buttons][1]:LockHighlight();
                GRM_G.DropDownHighlightLockIndex = #buttons;
            end
        end
    end

    -- CLASS DROP DOWN MENU 
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected, "BOTTOMLEFT", 0, -4);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetSize( 130, 18);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetFrameStrata("FULLSCREEN")
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetWidth(130);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected, "BOTTOM");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetWidth(129);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetFrameStrata("FULLSCREEN");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:Show();
        elseif key == "TAB" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
            GRM_UI.TabNextDropDown(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu, false);
        elseif key == "ENTER" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPropagateKeyboardInput(false);
            local classColors = GRM.GetClassColorRGB(string.upper(AllClasses[GRM_G.DropDownHighlightLockIndex]));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetText(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[GRM_G.DropDownHighlightLockIndex][2]:GetText());
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetTextColor(classColors[1], classColors[2], classColors[3], 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:Show();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
            GRM_G.tempAddBanClass = string.upper(AllClasses[GRM_G.DropDownHighlightLockIndex]);
        elseif key == "UP" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.TabNextDropDown(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu, true);
        elseif key == "DOWN" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetPropagateKeyboardInput(false);
            GRM_UI.TabNextDropDown(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu, false);
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetScript("OnHide", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:SetScript("OnShow", function()
        -- Cleanup
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();

        if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons ~= nil then
            for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons do
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[i][2]:GetText() == GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:GetText() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[i][1]:LockHighlight();
                    GRM_G.DropDownHighlightLockIndex = i;
                else
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[i][1]:UnlockHighlight();
                end
            end
        end
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnTabPressed", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        if IsShiftKeyDown() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Show();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetFocus();            
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnEditFocusGained", function( self)
        self:HighlightText(0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:SetText(#self:GetText() .. "/" .. self:GetMaxLetters());
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:Show();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnEditFocusLost", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:HighlightText(#GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:GetText());
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetScript("OnTextChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:SetText(#self:GetText() .. "/" .. self:GetMaxBytes() - 1);
    end);
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetScript("OnShow", function() 
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetScript("OnMouseDown", function( _, button) 
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:IsVisible() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
            else
                if GameTooltip:IsVisible() then
                    GRM_UI.RestoreTooltipScale();
                    GameTooltip:Hide();
                end
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Show();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetScript("OnEnter", function( self)
        if not GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:IsVisible() then
            GRM_UI.SetTooltipScale();
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine( GRM.L("|CFFE6CC7FClick|r to select player class"));
            GameTooltip:Show();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelected:SetScript("OnLeave", function()
        GRM_UI.RestoreTooltipScale();
        GameTooltip:Hide();
    end);

    -- Resets the values on loading the "Add Ban" window...
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetScript("OnShow", function()
        if not GRM_G.InitiatingBanEdit then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetFocus();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetText("");
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetText(GRM_G.realmName);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetText(GRM.L("Deathknight"));
            GRM_G.tempAddBanClass = "DEATHKNIGHT";
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetTextColor(0.77, 0.12, 0.23, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetText(GRM.L("Reason Banned?"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        end
        GRM.PopulateClassDropDownMenu();

        -- Create the autocomplete list so it doesn't have to keep rebuilding it over and over.
        GRM_G.autoCompleteBanList = GRM.GetAllCurrentAndFormerGuildies();
    end)

    -- Autocomplete scrollframe
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:Hide();
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:SetSize(115, 100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox, "TOPRIGHT", 3, -3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetSize( 20, 68);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame, "TOPRIGHT", -10, -15);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_AddBanScrollFrameSlider:SetScript( "OnValueChanged", function( self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame:SetVerticalScroll( self:GetValue());
    end);
    -- Text Helper
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame, "BOTTOM", 0, -3);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText:SetWidth(110);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanScrollFrame.GRM_BanFrameHelperText:SetTextColor(0, 0.8, 1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetScript("OnHide", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        GRM_G.autoCompleteBanList = {};     -- Clear out the list.
    end)

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame, "BOTTOM", -1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetSize(307, 100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:EnableKeyboard(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetToplevel(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetFrameStrata("DIALOG");

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, "BOTTOMLEFT", 25, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton:SetSize(50, 30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButtonText:SetText(GRM.L("Confirm"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, "BOTTOMRIGHT", -25, 20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton:SetSize(50, 30);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButtonText:SetText(GRM.L("Cancel"));

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton, "RIGHT", 2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox, "RIGHT", 2, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText:SetTextColor(1, 0, 0, 1);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame, 0, -20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText:SetText(GRM.L("Confirm Ban for the Following Player?"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText2:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText, "BOTTOM", 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText2:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:SetPoint("BOTTOMLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBoxFrame, "BOTTOMRIGHT", 1, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_ReasonCountText:Hide();

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if not self:GetChecked() then
                GRM_G.isChecked2 = false;
            else
                GRM_G.isChecked2 = true;
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameCancelButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:SetScript("OnShow", function()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:ClearFocus();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then

            GRM_G.isChecked2 = false;       -- Gotta reset the alt check...
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:SetChecked(false);

            -- Run some logic... and if it is good, confirm popup window pop
            local name = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText();
            local server = GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:GetText();
            local needsToReEnter = false;

            if #name <= 1 or not GRM.IsValidName( name) then
                GRM.Report(GRM.L("Please Enter a Valid Player Name"));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetFocus();
                needsToReEnter = true;
            end
            if #server <= 1 or tonumber(server) ~= nil then
                GRM.Report(GRM.L("Please Enter a Valid Server Name"));
                needsToReEnter = true;
            end
            
            if not needsToReEnter then
                local name =(GRM.FormatInputName(GRM.Trim( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText())) .. "-" .. GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:GetText());
                               
                -- Check if there are alts.
                local isFound = false;
                local numAlts = 0;
                for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == name then
                        isFound = true;
                        if GRM_G.tempAddBanClass ~= GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9] then
                            local wrongName = GRM.FormatInputName(GRM_G.tempAddBanClass);
                            if wrongName ~= nil and wrongName ~= "" and wrongName ~= GRM.FormatInputName(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9]) then
                                GRM.Report(GRM.L("{name} plays the {custom1} class, not {custom2}.", name, nil, nil, GRM.L(GRM.FormatInputName(GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9])), GRM.L(wrongName)));
                            end
                        end
                        GRM_G.tempAddBanClass = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9];
                        numAlts = #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][11];
                        break;
                    end
                end

                for j = 2, #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == name then
                        isFound = true;
                        if GRM_G.tempAddBanClass ~= GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9] then
                            local wrongName = GRM.FormatInputName(GRM_G.tempAddBanClass);
                            if wrongName ~= nil and wrongName ~= "" and wrongName ~= GRM.FormatInputName(GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9]) then
                                GRM.Report(GRM.L("{name} plays the {custom1} class, not {custom2}.", name, nil, nil, GRM.L(GRM.FormatInputName(GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9])), GRM.L(wrongName)));
                            end
                        end
                        GRM_G.tempAddBanClass = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9];
                        numAlts = #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][11];
                        break;
                    end
                end
                
                if isFound then
                    local indexOfClass = 1;
                    -- Set the index                
                    for i = 1, #AllClasses do
                        if string.lower(AllClasses[i]) == string.lower(GRM_G.tempAddBanClass) then
                            indexOfClass = i;
                            break;
                        end
                    end

                    local colors = GRM.GetClassColorRGB(string.upper(AllClasses[indexOfClass]));
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetText( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[indexOfClass][2]:GetText());
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetTextColor(colors[1], colors[2], colors[3], 1);
                end
                
                if isFound and numAlts > 0 then
                    if numAlts > 1 then
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText:SetText(GRM.L("Ban the Player's {num} alts too?", nil, nil, numAlts));
                    else
                        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckboxText:SetText(GRM.L("Ban the Player's {num} alt too?", nil, nil, numAlts));
                    end
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:Show();
                else
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanAllAltsCheckbox:Hide();
                end
                
                 -- Popupwindow confirm Frames
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:ClearFocus();
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:ClearFocus();
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu:Hide();
 
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText2:SetText(name);
                 local classColors = GRM.GetClassColorRGB(string.upper(GRM_G.tempAddBanClass));
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameText2:SetTextColor(classColors[1], classColors[2], classColors[3], 1);
                 GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Show();

            end
        end
    end);

    -- So escape key can hide the frames.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetScript("OnKeyDown", function(_, key)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:SetPropagateKeyboardInput(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:Hide();
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrameYesButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            local needsDelayedRefresh = false;      -- for controlling if to add to friends to find GUID
            -- This is where the actual logic for doling out the ban takes place!!!
            
            -- Required info to add the player...
            local fullName = GRM.Trim( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:GetText()) .. "-" .. string.gsub(string.gsub(GRM.Trim( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:GetText()), "-", ""), "%s+", "");
            local banReason = GRM.Trim(GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:GetText());
            if banReason == GRM.L("Reason Banned?") or banReason == nil then
                banReason = "";
            end
            
            -- Ok, let's check if this player is already currently in the guild.
            local isFoundInLeft = false;
            local isFoundInGuild = false;
            local isAnEdit = false;
            local indexFound = 0;
            local originalClass = "";
            for i = 2, #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                if GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == fullName then
                    isFoundInLeft = true;
                    indexFound = i;
                    GRM_G.tempAddBanClass = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][9];
                    originalClass = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][9];
                    break;
                end
            end


            if not isFoundInLeft then
                for j = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][1] == fullName then
                        isFoundInGuild = true;
                        indexFound = j;
                        GRM_G.tempAddBanClass = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9];
                        originalClass = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][j][9];
                        break;
                    end
                end
            end

            local listOfAlts = {};
            local guid = "";
            if isFoundInLeft then
                if GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][1] then
                    -- Player was previously banned! This is just an update!
                    GRM.Report(GRM.L("{name}'s Ban Info has Been Updated!", GRM.GetStringClassColorByName(fullName, true) .. GRM.SlimName(fullName) .. "|r"));
                    isAnEdit = true;
                else
                    GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][1] = true;
                end
                GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][2] = time();
                GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][3] = false;
                GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][4] = GRM_G.addonPlayerName;
                GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][18] = banReason;
                listOfAlts = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][11];
                guid = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][42];
            
            elseif isFoundInGuild then
                if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][1] then
                    -- Player was previously banned! This is just an update!
                    GRM.Report(GRM.L("{name}'s Ban Info has Been Updated!", GRM.GetClassifiedName(fullName, true)));
                    isAnEdit = true
                else
                    GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][1] = true;
                end
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][2] = time();
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][3] = false;
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][17][4] = GRM_G.addonPlayerName;
                GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][18] = banReason;
                listOfAlts = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][11];
                guid = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][indexFound][42];
                
            else
                needsDelayedRefresh = true;
                local memberInfoToAdd = {
                    fullName,
                    "< " .. GRM.L("Unknown") .. " >",
                    GuildControlGetNumRanks() - 1,
                    1,
                    "",
                    "",
                    string.upper(GRM_G.tempAddBanClass),
                    1,
                    "",
                    100,
                    false,
                    1,
                    false,
                    0,
                    ""
                }
                -- Add ban of in-guild guildie with notification!!!
                GRM.AddMemberToLeftPlayers(memberInfoToAdd, time(), time() - 5000, GRM_G.addonPlayerName);

                -- Now, let's implement the ban!
                for i = 2, #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do
                    if GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == fullName then
                        GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][17][1] = true;
                        GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][17][2] = time();
                        GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][17][3] = false;
                        GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][17][4] = GRM_G.addonPlayerName;
                        GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][18] = banReason;
                        break;
                    end
                end

                if not GRM_G.CheckingGUIDThroughFriendsList then
                    GRM.QueryPlayersGUIDByFriendsList(GRM.GetPlayersWithoutGUID(), 1, true, true);
                end
                
            end

            -- Let's cleanup the alts now..
            if GRM_G.isChecked2 then
                for i = 1, #listOfAlts do
                    GRM.BanSpecificPlayer(listOfAlts[i][1], true, banReason, GRM_G.addonPlayerName);
                end
            end

            if banReason == "" then
                banReason = GRM.L("None Given");
            end

            if originalClass == "" then
                GRM_G.CurrentBanSelectedName = { fullName, string.upper(GRM_G.tempAddBanClass) };
            else
                GRM_G.CurrentBanSelectedName = { fullName, string.upper(originalClass) };
            end
            local colorCode = GRM.GetClassColorRGB(GRM_G.CurrentBanSelectedName[2], true);
            local log = "";

            if isFoundInGuild and GRM_G.isChecked2 then
                if not isAnEdit then
                    log = GRM.L("{name} has BANNED {name2} and all linked alts from the guild!", GRM.GetClassifiedName(GRM_G.addonPlayerName, true), GRM.GetClassifiedName(fullName, true));
                else
                    log = GRM.L("{name} has Updated {name2}'s BAN and also BANNED all linked alts from the guild!", GRM.GetClassifiedName(GRM_G.addonPlayerName, true), GRM.GetClassifiedName(fullName, true));
                end
            elseif GRM_G.isChecked2 then
                if not isAnEdit then
                    log = GRM.L("{name} has BANNED {name2} and all linked alts from the guild!", GRM.GetClassifiedName(GRM_G.addonPlayerName, true), colorCode .. GRM.SlimName(fullName) .. "|r");
                else
                    log = GRM.L("{name} has Updated {name2}'s BAN and also BANNED all linked alts from the guild!", GRM.GetClassifiedName(GRM_G.addonPlayerName, true), colorCode .. GRM.SlimName(fullName) .. "|r");
                end
            else
                if not isAnEdit then
                    log = GRM.L("{name} has BANNED {name2} from the guild!", GRM.GetClassifiedName(GRM_G.addonPlayerName, true), colorCode .. GRM.SlimName(fullName) .. "|r");
                else
                    log = GRM.L("{name}'s Ban has been Updated by {name2}!", colorCode .. GRM.SlimName(fullName) .. "|r", GRM.GetClassifiedName(GRM_G.addonPlayerName, true));
                end
            end
            if banReason ~= GRM.L("None Given") then
                log =(log .. "\n|CFFFFFFFF" .. GRM.L("Reason Banned:") .. " " .. banReason);
            end
            GRM.AddLog(17, GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. log);
                    
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][13] then
                DEFAULT_CHAT_FRAME:AddMessage(log, 1.0, 0, 0, 1);
            end
            GRM.BuildLogComplete( true);

            -- Live Sync the ban
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][21] then
                local syncRankFilter = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15];
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] then
                    syncRankFilter = GuildControlGetNumRanks() - 1;
                end
                if guid == "" then
                    guid = "X";
                end
                GRMsync.SendMessage("GRM_SYNC", GRM_G.PatchDayString .. "?GRM_BAN?" .. syncRankFilter .. "?" .. tostring(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][22]) .. "?" .. fullName .. "?" .. tostring(GRM_G.isChecked2) .. "?" .. banReason .. "?" .. originalClass .. "?" .. guid, "GUILD");
            end

            -- Finally, close the window
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_PopupWindowConfirmFrame:Hide();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:Hide();

            -- and Update the live frames too!
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:IsVisible() then
                if not needsDelayedRefresh then
                    GRM.RefreshBanListFrames();
                else
                    GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("One moment, requesting additional details on {name} from the server. Ban List will soon update.", colorCode .. GRM.SlimName(fullName) .. "|r"));
                    C_Timer.After(5, function()
                        GRM.RefreshBanListFrames();
                    end);
                end
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListAddButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetText(GRM.L("Submit Ban"));
            GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:Show();
        end
    end);
    -- For when the frame appears
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:SetScript("OnShow", function()
        -- Reset the highlights and some certain frames...
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameTitleText:SetText(GRM.L("{name} - Ban List", GRM.SlimName(GRM_G.guildName)));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameText:SetText(GRM.L("Select a Player"));
        
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollChildFrame.allFrameButtons ~= nil then
            for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollChildFrame.allFrameButtons do
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListScrollChildFrame.allFrameButtons[i][1]:UnlockHighlight();
            end
        end
        -- Build the frames...
        GRM.RefreshBanListFrames();

        if not GRM_G.CheckingGUIDThroughFriendsList then
            GRM.QueryPlayersGUIDByFriendsList(GRM.GetPlayersWithoutGUID(), 1, true, false);
        end
    end);

    if not isManualUpdate then
        -- Logic for sorting the ban list frames
        GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame:SetScript("OnUpdate", function(self, elapsed)
            GRM_G.TimerBanUpdate = GRM_G.TimerBanUpdate + elapsed;
            if GRM_G.TimerBanUpdate > 0.05 then
                if GetMouseFocus() == GRM_UI.GRM_RosterChangeLogFrame and IsMouseButtonDown(1) and(time() - GRM_G.sortRestrictionTimer) > 0.2 then
                    GRM_G.sortRestrictionTimer = time();
                    local needsRefresh = false;

                    local setValue = function(int)
                        if GRM_G.banDetailsControl[1] ~= int then
                            GRM_G.banDetailsControl = { int, true };
                        else
                            if GRM_G.banDetailsControl[2] then
                                GRM_G.banDetailsControl[2] = false;
                            else
                                GRM_G.banDetailsControl[2] = true;
                            end
                        end
                    end

                    if self.GRM_CoreBanListFrameTitleText2:IsMouseOver(1, -1, -1, 1) then
                        setValue(2);
                        needsRefresh = true;
                    elseif self.GRM_CoreBanListFrameTitleText3:IsMouseOver(1, -1, -1, 1) then
                        setValue(3);
                        needsRefresh = true;
                    elseif self.GRM_CoreBanListFrameTitleText4:IsMouseOver(1, -1, -1, 1) then
                        setValue(4);
                        needsRefresh = true;
                    end
                    if needsRefresh then
                        GRM.RefreshBanListFrames();
                    end
                end

                if self.GRM_CoreBanListFrameTitleText2:IsMouseOver(1, -1, -1, 1) or self.GRM_CoreBanListFrameTitleText3:IsMouseOver(1, -1, -1, 1) or self.GRM_CoreBanListFrameTitleText4:IsMouseOver(1, -1, -1, 1) then
                    if not self.GRM_BanHeaderTooltip:IsVisible() then
                        self.GRM_BanHeaderTooltip:SetOwner(self, "ANCHOR_CURSOR");
                        self.GRM_BanHeaderTooltip:AddLine( GRM.L("Click to Sort"));
                        self.GRM_BanHeaderTooltip:Show();
                    end;
                elseif self.GRM_BanHeaderTooltip:IsVisible() then
                    self.GRM_BanHeaderTooltip:Hide();
                end

                GRM_G.TimerBanUpdate = 0;
            end
        end);
    end

    -- Removing a player from the ban list that is no longer in the guild.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListRemoveButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:IsVisible() then
                
                -- Send the unban out for sync'd players
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][21] then
                    GRMsync.SendMessage("GRM_SYNC", GRM_G.PatchDayString .. "?GRM_UNBAN?" .. GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15] .. "?" .. tostring(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][22]) .. "?" .. GRM_G.TempBanTarget[1] .. "?", "GUILD");
                end
               
                -- Do the unban locally...
                GRM.BanListUnban(GRM_G.TempBanTarget[1], GRM_G.addonPlayerName);

                -- Message
                if GRM_G.TempBanTarget ~= nil and #GRM_G.TempBanTarget ~= 0 then
                    local colorCode = GRM.rgbToHex({ GRM_G.TempBanTarget[2][1], GRM_G.TempBanTarget[2][2], GRM_G.TempBanTarget[2][3] });
                    local finalMsg = GRM.L("{name} has been UN-BANNED from the guild!", colorCode .. GRM.SlimName(GRM_G.TempBanTarget[1]) .. "|r");
                    GRM.AddLog(17 ,(GRM.FormatTimeStamp(GRM.GetTimestamp(), true) .. " : " .. finalMsg));
                    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][13] then
                        DEFAULT_CHAT_FRAME:AddMessage(finalMsg, 1.0, 0.0, 0);
                    end
                    if GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame:IsVisible() then
                        GRM.BuildLogComplete( true);
                    end
                end

                GRM_UI.UpdateBanTabCurrentlyInGuild();
            else
                GRM.Report(GRM.L("Please Select a Player to Unban!"));
            end
        end
    end);

    -- For managing the logic on the ban editing.
    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_BanListEditButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_CoreBanListFrameSelectedNameText:IsVisible() then
                GRM_G.InitiatingBanEdit = true;
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame:Show();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanConfirmButtonText:SetText(GRM.L("Update Ban"));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanNameSelectionEditBox:SetText(GRM.SlimName(GRM_G.TempBanTarget[1]));
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_BanServerSelected.GRM_BanServerSelectedText:SetText(string.sub(GRM_G.TempBanTarget[1], string.find(GRM_G.TempBanTarget[1], "-") + 1));
                
                local class = "";
                local indexOfClass = 1;
                local banReason = "";
                for i = 2, #GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do      
                    if GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.TempBanTarget[1] then
                        class = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][9];
                        banReason = GRM_GuildMemberHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][18];
                        break;
                    end
                end
                if class == "" then
                    for i = 2, #GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ] do      
                        if GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][1] == GRM_G.TempBanTarget[1] then
                            class = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][9];
                            banReason = GRM_PlayersThatLeftHistory_Save[ GRM_G.FID ][ GRM_G.saveGID ][i][18];
                            break;
                        end
                    end
                end
                -- Set the index                
                for i = 1, #AllClasses do
                    if string.lower(AllClasses[i]) == string.lower(class) then
                        indexOfClass = i;
                        break;
                    end
                end
                GRM_G.tempAddBanClass = string.upper(AllClasses[indexOfClass]);
                local colors = GRM.GetClassColorRGB(GRM_G.tempAddBanClass);
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetText( GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownMenu.Buttons[indexOfClass][2]:GetText());
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanDropDownClassSelectedText:SetTextColor(colors[1], colors[2], colors[3], 1);
                if banReason ~= GRM.L("None Given") and banReason ~= "" then
                    
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetText(banReason);
                else
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetText(GRM.L("Reason Banned?"));
                end
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:SetFocus();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_CoreBanListFrame.GRM_AddBanFrame.GRM_AddBanReasonEditBox:HighlightText(0);                
            else
                GRM.Report(GRM.L("Please Select a Player to Edit their Ban!"));
            end
            C_Timer.After(0.5, function()
                GRM_G.InitiatingBanEdit = false;
            end);
        end
    end);

    -- CALENDAR ADD EVENT FRAME
    -- SINCE PROTECTED FEATURE, PLAYER MUST MANUALLY ADD
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameTitleText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, 0, - 3.5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameTitleText:SetText(GRM.L("Event Calendar Manager"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollBorderFrame, 17, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText:SetText(GRM.L("Name:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2:SetWidth(170);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollBorderFrame, -85, 8);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2:SetText(GRM.L("Event:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText2, "RIGHT", 3, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3:SetText(GRM.L("Description:"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3:SetJustifyH("LEFT");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameTitleText3:SetWidth(280);
    -- Scroll Frame Details
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollBorderFrame:SetSize(584, 375);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollBorderFrame:SetPoint("Bottom", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, -10, -2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame:SetSize(566, 353);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame:SetPoint("BOTTOM", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, -3, 10);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame:SetScrollChild(GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame);
    -- Slider Parameters
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetOrientation( "VERTICAL");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetSize( 20, 334);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame, "TOPRIGHT", -2.5, -9);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetValue( 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrameSlider:SetScript( "OnValueChanged", function(self)
        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollFrame:SetVerticalScroll( self:GetValue())
    end);
    -- Buttons
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton:SetPoint("TOPLEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, "TOPLEFT", 25, -28);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton:SetSize(80, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText:SetText(GRM.L("Add to\nCalendar"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GRM_UI.ScaleFontStringToObjectSize(true, 70, GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButtonText, 2);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton, "RIGHT", 25, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton:SetSize(80, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText:SetPoint("CENTER", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText:SetText(GRM.L("Ignore Event"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText:SetWidth(70);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButtonText :SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 12);
    -- STATUS TEXT
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton, "RIGHT", 75, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetWidth(250);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetSpacing(1);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:SetPoint("LEFT", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton, "RIGHT", 75, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:SetWidth(250);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText, "BOTTOM", 0, -5);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetWidth(105);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetJustifyH("CENTER");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetWordWrap(true);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:SetTextColor(0, 0.8, 1.0, 1.0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddTitleText:SetText( "");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetPoint("TOP", GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame, 0, 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetText(GRM.L("You Do Not Have Permission to Add Events to Calendar"));
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:SetTextColor(1, 0, 0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText2:Hide();
    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:SetScript("OnShow", function ()
        GRM.CalendarQueCheck();
        GRM.RefreshAddEventFrame();
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);

            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:IsVisible() then
                for j = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[j][1]:UnlockHighlight();
                end
                GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:Hide();
                GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:Show();
                -- establishes and also resets the tooltips
                for j = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[j][1]:SetScript("OnEnter", function()
                        GRM_G.tempEventNoteHolder = GRM.L("|CFFE6CC7FClick|r to select player event");
                    end);

                    if GameTooltip:IsVisible() and GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[j][1]:IsMouseOver() and not GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[j][4]:IsMouseOver( 9, -9, -9, 9) then
                        GRM_G.tempEventNoteHolder = GRM.L("|CFFE6CC7FClick|r to select player event");
                    end
                end
                
            else
                GRM_UI.GRM_RosterChangeLogFrame:Hide();
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameSetAnnounceButton:SetScript("OnClick", function(_, button) 
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:IsVisible() then
                GRM.Report(GRM.L("No Player Event Has Been Selected"));
            else
                if CanEditGuildEvent() then
                    local tempTime = time();
                    if tempTime - GRM_G.CalendarAddDelay > 5 then
                        for i = 2, #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] do
                            local name = GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][1];
                            local title = GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2];
                            if GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddTitleText:GetText() == GRM.SlimName(name) and GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:GetText() == title then

                                -- Ensure it is not already on the calendar(eventName, year, month, day)
                                if not GRM.IsCalendarEventAlreadyAdded(GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][5], GRM.ConvertMonthToSelectedCalendarMonth(GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][3]), GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][4]) then
                                    -- Add to Calendar
                                    GRM.AddAnnouncementToCalendar(title, GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][3], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][4], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][5], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][6]);
                                    -- Do I really need a "SlimName" here?
                                    GRM.Report(GRM.L("Event Added to Calendar: {custom1}", nil, nil, nil, GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2]));
                                    
                                    -- Let's Broadcast the change to the other users now!
                                    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] then
                                        local syncRankFilter = GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][15];
                                        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] then
                                            syncRankFilter = GuildControlGetNumRanks() - 1;
                                        end
                                        GRMsync.SendMessage("GRM_SYNC", GRM_G.PatchDayString .. "?GRM_AC?" .. syncRankFilter .. "?" .. name .. "?" .. GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2] .. "?" .. tostring(GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][7]), "GUILD");
                                    end

                                    -- Remove from que
                                    GRM.RemoveFromCalendarQue(name, GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][7], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2]);
                                    -- Reset Frames
                                    -- Clear the buttons first
                                    if GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons ~= nil then
                                        for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[i][1]:Hide();
                                        end
                                    end
                                    -- Status Notification logic
                                    if #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] > 1 then
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetText(GRM.L("Please Select Event to Add to Calendar"));
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:Show();
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:Hide();
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:Hide();
                                    else
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetText(GRM.L("No Calendar Events to Add"));
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:Show();
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:Hide();
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:Hide();
                                    end
                        
                                    -- Ok Building Frame!
                                    GRM.BuildEventCalendarManagerScrollFrame();
                                    -- Unlock the highlights too!
                                    for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                                        GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[i][1]:UnlockHighlight();
                                    end

                                    GRM_G.CalendarAddDelay = tempTime;
                                    break;
                                else
                                    GRM.Report(GRM.L("{name}'s event has already been added to the calendar!", GRM.SlimName(name)));
                                    GRM.RemoveFromCalendarQue(name, GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][7], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2]);
                                    GRM.RefreshAddEventFrame();
                                end
                            end
                        end
                    else
                        GRM.Report(GRM.L("Please wait {num} more seconds to Add Event to the Calendar!", nil, nil ,(6 -(tempTime - GRM_G.CalendarAddDelay))));
                    end
                else
                    GRM.Report(GRM.L("You Do Not Have Permission to Add Events to Calendar"));
                end
            end
        end
    end);

    GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameIgnoreButton:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if not GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:IsVisible() then
                GRM.Report(GRM.L("No Player Event Has Been Selected"));
            else
                for i = 2, #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] do
                    local name = GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][1];
                    local title = GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2];
                    if GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddTitleText:GetText() == GRM.SlimName(name) and GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:GetText() == title then
                        -- Remove from que
                        GRM.RemoveFromCalendarQue(name, GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][7], GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID][i][2]);
                        -- Reset Frames
                        -- Clear the buttons first
                        if GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons ~= nil then
                            for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                                GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[i][1]:Hide();
                            end
                        end
                        -- Status Notification logic
                        if #GRM_CalendarAddQue_Save[GRM_G.FID][GRM_G.saveGID] > 1 then
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetText(GRM.L("Please Select Event to Add to Calendar"));
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:Show();
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:Hide();
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:Hide();
                        else
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:SetText(GRM.L("No Calendar Events to Add"));
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameStatusMessageText:Show();
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameToAddText:Hide();
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_EventsFrameNameDateText:Hide();
                        end
                        -- Ok Building Frame!
                        GRM.BuildEventCalendarManagerScrollFrame();
                        -- Unlock the highlights too!
                        for i = 1, #GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons do
                            GRM_UI.GRM_RosterChangeLogFrame.GRM_EventsFrame.GRM_AddEventScrollChildFrame.allFrameButtons[i][1]:UnlockHighlight();
                        end
                        -- Report
                        GRM.Report(GRM.L("{name}'s Event Removed From the Que!", GRM.SlimName(name)));
                        break;
                    end                
                end
            end
        end
    end);

    -- Scroll Frame Details
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetSize(320, 150);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetClampedToScreen(true);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetFrameStrata("HIGH");

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameCloseButton:SetPoint("TOPRIGHT", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOPRIGHT", 4, 3);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame:SetSize(320, 110);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame:SetPoint( "Bottom", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "BOTTOM", 0, 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame:SetScrollChild(GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameTitle:SetPoint("Bottom", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOP", 0, -3);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrameTitle:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 16);
    -- Slider Parameters
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetOrientation("VERTICAL");
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetSize(20, 85);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame, "TOPRIGHT", -3.5, -14.5);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetValue(0);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetValueStep(20);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetStepsPerPage(14);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_AltGroupingScrollFrameSlider:SetScript("OnValueChanged", function(self)
            GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollFrame:SetVerticalScroll(self:GetValue());
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_MainTag:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_MainTag:SetText(GRM.L("(main)"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingScrollChildFrame.GRM_MainTag:SetTextColor(1.0, 0.0, 0.0, 1.0);

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingName:SetPoint("TOPLEFT", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOPLEFT", 17, -15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingName:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingName:SetText(GRM.L("Name"));

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOP", -40, -15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:SetText(GRM.L("Level"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:SetWidth(75);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:SetJustifyH("CENTER");

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOP", 28, -15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:SetText(GRM.L("Rank"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:SetWidth(75);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:SetJustifyH("CENTER");

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:SetPoint("TOP", GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame, "TOP", 108, -15);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:SetText(GRM.L("Last Online"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:SetWidth(75);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:SetJustifyH("CENTER");

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingMain:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 7);
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingMain:SetText(GRM.L("(main)"));
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingMain:SetTextColor(1.0, 0.0, 0.0, 1.0);

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetScript("OnShow", function()
        if GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:IsVisible() then
            GRM_UI.GRM_CoreAltFrame.GRM_AddAltEditFrame:Hide();
        end
        GRM_G.timer6 = 0;               -- reset onupdate timer...
        if GRM_UI.GRM_MemberDetailMetaData:IsMouseOver() then
            GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetPoint("BOTTOMLEFT", GRM_UI.GRM_MemberDetailMetaData, "BOTTOMRIGHT", -3, 0);
        elseif CalendarViewEventFrame and CalendarViewEventFrame:IsMouseOver() then
            GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetPoint("BOTTOMLEFT", CalendarViewEventFrame, "BOTTOMRIGHT", 11, 0);
            GRM_UI.GRM_MemberDetailMetaData:Hide();
        elseif CalendarCreateEventFrame and CalendarCreateEventFrame:IsMouseOver() then
            GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetPoint("BOTTOMLEFT", CalendarCreateEventFrame, "BOTTOMRIGHT", 11, 0);
            GRM_UI.GRM_MemberDetailMetaData:Hide();
        end
        -- Reset the tooltips
        GRM.BuildAltGroupingScrollFrame();
        GRM_UI.RestoreTooltipScale();
        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:Hide();
        GameTooltip:Hide();
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetScript("OnHide", function()
        GRM_G.AltSideWindowFreeze = false;
    end);

    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);

    -- Logic for initializing the sort lists of the alt grouping shift-click side frams
    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            local needsRefresh = false;

            local setValue = function(int)
                if GRM_G.altDetailsControl[1] ~= int then
                    GRM_G.altDetailsControl = { int, true };
                else
                    if GRM_G.altDetailsControl[2] then
                        GRM_G.altDetailsControl[2] = false;
                    else
                        GRM_G.altDetailsControl[2] = true;
                    end
                end
            end

            if GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingName:IsMouseOver(1, -1, -1, 1) then
                setValue(1);
                needsRefresh = true;
            elseif GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLastOnline:IsMouseOver(1, -1, -1, 1) then
                setValue(2);
                needsRefresh = true;
            elseif GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingLevel:IsMouseOver(1, -1, -1, 1) then
                setValue(3);
                needsRefresh = true;
            elseif GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame.GRM_AltGroupingRank:IsMouseOver(1, -1, -1, 1) then
                setValue(4);
                needsRefresh = true;
            end

            if needsRefresh then
                GRM.BuildAltGroupingScrollFrame();
            end
        end
    end);

    if not isManualUpdate then
        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:SetScript("OnUpdate", function(self, elapsed)
            GRM_G.timer6 = GRM_G.timer6 + elapsed;
            GRM_G.timer7 = GRM_G.timer7 + elapsed;
            if GRM_G.timer6 > 0.05 then
                if(self.GRM_AltGroupingName:IsMouseOver(1, -1, -1, 1) or self.GRM_AltGroupingLastOnline:IsMouseOver(1, -1, -1, 1) or self.GRM_AltGroupingLevel:IsMouseOver(1, -1, -1, 1) or self.GRM_AltGroupingRank:IsMouseOver(1, -1, -1, 1)) then
                    if not self.GRM_AltGroupHeaderTooltip:IsVisible() then
                        self.GRM_AltGroupHeaderTooltip:SetOwner(self, "ANCHOR_CURSOR");
                        self.GRM_AltGroupHeaderTooltip:AddLine( GRM.L("Click to Sort"));
                        self.GRM_AltGroupHeaderTooltip:Show();
                    end;
                elseif self.GRM_AltGroupHeaderTooltip:IsVisible() then
                    self.GRM_AltGroupHeaderTooltip:Hide();
                end
                
                if GRM_G.timer7 > 300 then
                    GRM.BuildAltGroupingScrollFrame();      -- Rebuild every 5 min just in case changes.
                    GRM_G.timer7 = 0;
                end
                GRM_G.timer6 = 0;
            end
        end);
    end

    -- GENERAL POPUP WINDOW FOR ANY FEATURE TO USE
    GRM_UI.GRM_GeneralPopupWindow:Hide();
    GRM_UI.GRM_GeneralPopupWindow:SetPoint("CENTER");
    GRM_UI.GRM_GeneralPopupWindow:SetSize(220, 100);
    GRM_UI.GRM_GeneralPopupWindow:EnableKeyboard(true);
    GRM_UI.GRM_GeneralPopupWindow:SetToplevel(true);
    GRM_UI.GRM_GeneralPopupWindow:SetFrameStrata("DIALOG");

    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText:SetPoint("TOP", GRM_UI.GRM_GeneralPopupWindow, 0, -20);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText:SetWidth(180);

    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton:SetPoint("BOTTOMLEFT", GRM_UI.GRM_GeneralPopupWindow, "BOTTOMLEFT", 25, 20);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton:SetSize(75, 30);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButtonText:SetPoint("CENTER", GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButtonText:SetText(GRM.L("Confirm"));
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton:SetPoint("BOTTOMRIGHT", GRM_UI.GRM_GeneralPopupWindow, "BOTTOMRIGHT", -25, 20);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton:SetSize(75, 30);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButtonText:SetPoint("CENTER", GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton);
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButtonText:SetText(GRM.L("Cancel"));
    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);

    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowNoButton:SetScript("OnClick", function( _, button)
        if button == "LeftButton" then
            GRM_UI.GRM_GeneralPopupWindow:Hide();
        end
    end);
    
    GRM_UI.NewTooltipScale();

end

-- Method:          GRM_UI.BuildLogFilterSideFrame()
-- What it Does:    Builds the side roster checkboxes properly
-- Purpose:         Front end UI log filtering.
GRM_UI.BuildLogFilterSideFrame = function()
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][1] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterJoinedCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][1] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterJoinedChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][2] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeveledChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][2] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeveledChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][3] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterInactiveReturnCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][3] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterInactiveReturnChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][4] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterPromotionChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][4] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterPromotionChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][5] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterDemotionChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][5] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterDemotionChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][6] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNoteChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][6] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNoteChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][7] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterOfficerNoteChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][7] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterOfficerNoteChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][8] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterNameChangeCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][8] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterNameChangeChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][9] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRankRenameCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][9] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRankRenameChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][10] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterEventCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][10] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterEventChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][11] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterLeftGuildCheckButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][11] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterLeftGuildChatCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][12] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterRecommendationsButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][12] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterRecommendationsChatButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][13] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterBannedPlayersButton:SetChecked( true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][13] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterBannedPlayersButtonChatButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][3][14] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_RosterCustomNoteChangeCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][13][14] then
        GRM_UI.GRM_RosterCheckBoxSideFrame.GRM_RosterCustomNoteChatCheckButton:SetChecked(true);
    end
    
end

-- Method:          GRM_UI.ConfigureJoinDateLocation()
-- What it Does:    Configures the front-end UI in the options, including enabling/disabling if you have officer permissions, and basing the selection properly
-- Purpose:         UI Configuration on load.
GRM_UI.ConfigureJoinDateLocation = function()
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 1 then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  |cffff0000Officer Note|r"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
    elseif GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 2 then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText("|cffff0000" .. GRM.L("Public Note"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText(GRM.L("Custom Note"));
    elseif GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][20] == 3 then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton1:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton2:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampRadioButton3:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetText(GRM.L("Add Join Date to:  Officer Note"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetText(GRM.L("Public Note"));
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText3:SetText("|cffff0000" .. GRM.L("Custom Note"));
    end

    if CanEditOfficerNote() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetTextColor( 1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetTextColor( 1.0, 0.82, 0.0, 1.0);
        
        if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:GetChecked() then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:Enable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] then
                GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(true);
            end
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:Disable();
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(false);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        end
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButtonText2:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:Disable();
    end
end

-- Method:          GRM_UI.BuildLogFrames()
-- What it Does:    Rebuilds the frames that hold the guild event log...
-- Purpose:         Easy access. Useful to rebuild frames on the fly at times, particularly if a player rank changes, just in case he receives/loses various permissions.
GRM_UI.BuildLogFrames = function()
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][2] then                                         -- Show at Logon Button
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][7] then                                         -- Add Timestamp to Officer on Join Button
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterAddTimestampCheckButton:SetChecked(true);
    else
        GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][7] = false;
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][8] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][10] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][11] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportInactiveReturnButton:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][12] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsCheckButton:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor(0.5, 0.5, 0.5, 1.0);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][14] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][16] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][17] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMainOnlyCheckButton:SetChecked(true);
    end
    
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][18] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterTimeIntervalCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][19] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncOnlyCurrentVersionCheckButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][21] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][27] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][28] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][29] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterShowMainTagCheckButton:SetChecked(true);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:Enable();
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMainsText:SetTextColor(0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:Disable();
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][31] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_SyncAllSettingsCheckButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][32] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMinimapButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][35] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][52] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_FadeCheckButton:SetChecked(true)
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][53] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_ReputationToggleButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetChecked(true)
    end
    
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][55] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactivesOnlyIfAllButton:SetChecked(true);
    end

    -- Leveling 
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][56] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRecordButton:SetChecked(true);
        -- Enable
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(1.0, 0.82, 0, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(1.0, 0.82, 0, 1);
        
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 60 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 70 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 80 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 85 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 90 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 100 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 110 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(1.0, 0, 0, 1);
        end

        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] or GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] <= 120 then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.0, 0.8, 1.0, 1.0);
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(1.0, 0, 0, 1);
        end
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText2:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_MinLevelText3:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Text:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Text:SetTextColor(0.5, 0.5, 0.5, 1);
    end

    -- Sub controls on leveling
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][1] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter1Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][2] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter2Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][3] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter3Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][4] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter4Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][5] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter5Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][6] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter6Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][7] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter7Button:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][47][8] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelFilter8Button:SetChecked(true);
    end

    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_LevelRange:SetText(GRM.GetLevelRange());

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][57] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AddJoinedTagButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][58] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_NoteBordersButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][59] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ShowNotesOnLeavingPlayerButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][60] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][65] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_ShowMainTagOnMains:SetChecked( true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][66] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_SearchAutoFocusCheckButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][67] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_UXOptionsFrame.GRM_BirthdayToggleButton:SetChecked(true);
    end

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][68] then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:SetChecked(true);
    end

    -- Sliders
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncSpeedSlider:SetValue(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][24] * 100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:SetValue(( GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][45] * 10) + 100);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText2:SetText(math.floor(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider:GetValue() + 0.5) .. "%");
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_FontSizeSlider.GRM_FontSizeSliderText3:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:SetValue(((( GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][50] - 0.8) / 0.02) * 5) + 50);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider.GRM_TooltipScaleSliderText2:SetText(math.floor(GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_TooltipScaleSlider:GetValue() + 0.5) .. "%");
    
    -- Reset the editboxes
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][5]) ;    
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_RosterTimeIntervalOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][6]);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][9]);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNoteText:SetText(math.floor(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][4] / 24));
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23] == 0 then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetText(1);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterMinLvlOverlayNoteText:SetText(GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][23]);
    end

    -- Display Information
    if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:IsVisible() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickOverlayNote:Show();
    end
    if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:IsVisible() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnEditBox:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_ReportInactiveReturnOverlayNote:Show();
    end
    if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:IsVisible() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsEditBox:Hide();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_ScanningOptionsFrame.GRM_RosterReportUpcomingEventsOverlayNote:Show();
    end
    if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonCheckButton:GetChecked() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_GeneralOptionsFrame.GRM_RosterLoadOnLogonChangesCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
    end
    if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncCheckButton:GetChecked() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        -- need to disable or enable these...
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][38] then
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(1.0, 0.82, 0.0, 1.0);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Enable();
        else
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(0.5, 0.5, 0.5, 1);
            GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Disable();
        end
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterNotifyOnChangesCheckButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanList:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_RosterSyncBanListText3:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_SyncAllRestrictReceiveButtonText:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBox:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomNoteSyncCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_DefaultCustomRankText2:SetTextColor(0.5, 0.5, 0.5, 1);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_CustomRankResetButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBox:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_SyncOptionsFrame.GRM_BDaySyncCheckBoxText:SetTextColor(0.5, 0.5, 0.5, 1);
    end

    -- Join date location permissions...
    GRM_UI.ConfigureJoinDateLocation();

    if CanEditGuildEvent() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor( 1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButtonText:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterReportAddEventsToCalendarButton:Disable();
    end
    if CanGuildRemove() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:Enable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText:SetTextColor(1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText:SetTextColor( 1.0, 0.82, 0.0, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2:SetTextColor( 1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButtonText2:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterRecommendKickCheckButton:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimed:Disable();
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_AllAltsOfflineTimedText:SetTextColor(0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RosterKickRecommendEditBox:Disable();
    end
    if CanGuildInvite() then
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:Enable()
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText:SetTextColor( 1.0, 0.82, 0.0, 1.0);
    else
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButtonText:SetTextColor( 0.5, 0.5, 0.5, 1.0);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:SetChecked(false);
        GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationCheckButton:Disable();
    end
    -- Reset these Extra Log window values (removes the red coloring of the text otherwise.)
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox1:SetText(0);
    GRM_UI.GRM_RosterChangeLogFrame.GRM_LogFrame.GRM_LogExtraOptionsFrame.GRM_LogExtraEditBox2:SetText(0);

    -- Get that Dropdown Menu Populated!
    GRM.CreateOptionsRankDropDown();
    GRM.BuildLog();
    -- Ok rebuild the log after changes!
end

-----------------------------------
------ MISC CONFIGURATION ---------
-----------------------------------

-----------------
--- CALENDAR ----
-----------------

local UI_CalendarTrigger = CreateFrame( "Frame");
UI_CalendarTrigger:RegisterEvent("CALENDAR_UPDATE_EVENT_LIST");
UI_CalendarTrigger:RegisterEvent("CALENDAR_UPDATE_INVITE_LIST");
UI_CalendarTrigger:RegisterEvent("CALENDAR_OPEN_EVENT");
UI_CalendarTrigger:RegisterEvent("CALENDAR_UPDATE_EVENT");
UI_CalendarTrigger:RegisterEvent("GUILD_ROSTER_UPDATE");
UI_CalendarTrigger:RegisterEvent("PLAYER_GUILD_UPDATE");
UI_CalendarTrigger:SetScript("OnEvent", function ()
    if CalendarCreateEventFrame and CalendarViewEventFrame then
        if not GRM_G.CalendarRegistered then
            -- View Window
            CalendarViewEventInviteListScrollFrameScrollBar:HookScript("OnValueChanged", GRM_UI.CalendarEventOpenRefresh);
            CalendarViewEventFrame:HookScript("OnShow", GRM_UI.CalendarEventOpenRefresh);
            CalendarViewEventFrame:HookScript("OnHide", function()
                GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
            end);
            CalendarViewEventInviteListScrollFrame:HookScript("OnHide", function()
                GRM_G.currentCalendarOffset = 1;    -- Resets this for triggering.
            end);

            -- Create and Edit Window
            CalendarCreateEventInviteListScrollFrameScrollBar:HookScript("OnValueChanged", GRM_UI.CalendarEventCreateRefresh);
            CalendarCreateEventFrame:HookScript("OnShow", GRM_UI.CalendarEventCreateRefresh);
            CalendarCreateEventInviteListScrollFrame:HookScript("OnHide", function()
                GRM_G.currentCalendarOffset = 1;    -- Resets this for triggering.
            end);
            CalendarCreateEventFrame:HookScript("OnHide", function()
                GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
            end);
            GRM_G.CalendarRegistered = true;
            GRM_UI.CalendarEventOpenRefresh(0);
            GRM_UI.CalendarEventCreateRefresh(0);

        else
            GRM_UI.CalendarDelayRefresh(0);
        end
        GRM_G.currentCalendarOffset = 1;
    end
end);

-- Method:          GRM_UI.CalendarDelayRefresh(float)
-- What it Does:    Adds a delay as Blizz frames
GRM_UI.CalendarDelayRefresh = function(time)
    C_Timer.After(time, function()
        if CalendarCreateEventFrame:IsVisible() then
            GRM_UI.CalendarEventCreateRefresh();
        elseif CalendarViewEventFrame:IsVisible() then
            GRM_UI.CalendarEventOpenRefresh();
        end
    end);
end

-- Method:          GRM_UI.CalendarEventOpenRefresh()
-- What it Does:    Calls to the event update for the calendar invite scrollframe
-- Purpose:         Keep code bloat down... multiple use.
GRM_UI.CalendarEventOpenRefresh = function()
    GRM_UI.UpdateCalendarInviteNames(CalendarViewEventInviteListScrollFrame);
    GRM_UI.InitializeCalendarButtons(CalendarViewEventInviteListScrollFrame);
end
-- /dump HybridScrollFrame_GetOffset(CalendarViewEventInviteListScrollFrame.buttons)

-- Method:          GRM_UI.CalendarEventCreateRefresh()
-- What it Does:    Calls to the event update for the calendar invite scrollframe
-- Purpose:         Keep code bloat down... multiple use.
GRM_UI.CalendarEventCreateRefresh = function()
    GRM_UI.UpdateCalendarInviteNames(CalendarCreateEventInviteListScrollFrame);
    GRM_UI.InitializeCalendarButtons(CalendarCreateEventInviteListScrollFrame);
end

-- Method:          GRM_UI.InitializeCalendarButtons( frame)
-- What it Does:    Initializes the tooltip logic for the calendar invite list on mouseover
-- Purpose:         So that tooltips are available on the calendar frames!
GRM_UI.InitializeCalendarButtons = function( calendarFrame)
    local buttons = calendarFrame.buttons
    for i = 1, #buttons do
        local button = buttons[i];
        button:SetScript("OnEnter", function( self)
            local inviteIndex = i + GRM_G.currentCalendarOffset;
            local inviteInfo = C_Calendar.EventGetInvite(inviteIndex);
            if(inviteInfo ~= nil and inviteInfo.name) then               -- Verify the buttons.
                local name = GRM.FormatNameWithPlayerServer(inviteInfo.name);
                GRM_G.CurrentCalendarName = name;
                if not GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                    GRM_G.currentName = name;                           -- useful for players with alts...
                end
                local classHexCode = GRM.GetClassColorRGB(inviteInfo.classFilename, true);
                GRM_G.CurrentCalendarHexCode = classHexCode;
                name = classHexCode .. GRM.GetNameWithMainTags(name, false, true, true, false) .. "|r";

                GRM_UI.SetTooltipScale();
                GameTooltip:SetOwner(self , "ANCHOR_CURSOR");
                GameTooltip:AddLine(name);
                if GRM_G.IsAltGrouping then
                    GameTooltip:AddLine("|CFFE6CC7FClick|r to view more alt details.");
                end
                -- For calendar timing
                local responseTime = C_Calendar.EventGetInviteResponseTime(button.inviteIndex);
                if(responseTime and responseTime.weekday ~= 0) then
                    GameTooltip:AddLine(CALENDAR_TOOLTIP_INVITE_RESPONDED);
                    -- date
                    GameTooltip:AddLine(
                        format(FULLDATE, GRM.GetFullDate(responseTime.weekday, responseTime.month, responseTime.monthDay, responseTime.year)),
                        HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b
                 );
                    -- time
                    GameTooltip:AddLine(
                        GameTime_GetFormattedTime(responseTime.hour, responseTime.minute, true),
                        HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b
                 );
                end
                GameTooltip:Show();
            end
        end);

        button:SetScript("OnLeave", function()
            GRM_G.IsAltGrouping = false;
            GRM_UI.RestoreTooltipScale();
            GameTooltip:Hide();
        end);

        -- Hold the action button script holders...
        button:SetScript("OnMouseDown", function( _, button)
            if button == "LeftButton" then
                if GRM_G.IsAltGrouping then
                    if GRM_G.CurrentCalendarName ~= GRM_G.currentName then
                        GRM_G.currentName = GRM_G.CurrentCalendarName;
                    elseif GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide()
                        return;
                    end
                    if not GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:IsVisible() then
                        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Show();
                    else
                        GRM_UI.GRM_MemberDetailMetaData:Hide();
                        GRM_G.timer6 = 0;
                        GRM.BuildAltGroupingScrollFrame();
                        GRM_UI.RestoreTooltipScale();
                        GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingTooltip:Hide();
                        GameTooltip:Hide();
                    end
                else
                    GRM_UI.GRM_MemberDetailMetaData.GRM_AltGroupingScrollBorderFrame:Hide();
                end
            end            
        end);
    end
end

-- Method:          GRM_UI.UpdateCalendarInviteNames(frame)
-- What it Does:    Updates the frames and replaces the names of each player with the proper main tags
-- Purpose:         To add new functionality to the Calendar frames
GRM_UI.UpdateCalendarInviteNames = function( calendarFrame)
    if C_Calendar.AreNamesReady() then
        local offset = HybridScrollFrame_GetOffset(calendarFrame);
        if offset ~= GRM_G.currentCalendarOffset then
            GRM_G.currentCalendarOffset = offset;                               -- Set the new offset
            local buttons = calendarFrame.buttons;
            -- Parse all the buttons
            for i = 1, #buttons do
                local button = buttons[i];
                local buttonName = button:GetName();
                local inviteIndex = i + offset;
                local inviteInfo = C_Calendar.EventGetInvite(inviteIndex);

                if(inviteInfo ~= nil and inviteInfo.name) then               -- Verify the buttons.
                    local name = GRM.FormatNameWithPlayerServer(inviteInfo.name);
                    local classColor =(inviteInfo.classFilename and RAID_CLASS_COLORS [ inviteInfo.classFilename ]) or NORMAL_FONT_COLOR;
                    local buttonFontString = _G [ buttonName .. "Name" ];
                    buttonFontString:SetText(GRM.GetNameWithMainTags(name, true, false, true, false));
                    buttonFontString:SetTextColor(classColor.r, classColor.g, classColor.b);
                end
            end
        end
    else
        -- Retry in 0.5 seconds
        C_Timer.After(0.5, function()
            GRM_UI.UpdateCalendarInviteNames(calendarFrame);
        end);
        return;
    end
end

-- Method:          GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate()
-- What it Does:    Configures the SetPoints to trigger on key frames for the recruitment window
-- Purpose:         Much smoother, cleaner, happier UX 
GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate = function()
    --GuildInfoFrameApplicants:SetPoint("TOPLEFT", GuildRosterFrame, "TOPRIGHT", 0, 0)
end

-- Method:          GRM_UI.RequestToJoinLogic_OnShow()
-- What it Does:    Builds the strings, the buttons, and the logic for the recruit UI QoL features
-- Purpose:         Flow contorl of the code...
GRM_UI.RequestToJoinLogic_OnShow = function()
    GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings = GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings or {};
    local buttons = GuildInfoFrameApplicantsContainer.buttons;
    
    if not GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1] then
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1] = GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:CreateFontString("GRM_NeedFriendsCleanedUpWarning", "OVERLAY", "GameFontNormal");
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetPoint("BOTTOM", buttons[1], "BOTTOM", 0, 2);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetTextColor(1, 0, 0, 1);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 10);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetWidth( 285);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetWordWrap(false);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:Hide();
    end
    GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:SetText(GRM.L("Clear Space on Friends List to Find Online Status"));
    

    for i = 1, #buttons do
        if not GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[i+1] then
            GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[i+1] = GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:CreateFontString("GRM_ReqToJoinText" .. i - 1, "OVERLAY", "GameFontNormal");
            GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[i+1]:SetPoint("BOTTOMRIGHT", buttons[i], "BOTTOMRIGHT", - 15, 8);
            GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[i+1]:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 14);
        end
    end

    if not GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText then
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText = GuildInfoFrameApplicants:CreateFontString("GRM_NumRecruitsOnlineText", "OVERLAY", "GameFontNormal");
        --GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetPoint("TOPRIGHT", GuildInfoFrameApplicants, "TOPRIGHT", 5, -43)
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetPoint("TOPRIGHT", GuildInfoFrameApplicants, "TOPRIGHT", 5, 17)
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetTextColor(0.12, 1, 0, 1);
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetWidth( 160);
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetJustifyH("CENTER");
        GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetWordWrap(false);
    end
    GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetText(GRM.L("Online:  {num}/{custom1}", nil, nil, #GRM.GetPlayersOnRecruitListCurrentlyOnline(), GetNumGuildApplicants()));
    
    if not GuildInfoFrameApplicants.GRM_MoveForwardButton then
        GuildInfoFrameApplicants.GRM_MoveForwardButton = CreateFrame("Button", "GRM_MoveForwardButton" , GuildInfoFrameApplicants, "UIPanelButtonTemplate");
        GuildInfoFrameApplicants.GRM_MoveBackwardButton = CreateFrame("Button", "GRM_MoveBackwardButton" , GuildInfoFrameApplicants, "UIPanelButtonTemplate");
        GuildInfoFrameApplicants.GRM_MoveForwardButton:SetPoint("BOTTOMLEFT", GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText, "TOP", 0, 5);
        GuildInfoFrameApplicants.GRM_MoveForwardButton:SetSize(70, 18);
        GuildInfoFrameApplicants.GRM_MoveForwardButton:SetScript("OnClick", function(_, button)
            if button == "LeftButton" then
                -- Store the update.
                if #GRM.GetPlayersOnRecruitListCurrentlyOnline() > 0 then
                    local ScrollBar = GuildInfoFrameApplicantsContainer.scrollBar;
                    if select(2, ScrollBar:GetMinMaxValues()) == ScrollBar:GetValue() then
                        GRM.Report(GRM.L("You have reached the end of the list"));
                    else
                        GRM.GoToNextOnline(true, false);
                    end
                else
                    GRM.Report(GRM.L("There are currently no ONLINE recruits."));
                end
            end
        end)

        GuildInfoFrameApplicants.GRM_MoveBackwardButton:SetPoint("BOTTOMRIGHT", GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText, "TOP", 0, 5);
        GuildInfoFrameApplicants.GRM_MoveBackwardButton:SetSize(70, 18);
        GuildInfoFrameApplicants.GRM_MoveBackwardButton:SetScript("OnClick", function(_, button)
            if button == "LeftButton" then
                -- Store the update.
                if #GRM.GetPlayersOnRecruitListCurrentlyOnline() > 0 then
                    local ScrollBar = GuildInfoFrameApplicantsContainer.scrollBar;
                    if ScrollBar:GetMinMaxValues() == ScrollBar:GetValue() then
                        GRM.Report(GRM.L("You have reached the top of the list"));
                    else
                        GRM.GoToNextOnline(false, false);
                    end
                else
                    GRM.Report(GRM.L("There are currently no ONLINE recruits."));
                end
            end
        end);
    end

    if not GuildInfoFrameApplicants.GRM_InviteMessageFrame then
        GuildInfoFrameApplicants.GRM_InviteMessageFrame = CreateFrame( "Frame", "GRM_InviteMessageFrame", GuildInfoFrameApplicants, "TranslucentFrameTemplate");
        --GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetPoint("TOPLEFT", GuildInfoFrameApplicants, "BOTTOMLEFT",  0, 2);
        --GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetPoint("TOPRIGHT", GuildInfoFrameApplicants, "BOTTOMRIGHT",  0, 2);
        --GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(338, 130);                -- Slightly wider for larger guild names.

        -- Test Placement
        GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetPoint("TOPLEFT", GuildInfoFrameApplicants, "TOPRIGHT", 10, 5) -- 22.5, 5);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(300, 330);
    end

    if not GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton then
        GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton = CreateFrame("Button", "GRM_ClearAllRecruitsButton" , GuildInfoFrameApplicants, "UIPanelButtonTemplate");
        --GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton:SetPoint("BOTTOMLEFT", GuildInfoFrameApplicants, "BOTTOMRIGHT", -2, 0);
        GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton:SetPoint("BOTTOMLEFT", GRM_InviteMessageFrame, "BOTTOMRIGHT", -75, -40);
        GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton:SetSize(70, 36);
        GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton:SetScript("OnClick", function(_, button)
            if button == "LeftButton" then
                -- Configure the yes button
                GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton:SetScript("OnClick", function( _, button) 
                    if button == "LeftButton" then
                        local num = GetNumGuildApplicants();
                        for i = 1, num do
                            DeclineGuildApplicant(i);
                        end
                        GRM.Report(GRM.L("{num} Applicants to the Guild have been denied" , num));
                        GRM_UI.GRM_GeneralPopupWindow:Hide();
                    end
                end);

                -- Macro Cleanup
                GRM_UI.GRM_GeneralPopupWindow:SetScript("OnHide", function()
                    
                end);

                GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText:SetText(GRM.L("Do you really want to reject all applicants?"));
                if not GRM_UI.GRM_GeneralPopupWindow:IsVisible() then
                    GRM_UI.GRM_GeneralPopupWindow:Show();
                end
            end
        end)
    end

    if not GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton then
        --GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton = CreateFrame("Button", "GRM_InviteAllRecruitsButton" , GuildInfoFrameApplicants, "UIPanelButtonTemplate");
        GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton = CreateFrame("Button", "GRM_InviteAllRecruitsButton" , GuildInfoFrameApplicants, "UIPanelButtonTemplate");
        --GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton:SetPoint("BOTTOMRIGHT", GuildInfoFrameApplicants, "BOTTOMLEFT", 0, 0);
        GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton:SetPoint("BOTTOMRIGHT", GRM_InviteMessageFrame, "BOTTOMLEFT", 75, -40);
        
        GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton:SetSize(70, 36);
        GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton:SetScript("OnClick", function(_, button)
            if button == "LeftButton" then
                local listPlayers = GRM.GetPlayersOnRecruitListCurrentlyOnline();
                -- No need to bringup popup if no players are currently online!
                if #listPlayers > 0 then
                    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowYesButton:SetScript("OnClick", function( _, button) 
                        if button == "LeftButton" then
                            listPlayers = GRM.GetPlayersOnRecruitListCurrentlyOnline();
                            -- In case they popup window is now up, and since then players have logged off.
                            if #listPlayers > 0 then
                                -- Set Macro
                                local num = #listPlayers;

                                GRM.CreateMacro(GRM.BuildMacroInviteAll("/ginvite", listPlayers), "GRM_Inv", "Inv_axe_38", "CTRL-SHIFT-K");
                                
                                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][61] and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" then
                                    GRM.GuildInviteAllNames(listPlayers);
                                    C_Timer.After(( num - 1) * 2, function()                                                           -- Delay of 2 seconds between invites...
                                        GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("Invite all macro created. Press \"CTRL-SHIFT-K\" to invite all online recruits."));
                                        GRM.CleanupMacros(60);
                                    end);
                                else
                                    GRM.Report(GRM.L("GRM:") .. " " .. GRM.L("Invite all macro created. Press \"CTRL-SHIFT-K\" to invite all online recruits."));
                                    GRM.CleanupMacros(60);
                                end
                            else
                                GRM.Report(GRM.L("It appears all players are now offline."));
                            end
                            GRM_UI.GRM_GeneralPopupWindow:Hide();
                        end
                    end);

                    GRM_UI.GRM_GeneralPopupWindow.GRM_GeneralPopupWindowText:SetText(GRM.L("Do you really want to invite all applicants?"));
                    if not GRM_UI.GRM_GeneralPopupWindow:IsVisible() then
                        GRM_UI.GRM_GeneralPopupWindow:Show();
                    end
                else
                    GRM.Report(GRM.L("There are currently 0 players online to invite.")); 
                end
            end
        end)
    end

    if not GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox then
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox = CreateFrame("CheckButton", "GRM_InviteMsgCheckBox", GuildInfoFrameApplicants.GRM_InviteMessageFrame, "OptionsSmallCheckButtonTemplate");
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox:SetPoint("TOPLEFT", GuildInfoFrameApplicants.GRM_InviteMessageFrame, "TOPLEFT", 13, -10);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox:SetHitRectInsets(0, -235, 0, 0);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox.GRM_InvMsgChkBoxText = GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox:CreateFontString("GRM_InviteMsgCheckBox", "OVERLAY", "GameFontNormal");
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox.GRM_InvMsgChkBoxText:SetPoint("LEFT", GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox, 27, 0);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox.GRM_InvMsgChkBoxText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox.GRM_InvMsgChkBoxText:SetText(GRM.L("Include Message When Sending Invite"));
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox:SetScript("OnClick", function(self, button) 
            if button == "LeftButton" then
                if self:GetChecked() then
                    GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][61] = true;
                    GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(338, 130);
                    GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:Show();
                else
                    GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][61] = false;
                    GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(338, 45);
                    GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:Hide();
                end
                GRM.SyncSettings();
            end
        end);
    end
    
    if not GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox then

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox = CreateFrame("EditBox", "GRM_InviteMsgEditBox", GuildInfoFrameApplicants.GRM_InviteMessageFrame);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetPoint("TOP", GuildInfoFrameApplicants.GRM_InviteMessageFrame, "TOP", 0, -30);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetPoint("BOTTOM", GuildInfoFrameApplicants.GRM_InviteMessageFrame, "BOTTOM", 0, 10);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetSize(308, 80);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetTextInsets( 5, 6, 6, 5);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetMultiLine(true);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetMaxLetters(255);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetFont( GRM_G.FontChoice, GRM_G.FontModifier + 11);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:EnableMouse( true);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetAutoFocus( false);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount = GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:CreateFontString("GRM_MsgEditBoxCharCount", "OVERLAY", "GameFontNormal");
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:SetPoint("TOPLEFT", GuildInfoFrameApplicants.GRM_InviteMessageFrame, "TOPRIGHT", 0, -20);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetScript("OnEscapePressed", function(self)
            self:ClearFocus();
        end);

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetScript("OnEditFocusLost", function(self)
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" then
                self:SetText( GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62]);
            else
                self:SetText( GRM.L("Click here to set custom invite message. Press Enter to save before sending invite!"));
            end
            GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:Hide();
        end);

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetScript("OnEditFocusGained", function(self)
            if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" then
                self:SetCursorPosition(#self:GetText());
                self:HighlightText(0);
            else
                self:SetText("");
            end
            GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:SetText(#self:GetText() .. "/" .. self:GetMaxLetters());
            GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:Show();
        end);

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetScript("OnEnterPressed", function(self)
            local msg = GRM.Trim(self:GetText());
            self:SetText(msg);                   -- Clean it up!
            if GRM.ByteRulesFollowed(msg, true, self) then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] = msg;
                if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" then
                    self:SetText(msg);
                else
                    self:SetText( GRM.L("Click here to set custom invite message. Press Enter to save before sending invite!"));
                end
                self:ClearFocus();
                GRM.SyncSettings();
            end
        end);

        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetScript("OnTextChanged", function(self)
            GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox.GRM_MsgEditBoxCharCount:SetText(#self:GetText() .. "/" .. self:GetMaxLetters());
        end);
        
    end

    if not GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton then
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton = CreateFrame("CheckButton", "GRM_AutoPopupRecruitButton", GuildInfoFrameApplicants, "OptionsSmallCheckButtonTemplate");
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText = GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:CreateFontString("GRM_AutoPopupRecruitButtonText", "OVERLAY", "GameFontNormalSmall");
        --GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetPoint("TOPLEFT", GuildInfoFrameApplicants, "TOPLEFT", 58, 2);
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetPoint("TOPLEFT", GRM_InviteMessageFrame, "TOPLEFT", 5, 20);
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText:SetPoint("LEFT", GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton, 27, 0);
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText:SetText(GRM.L("Auto Open Window"));
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetScript("OnClick", function( self)
            if self:GetChecked() then
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] = true;
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:IsVisible() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetChecked(true);
                end
            else
                GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] = false;
                if GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:IsVisible() then
                    GRM_UI.GRM_RosterChangeLogFrame.GRM_OptionsFrame.GRM_OfficerOptionsFrame.GRM_RecruitNotificationAutoPopButton:SetChecked(false);
                end
            end
        end);

        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetScript("OnEnter", function( self)
            local connectedRealms = GRM.GetAllConnectedRealms();
            if #connectedRealms > 1 then
                GRM_UI.SetTooltipScale();
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
                GameTooltip:AddLine( GRM.L("Only if a player is online and you are not in combat"));
                GameTooltip:Show();
            end
        end);
    
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetScript("OnLeave", function()
            if GameTooltip:IsVisible() then
                GRM_UI.RestoreTooltipScale();
                GameTooltip:Hide();
            end
        end);

    end

    -- In case options size change or language chance
    GuildInfoFrameApplicants.GRM_NumRecruitsOnlineText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 13);
    GuildInfoFrameApplicants.GRM_MoveForwardButton:SetText(GRM.L("Next"));
    GuildInfoFrameApplicants.GRM_MoveBackwardButton:SetText(GRM.L("Previous"));
    GuildInfoFrameApplicants.GRM_ClearAllRecruitsButton:SetText(GRM.L("Reject\nAll"));
    GuildInfoFrameApplicants.GRM_InviteAllRecruitsButton:SetText(GRM.L("Invite\nAll"));
    GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText:SetFont(GRM_G.FontChoice, GRM_G.FontModifier + 12);
    GuildInfoFrameApplicants.GRM_AutoPopupRecruitButtonText:SetText(GRM.L("Auto Open Window"));

    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= nil then
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetText( GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62]);
    else
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:SetText( GRM.L("Click here to set custom invite message. Press Enter to save before sending invite!"));
    end
    -- Checkbox on or off
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][54] then
        GuildInfoFrameApplicants.GRM_AutoPopupRecruitButton:SetChecked(true);
    end
    if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][61] then
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgCheckBox:SetChecked(true);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(338, 130);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:Show();
    else
        GuildInfoFrameApplicants.GRM_InviteMessageFrame:SetSize(338, 45);
        GuildInfoFrameApplicants.GRM_InviteMessageFrame.GRM_InviteMsgEditBox:Hide();
    end
end
    
-- Method:          GRM_UI.RequestToJoinLogic_OnUpdate()
-- What it Does:    Builds the strings, the buttons, and the logic for the recruit UI QoL features
-- Purpose:         Flow contorl of the code...
GRM_UI.RequestToJoinLogic_OnUpdate = function( self, elapsed)
    GRM_G.requestToJoinTimer = GRM_G.requestToJoinTimer + elapsed;
    if GRM_G.requestToJoinTimer > 0.05 then

        if GetNumFriends() < 100 then
            self.allFontStrings[1]:Hide();

            local online = string.upper(GRM.L("Online"));
            local offline = string.upper(GRM.L("Offline"));
            local unknown = string.upper(GRM.L("Unknown"));
            local color = { 0.12, 1, 0 };
            local color2 = { 1, 0.82, 0 };
            local color3 = { 1, 0.82, 0 };
            local buttons = GuildInfoFrameApplicantsContainer.buttons;

            for i = 1, #buttons do
                if buttons[i]:IsVisible() then
                    local playerInfo = GRM.IsRequestToJoinPlayerCurrentlyOnline(buttons[i].name:GetText());
                    if playerInfo[1] then
                        if playerInfo[2] then
                            self.allFontStrings[i+1]:SetText(online);
                            self.allFontStrings[i+1]:SetTextColor(color[1], color[2], color[3], 1);
                        else
                            self.allFontStrings[i+1]:SetTextColor(color2[1], color2[2], color2[3], 1);
                            self.allFontStrings[i+1]:SetText(offline);
                        end
                    else
                        -- player was not found on the list, thus it is assumed it is unknow due to player having too many on friends list to check.
                        self.allFontStrings[i+1]:SetText(unknown);
                        self.allFontStrings[i+1]:SetTextColor(color3[1], color3[2], color3[3], 1);
                    end
                    self.allFontStrings[i+1]:Show();
                else
                    self.allFontStrings[i+1]:Hide();
                end
            end
        else
            C_Timer.After(2, function()
                if GetNumFriends() >= 100 then
                    for i = 2, #self.allFontStrings do
                        self.allFontStrings[i]:Hide();
                    end
                    self.allFontStrings[1]:Show();
                end
            end);
        end
        GRM_G.requestToJoinTimer = 0;
    end
end


-- Method:          GRM_UI.CommunitiesGuildRecruitmentFrame_Update()
-- What it Does:    Hides the recruitment frame, and gives it its initial setpoint
-- Purpose:         On the LoadAddOn, so slash command hyperlink can work, Blizz's default code does not establish a setpoint, so it will never show
GRM_UI.CommunitiesGuildRecruitmentFrame_Update = function()
    GuildFrame_LoadUI(); if(GuildFrame_Toggle) then GuildFrame_Toggle(); end
    
    --GuildInfoFrameApplicants:SetPoint("TOPLEFT", UIPanel, "TOPLEFT", 100, -100);
    GuildInfoFrameApplicants:Hide();
    GuildInfoFrameApplicants:EnableKeyboard(true);

    -- So the ESC key works on the guild recruitment frame...
    GuildInfoFrameApplicants:HookScript("OnKeyDown", function(self, key)
        self:SetPropagateKeyboardInput(true);      -- Ensures keyboard access will default to the main chat window on / or Enter. UX feature.
        if key == "ESCAPE" then
            self:SetPropagateKeyboardInput(false);
            self:Hide();
        end
    end);

    -- So it repositions itself appropriately and overrides Blizz's default positions.
    GuildInfoFrameApplicants:HookScript("OnShow", function() GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate() end);
    --FriendsFrame:HookScript("OnShow", GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate);
    --ChannelFrame:HookScript("OnShow", GRM_UI.CommunitiesGuildRecruitmentFrame_SetPointUpdate);

    -- Build the proper frames...
    if not GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow then
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow = CreateFrame("Frame", "GRM_RequestToJoinWindow", GuildInfoFrameApplicantsContainerScrollChild);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:Hide();
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:SetFrameStrata("HIGH");
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:SetScript("OnShow", GRM_UI.RequestToJoinLogic_OnShow);
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:SetScript("OnUpdate", GRM_UI.RequestToJoinLogic_OnUpdate) 
    end

    GuildInfoFrameApplicantsContainerButton1:HookScript("OnShow", function()
        -- Create the frame if it doesn't exist...
        if not GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][27] and not GRM_G.ObtainingOnlineStatusRecruits then
            GRM.CheckRequestPlayersIfOnline(GRM.GetGuildApplicantNames(), 1, false);
        end
        GRM_G.requestToJoinTimeInterval = 15;     -- Temporarily check every 5 seconds...
        GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:Show();
    end);

    -- On Clicking the button, it stores the name of selected.
    for i = 1, #GuildInfoFrameApplicantsContainer.buttons do 
        GetClickFrame("GuildInfoFrameApplicantsContainerButton" .. i):HookScript("OnClick", function( self)
            GRM_G.RecruitmentSelectName = self.name:GetText();
        end);
    end

    -- Sends the player a recruit invite message as well!
    GuildRecruitmentInviteButton:HookScript("OnClick", function()
        if GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][61] and GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62] ~= "" then
            local listPlayers = GRM.GetPlayersOnRecruitListCurrentlyOnline();
            local fullName = GRM.AppendSameServerName(GRM_G.RecruitmentSelectName);
            for i = 1, #listPlayers do
                if fullName == listPlayers[i][1] then
                    SendChatMessage( GRM_AddonSettings_Save[GRM_G.FID][GRM_G.setPID][2][62], "WHISPER", nil, GRM_G.RecruitmentSelectName);
                    break;
                end
            end
        end
    end);

    GuildInfoFrameApplicants:HookScript("OnHide", function()
        GRM_G.requestToJoinTimeInterval = 60;    -- Reset it back to normal...
        if GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow then
            GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow:Hide();
            if GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings and GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1] then
                GuildInfoFrameApplicantsContainerScrollChild.GRM_RequestToJoinWindow.allFontStrings[1]:Hide();
            end
        end
    end);
    if(GuildFrame_Toggle) then GuildFrame_Toggle(); end
end

-- Load this at start. You cannot save frame positions between sessions unless it initializes in initial login.
GRM_UI.PreAddonLoadUI();
