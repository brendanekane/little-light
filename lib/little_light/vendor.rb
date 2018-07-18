module LittleLight
  module Vendor

    # this will return all possible vendors that have a rotating inventory.
    # requires a components query string
    # https://bungie-net.github.io/multi/schema_Destiny-DestinyComponentType.html#schema_Destiny-DestinyComponentType

    def get_all_vendors(destinyMembershipId, membershipType, characterId)
      data = self.class.get(
        "/Destiny2/{membershipType}/Profile/{destinyMembershipId}/"\
        "Character/{characterId}/Vendors/",
        headers: @headers
      )
    end

    # this will return the inventory of a single vendor that is supplied through the vendorHash param
    # requires a components query string
    # https://bungie-net.github.io/multi/schema_Destiny-DestinyComponentType.html#schema_Destiny-DestinyComponentType

    def get_one_vendor(destinyMembershipId, membershipType, characterId, vendorHash)
      data = self.class.get(
        "/Destiny2/{membershipType}/Profile/{destinyMembershipId}/"\
        "Character/{characterId}/Vendors/{vendorHash}/",
        header: @headers
      )
    end

  end
end
