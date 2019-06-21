require 'rails_helper'

RSpec.describe PublishersController, type: :request do
  let!(:publishers) { create_list(:publisher, 10) }
  let(:publisher_id) { publishers.first.id }

  describe 'GET /publishers' do
    subject { get '/publishers' }

    before { subject }
    it { expect(json).not_to be_empty }
    it { expect(json.size).to eq(10) }
  end

  describe 'GET /publishers/:id' do
    subject { get "/publishers/#{publisher_id}" }

    context 'when record exist' do
      before { subject }
      it { expect(json).not_to be_empty }
      it { expect(json['id']).to eq(publisher_id) }
    end

    context 'when recor does not exist' do 
      subject { get '/publishers/20' }

      before { subject }
      it { expect(response.body).to match("Couldn't find Publisher with 'id'=20") }
    end
  end

  describe 'POST /publishers' do
    let(:params) { attributes_for(:publisher, name:'norma') }
    subject { post '/publishers', params: params }

    context 'when the request is valid' do
      before { subject }
      it { expect(json['name']).to eq('norma') }
    end

    context 'when the request is invalid' do
      let(:params) { attributes_for(:publisher, foundation: 2020)}
      subject { post '/publishers', params: params }
    
      before { subject }
      it { expect(response.body).to match("Validation failed: year of foundation is invalid") }
    end

    context 'when the request is invalid' do
      let(:params) { attributes_for(:publisher, name:nil) }
      subject { post '/publishers', params: params }
    
      before { subject }
      it { expect(response.body).to match("Validation failed: Name can't be blank") }
    end
  end

  describe 'PUT /publishers/:id' do
    let (:params) { { name: 'lasssy' } }
    subject { put "/publishers/#{publisher_id}", params: params }

    before { subject }
    it { expect(response.body).to be_empty }
    it { expect(response).to have_http_status(204) }
  end

  describe 'DELETE /publishers/:id' do
    subject { delete "/publishers/#{publisher_id}" }

    before { subject }
    it { expect(response).to have_http_status(204)}
  end
end
