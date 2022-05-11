# frozen_string_literal: true

RSpec.describe Wordcheat do
  it "has a version number" do
    expect(Wordcheat::VERSION).to match /\d+\.\d+\.\d+/
  end
end
