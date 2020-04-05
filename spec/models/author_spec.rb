require 'spec_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    subject { build(:author) }

    before do
      subject.validate
    end

    it 'should be valid' do
      expect(subject).to be_valid
    end

    context 'with blank name' do
      subject do
        build(:author, name: '')
      end

      it 'must have a name' do
        expect(subject.errors[:name].size).to eq(1)
      end
    end
  end

  describe 'associations' do
    it 'can have books' do
      author = create(:author)
      book = create(:book, author: author)
      expect(author.books.first).to eq(book)
    end
  end
end
