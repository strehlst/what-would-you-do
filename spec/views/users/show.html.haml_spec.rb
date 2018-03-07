# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            public_name: 'Public Name',
                            email: 'Email'
    ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Public Name/)
    expect(rendered).to match(/Email/)
  end
end
