module Clan

  #groupType 0 - general, 1 - clan
  def get_clan_by_name(groupName, groupType)
    if groupName.split(" ").length > 1
      groupName = groupName.split(" ").map {|el| el += "%20"}.join("")
    end 
    data = self.class.get("/GroupV2/Name/#{groupName}/#{groupType}/", headers: @headers)
  end

  def get_clan_by_id(groupId)
    data = self.class.get("/GroupV2/#{groupId}/", headers: @headers)
  end

  def get_clan_weekly_state(groupId)
    data = self.class.get("/Destiny2/Clan/#{groupId}/WeeklyRewardState/", headers: @headers)
  end
end
