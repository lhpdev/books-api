require 'spec_helper'

RSpec.describe Collection, type: :model do
  describe 'validations' do
    subject { build(:collection) }

    before do
      subject.validate
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    context 'with blank title' do
      subject do
        build(:collection, title: '')
      end

      it 'must have a title' do
        expect(subject.errors[:title].size).to eq(1)
      end
    end
  end

  describe 'associations' do
    it 'can have books' do
      collection = create(:collection)
      book = create(:book, collection_id: collection.id)
      expect(collection.books.first).to eq(book)
    end

    it 'can have author' do
      collection = create(:collection)
      book = create(:book, collection_id: collection.id)
      expect(collection.author).to eq(book.author)
    end
  end
end
