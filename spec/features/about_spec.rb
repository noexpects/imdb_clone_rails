# frozen_string_literal: true

RSpec.describe 'About page' do
  describe 'Reaching About page' do
    before do
      visit about_path
    end

    it { expect(status_code).to be(200) }
  end
end
