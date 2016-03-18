require 'spec_helper'

describe "yamlcon" do

  before do
    @config = YAML.load_config 'spec/fixtures/config.yml'
  end

  it "should load as OpenStruct" do
    expect(@config).to be_kind_of OpenStruct
  end

  it "should allow access with accessor" do
    expect(@config.weapon).to eq 'Handheld Portal Device'
  end

  it "should load nested options" do
    expect(@config.items).to be_kind_of OpenStruct
    expect(@config.items.weighted_companion_cube).to eq 2
  end

  it "should load deeply nested options" do
    expect(@config.glados.texts.during_escape).to be_kind_of Array
    expect(@config.glados.texts.during_escape[0]).to eq "Is anyone there?"
  end

  it "should save" do
    @config.items.portal_gun = 1
    YAML.save_config 'tmp.yml', @config
    config = YAML.load_config 'tmp.yml'
    expect(@config.items.portal_gun).to eq 1
    expect(@config.items.weighted_companion_cube).to eq 2
  end

  it "should not panic on missing options" do
    expect(@config.hello_are_you_there).to be nil
  end

  it "should not panic on options with spaces" do
    expect(@config["emancipation grill"]).to eq 'yes please'
  end

end
