# frozen_string_literal: true

RSpec.describe Category do
  it { is_expected.to have_many(:movies).class_name('Movie') }
end
