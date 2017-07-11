# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'
require 'json'
require_relative '../../../app/api'

module ExpenseTracker
  describe 'Expense Tracker Api' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    def post_expense(expense)
      post '/expense', JSON.generate(expense)
      expect(last_response.status).to eq(200)

      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('expense_id' => a_kind_of(Integer))
      expense.merge('id' => parsed['expense_id'])
    end


    it 'records submitted expenses' do
      coffee = {
        payee: 'Starbucks',
        amount: 5.75,
        date: '2017-06-10'
      }

      post '/expense', JSON.generate(coffee)
      expect(last_response.status).to eq(200)
      expect(last_response).to be_ok
      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('expense_id' => a_kind_of(Integer))
    end

    it 'records submitted expenses' do
      pending('need to persist data')
      coffee = post_expense({
                                payee: 'Starbucks',
                                amount: 5.75,
                                date: '2017-06-10'
                            })
      zoo = post_expense({
                             payee: 'Zoo',
                             amount: 15.25,
                             date: '2017-06-10'
                         })
      groceries = post_expense({
                                   payee: 'Whole Foods',
                                   amount: 95.20,
                                   date: '2017-06-11'
                               })

      get '/expenses/2017-06-10'
      expect(last_response.status).to eq(200)

      expenses = JSON.parse(last_response.body)
      expect(expenses).to contain_exactly(coffee, zoo)
    end
  end
end

