# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               public_name: 'Public Name',
               email: 'Email'
             ),
             User.create!(
               public_name: 'Public Name',
               email: 'Email'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Public Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
  end
end
