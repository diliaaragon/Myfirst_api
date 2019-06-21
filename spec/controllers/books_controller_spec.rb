require 'rails_helper'

RSpec.describe BooksController, type: :request do
 let!(:books){ create_list(:book, 10) }
 let(:book_id){ books.first.id }

  describe 'GET /books' do
    subject { get '/books' }

    before { subject }
    it { expect(json).not_to be_empty }
    it { expect(json.size).to eq(10) }
  end 

  describe 'GET/books/:id' do
    subject { get "/books/#{book_id}" }

    context 'when th record exists' do
      before { subject }
      it { expect(json).not_to be_empty }
      it { expect(json['id']).to eq(book_id) }
    end

    context 'when the record does not exist' do
      subject { get "/books/20" }

      before { subject }
      it { expect(response.body).to match("Couldn't find Book with 'id'=20") }
    end
  end

  describe 'POST /books' do
    let(:params) { attributes_for(:book, title: 'lemanch') }
    subject { post '/books', params: params }

    context 'when the request is valid' do
      before { subject }
      it { expect(json['title']).to eq('lemanch') }
    end

    context 'when the request is invalid' do
      let(:params) { { title: nil } }
      subject { post '/books', params: params }

      before { subject }
      it { expect(response.body).to match("Validation failed: Title can't be blank, Edition can't be blank, Language can't be blank, Isbn can't be blank") }
    end
  end

  describe 'PUT /books/:id' do
    let (:params) { { title: 'lasssy' } }
    subject { put "/books/#{book_id}", params: params }

    before { subject }
    it { expect(response.body).to be_empty }
    it { expect(response).to have_http_status(204) }
  end

  describe 'DELETE /books/:id' do
    subject { delete "/books/#{book_id}" }

    before { subject }
    it { expect(response).to have_http_status(204)}
  end

end