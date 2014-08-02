require 'rails_helper'

describe "Creation" do
  include UserFlowHelpers

  before do
    Capybara.current_driver = :selenium
    @user = create(:user)
    go_to_sign_in
    submit_sign_in_form(@user.email, @user.password)
    expect(current_path).to eq(todos_path)
  end

  describe "successful" do
    it "creates todo" do
      click_link 'Create new todo'
      expect(current_path).to eq(new_todo_path)

      fill_in 'Description', with: "Mop up the kool aid"
      click_button 'Save'

      expect(current_path).to eq(todos_path)
      expect(page).to have_content("Your todo has been created successfully.")
      expect(page).to have_content("Mop up the kool aid")
      expect(page).to have_content("7 days")
    end

    it "marks todo as complete and removes todo", js: true do
      todo = create(:todo, user: @user)

      visit todos_path
      check "checkbox_#{todo.id}"
      expect(page).to have_content("Todo successfully completed.")
      expect(page).to_not have_content(todo.description)
    end
  end
end

