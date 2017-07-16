require "spec_helper"

RSpec.describe Scrapp do
  it "has a version number" do
    expect(Scrapp::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
