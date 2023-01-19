require 'rails_helper'

RSpec.describe "Users", type: :request do

  context 'before creation' do
    it 'cannot have blank name and address' do
      expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
