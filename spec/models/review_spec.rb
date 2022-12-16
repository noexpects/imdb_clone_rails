# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review do
  it { is_expected.to belong_to(:user).class_name('User') }
  it { is_expected.to belong_to(:movie).class_name('Movie') }
end
