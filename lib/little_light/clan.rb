module LittleLight
  module Clan

    #groupType 0 - general, 1 - clan

    #both get_clan_by methods return exactly the same thing, just different ways of
    #accessing information through params
    def get_clan_by_name(groupName, groupType)
      if groupName.match(" ")
        groupName = groupName.split(" ").map {|el| el += "%20"}.join("")
      end
      data = self.class.get(
        "/GroupV2/Name/#{groupName}/#{groupType}/",
         headers: @headers
       )
    end

    def get_clan_by_id(groupId)
      data = self.class.get("/GroupV2/#{groupId}/",
        headers: @headers)
    end

    # returns a list of available optional conserations for the clan
    def get_clan_optional_convos(groupId)
      data = self.class.get(
        "/GroupV2/{groupId}/OptionalConversations/",
        headers: @headers
      )
    end

    # returns a list of active members in the clan
    def get_clan_members(groupId)
      data = self.class.get(
        "/GroupV2/{groupId}/Members/",
        headers: @headers
      )
    end

    # returns a list of banned members
    def get_banned_clan_members(groupId)
      data = self.class.get(
        "GroupV2/{groupId}/Banned/",
        headers: @headers
      )
    end

    # returns a hash of whether the rewards were unlocked or picked up along with their boolean state
    def get_clan_weekly_state(groupId)
      data = self.class.get(
        "/Destiny2/Clan/#{groupId}/WeeklyRewardState/",
         headers: @headers
       )
    end

    # both of the next two clan member functions take an optional param for page number
    # (which limits to 50 elements per page). Not sure how to implement that currently.
    def get_clan_admin_founders(groupId)
      data = self.class.get(
        "/GroupV2/#{groupId}/AdminsAndFounder/",
         headers: @headers
       )
    end


    def get_clan_members(groupId)
      data = self.class.get(
        "/GroupV2/#{groupId}/Members/",
         headers: @headers
       )
    end
  end
end
