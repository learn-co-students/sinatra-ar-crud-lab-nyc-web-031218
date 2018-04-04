
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  	configure do
        set :public_folder, 'public'
        set :views, 'app/views'
  	end

##READ

    get '/' do 
        @posts = Post.all
        erb :index
    end

    get '/posts' do
        @posts = Post.all
        erb :index
    end


    get '/posts/new' do
        #BUILD A FORM
        #RENDER that forn PAGE
        erb :new
    end


    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :show
    end
	
	post '/posts' do
        #binding.pry
  	    @post = Post.create(params[:post]) 
  	    #A post variale to use in (Views posts)
        #binding.pry
  	    #REDIRECTS TO /POSTS
  	    redirect '/posts'
  	end


    get "/posts/:id/edit" do
        @post = Post.find(params[:id])
        erb :edit
    end

    patch "/posts/:id" do
        @post = Post.find(params[:id])
        @post.update(params[:post])
        redirect "/posts/#{@post.id}"
    end



    delete "/posts/:id/delete" do
        @post = Post.find(params[:id])
        @post.destroy
        erb :delete
    end




end


