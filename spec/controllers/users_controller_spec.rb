# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let(:valid_attributes_for_create) do
    { email: 'test@example.com',
      password: '12345?&@',
      'public_name': 'User name' }
  end

  let(:invalid_attributes_for_create) do
    { public_name: '' }
  end

  let(:invalid_attributes_for_create) do
    { avatar_path: '' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'renders the show view' do
      user = User.create! valid_attributes_for_create
      get :show, params: { id: user.to_param }
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #dreams' do
    let(:user) do
      User.create!(valid_attributes_for_create)
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

  #   describe 'GET #edit' do
  #     user = User.create! valid_attributes_for_create
  #     other_user = User.create! valid_attributes_for_create
  #     context 'when the user is not logged in' do
  #       get :edit, params: { id: user.to_param }, session: valid_session
  #       expect(response).to be_success
  #     end
  #     context 'when the user is logged in' do
  #       sign_in user
  #       context 'when the user is logged in' do
  #         it 'renders the edit view' do
  #           get :edit, params: { id: user.to_param }, session: valid_session
  #           expect(response).to be_success
  #         end
  #       end
  #       context 'when the user is logged in and tries to edit another user\'s record ' do
  #         it 'renders the edit view' do
  #           get :edit, params: { id: other_user.to_param }, session: valid_session
  #           expect(response).to be_
  #         end
  #       end
  #
  #     end
  #   end
  #
  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_attributes_for_update) do
        { public_name: 'User' }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes_for_create
        sign_in user
        put :update, params: { id: user.to_param, user: valid_attributes_for_update }, session: valid_session
        user.reload
        expect(user.public_name).to eq 'User'
      end

      it 'redirects to the user' do
        user = User.create! valid_attributes_for_create
        sign_in user
        put :update, params: { id: user.to_param, user: valid_attributes_for_update }, session: valid_session
        expect(response).to redirect_to(edit_user_path(user))
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes_for_update) do
        { public_name: ' ' }
      end

      it 'does not update the requested user' do
        user = User.create! valid_attributes_for_create
        sign_in user
        put :update, params: { id: user.to_param, user: invalid_attributes_for_update }, session: valid_session
        expect(user.public_name).to eq 'User name'
      end
    end

    context 'with forbidden params' do
      let(:forbidden_attributes_for_update) do
        { avatar_path: 'new_image' }
      end

      it 'does not update the requested user' do
        user = User.create! valid_attributes_for_create
        sign_in user
        put :update, params: { id: user.to_param, user: forbidden_attributes_for_update }, session: valid_session
        expect(user.avatar_path).to eq nil
      end
    end
  end
  describe 'DELETE #destroy' do
    xit 'destroys the requested user' do
      user = User.create! valid_attributes_for_create
      expect do
        delete :destroy, params: { id: user.to_param }, session: valid_session
      end.to change(User, :count).by(-1)
    end

    xit 'redirects to the users list' do
      user = User.create! valid_attributes_for_create
      delete :destroy, params: { id: user.to_param }, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end
end
