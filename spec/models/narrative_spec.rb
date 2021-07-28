require 'rails_helper'

RSpec.describe Narrative, type: :model do
  before do
    @narrative = Narrative.new(
      title: "Princes of the Apocalypse",
      description: "Descrição",
      size: "1",
    )
    @saved = @narrative.save
  end

  it "is closed by default" do
    expect(@saved).to eq(true)
    expect(@narrative.open?).to eq(false)
  end
end
