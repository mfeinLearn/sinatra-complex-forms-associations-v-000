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
  #  binding.pry
    @pet = Pet.create(name: params["pet_name"], owner_id: params["pet"]["owner_id"])
  #  binding.pry
    if !params["owner"]["name"].empty? # ""
      @pet.owner = Owner.create(name: params["owner"]["name"])
      # @pet.owner# = Owner.all.last.id
    end
    #binding.pry
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    @pet = Pet.create(name: params["name"])

    @pet.update(params["name"])
    if !params["owner"]["name"].empty?
      @owner = Owner.create(name: params["name"])
      @pet.owner = @owner
    end
    redirect to "pets/#{@pet.id}"
  end
end
