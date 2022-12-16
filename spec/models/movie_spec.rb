# frozen_string_literal: true

RSpec.describe Movie do
  it { is_expected.to belong_to(:category).class_name('Category') }
  it { is_expected.to have_many(:reviews).class_name('Review') }
end
