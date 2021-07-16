require 'rails_helper'

RSpec.describe User, type: :model do
  describe "types" do
    before do
      @user = User.new(
        name: "Felippe",
        institution: "UnB",
        nickname: "F.",
        age: "23",
        email: "fkipman@hotmail.com",
        password: "123456"
      )
      @saved = @user.save
    end

    context "valid user" do
      it "is saved" do
        expect(@saved).to eq(true)
      end

      it "is student by default" do
        expect(@user.student?).to eq(true)
      end
    end

    context "promoted user" do
      it "is now a narrator" do
        @user.type = "Narrator"
        @saved = @user.save

        expect(@saved).to eq(true)
        expect(@user.narrator?).to eq(true)
      end
    end
  end
end
