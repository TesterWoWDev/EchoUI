settings = {
    selectionIconSize = 60,
    iconsPerRow = 12,
    gap = 8,
    width = GetScreenWidth() / 2.18,
    height = GetScreenHeight() / 1.4
}

assets = {
    -- rankone = "Interface\\AddOns\\ForgedWoW\\UI\\Perk\\rank1",--rank1 just has no glow
    ranktwo = "Interface\\BUTTONS\\CheckButtonGlow",
    rankthree = "Interface\\BUTTONS\\CheckButtonGlow",
    hourglass = "Interface\\AddOns\\ForgedWoWCommunication\\UI\\Perk\\hourglass",
    highlight = "Interface\\AddOns\\ForgedWoWCommunication\\UI\\Perk\\highlight"
}

PerkExplorerInternal = {
    PERKS_SPEC = {},
    PERKS_ALL = {},
    PERKS_SEARCH = {}
}

perkTooltip1 = CreateFrame("GameTooltip", "perkTooltip1", UIParent, "GameTooltipTemplate");
perkTooltip1:SetBackdrop({
    bgFile = "",
    edgeFile = "",
    tile = false,
    tileSize = 0,
    edgeSize = 0,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
});
perkTooltip2 = CreateFrame("GameTooltip", "perkTooltip2", UIParent, "GameTooltipTemplate");
perkTooltip2:SetBackdrop({
    bgFile = "",
    edgeFile = "",
    tile = false,
    tileSize = 0,
    edgeSize = 0,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
});
-- SetTemplate(perkTooltip2);
perkTooltip3 = CreateFrame("GameTooltip", "perkTooltip3", UIParent, "GameTooltipTemplate");
perkTooltip3:SetBackdrop({
    bgFile = "",
    edgeFile = "",
    tile = false,
    tileSize = 0,
    edgeSize = 0,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
});
-- SetTemplate(perkTooltip3);
perkBG = CreateFrame("Frame", nil, UIParent)
perkBG:SetPoint("CENTER")
perkBG:SetSize(128, 128)
perkBG:SetBackdrop({
    bgFile = "Interface/TutorialFrame/TutorialFrameBackground",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true,
    edgeSize = 22,
    tileSize = 22,
    insets = {
        left = 4,
        right = 4,
        top = 4,
        bottom = 4
    }
})
perkBG:Hide()
-- perkBG:SetBackdropColor(0, 0, 1, .5)
lastSelectedSpell = 0
StaticPopupDialogs["REROLL_PERK"] = {
    text = "Are you sure you want to reroll %s?",
    button1 = "Yes",
    button2 = "No",
    spellId = "%s",
    spellName = "%s",
    OnAccept = function(self)
        PushForgeMessage(ForgeTopic.REROLL_PERK, GetSpecID() .. ";" .. lastSelectedSpell);
    end,
    sound = "levelup2",
    timeout = 30,
    whileDead = true,
    hideOnEscape = true
}

PerkDeserializerDefinitions = {
    PERKSEL = {
        OBJECT = "*",
        FIELDS = {
            DELIMITER = "^",
            FIELDS = {{
                NAME = "SpellId"
            }, {
                NAME = "carryover",
                TYPE = FieldType.NUMBER
            }}
        }
    },
    PERKCHAR = {
        OBJECT = ";",
        FIELDS = {
            DELIMITER = "^",
            FIELDS = {{
                NAME = "SpecId"
            }, {
                NAME = "Perk",
                OBJECT = "*",
                FIELDS = {
                    DELIMITER = "&",
                    FIELDS = {{
                        NAME = "spellId"
                    }, {
                        NAME = "Meta",
                        OBJECT = "@",
                        FIELDS = {
                            DELIMITER = "~",
                            FIELDS = {{
                                NAME = "classMask",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "group",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "isAura",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "unique",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "tags"
                            }, {
                                NAME = "rank",
                                TYPE = FieldType.NUMBER
                            }}
                        }
                    }}
                }
            }}
        }
    },
    PERKCAT = {
        OBJECT = ";",
        FIELDS = {
            FIELDS = {{
                NAME = "Perk",
                OBJECT = "*",
                FIELDS = {
                    DELIMITER = "&",
                    FIELDS = {{
                        NAME = "spellId"
                    }, {
                        NAME = "Meta",
                        OBJECT = "@",
                        FIELDS = {
                            DELIMITER = "~",
                            FIELDS = {{
                                NAME = "classMask",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "group",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "isAura",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "unique",
                                TYPE = FieldType.NUMBER
                            }, {
                                NAME = "tags"
                            }}
                        }
                    }}
                }
            }}
        }
    }
}