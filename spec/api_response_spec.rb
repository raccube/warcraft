# frozen_string_literal: true

require_relative "../lib/warcraft/client"
require_relative "../lib/warcraft/character/profile"

describe Warcraft::ApiResponse do
  before do
    stub_request(:get,
                 "https://eu.api.blizzard.com/profile/wow/character/magtheridon/jiu/achievements?namespace=profile-eu")
      .to_return(status: 200, body: file_fixture("character/achievements.json"), headers: {})
  end

  context "#link" do
    let(:client) { Warcraft::Client.new("token", :eu) }
    let(:profile) { Warcraft::Character::Profile.new(client, json_fixture("character/profile.json")) }

    it "should return and memoize a hash" do
      expect(profile.achievements).to be_a(Hash)
      memoized_responses = profile.instance_variable_get(:@memoized_responses)
      expect(memoized_responses).to have_key(:achievements)
      expect(memoized_responses[:achievements]).to eq(profile.achievements)
    end
  end
end
