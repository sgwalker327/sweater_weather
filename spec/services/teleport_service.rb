require 'rails_helper'

RSpec.describe TeleportService do
  describe 'class methods' do
    context '.salary_data' do
      it 'returns salary data for a location' do
        salary_data = TeleportService.salary_data('Denver, CO')
        require 'pry'; binding.pry
      end
    end
  end
end