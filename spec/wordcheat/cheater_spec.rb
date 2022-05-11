require 'spec_helper'

RSpec.describe Wordcheat::Cheater do
  it 'can be instantiated' do
    cheater = Wordcheat::Cheater.new
  end

  let(:words) do
    [
      "hello",
      "goodbye",
      "badger",
      "weasel",
      "marmot",
      "ferret",
      "muskrat",
      "bobcat",
    ]
  end

  it "can find words at a specific location" do
    cheater = Wordcheat::Cheater.new
    matches = cheater.at("_____", words)
    expect(matches).to eq(["hello"])

    matches = cheater.at("_____t", words)
    expect(matches).to eq(["marmot", "ferret", "bobcat"])

    matches = cheater.at("H____", words)
    expect(matches).to eq(["hello"])

    matches = cheater.at("__z___", words)
    expect(matches).to be_empty
  end

  it "can find words that only include a list of letters" do
    cheater = Wordcheat::Cheater.new
    matches = cheater.only("efr", words)
    expect(matches).to be_empty

    matches = cheater.only("efrt", words)
    expect(matches).to eq(["ferret"])

    matches = cheater.only("efrtz", words)
    expect(matches).to eq(["ferret"])
  end

  it "can find words that must include a list of letters" do
    cheater = Wordcheat::Cheater.new
    matches = cheater.must("z", words)
    expect(matches).to be_empty

    matches = cheater.must("ab", words)
    expect(matches).to eq(["badger", "bobcat"])
  end

  it "can find words that must not include a list of letters" do
    cheater = Wordcheat::Cheater.new
    matches = cheater.must_not("aiou", words)
    expect(matches).to eq(["ferret"])
  end

  it "can find words of an expected length" do
    cheater = Wordcheat::Cheater.new
    matches = cheater.length(7, words)
    expect(matches).to eq(["goodbye", "muskrat"])
  end
end
