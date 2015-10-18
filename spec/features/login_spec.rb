require 'support/features'

RSpec.describe 'Login Feature', type: :feature do

  let(:valid_password) { 'testpassword' }
  let(:invalid_password) { 'badpassword' }

  let(:user) do
    student = Student.create!(first_name: 'Jaden', email: 'student@gmail.com', user_attributes: { password: valid_password })
    user = student.user
    campus = Campus.create(name: 'New York', timezone: 'Eastern Time (US & Canada)')
    employee = Employee.create!(user: user, campus: campus, first_name: 'Jaden', title: 'Instructor', email: 'employee@generalassemb.ly')
    user
  end

  context 'as an employee' do
    it 'accepts when valid' do
      visit '/auth/new'
      fill_in 'Email Address', with: user.employee.email
      fill_in 'Password', with: valid_password
      click_button 'Login'
      expect(current_path).to match %r{/auth/[0-9]+}
    end
    it 'rejects when invalid' do
      visit '/auth/new'
      fill_in 'Email Address', with: user.employee.email
      fill_in 'Password', with: invalid_password
      click_button 'Login'
      expect(current_path).to eq '/auth'
    end
  end

  context 'as a student' do
    it 'accepts when valid' do
      visit '/auth/new'
      fill_in 'Email Address', with: user.student.email
      fill_in 'Password', with: valid_password
      click_button 'Login'
      expect(current_path).to match %r{/auth/[0-9]+}
    end
    it 'denies when invalid' do
      visit '/auth/new'
      fill_in 'Email Address', with: user.student.email
      fill_in 'Password', with: invalid_password
      click_button 'Login'
      expect(current_path).to eq '/auth'
    end
  end

end
