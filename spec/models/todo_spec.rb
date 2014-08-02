require 'rails_helper'

describe Todo do
  before do
    @user = create(:user)
    @todo = create(:todo, created_at: Time.new(2014, 7, 31, 9, 5, 0))
  end

  describe "#expiration_date" do
    it "returns the number of days remaining before todo is deleted" do
      expect(@todo.expiration_date).to eq(Time.new(2014, 8, 7, 9, 5, 0))
    end
  end

  describe "#delete_completed_todo" do
    it "deletes the todo after the todo is marked as complete" do
      @todo.update_attribute("completed", true)
      expect(Todo.count).to eq(0)
    end
  end
end