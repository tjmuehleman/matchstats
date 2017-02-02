class MatchController < ApplicationController
  def set


    data= {
      meta_instance_id: "uuid:#{SecureRandom::uuid}",
      winner: "TJ",
      loser: "Jared",
      date_of_match: Date.today.to_s
      }


    endpoint = "https://www.securedatakit.com/api/datasets/matches2/records/create?api_token=UKaYegEAZphzVnZtyFMsXU3LpEhwzHYzq2GPNaA8oa8gUJvvbwgagPPeXkhLvHqX"

    response = HTTParty.post(endpoint,
                         :body => data.to_json,
                         :headers => { "Content-Type" => 'application/json'})

    puts "testing bbbbb?"
    puts response

  end
end
