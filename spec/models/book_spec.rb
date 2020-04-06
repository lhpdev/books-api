require 'spec_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { build(:book) }

    before do
      subject.validate
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    context 'with blank attributes' do
      subject do
        build(:book, title: '', isbn: '', author: nil)
      end

      it 'must have a title' do
        expect(subject.errors[:title].size).to eq(1)
      end

      it 'must have an isbn' do
        expect(subject.errors[:isbn].size).to eq(1)
      end

      it 'must have an author' do
        expect(subject.errors[:author].size).to eq(1)
      end
    end

    context 'with repeated isbn' do
      let(:first_book) { create(:book) }

      subject do
        build(:book, isbn: first_book.isbn)
      end

      it 'must have a title' do
        expect(subject.errors[:isbn].size).to eq(1)
      end
    end
  end

  describe 'associations' do
    it 'can have a collection' do
      collection = create(:collection)
      book = create(:book, collection_id: collection.id)
      expect(Collection.find(book.collection_id))
    end
  end
end
