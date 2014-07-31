require 'rails_helper'

describe "Sign up" do
  include UserFlowHelpers
  
  describe "sucessful" do
    it "signs up, confirm account, and login" do
      go_to_sign_up
      submit_sign_up_form("anyone@example.com", "password1", "password1")

      expect(current_path).to eq(root_path)
      expect(page).to have_content(confirmation_message)

      expect_to_send_one_email
      mail = ActionMailer::Base.deliveries.first
      expect(mail.subject).to eq("Confirmation instructions")
      expect(mail.from).to eq(["devan.beitel@gmail.com"])

      confirmation_link = mail.body.to_s.match(/a href=\"([^"]+)/)[1]
      visit(confirmation_link)
      expect(page).to have_content("Your account was successfully confirmed.")

      go_to_sign_in
      submit_sign_in_form("anyone@example.com", "password1")

      expect(current_path).to eq(todos_path)
      expect(page).to have_content("Signed in successfully.")
    end
  end  

  describe "unsuccessful" do
    it "when user doesn't specify correct email" do
      go_to_sign_up
      submit_sign_up_form("bademail", "password1", "password1")

      expect(current_path).to eq('/users')
      expect(page).to_not have_content(confirmation_message)
    end

    it "when user doesn't specify password at least 8 characters long" do
      go_to_sign_up
      submit_sign_up_form("anyone@example.com", "bad", "bad")

      expect(current_path).to eq('/users')
      expect(page).to_not have_content(confirmation_message)
    end
  end
end

describe "Sign in" do
  include UserFlowHelpers

  describe "successful" do
    it "signs in with valid credentials" do
      user = create(:user)
      go_to_sign_in
      submit_sign_in_form(user.email, user.password)

      expect(page).to have_content("Signed in successfully.")
      expect(current_path).to eq(todos_path)
    end
  end

  describe "unsuccessfully" do
    it "when user has incorrect credentials" do
      go_to_sign_in
      submit_sign_in_form("bademail@example.com", "badpassword")

      expect(page).to_not have_content("Signed in successfully.")
      expect(current_path).to eq('/users/sign_in')
    end
  end
end

describe "Sign out" do
  include UserFlowHelpers

  describe "successful" do
    it "signs out" do
      user = create(:user)
      go_to_sign_in
      submit_sign_in_form(user.email, user.password)
      
      go_and_sign_out

      expect(current_path).to eq('/')
      expect(page).to have_content("Signed out successfully.")
    end
  end
end
