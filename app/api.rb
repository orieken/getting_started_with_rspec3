# frozen_string_literal: true

require 'sinatra/base'
require 'json'

module ExpenseTracker
  # ExpenseTracker API
  class API < Sinatra::Base
    post '/expense' do
      JSON.generate('expense_id' => 42)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
