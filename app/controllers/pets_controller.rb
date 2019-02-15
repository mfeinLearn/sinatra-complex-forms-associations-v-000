class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all # mine
    # @pet = Pet.create(name: params["pet_name"], owner_id: params["pet"]["owner_id"])
    # @owner = Owner.create(name: params["owner"]["name"])
    erb :'/pets/new'
  end

  post '/pets' do
    binding.pry
    @pet = Pet.create(name: params["pet_name"], owner_id: params["pet"]["owner_id"])

    if !params["owner"]["name"].empty? # ""
      @owner = Owner.create(params[:owner])
      @pet.owner_id = Owner.all.last.id
    end
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
