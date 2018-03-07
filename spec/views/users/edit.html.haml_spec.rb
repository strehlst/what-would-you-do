# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            public_name: 'MyString',
                            email: 'MyString'
    ))
  end

  xit 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[public_name]'

      assert_select 'input[name=?]', 'user[email]'
    end
  end
end
