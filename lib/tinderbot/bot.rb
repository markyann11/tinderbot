module Tinderbot
  class Bot
    attr_accessor :client
    def initialize(client)
      @client = client
      require 'csv'
    end

    def like_recommended_users
      recommended_users = @client.recommended_users
      CSV.open("tinder_users_db.csv", "ab") do |csv|
        while recommended_users
          recommended_users.each { |user|
            @client.like user
            csv << [user.id,user.name,user.bio,user.birth_date,user.photo_urls]
            sleep(1.0)
          }
          recommended_users = @client.recommended_users
        end

      end

    end
  end
end