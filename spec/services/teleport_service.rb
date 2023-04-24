require 'rails_helper'

RSpec.describe TeleportService do
  describe 'class methods' do
    context '.salary_data' do
      it 'returns salary data for a location' do
        salary_data = TeleportService.salary_data('denver')
        require 'pry'; binding.pry
        expect(salary_data).to be_a(Hash)
      end
    end
  end
end