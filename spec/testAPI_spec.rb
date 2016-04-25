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

  it 'should receive all users' do
   expect(user.getAllUsers).to include('users')
  end

  it'should retrive user with id' do
    expect(user.getUser(1)).to include('email')
  end

  it 'should create new user' do
    expect(user.createNewUser(email:'gen1321@mail.ru')).to include('new user recorded')
  end

  it 'should update user with id' do
    expect(user.updateUser(1,email:'gen1321@mail.ru')).to include('user updated')
  end

  it 'should delete user with id' do
    expect(user.deleteUser(1)).to include('user deleted')
  end

end
