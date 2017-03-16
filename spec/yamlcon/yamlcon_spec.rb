require 'spec_helper'

describe YAMLCon do

  let :config do
    YAML.load_config 'spec/fixtures/config.yml'
  end

  it "loads as OpenStruct" do
    expect(config).to be_kind_of OpenStruct
  end

  it "allows access with accessor" do
    expect(config.weapon).to eq 'Handheld Portal Device'
  end

  it "allows access with []" do
    expect(config["weapon"]).to eq 'Handheld Portal Device'
  end

  it "allows access with spaces" do
    expect(config["emancipation grill"]).to eq 'yes please'
  end

  it "loads nested options" do
    expect(config.items).to be_kind_of OpenStruct
    expect(config.items.weighted_companion_cube).to eq 2
  end

  it "loads deeply nested options" do
    expect(config.glados.texts.during_escape).to be_kind_of Array
    expect(config.glados.texts.during_escape[0]).to eq "Is anyone there?"
  end

  it "loads array of key value pairs" do
    expect(config.gels).to be_kind_of Array
    expect(config.gels.first).to be_kind_of OpenStruct
    expect(config.gels.first.color).to eq "blue"
  end

  it "loads multiple files" do
    config = YAML.load_config 'spec/fixtures/*.yml'
    expect(config.config.weapon).to eq 'Handheld Portal Device'
    expect(config.another.three).to eq 'five'
  end

  it "saves" do
    config.items.portal_gun = 1
    YAML.save_config 'tmp.yml', config
    config = YAML.load_config 'tmp.yml'
    expect(config.items.portal_gun).to eq 1
    expect(config.items.weighted_companion_cube).to eq 2
  end

  context "with missing options" do
    it "does not raise exception" do
      expect(config.hello_are_you_there).to be nil
    end
  end

end
