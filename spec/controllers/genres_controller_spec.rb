require 'rails_helper'

RSpec.describe GenresController, type: :request do

  let!(:genres) { create_list(:genre, 10) }
  let(:genre_id){ genres.first.id }

  describe 'GET /genres' do
    subject { get '/genres' }

    before { subject }
    it { expect(json).not_to be_empty }
    it { expect(json.size).to eq(10) }
  end

  describe 'GET /genres/:id' do
    subject { get "/genres/#{genre_id}" }

    context 'when record exists' do
      before { subject }
      it { expect(json).not_to be_empty }
      it { expect(json['id']).to eq(genre_id) }
    end

    context 'when the record does not exist' do
      subject { get '/genres/20' }

      before { subject }
      it { expect(response.body).to match("Couldn't find Genre") }
    end
  end

  describe 'POST /genres' do
    let(:params) { attributes_for(:genre, name: 'lassym') }
    subject { post '/genres', params: params }
    
    context 'when the request is valid' do
      before { subject }
      it { expect(json['name']).to eq('lassym') }
    end

    context 'when the request is invalid' do
      let(:params) { { name: nil } }
      subject { post '/genres', params: params }

      before { subject }
      it { expect(response.body).to match("Validation failed: Name can't be blank") }
    end
  end

  describe 'PUT /genres/:id' do
    let (:params) { { name: 'lasssy' } }
    subject { put "/genres/#{genre_id}", params: params }

    before { subject }
    it { expect(response.body).to be_empty }
    it { expect(response).to have_http_status(204) }
  end

  describe 'DELETE /genres/:id' do
    subject { delete "/genres/#{genre_id}" }

    before { subject }
    it { expect(response).to have_http_status(204)}
  end
end