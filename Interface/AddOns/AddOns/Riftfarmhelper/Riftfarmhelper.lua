--Setting up slash commands
SLASH_Riftfarmhelper1 = "/riftfarmhelper"
SLASH_Riftfarmhelper2 = "/rfh"
SlashCmdList["Riftfarmhelper"] = function()   
local numglobal, numperchar = GetNumMacros()
local members = GetNumGroupMembers()
local affectingCombat = UnitAffectingCombat("player");
--check if in a party and no more than 5 players are present 
if(members == 0 or members > 5) then 
print("Current party size is not supported.")
--check if player is in combat since CreateMacro is protected and can only be used out of combat
elseif(affectingCombat) then 
print("Macro can only be created out of combat.")
else
--check if macros are capped  
if(numglobal>119) then
    print("You can't have any more macros!")
else
    local macrotxt
    local PartyNames = {}
    for i=1, members-1 do
        PartyNames[i] = "/inv " .. GetUnitName("party"..(i), true) .. "\n"
    end
    macrotxt = table.concat(PartyNames)
    --check if there already is a macro named RIFTFARM and edit it if 
    if(GetMacroIndexByName("RIFTFARM") == 0) then 
        CreateMacro("RIFTFARM", 1394890, macrotxt)  
        print("Macro generated.")
    else 
    --if not create one
        EditMacro("RIFTFARM", "RIFTFARM", 1394890, macrotxt, 1, 1) 
        print("Macro updated.")
    end  
    --check if the macro frame is open and update it if
    if (MacroFrame ~= nil) then   
        if (MacroFrame:IsVisible()) then
            MacroFrame_Update()
        end
    end
end
end






























end
