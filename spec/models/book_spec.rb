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

    context 'with description too long' do
      subject do
        build(:book, description: "Sauron, the Dark Lord, has gathered to him all the Rings of Power, the means by which he intends to rule Middle-earth.
                                                All he lacks in his plans for dominion is the One Ring, the ring that rules them all, which has fallen into the hands of
                                                the hobbit, Bilbo Baggins. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task,
                                                as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across
                                                Middle-earth to the Cracks of Doom.")
      end

      it 'must have a shorter description' do
        expect(subject.errors[:description].size).to eq(1)
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
