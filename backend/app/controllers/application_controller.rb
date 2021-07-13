class ApplicationController < Sinatra::Base
    register Sinatra::CrossOrigin
  
    configure do
      enable :cross_origin
      set :allow_origin, "*" 
      set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
      set :expose_headers, ['Content-Type']
    end
  
    options "*" do
      response.headers["Allow"] = "HEAD,GET,PUT,PATCH,POST,DELETE,OPTIONS"
      response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
      200
    end

    get "/beverages" do 
      beverages = Beverage.all
      beverages.to_json(include: [:ingredients, :reviews])
    end
  
    get "/users" do 
      users = User.all
      users.to_json
    end

    get "/reviews" do 
      reviews = Review.all
      reviews.to_json
    end

    get "/ingredients" do 
      ingredients = Ingredient.all
      ingredients.to_json
    end

    # post "/new_painting" do 
    #   puts params.inspect
    #   painting_params = params.select do |key|
    #     ["image", "title", "artist_name", "date", "width", "height"].include?(key)
    #   end
    #   painting = Painting.create(painting_params)
    #   painting.to_json
    # end
    
    # # app/controllers/application_controller.rb
    # patch "/paintings/:id/upvote" do 
    #   painting = Painting.find(params[:id])
    #   painting.increment!(:votes)
    #   painting.to_json
    # end`
  
  end
  