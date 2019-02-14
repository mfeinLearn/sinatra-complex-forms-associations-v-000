class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all # mine
    erb :'/pets/new'
  end

  post '/pets' do
    binding.pry
     @pet = Pet.new(name: params["pet_name"], owner_id: params["pet"]["owner_id"]) 
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
