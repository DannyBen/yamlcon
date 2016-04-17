require 'spec_helper'

describe "yamlcon" do

  let(:config) { YAML.load_config 'spec/fixtures/config.yml' }

  it "should load as OpenStruct" do
    expect(config).to be_kind_of OpenStruct
  end

  it "should allow access with accessor" do
    expect(config.weapon).to eq 'Handheld Portal Device'
  end

  it "should load nested options" do
    expect(config.items).to be_kind_of OpenStruct
    expect(config.items.weighted_companion_cube).to eq 2
  end

  it "should load deeply nested options" do
    expect(config.glados.texts.during_escape).to be_kind_of Array
    expect(config.glados.texts.during_escape[0]).to eq "Is anyone there?"
  end

  it "should save" do
    config.items.portal_gun = 1
    YAML.save_config 'tmp.yml', config
    config = YAML.load_config 'tmp.yml'
    expect(config.items.portal_gun).to eq 1
    expect(config.items.weighted_companion_cube).to eq 2
  end

  context "on missing options" do
    it "should not panic" do
      expect(config.hello_are_you_there).to be nil
    end
  end

  context "on options with spaces" do
    it "should not panic" do
      expect(config["emancipation grill"]).to eq 'yes please'
    end
  end

end
