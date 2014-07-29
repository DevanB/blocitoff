module UserFlowHelpers
  def expect_to_send_one_email
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  def confirmation_message
    "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
  end

  def submit_sign_up_form(email, password, password_confirmation)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation

    within 'form' do
      click_button "Sign Up"
    end
  end

  def go_to_sign_up
    visit root_path
    within '.user-info' do
      click_link 'Sign Up'
    end
  end

  def go_to_sign_in
    visit root_path
    within '.user-info' do
      click_link 'Sign In'
    end
  end

  def submit_sign_in_form(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password

    within 'form' do
      click_button "Sign in"
    end
  end

  def go_and_sign_out
    visit root_path
    within '.user-info' do
      click_link "Sign Out"
    end
  end
end