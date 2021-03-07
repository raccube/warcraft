# frozen_string_literal: true

require_relative "../lib/warcraft/client"
require_relative "../lib/warcraft/character/achievements"

describe Warcraft::Character::Achievements do
  let(:client) { Warcraft::Client.new("token", :eu) }
  let(:response) { Warcraft::Character::Achievements.new(client, json_fixture("character/achievements.json")) }

  it "should map the total quantity of achievements" do
    expect(response.total_quantity).to eq(2231)
  end

  it "should map the total of achievement points" do
    expect(response.total_points).to eq(20_010)
  end

  it "should contain an achievements array with Achievement objects" do
    expect(response.achievements.all? { |a| a.is_a? Warcraft::Character::AchievementFragment }).to be(true)
    expect(response.achievements[0].id).to eq(6)
    expect(response.achievements[0].name).to eq("Level 10")
  end

  it "should contain an caterogy_progress array with CategoryProgress objects" do
    expect(response.category_progress.all? { |c| c.is_a? Warcraft::Character::CategoryProgress }).to be(true)
    expect(response.category_progress[0].quantity).to eq(27)
    expect(response.category_progress[0].points).to eq(270)
    expect(response.category_progress[0].name).to eq("Shadowlands Dungeon")
  end

  it "should contain an recent_events array with AchievementEvent objects" do
    expect(response.recent_events.all? { |e| e.is_a? Warcraft::Character::AchievementEvent }).to be(true)
    expect(response.recent_events[0].achievement_id).to eq(14_338)
    expect(response.recent_events[0].achievement_name).to eq("Court of Harvesters")
    expect(response.recent_events[0].time).to eq(Time.at(1_614_975_993))
  end
end
