
class MatchController < ApplicationController
  def set


    data= {
      meta_instance_id: "uuid:#{SecureRandom::uuid}",
      winner: "TJ",
      loser: "Jared",
      date_of_match: Date.today.to_s
      }

    api_token = ENV['api_token']

    endpoint = "https://www.securedatakit.com/api/datasets/matches2/records/create?api_token=#{api_token}"

    response = HTTParty.post(endpoint,
                         :body => data.to_json,
                         :headers => { "Content-Type" => 'application/json'})

    puts "testing bbbbb?"
    puts response

  end
end
