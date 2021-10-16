require 'rails_helper'

RSpec.describe Narrative, type: :model do
  before do
    @narrator = User.create(
      email: "vitor@example.com",
      password: "caplin123",
      name: "vitor",
      type: "Narrator"
    )
    @narrator.confirm

    @narrative = Narrative.new(
      title: "Princes of the Apocalypse",
      description: "Descrição",
      size: "1",
      narrator: @narrator
    )
    @saved = @narrative.save
  end

  it "is closed by default" do
    expect(@saved).to eq(true)
    expect(@narrative.open?).to eq(false)
  end
end
