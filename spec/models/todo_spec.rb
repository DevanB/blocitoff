require 'rails_helper'

describe Todo do
  before do
    @user = create(:user)
    @todo = create(:todo)
  end

  describe "#expiration_date" do
    it "returns the number of days remaining before todo is deleted" do
      expect(@todo.expiration_date).to eq(@todo.created_at+7.days)
    end
  end

end