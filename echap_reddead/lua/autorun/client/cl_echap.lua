resource.AddFile( "resource/fonts/ChineseRocksRG-Regular" )
resource.AddFile( "lua/autorun/sh_config.lua" )

echap = echap or {}

surface.CreateFont("fontnormal", {
    font = "ChineseRocksRG-Regular",
    size = 60,
    weight = 1000,
})

local txt = Material("echap1.png")
local bsl = Material("liens.png")
local crcd = Material("crd.png")
local boussole = Material("boussole.png")


local EscapeMenu;
print("Loaded addon")
hook.Add("PreRender", "HandleEscapeMenu", function()
    if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
        if ValidPanel(EscapeMenu) then
            gui.HideGameUI()
            EscapeMenu:Remove()
        else
            gui.HideGameUI() 
            OpenEscapeMenu()
        end
    end
end)

function OpenEscapeMenu()
    if IsValid(EscapeMenu) then
        EscapeMenu:Remove()
    end
    local scrw, scrh = ScrW(), ScrH()

    EscapeMenu = vgui.Create("TRYEscapeMenu")
    EscapeMenu:ShowCloseButton(false)



    local para = vgui.Create("DButton", EscapeMenu)
    para:SetSize(450, 100)
    para:SetPos(-50, 725)
    para:SetText("")
    para.Paint = function(m, w, h)
        if m:IsHovered() then
            draw.SimpleText("Paramètres", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            para:MoveTo(-30, 725, 1, 0, .8, function() end)
        else
            draw.SimpleText("Paramètres", "fontnormal", w * .5, h * .5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            para:SetPos(-50, 725)
        end
    end
    para.DoClick = function()
        RunConsoleCommand("gamemenucommand", "openoptionsdialog")
        timer.Simple( 0, function() RunConsoleCommand("gameui_activate") end )
    end

    local deco = vgui.Create("DButton", EscapeMenu)
    deco:SetSize(454, 100)
    deco:SetPos(-50, 825)
    deco:SetText("")
    deco.Paint = function(m, w, h)
        if m:IsHovered() then
            draw.SimpleText("Déconnexion", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            deco:MoveTo(-30, 825, 1, 0, .8, function() end)
        else
            draw.SimpleText("Déconnexion", "fontnormal", w * .5, h * .5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            deco:SetPos(-50, 825)
        end
    end
    deco.DoClick = function()
        RunConsoleCommand("disconnect")
    end


    local rep = vgui.Create("DButton", EscapeMenu)
    rep:SetSize(454, 100)
    rep:SetPos(-50, 425)
    rep:SetText("")
    rep.Paint = function(m, w, h)
        if m:IsHovered() then
            draw.SimpleText("Reprendre", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            rep:MoveTo(-30, 425, 1, 0, .8, function() end)
        else
            draw.SimpleText("Reprendre", "fontnormal", w * .5, h * .5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            rep:SetPos(-50, 425)
        end
    end
    rep.DoClick = function()
        EscapeMenu:Remove()
        gui.HideGameUI()
    end

    

    local Boutique = vgui.Create("DButton", EscapeMenu)
    Boutique:SetSize(454, 100)
    Boutique:SetPos(-50, 525)
    Boutique:SetText("")
    Boutique.Paint = function(m, w, h)
        if m:IsHovered() then
            draw.SimpleText("Boutique", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            Boutique:MoveTo(-30, 525, 1, 0, .8, function() end)
        else
            draw.SimpleText("Boutique", "fontnormal", w * .5, h * .5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            Boutique:SetPos(-50, 525)
        end
    end
    Boutique.DoClick = function()
        
        gui.OpenURL(echap.Boutique)
        gui.HideGameUI()
    end


        local liens = vgui.Create("DButton", EscapeMenu)
        liens:SetSize(454, 100)
        liens:SetPos(-50, 625)
        liens:SetText("")
        liens.Paint = function(m, w, h)
            if m:IsHovered() then
                draw.SimpleText("Liens", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                liens:MoveTo(-30, 625, 1, 0, .8, function() end)
            else
                draw.SimpleText("Liens", "fontnormal", w * .5, h * .5, Color(0,0,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                liens:SetPos(-50, 625)
            end
        end
        liens.DoClick = function()

            gui.HideGameUI()
            local frameliens = vgui.Create("DFrame", EscapeMenu)
            frameliens:SetSize(1925, 1090)
            frameliens:SetPos(0,0)
            frameliens:SetTitle("")

       
            frameliens:MakePopup()
            frameliens:SetDraggable(false)
            frameliens:ShowCloseButton(false)
                function frameliens:Paint(w,h)
                    surface.SetMaterial(bsl)
                    surface.SetDrawColor( 255, 255, 255, 255)
                    surface.DrawTexturedRect(0, 0, 1925, 1090)

                    draw.SimpleText("Liens Utiles", "fontnormal",260,60,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end

            local revenir = vgui.Create("DButton", frameliens)
            revenir:SetSize(454, 100)
            revenir:SetPos(1370, 985)
            revenir:SetText("")
            revenir.Paint = function(m, w, h)
                draw.SimpleText("Revenir", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            revenir.DoClick = function()
                frameliens:Remove()
            end

            local discord = vgui.Create("DButton", frameliens)
            discord:SetSize(454, 100)
            discord:SetPos(210, 340)
            discord:SetText("")
            discord.Paint = function(m, w, h)
                draw.SimpleText("Discord", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            discord.DoClick = function()
                gui.OpenURL(echap.Discord)
                print("discord open")
            end

            local worksop = vgui.Create("DButton", frameliens)
            worksop:SetSize(454, 100)
            worksop:SetPos(735, 340)
            worksop:SetText("")
            worksop.Paint = function(m, w, h)
                draw.SimpleText("Workshop", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            worksop.DoClick = function()
                gui.OpenURL(echap.Workshop)
            end

            local forum = vgui.Create("DButton", frameliens)
            forum:SetSize(454, 100)
            forum:SetPos(1245, 340)
            forum:SetText("")
            forum.Paint = function(m, w, h)
                draw.SimpleText("Forum", "fontnormal", w * .5, h * .5,  Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            forum.DoClick = function()
                gui.OpenURL(echap.Forum)
            end
        
        
    end



    EscapeMenu:Dock(FILL)
end

local PANEL = {}
function PANEL:Init()
    local scrw, scrh = ScrW(), ScrH()
    self:ShowCloseButton(false)
    self:SetTitle("")
    self:DockPadding(0,0,0,0)
    self:MakePopup()
end

function PANEL:Paint(w,h)

    Derma_DrawBackgroundBlur(self, self.startTime)

    local lum = Material("lum.png")
    
    surface.SetMaterial(lum)
    surface.SetDrawColor( 255, 255, 255, 250)
    surface.DrawTexturedRect(-100, -100, 2150, 1490)
    
  


    surface.SetMaterial(txt)
    surface.SetDrawColor( 255, 255, 255, 255)
    surface.DrawTexturedRect(0, 0, 1700, 1090)




    surface.SetMaterial(boussole)
    surface.SetDrawColor( 255, 255, 255, 255)
    surface.DrawTexturedRect(52, 35, 179,236)


end

derma.DefineControl("TRYEscapeMenu", "", PANEL, "DFrame")







