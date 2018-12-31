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
  @posts = JSON.parse(response)

  erb :'/posts/index'
end

get '/posts/:id' do
  post_id = params[:id]
  url = "https://jsonplaceholder.typicode.com/posts/#{post_id}"
  uri = URI.parse(url)
  response = Net::HTTP.get(uri)
  @post = JSON.parse(response)

  erb :'/posts/show'
end

get '/users' do
  url = 'https://jsonplaceholder.typicode.com/users'
  uri = URI.parse(url)

  response = Net::HTTP.get(uri)
  JSON.parse(response)
end
