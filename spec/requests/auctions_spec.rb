require 'rails_helper'

RSpec.describe "Auctions", type: :request do
  
  before do
    user = User.create(email: 'john@doe.com', password: '123456')
    Auction.create(title: 'Anything', description: 'Lorem ipsum', start_date: DateTime.now, end_date: DateTime.now + 1.week, user: user)
    Auction.create(title: 'Anything 1', description: 'Lorem ipsum', start_date: DateTime.now, end_date: DateTime.now + 1.week, user: user)
    Auction.create(title: 'Anything 2', description: 'Lorem ipsum', start_date: DateTime.now, end_date: DateTime.now + 1.week, user: user)
    Auction.create(title: 'Anything 3', description: 'Lorem ipsum', start_date: DateTime.now, end_date: DateTime.now + 1.week, user: user)
  end

  scenario 'Get all auctions and check array length' do
    get 'http://localhost:3000/auctions'
    expect(response).to have_http_status(:success)
    auctions = JSON.parse(response.body)
    expect(auctions.length).to eq(4)
  end

  scenario 'Get second auctions' do
    get 'http://localhost:3000/auctions/2'
    expect(response).to have_http_status(:success)
    auction = JSON.parse(response.body)
    expect(auction['title']).to eq('Anything 1')
    expect(auction['description']).to eq('Lorem ipsum')
  end

  scenario 'Get second auction' do
    get 'http://localhost:3000/auctions/2'
    expect(response).to have_http_status(:success)
    auction = JSON.parse(response.body)
    expect(auction['title']).to eq('Anything 1')
    expect(auction['description']).to eq('Lorem ipsum')
  end

  scenario 'Create new auction' do
    post 'http://localhost:3000/auctions', params: { auction: { title: 'Anything 4', description: 'Lorem ipsum 4' } }
    expect(response).to have_http_status(:success)
    auction = JSON.parse(response.body)
    expect(auction['title']).to eq('Anything 4')
    expect(auction['description']).to eq('Lorem ipsum 4')
  end
end
