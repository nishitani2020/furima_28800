require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end