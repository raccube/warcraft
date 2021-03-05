# frozen_string_literal: true

RSpec.describe Warcraft do
  it "has a version number" do
    expect(Warcraft::VERSION).not_to be nil
  end
end
