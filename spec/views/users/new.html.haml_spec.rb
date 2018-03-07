# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    public_name: 'MyString',
                    email: 'MyString'
    ))
  end

  xit 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[public_name]'

      assert_select 'input[name=?]', 'user[email]'
    end
  end
end
