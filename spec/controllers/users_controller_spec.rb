# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let(:valid_attributes) do
    { email: 'test@example.com',
      password: '12345?&@',
      'public_name': 'User name',
      'avatar_path': nil }
  end

  let(:invalid_attributes) do
    { body: 'User name' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'renders the show view' do
      user = User.create! valid_attributes
      get :show, params: { id: user.to_param }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #dreams' do
    let(:user) do
      User.create!(valid_attributes)
    end
    let!(:dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
    let!(:embrace) { Embrace.create!(dream: dream, user: user) }
    context 'when the user is logged in' do
      it 'renders the show view' do
        sign_in user
        get :dreams
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:dreams)
      end
    end
    context 'when the user is not logged in' do
      it 'redirects to the sign in page' do
        get :dreams
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

=begin
  describe 'GET #edit' do
    user = User.create! valid_attributes
    other_user = User.create! valid_attributes
    context 'when the user is not logged in' do
      get :edit, params: { id: user.to_param }, session: valid_session
      expect(response).to be_success
    end
    context 'when the user is logged in' do
      sign_in user
      context 'when the user is logged in' do
        it 'renders the edit view' do
          get :edit, params: { id: user.to_param }, session: valid_session
          expect(response).to be_success
        end
      end
      context 'when the user is logged in and tries to edit another user\'s record ' do
        it 'renders the edit view' do
          get :edit, params: { id: other_user.to_param }, session: valid_session
          expect(response).to be_
        end
      end

    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      xit 'updates the requested user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: new_attributes }, session: valid_session
        user.reload
        skip('Add assertions for updated state')
      end

      xit 'redirects to the user' do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: valid_attributes }, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid params' do
      xit "returns a success response (i.e. to display the 'edit' template)" do
        user = User.create! valid_attributes
        put :update, params: { id: user.to_param, user: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end
  describe 'DELETE #destroy' do
    xit 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    xit 'redirects to the users list' do
      user = User.create! valid_attributes
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
=end
end
