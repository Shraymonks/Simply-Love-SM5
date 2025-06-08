local player, controller = unpack(...)

local pn = ToEnumShortString(player)
local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn)

local firstToUpper = function(str)
    return (str:gsub("^%l", string.upper))
end

-- iterating through the TapNoteScore enum directly isn't helpful because the
-- sequencing is strange, so make our own data structures for this purpose
local TapNoteScores = {}
local TapNoteScores = {
	Types = { 'W0', 'W1', 'W2', 'W3', 'W4', 'W5', 'Miss' },
	Names = {
		THEME:GetString("TapNoteScore", "W1"),
		THEME:GetString("TapNoteScoreFA+", "W2"), -- Extract the Fantastic White window
        THEME:GetString("TapNoteScore", "W2"),
		THEME:GetString("TapNoteScore", "W3"),
		THEME:GetString("TapNoteScore", "W4"),
		THEME:GetString("TapNoteScore", "W5"),
		THEME:GetString("TapNoteScore", "Miss"),
	},
	Colors = {
		SL.JudgmentColors["ITG"][1], -- Fantastic Blue
		SL.JudgmentColors["FA+"][2], -- Just extract the Fantastic white color
        SL.JudgmentColors["ITG"][2], -- Yellow Excellent
		SL.JudgmentColors["ITG"][3], -- Green Great
		SL.JudgmentColors["ITG"][4], -- Purple Decent
		SL.JudgmentColors["ITG"][5], -- Way Off
		SL.JudgmentColors["ITG"][6], -- Red Miss
	},
	-- x values for P1 and P2
	x = { P1=64, P2=94 }
}

local RadarCategories = {
	THEME:GetString("ScreenEvaluation", 'Holds'),
	THEME:GetString("ScreenEvaluation", 'Mines'),
	THEME:GetString("ScreenEvaluation", 'Rolls')
}

local EnglishRadarCategories = {
	[THEME:GetString("ScreenEvaluation", 'Holds')] = "Holds",
	[THEME:GetString("ScreenEvaluation", 'Mines')] = "Mines",
	[THEME:GetString("ScreenEvaluation", 'Rolls')] = "Rolls",
}

local t = Def.ActorFrame{
	InitCommand=function(self)
		self:xy(50 * (controller==PLAYER_1 and 1 or -1), _screen.cy-24)
	end,
}

-- The FA+ window shares the status as the FA window.
-- If the FA window is disabled, then we consider the FA+ window disabled as well.
local windows = {SL[pn].ActiveModifiers.TimingWindows[1]}
for v in ivalues(SL[pn].ActiveModifiers.TimingWindows) do
	windows[#windows + 1] = v
end

-- Shift labels left if any tap note counts exceeded 9999
-- The positioning logic breaks if we get to 7 digits, please nobody hit a million Fantastics
local maxCount = 1
local counts = GetExJudgmentCounts(player)
for i=1, #TapNoteScores.Types do
	local window = TapNoteScores.Types[i]
	local number = counts[window] or 0
	if number > maxCount then maxCount = number end
end

--  labels: W1, W2, W3, W4, W5, Miss
for i=1, #TapNoteScores.Types do
	-- no need to add BitmapText actors for TimingWindows that were turned off
	if windows[i] or i==#TapNoteScores.Types then
		t[#t+1] = LoadFont("Common Normal")..{
			Text=TapNoteScores.Names[i]:upper(),
			InitCommand=function(self) self:zoom(0.833):horizalign(right):maxwidth(76) end,
			BeginCommand=function(self)
				self:x( (controller == PLAYER_1 and 28) or -28 )
				if maxCount > 9999 then
					length = math.floor(math.log10(maxCount)+1)
					modifier = controller == PLAYER_1 and -11*(length-4) or 11*(length-4)
					finalPos = 28 + modifier
					finalZoom = 0.833 - 0.1*(length-4)
					self:x( (controller == PLAYER_1 and finalPos) or -finalPos ):zoom(finalZoom)
				end
				self:y(i*26 -46)
				-- diffuse the JudgmentLabels the appropriate colors for the current GameMode
				self:diffuse( TapNoteScores.Colors[i] )
			end
		}
	end
end

-- labels: hands/ex, holds, mines, rolls
for index, label in ipairs(RadarCategories) do
	if index == 1 then
		text = nil
		if SL[pn].ActiveModifiers.ShowExScore then
			text = "ITG"
		else
			text = "EX"
		end


		t[#t+1] = LoadFont("Wendy/_wendy small")..{
			Text=text,
			InitCommand=function(self) self:zoom(0.5):horizalign(right) end,
			BeginCommand=function(self)
				self:x( (controller == PLAYER_1 and -160) or 82 )
				self:y(38)

				if SL[pn].ActiveModifiers.ShowExScore then
					self:diffuse(Color.White)
				else
					self:diffuse( SL.JudgmentColors[SL.Global.GameMode][1] )
				end
			end
		}
	end

	local performance = stats:GetRadarActual():GetValue( "RadarCategory_"..firstToUpper(EnglishRadarCategories[label]) )
	local possible = stats:GetRadarPossible():GetValue( "RadarCategory_"..firstToUpper(EnglishRadarCategories[label]) )

	t[#t+1] = LoadFont("Common Normal")..{
		Text=label,
		InitCommand=function(self) self:zoom(0.833):horizalign(right) end,
		BeginCommand=function(self)
			self:x( (controller == PLAYER_1 and -160) or 90 )
			self:y(index*28 + 41)
		end
	}
end

return t
