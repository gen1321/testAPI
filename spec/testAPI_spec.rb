require 'spec_helper'
require 'rest-client'

describe TestAPI do
  let(:user){TestAPI::User}
  it 'has a version number' do
    expect(TestAPI::VERSION).not_to be nil
  end


  it 'Basic http auth is working' do
    expect(user.testFire.code).to eq(200)
  end

  it 'make sure response have a json format' do
    expect(user.testFire.headers[:content_type]).to eq('application/json')
  end

  it 'should receive all users' do
   expect(user.getAllUsers["users"]).not_to eq({})
  end

  it'should retrive user with id' do
    expect(user.getUser(2)["email"]).not_to eq({})
  end

  it 'should create new user' do
    expect(user.createNewUser(email:'gen1321@mail.ru')["message"]).to include('new user recorded')
  end

  it 'should update user with id' do
    expect(user.updateUser(2,email:'gen1321@mail.ru')["message"]).to include('user updated')
  end

  it 'should delete user with id' do
    expect(user.deleteUser(4)["message"]).to include('user deleted')
  end

end
