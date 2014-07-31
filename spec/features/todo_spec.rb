require 'rails_helper'

describe "Creation" do
  include UserFlowHelpers

  describe "successful" do
    it "creates todo" do
      user = create(:user)
      go_to_sign_in
      submit_sign_in_form(user.email, user.password)
      expect(current_path).to eq(todos_path)

      click_link 'Create new todo'
      expect(current_path).to eq(new_todo_path)

      fill_in 'Description', with: "Mop up the kool aid"
      click_button 'Save'

      expect(current_path).to eq(todos_path)
      expect(page).to have_content("Your todo has been created successfully.")
      expect(page).to have_content("Mop up the kool aid")
      expect(page).to have_content("7 days")
    end
  end
end

