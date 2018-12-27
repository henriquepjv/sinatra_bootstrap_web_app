require 'sinatra'
require 'net/http'
require 'uri'
require 'pry'

get '/' do
  erb :'/home'
end

get '/posts' do
  url = 'https://jsonplaceholder.typicode.com/posts'
  uri = URI.parse(url)

  response = Net::HTTP.get(uri)
  JSON.parse(response).count
end

get '/users' do
  url = 'https://jsonplaceholder.typicode.com/users'
  uri = URI.parse(url)

  response = Net::HTTP.get(uri)
  JSON.parse(response).count
end
