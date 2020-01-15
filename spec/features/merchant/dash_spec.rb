require 'rails_helper'

RSpec.describe 'Merchant Admin Dashboard' do

it 'can see the link dashbord in profile and click it to go to dashbor' do
  ski_shop = Merchant.create(name: "Ski Palace", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)


  merchant_employee = ski_shop.users.create!(name: "Merchant Employee", address: "1230 East Street", city: "Boulder", state: "CO", zip: 98273, email: "merchant@mployee.com", password: "merchant_employee", password_confirmation: "merchant_employee", role: 1)
  coup = ski_shop.coupons.create!(name:'coup', code:'209313', percent_off: 10 )
  # coup_1 = ski_shop.coupons.create!(name:'couper', code:'209312', percent_off: 10 )
  # binding.pry
  visit '/'
  click_on 'Log In'
  fill_in :email, with: merchant_employee.email
  fill_in :password, with: merchant_employee.password
  click_button 'Log In'
  click_link 'Profile'

  click_on 'Dashbord'
  expect(current_path).to eq("/merchant/#{ski_shop.id}/dashboard")
  click_on 'Manage Coupons'
  expect(current_path).to eq("/merchant/coupons/#{ski_shop.id}")
  # save_and_open_page
  expect(page).to have_content(coup.name)
  expect(page).to have_content(coup.code)
  expect(page).to have_content(coup.percent_off)
  # expect(page).to have_content(coup_1.name)
  # expect(page).to have_content(coup_1.code)
  # expect(page).to have_content(coup_1.percent_off)
  expect(page).to have_content('Delete')
  expect(page).to have_content('Update')
  expect(page).to have_content('New')

  click_on 'New'
  expect(current_path).to eq("/merchant/#{ski_shop.id}/coupon/new")

  fill_in :name, with: 'daf'
  fill_in :code, with: '29103'
  fill_in :percent_off, with: 39

  click_on 'Submit'
  expect(current_path).to eq("/merchant/coupons/#{ski_shop.id}")

  expect(page).to have_content('daf')
  expect(page).to have_content('29103')
  expect(page).to have_content('39')

  end
end
