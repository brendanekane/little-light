module LittleLight
  module User
    def get_bungie_net_profile(bungieMembershipId)
      data = self.class.get(
        "/User/GetBungieNetUserById/#{bungieMembershipId}/",
         headers: @headers
       )
    end


    # returns a JSON object of potential users that match the given username
    # gives basic overview of returned users, returns bungie.net membershipID but no Destiny membershipID
    def search_bungie_net_by_username(username)
      data = self.class.get(
        "/User/SearchUsers?q=#{username}",
         headers: @headers
       )
    end


    # returns only the exact user on the given platform or nothing
    # basically just gives the Destiny membershipID
    # displayName is either GamerTag or PSN Name
    def search_destiny_player(displayName, membershipType)
      data = self.class.get(
        "/Destiny2/SearchDestinyPlayer/#{membershipType}/#{displayName}/",
         headers: @headers
       )
    end

    # basically returns a combination of both search_bungie_net_by_username && search_destiny_player however
    # the destinyMembershipId is needed to access this endpoint (which you can only really get from search_destiny_player)
    def get_user_by_membership(destinyMembershipId, membershipType)
      data = self.class.get(
        "/User/GetMembershipsById/#{destinyMembershipId}/#{membershipType}/",
         headers: @headers
       )
    end

    # returns the same as the method above, doesn't require any parms to be passed in but does require a user to be
    # signed in via Oauth2
    def get_current_user_membership
      data = self.class.get(
        "/User/GetMembershipsForCurrentUser/",
        headers: @headers
      )
    end


    def get_user_themes
      data = self.class.get(
        "/User/GetAvailableThemes/",
        headers: @headers
      )
    end


    def get_user_partnerships(destinyMembershipId)
      data = self.class.get(
        "/User/#{destinyMembershipId}/Partnerships/",
        headers: @headers
       )
    end


    def get_linked_profiles(destinyMembershipId, membershipType)
      data = self.class.get(
        "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}"\
        "/LinkedProfiles/",
         headers: @headers
       )
    end


    #groupType 0 - general, 1 - clan
    #filter 0 - All, 1 - Founded, 2 - Not Founded
    def get_groups_for_user(destinyMembershipId, membershipType, groupType, filter)
      data = self.class.get(
        "/GroupV2/User/#{membershipType}/#{destinyMembershipId}"\
        "/#{filter}/#{groupType}/",
         headers: @headers
       )
    end
    # component query string 100 - profile, 200 - characters, 300 - items, 400 - vendors, 500 - kiosks
    # https://bungie-net.github.io/multi/schema_Destiny-DestinyComponentType.html#schema_Destiny-DestinyComponentType
    #                 ^^^ Link to full list of components ^^^


    # only 100 & 200 query strings will produce results here
    def get_destiny_profile(destinyMembershipId, membershipType, component)
      data = self.class.get(
        "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}"\
        "?components=#{component}",
         headers: @headers
       )
    end


    # only 200 query strings will produce results here
    # for query strings that return a JSON object that has a key of
    # privacy pointing to 2 - means that user need to be authenticated via
    # OAuth 2.0 or user has privacy settings on.
    # No real plans to implement OAuth in this gem.
    def get_character(destinyMembershipId, membershipType, characterId, component)
      data = self.class.get(
        "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}"\
        "/Character/#{characterId}?components=#{component}",
         headers: @headers
       )
    end

    # returns the stats of a specific item instance
    def get_item(destinyMembershipId, membershipType, itemInstanceId)
      data = self.class.get(
        "/Destiny2/{membershipType}/Profile/{destinyMembershipId}/Item/"\
        "{itemInstanceId}/",
        headers: @headers
      )
    end

    # the next two get_user methods return info relevant to the specific clans they're in
    # but are user methods not clan methods
    def get_user_clan_theme
      data = self.class.get(
        "/GroupV2/GetAvailableThemes/",
        headers: @headers
      )
    end


    def get_user_clan_avatar
      data = self.class.get(
        "/GroupV2/GetAvailableAvatars/",
        headers: @headers
      )
    end
  end
end
