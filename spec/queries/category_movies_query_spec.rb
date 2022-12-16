# frozen_string_literal: true

RSpec.describe CategoryMoviesQuery, bullet: :skip do
  describe '.call with category passed' do
    subject(:result) { described_class.call(category: category_first) }

    before do
      create_list(:movie, 2)
    end

    let(:category_first) { create(:category) }
    let!(:movies) { create_list(:movie, 2, category: category_first) }

    it { expect(result.count).to be(movies.count) }
    it { expect(result).is_a?(ActiveRecord::Relation) }
    it { expect(result.to_a).to eq(movies.reverse) }
    it { expect(result.first.category).to eq(category_first) }
  end

  describe '.call with no category passed returns all movies' do
    subject(:result) { described_class.call(category: nil) }

    let!(:movies) { create_list(:movie, 2) }

    it { expect(result.count).to be(movies.count) }
    it { expect(result).is_a?(ActiveRecord::Relation) }
    it { expect(result.to_a).to eq(movies.reverse) }
  end
end
