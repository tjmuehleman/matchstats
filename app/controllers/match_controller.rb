
class MatchController < ApplicationController
  def set

    body = params['body']

    # split -- first name is winner
    spl = body.split(" ")

    winner = spl[0]
    loser = spl[1]

    puts winner
    puts loser

    data= {
      meta_instance_id: "uuid:#{SecureRandom::uuid}",
      winner: winner,
      loser: loser,
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
