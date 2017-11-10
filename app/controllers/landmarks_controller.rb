class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
    redirect '/landmarks'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end
  end
