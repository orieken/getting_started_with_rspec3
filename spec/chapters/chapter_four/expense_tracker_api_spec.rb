# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'
require 'json'
require_relative '../../../app/api'

def app
  ExpenseTracker::API.new
end

module ExpenseTracker
  describe 'Expense Tracker Api' do
    include Rack::Test::Methods

    it 'records submitted expenses' do
      coffee = {
        payee: 'Starbucks',
        amount: 5.75,
        date: '2017-06-10'
      }

      post '/expense', JSON.generate(coffee)
      expect(last_response.status).to eq(200)
      expect(last_response).to be_ok
    end
  end
end
