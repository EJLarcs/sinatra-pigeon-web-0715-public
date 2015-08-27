# create your PigeonsController here
# it should inherit from ApplicationController
class PigeonsController < ApplicationController

  get '/pigeons' do
    erb :'/pigeons/index'
  end

  post '/pigeons' do
    Pigeon.create(name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives])
    redirect '/pigeons'
  end

  get '/pigeons/new' do
    erb :'/pigeons/new'
  end
  #be careful of placement... when designing controllers think about the flow of your routes

  get '/pigeons/:id' do
    @pigeon = Pigeon.find(params[:id])
    #find and params are your best friends in this instance
    #remember to call the Pigeon class and not a plural... you're calling the class name not the english plural for many things
    erb :'/pigeons/show'
  end

  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find(params[:id])
    erb :'/pigeons/edit'
  end

  patch '/pigeons/:id' do
      @pigeon = Pigeon.find(params[:id])
      @pigeon.name = params[:name]
      @pigeon.color = params[:color]
      @pigeon.gender = params[:gender]
      @pigeon.lives = params[:lives]
      @pigeon.save
      redirect "/pigeons/#{@pigeon.id}"
  end

  delete '/pigeons/:id' do
    # Pigeon.delete(name: params[:name], color: params[:color], gender: params[:gender], lives: params[:lives])
    #^^^ this is incorrect...much simpler.. find pigeon via id and destroy
    @pigeon = Pigeon.find(params[:id])
    @pigeon.destroy
    redirect "/pigeons"
  end

end
