local browseCategory = 0;
local browseGroups = {};
local customGroups = {};

--LE_EXPANSION_CLASSIC
--LE_EXPANSION_BURNING_CRUSADE
--LE_EXPANSION_WRATH_OF_THE_LICH_KING
--LE_EXPANSION_CATACLYSM
--LE_EXPANSION_MISTS_OF_PANDARIA
--LE_EXPANSION_WARLORDS_OF_DRAENOR

local activityToExpansion = {
	["3:9"] = LE_EXPANSION_CLASSIC,
	["3:293"] = LE_EXPANSION_CLASSIC,
	["3:294"] = LE_EXPANSION_CLASSIC,
	["3:295"] = LE_EXPANSION_CLASSIC,

	["2:18"] = LE_EXPANSION_CLASSIC,
	["2:50"] = LE_EXPANSION_CLASSIC,
	["2:51"] = LE_EXPANSION_CLASSIC,
	["2:52"] = LE_EXPANSION_CLASSIC,
	["2:53"] = LE_EXPANSION_CLASSIC,
	["2:54"] = LE_EXPANSION_CLASSIC,
	["2:55"] = LE_EXPANSION_CLASSIC,
	["2:56"] = LE_EXPANSION_CLASSIC,
	["2:57"] = LE_EXPANSION_CLASSIC,
	["2:58"] = LE_EXPANSION_CLASSIC,
	["2:59"] = LE_EXPANSION_CLASSIC,
	["2:60"] = LE_EXPANSION_CLASSIC,
	["2:61"] = LE_EXPANSION_CLASSIC,
	["2:62"] = LE_EXPANSION_CLASSIC,
	["2:63"] = LE_EXPANSION_CLASSIC,
	["2:64"] = LE_EXPANSION_CLASSIC,
	["2:65"] = LE_EXPANSION_CLASSIC,
	["2:66"] = LE_EXPANSION_CLASSIC,
	["2:77"] = LE_EXPANSION_CLASSIC,
	["2:78"] = LE_EXPANSION_CLASSIC,

	["3:45"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:296"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:297"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:298"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:299"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:300"] = LE_EXPANSION_BURNING_CRUSADE,
	["3:301"] = LE_EXPANSION_BURNING_CRUSADE,

	["2:67"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:94"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:68"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:93"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:69"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:95"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:70"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:90"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:71"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:92"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:72"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:91"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:73"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:85"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:74"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:84"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:75"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:86"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:76"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:87"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:79"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:89"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:80"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:88"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:81"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:98"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:82"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:97"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:83"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:96"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:99"] = LE_EXPANSION_BURNING_CRUSADE,
	["2:100"] = LE_EXPANSION_BURNING_CRUSADE,

	["3:43"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:44"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:46"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:47"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:48"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:49"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:302"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:303"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:304"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:305"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:306"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:307"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:308"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:309"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:310"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["3:311"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,

	["2:101"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:128"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:102"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:117"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:103"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:127"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:104"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:119"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:105"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:120"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:106"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:121"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:107"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:118"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:108"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:122"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:109"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:123"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:110"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:124"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:111"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:125"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:112"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:126"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:113"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:129"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:114"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:130"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:115"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:131"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:116"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,
	["2:132"] = LE_EXPANSION_WRATH_OF_THE_LICH_KING,

	["3:313"] = LE_EXPANSION_CATACLYSM,
	["3:316"] = LE_EXPANSION_CATACLYSM,
	["3:317"] = LE_EXPANSION_CATACLYSM,
	["3:318"] = LE_EXPANSION_CATACLYSM,
	["3:319"] = LE_EXPANSION_CATACLYSM,
	["3:320"] = LE_EXPANSION_CATACLYSM,
	["3:321"] = LE_EXPANSION_CATACLYSM,
	["3:322"] = LE_EXPANSION_CATACLYSM,
	["3:323"] = LE_EXPANSION_CATACLYSM,
	["3:324"] = LE_EXPANSION_CATACLYSM,
	["3:325"] = LE_EXPANSION_CATACLYSM,
	["3:326"] = LE_EXPANSION_CATACLYSM,
	["3:327"] = LE_EXPANSION_CATACLYSM,
	["3:328"] = LE_EXPANSION_CATACLYSM,
	["3:329"] = LE_EXPANSION_CATACLYSM,
	["3:330"] = LE_EXPANSION_CATACLYSM,
	["3:331"] = LE_EXPANSION_CATACLYSM,
	["3:332"] = LE_EXPANSION_CATACLYSM,
	["3:333"] = LE_EXPANSION_CATACLYSM,
	["3:334"] = LE_EXPANSION_CATACLYSM,

	["2:133"] = LE_EXPANSION_CATACLYSM,
	["2:146"] = LE_EXPANSION_CATACLYSM,
	["2:134"] = LE_EXPANSION_CATACLYSM,
	["2:144"] = LE_EXPANSION_CATACLYSM,
	["2:135"] = LE_EXPANSION_CATACLYSM,
	["2:143"] = LE_EXPANSION_CATACLYSM,
	["2:136"] = LE_EXPANSION_CATACLYSM,
	["2:142"] = LE_EXPANSION_CATACLYSM,
	["2:137"] = LE_EXPANSION_CATACLYSM,
	["2:141"] = LE_EXPANSION_CATACLYSM,
	["2:138"] = LE_EXPANSION_CATACLYSM,
	["2:140"] = LE_EXPANSION_CATACLYSM,
	["2:139"] = LE_EXPANSION_CATACLYSM,
	["2:147"] = LE_EXPANSION_CATACLYSM,
	["2:148"] = LE_EXPANSION_CATACLYSM,
	["2:149"] = LE_EXPANSION_CATACLYSM,
	["2:150"] = LE_EXPANSION_CATACLYSM,
	["2:151"] = LE_EXPANSION_CATACLYSM,
	["2:152"] = LE_EXPANSION_CATACLYSM,
	["2:153"] = LE_EXPANSION_CATACLYSM,
	["2:154"] = LE_EXPANSION_CATACLYSM,

	["2:155"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:163"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:156"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:164"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:157"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:165"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:158"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:166"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:159"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:171"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:160"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:167"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:168"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:169"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:170"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:363"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["2:364"] = LE_EXPANSION_MISTS_OF_PANDARIA,

	--Siege of Orgrimmar
	["3:4"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:41"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:42"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	--Mogu'shan Vaults
	["3:335"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:336"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:337"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:338"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	--Heart of Fear
	["3:339"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:340"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:341"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:342"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	--Terrace of Endless Spring
	["3:343"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:344"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:345"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:346"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	--Throne of Thunder
	["3:347"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:348"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:349"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:350"] = LE_EXPANSION_MISTS_OF_PANDARIA,
	["3:397"] = LE_EXPANSION_MISTS_OF_PANDARIA,
}

function LFGListDropDown_SetUp(self)
	C_LFGList.RequestAvailableActivities();
	UIDropDownMenu_SetWidth(self, 240);
	UIDropDownMenu_Initialize(self, LFGListDropDown_Initialize);
	UIDropDownMenu_SetSelectedValue(LFGListDropDown, self.activeValue or "");
end

function LFGListDropDown_Initialize(self, level)
	local info = UIDropDownMenu_CreateInfo();

	if ( not level or level == 1 ) then
		info.text = NONE;
		info.value = 0;
		info.func = LFGListDropDownButton_OnClick;
		info.checked = self.activeValue == info.value;
		UIDropDownMenu_AddButton(info);

		local categories = C_LFGList.GetAvailableCategories();
		for i=1, #categories do
			local categoryID = categories[i];
			local name, separateRecommended, autoChoose, preferCurrentArea = C_LFGList.GetCategoryInfo(categoryID);

			info.text = name;
			info.value = categoryID;
			info.func = nil;
			info.hasArrow = true;
			info.checked = false;
			info.isRadio = false;
			UIDropDownMenu_AddButton(info, 1);
		end
	elseif ( level == 2 ) then
		table.wipe(browseGroups);
		table.wipe(customGroups);

		browseCategory = UIDROPDOWNMENU_MENU_VALUE;

		local activities = C_LFGList.GetAvailableActivities(browseCategory, nil, 0, ""); -- categoryID, groupID, filters, text

		for i=1, #activities do
			local activityID = activities[i];
			local fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType = C_LFGList.GetActivityInfo(activityID);

			local exp = activityToExpansion[browseCategory..":"..activityID];
			if exp then
				local customName = _G["EXPANSION_NAME"..exp];
				local key = browseCategory..customName;
				if not customGroups[key] then
					customGroups[key] = true;
					info.text = customName;
					info.value = key;
					info.func = nil;
					info.hasArrow = true;
					info.checked = false;
					info.isRadio = false;
					UIDropDownMenu_AddButton(info, level);
				end
			else
				if not browseGroups[groupID] then
					browseGroups[groupID] = true;

					if groupID == 0 then
						info.text = OTHER;
					else
						local name = C_LFGList.GetActivityGroupInfo(groupID);
						info.text = name;
					end

					info.value = groupID;
					info.func = nil;
					info.hasArrow = true;
					info.checked = false;
					info.isRadio = false;
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	elseif ( level == 3 ) then
		local activities = C_LFGList.GetAvailableActivities(browseCategory, nil, 0, ""); -- categoryID, groupID, filters, text

		for i=1, #activities do
			local activityID = activities[i];
			local fullName, shortName, categoryID, groupID, itemLevel, filters, minLevel, maxPlayers, displayType = C_LFGList.GetActivityInfo(activityID);

			local exp = activityToExpansion[categoryID..":"..activityID];
			if exp then
				local customName = _G["EXPANSION_NAME"..exp];
				local key = categoryID..customName;
				if UIDROPDOWNMENU_MENU_VALUE == key then
					info.text = fullName;
					info.value = activityID;
					info.func = LFGListDropDownButton_OnClick;
					info.hasArrow = false;
					info.checked = (self.activeValue == info.value);
					info.isRadio = true;
					UIDropDownMenu_AddButton(info, level);
				end
			else
				if UIDROPDOWNMENU_MENU_VALUE == groupID then
					info.text = fullName;
					info.value = activityID;
					info.func = LFGListDropDownButton_OnClick;
					info.hasArrow = false;
					info.checked = (self.activeValue == info.value);
					info.isRadio = true;
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	end
end

function LFGListDropDownButton_OnClick(self)
	LFGListDropDown.activeValue = self.value;
	UIDropDownMenu_SetSelectedValue(LFGListDropDown, self.value);
	HideDropDownMenu(1);
	LFGListSearchPanel_DoSearch(LFGListFrame.SearchPanel);
end
