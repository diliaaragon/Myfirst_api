
require 'rails_helper'

RSpec.describe AuthorsController, type: :request do

  let!(:authors) { create_list(:author, 10) }
  let(:author_id) { authors.first.id }

  describe 'GET /authors' do
    subject { get '/authors' }

    before { subject }
    it { expect(json).not_to be_empty }
    it { expect(json.size).to eq(10) }
  end 

  describe 'GET/authors/:id' do
    subject { get "/authors/#{author_id}" }

    context 'when th record exists' do
      before { subject }
      it { expect(json).not_to be_empty }
      it { expect(json['id']).to eq(author_id) }
    end

    context 'when the record does not exist' do
      subject { get "/authors/20" }

      before { subject }
      it { expect(response.body).to match("Couldn't find Author") }
    end
  end

  describe 'POST /authors' do
    let(:params) { attributes_for(:author, first_name: 'lassym') }
    subject { post '/authors', params: params }

    context 'when the request is valid' do
      before { subject }
      it { expect(json['first_name']).to eq('lassym') }
    end

    context 'when the request is invalid' do
      let(:params) { { first_name: 'lety' } }
      subject { post '/authors', params: params }

      before { subject }
      it { expect(response.body).to match("Validation failed: Last name can't be blank") }
    end
  end

  describe 'PUT /authors/:id' do
    let (:params) { { first_name: 'lasssy' } }
    subject { put "/authors/#{author_id}", params: params }

    before { subject }
    it { expect(response.body).to be_empty }
    it { expect(response).to have_http_status(204) }
  end

  describe 'DELETE /authors/:id' do
    subject { delete "/authors/#{author_id}" }

    before { subject }
    it { expect(response).to have_http_status(204)}
  end
end
