# frozen_string_literal: true

require_relative "../lib/warcraft/client"
require_relative "../lib/warcraft/character/profile"

describe Warcraft::Character::Profile do
  let(:client) { Warcraft::Client.new("token", :eu) }
  let(:profile) { Warcraft::Character::Profile.new(client, json_fixture("character/profile.json")) }

  it "should map the ID" do
    expect(profile.id).to eq(117_060_781)
  end

  it "should map the character's name" do
    expect(profile.name).to eq("Jiu")
  end

  it "should map the character's level" do
    expect(profile.level).to eq(60)
  end

  it "should map the character's experience points" do
    expect(profile.experience).to eq(0)
  end

  it "should map the character's achievement points" do
    expect(profile.achievement_points).to eq(19_910)
  end
end
