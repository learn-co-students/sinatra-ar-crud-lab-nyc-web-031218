
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    # "Hello World"
    # binding.pry
    @posts = Post.all

    erb :posts
  end

  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    # binding.pry
    @post = Post.create(params[:post])

    redirect "/posts"
  end

  get '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id])
    @post.update(params[:post])

    erb :show
  end

  delete '/posts/:id' do
    Post.destroy(params[:id])

    redirect :posts
  end

end
