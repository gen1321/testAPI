require "testAPI/version"
require 'rest-client'
module TestAPI
  class User

    @@base_url = 'https://turfmediatest.herokuapp.com/'
    @@API_key = 'qwerty1234567890'


    def self.testFire
      requestBuilder('get').execute
    end

    def self.getAllUsers
      JSON.parse(requestBuilder('get', '/users').execute)
    end

    def self.createNewUser(email)
      JSON.parse(requestBuilder('post','/users',email.to_json).execute)
    end

    def self.getUser(id)
      JSON.parse(requestBuilder('get','/users/'+id.to_s).execute)
    end

    def self.updateUser(id ,args)
      JSON.parse(requestBuilder('put','/users/'+id.to_s,args.to_json).execute)
    end

    def self.deleteUser(id)
      JSON.parse(requestBuilder('delete','/users/'+id.to_s).execute)
    end
    private
    def self.requestBuilder(method = nil, url = '', body={} )
      request = RestClient::Request.new(method: method, user:  @@API_key, url: @@base_url+url, payload:body )
    end

  end
end
