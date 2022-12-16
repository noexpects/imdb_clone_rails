# frozen_string_literal: true

RSpec.describe 'Homepage' do
  describe 'Reaching home page' do
    before do
      visit root_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Header home button works correctly' do
    before do
      visit root_path
      click_on('home_link_header')
    end

    it { expect(status_code).to be(200) }
    it { expect(page).to have_current_path(root_path) }
  end

  describe 'Check categories block presence' do
    before do
      visit root_path
    end

    it { expect(page.has_css?('#categories_block')).to be(true) }
  end

  describe 'Check there is Log in button if no user logged in' do
    before do
      visit root_path
    end

    it { expect(page.has_css?('#login_btn')).to be(true) }
  end

  describe 'Check there is Log out button if user logged in' do
    let(:user) { create(:user) }

    before do
      sign_in user
      visit root_path
    end

    it { expect(page.has_css?('#logout_btn')).to be(true) }
  end

  describe 'View detail button in movie block works correctly' do
    let!(:movie) { create(:movie) }

    before do
      visit root_path
      find_by_id('view_detail_btn').click
    end

    it { expect(status_code).to be(200) }
    it { expect(page).to have_current_path(movie_path(movie)) }
  end

  describe 'Review form works correctly' do
    describe 'Success' do
      before do
        user = create(:user)
        sign_in user
        create(:movie)
        visit root_path

        click_on('submit_btn')
      end

      it { expect(page).to have_current_path(root_path) }
      it { expect(page.has_css?('#notice_message')).to be(true) }
      it { expect(page.has_css?('#reviewed_message')).to be true }
      it { expect(Review.count).to eq 1 }
    end
  end

  describe 'View More button presence' do
    describe 'View more button not present when there are no movies' do
      before do
        visit root_path
      end

      it { expect(page.has_button?('view_more_btn')).to be(false) }
    end

    describe 'View more button present when there is some movies' do
      before do
        stub_const('Constants::Movie::MOVIES_AMOUNT', 1)
        create_list(:movie, 2)
        visit root_path
      end

      it { expect(page.has_button?('view_more_btn')).to be(true) }
    end
  end

  describe 'There is correct movies amount on page' do
    let(:movies_amount) { 1 }

    before do
      stub_const('Constants::Movie::MOVIES_AMOUNT', movies_amount)
      create_list(:movie, 2)
      visit root_path
    end

    it { expect(page.find_all('.card').count).to eq movies_amount }
  end

  describe 'Pagination works correctly' do
    context 'when "View more" button not clicked yet' do
      let(:movies_amount) { 1 }
      let!(:movies) { create_list(:movie, 2) }

      before do
        stub_const('Constants::Movie::MOVIES_AMOUNT', movies_amount)
        visit root_path
      end

      it { expect(page.find_by_id('movie_title').text).to eq movies.last.title }
    end

    context 'when "View more" button clicked' do
      let(:movies_amount) { 1 }
      let!(:movies) { create_list(:movie, 2) }

      before do
        stub_const('Constants::Movie::MOVIES_AMOUNT', movies_amount)
        visit root_path
        click_on('view_more_link')
      end

      it { expect(page.find_by_id('movie_title').text).to eq movies.first.title }
    end
  end
end
