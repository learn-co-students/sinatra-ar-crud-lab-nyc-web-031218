
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#read all the posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #create a post/// new formm
    get '/posts/new' do
      erb :new
    end

#reaad one post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts/:id' do
    @post = Post.create(params[post])
    redirect '/posts/#{@post.id}'
  end

#update a specific post
  get 'posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #edit action
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  #delete a specific post
  delete '/post/:id/delete' do
    @post = post.find_by(:id)
    @post.delete
    redirect '/posts'
  end

end
