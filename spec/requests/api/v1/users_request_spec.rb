require 'rails_helper'

RSpec.describe 'USER API' do
  it 'sends a list of users' do
    create_list(:user, 5)

    get '/api/v1/users'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    users = json[:data]

    expect(users).to be_an(Array)
    expect(users.count).to eq(5)

    users.each do |user|
      expect(user).to have_key(:id)
      expect(user[:id]).to be_an(String)
      expect(user).to have_key(:type)
      expect(user[:type]).to be_an(String)
      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_a(Hash)
      expect(user[:attributes]).to have_key(:id)
      expect(user[:attributes][:id]).to be_an(Integer)
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_an(String)
    end
  end

  it 'can get one user by its id' do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    user = json[:data]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_an(String)

    expect(user).to have_key(:type)
    expect(user[:type]).to be_an(String)

    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to be_a(Hash)

    expect(user[:attributes]).to have_key(:email)
    expect(user[:attributes][:email]).to be_an(String)
  end

  it 'can create a new user' do
    user_params = ({email: Faker::Internet.email, provider: 'Google', token: '123'})
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    created_user = User.last

    expect(response).to be_successful

    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.provider).to eq(user_params[:provider])
    expect(created_user.token).to eq(user_params[:token])
  end
end
