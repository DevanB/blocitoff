require 'rails_helper'

describe Todo do
  before do
    @user = create(:user)
    @todo = create(:todo, created_at: Time.new(2014, 7, 31, 9, 5, 0))
    @todo2 = create(:todo, created_at: Time.new(2014, 8, 3, 9, 5, 0))
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

  describe "#delele_todos" do
    include ActiveSupport::Testing::TimeHelpers
    it "deletes the todo after 7 days" do
      travel_to Time.new(2014, 8, 7, 9, 5, 0) do
        DeleteTodos.run
        expect(Todo.count).to eq(1)
      end
    end
  end
end