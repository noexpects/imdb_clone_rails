# frozen_string_literal: true

RSpec.describe 'Category create page', bullet: :skip, driver: :chrome do
  before do
    sign_in(create(:user, admin: true))
  end

  let(:category_attributes) { attributes_for(:category) }

  describe 'Success' do
    before do
      visit new_admin_category_path

      fill_in('category_name', with: category_attributes[:name])

      click_on('commit')
    end

    it { expect(Category.all.count).to be(1) }
    it { expect(page.has_css?('.flash-notice')).to be true }
  end

  describe 'Failure' do
    context 'when no name passed' do
      before do
        visit new_admin_category_path

        click_on('commit')
      end

      it { expect(Category.all.count).to be(0) }
      it { expect(page.has_css?('.flash-error')).to be true }
    end
  end
end
