module Tinderbot
  class Bot
    attr_accessor :client
    def initialize(client)
      @client = client
      require 'csv'
    end

    def like_recommended_users
      recommended_users = @client.recommended_users
      CSV.open("mycsvfile.csv", "w") do |csv|
        while recommended_users
          recommended_users.each { |user|
            @client.like user
            csv << [user.id,user.name,user.bio,user.birth_date,user.photo_urls]
          }
          recommended_users = @client.recommended_users
        end
        #        csv << ["row", "of", "CSV", "data"]
      end

    end
  end
end