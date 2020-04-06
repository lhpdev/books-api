# frozen_string_literal: true

require 'spec_helper'

module Api
  describe CollectionsController, type: :controller do

    describe "#show" do
      context 'with books' do
        let(:collection) { create(:collection) }

        before do
          2.times do
            create(:book, collection: collection)
          end
        end

        it 'returns the expected json format' do
          get :show, params: { id: collection.id }
          expect(response).to be_ok
          expect(response.body).to include_json(
            id: collection.id,
            title: collection.title,
            books: [
              {
                id: /.*/,
                title: /.*/,
                description: /.*/,
                isbn: /.*/,
                year: /.*/,
                price: /.*/,
                author: {
                  id: /.*/,
                  name: /.*/
                },
                collection: {
                  id: /.*/,
                  title: /.*/
                },
              },
              {
                id: /.*/,
                title: /.*/,
                description: /.*/,
                isbn: /.*/,
                year: /.*/,
                price: /.*/,
                author: {
                  id: /.*/,
                  name: /.*/
                },
                collection: {
                  id: /.*/,
                  title: /.*/
                },
              },
            ]
          )
        end
      end

      context 'without books' do
        let(:collection) { create(:collection) }

        it 'returns the expected json format' do
          get :show, params: { id: collection.id }
          expect(response).to be_ok
          expect(response.body).to include_json(
            id: collection.id,
            title: collection.title,
            books: []
          )
        end
      end
    end
  end
end
