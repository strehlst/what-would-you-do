# frozen_string_literal: true

require 'rails_helper'
require 'pp'

RSpec.describe DreamsController, type: :controller do
  let!(:dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
  let(:user) do
    User.create!(public_name: 'User name',
                 email: 'user@example.com',
                 password: '12345?&@')
  end
  describe 'GET #index' do
    it 'renders the index view' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the dream view' do
      get :show, params: { id: dream.id }
      expect(response).to have_http_status(:success)
    end

    it 'redirects to not found' do
      get :show, params: { id: 0 }
      expect(response).to redirect_to(pages_not_found_path)
    end
  end

  describe 'GET #new' do
    context 'when no user is logged in' do
      it 'redirects to login' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'renders the new view' do
        get :new
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #create' do
    context 'when no user is logged in' do
      it 'redirects to login' do
        post :create, params: { caption: I18n.t('dreams.examples.pay_back_student_loan') }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      context 'when the caption is filled it' do
        it 'increases dream count by 1' do
          post :create, params: { dream: { caption: I18n.t('dreams.examples.pay_back_student_loan') } }
          expect(Dream.count).to eq 2
          expect(response).to have_http_status(:redirect)
        end
      end
      context 'when the caption is not filled in' do
        it 'renders the new view' do
          post :create, params: { dream: { caption: '' } }
          expect(response).to have_http_status(:success)
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe 'GET #embrace' do
    context 'when no user is logged in' do
      it 'redirects to login' do
        get :embrace, params: { id: dream.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      let!(:dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
      it 'embraces and redirects to dream' do
        expect(Embrace.count).to eq 0
        get :embrace, params: { id: dream.id }
        expect(Embrace.count).to eq 1
        expect(response).to redirect_to(dream_path(dream.id))
      end

      it 'redirects to dream' do
        expect(Embrace.count).to eq 0
        get :embrace, params: { id: dream.id }
        expect(response).to redirect_to(dream_path(dream.id))
        expect(Embrace.count).to eq 1
        get :embrace, params: { id: dream.id }
        expect(response).to redirect_to(dream_path(dream.id))
        expect(Embrace.count).to eq 1
      end
    end
    describe 'GET #disembrace' do
      context 'when no user is logged in' do
        it 'redirects to login' do
          get :disembrace, params: { id: dream.id }
          expect(response).to redirect_to(new_user_session_path)
        end
      end
      context 'when a user is logged in' do
        before do
          sign_in user
        end
        let!(:dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
        let!(:embrace) { Embrace.create!(dream: dream, user: user) }
        it 'disembraces and redirects to dream' do
          expect(Embrace.count).to eq 1
          get :disembrace, params: { id: dream.id }
          expect(Embrace.count).to eq 0
          expect(response).to redirect_to(dream_path(dream.id))
          expect(Embrace.count).to eq 0
        end

        let!(:unembraced_dream) { Dream.create!(caption: I18n.t('dreams.examples.travel_the_world')) }
        it 'redirects to dream' do
          get :disembrace, params: { id: unembraced_dream.id }
          expect(response).to redirect_to(dream_path(unembraced_dream.id))
        end
      end
    end
  end
end
