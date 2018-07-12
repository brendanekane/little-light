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


  def get_user_partnerships(destinyMembershipId)
    data = self.class.get(
      "/User/#{destinyMembershipId}/Partnerships/",
       headers: @headers
     )
  end


  def get_linked_profiles(destinyMembershipId, membershipType)
    data = self.class.get(
      "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}/LinkedProfiles/",
       headers: @headers
     )
  end


  #groupType 0 - general, 1 - clan
  #filter 0 - All, 1 - Founded, 2 - Not Founded
  def get_clans_for_user(destinyMembershipId, membershipType, groupType, filter)
    data = self.class.get(
      "/GroupV2/User/#{membershipType}/#{destinyMembershipId}/#{filter}/#{groupType}/",
       headers: @headers
     )
  end
  # component query string 100 - profile, 200 - characters, 300 - items, 400 - vendors, 500 - kiosks
  # https://bungie-net.github.io/multi/schema_Destiny-DestinyComponentType.html#schema_Destiny-DestinyComponentType
  #                 ^^^ Link to full list of components ^^^


  # only 100 & 200 query strings will produce results here
  def get_destiny_profile(destinyMembershipId, membershipType, component)
    data = self.class.get(
      "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}?components=#{component}",
       headers: @headers
     )
  end


  # only 200 query strings will produce results here
  def get_character(destinyMembershipId, membershipType, characterId, component)
    data = self.class.get(
      "/Destiny2/#{membershipType}/Profile/#{destinyMembershipId}/
      Character/#{characterId}?components=#{component}",
       headers: @headers
     )
  end
end
