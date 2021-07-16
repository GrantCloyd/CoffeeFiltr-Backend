require 'pry'

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
      beverages.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
    end
  
    get "/signin/:username/:password" do 
      user_params = params.select do |key|
        ["username", "password"].include?(key)
      end
      users = User.all
      user = users.find_by(username: user_params["username"])
      
      if user.password == user_params["password"] 
        user.to_json
      else 
        "Invalid credentials".to_json
      end
    end

    post "/users" do
      user_params = params.select do |key|
        ["first_name", "last_name", "email", "username", "bio", "avatar", "password"].include?(key)
      end
      user = User.create(user_params)
      user.to_json
    end

    post "/likes" do
      like_params = params.select do |key|
        ["review_id", "user_id"].include?(key)
      end
      
      liked = Like.find_by user_id: like_params["user_id"], review_id: like_params["review_id"]    

      if liked != nil 
        liked.destroy
        liked_bev = Review.find(like_params["review_id"]).beverage
        liked_bev.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
      else
        like = Like.create(like_params)
        bev = like.review.beverage
        bev.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
      end
    end

    post "/favorites" do
      fav_params = params.select do |key|
        ["beverage_id", "user_id"].include?(key)
      end
      
      faved = Favorite.find_by user_id: fav_params["user_id"], beverage_id: fav_params["beverage_id"]    

      
      if faved != nil 
        faved.destroy
        faved_bev = Beverage.find(fav_params["beverage_id"])
        faved_bev.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
      else
        fave = Favorite.create(fav_params)
        bev = fave.beverage
        bev.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
      end
    end

    get "/thumbnail_data" do
        beverages = Beverage.select(:title, :id, :img_url)
        beverages.to_json
      end

    get "/reviews" do 
      reviews = Review.all
      reviews.to_json
    end

    get "/ingredients" do 
      ingredients = Ingredient.all
      ingredients.to_json
    end

    delete "/reviews/:id" do 
      review = Review.find(params[:id])
      bev = review.beverage
      review.destroy
      bev.to_json(include: [:favorites, :ingredients, reviews: {include: [:likes, :user]}])
    end

    post "/reviews" do
      review_params = params.select do |key|
        ["title", "content", "rating", "user_id", "beverage_id"].include?(key)
      end
      review = Review.create(review_params)
      review.to_json
    end

    post "/beverages_post" do
      bev_params = params.select do |key|
        ["title", "description", "img_url", "hot"].include?(key)
      end
      beverage = Beverage.create(bev_params)

      ing_params = params["ingredients"]
          ing_params.each do |c| 
     
        Component.create(beverage_id: Beverage.last.id, ingredient_id: Ingredient.all.find_by(name: c).id)
      end
        beverage.to_json(include: :ingredients)
    end

    patch "/users/:id" do  
      user = User.find(params[:id])
      attrs_to_update = params.select{|k,v| ["username", "first_name", "last_name", "email", "password", "bio", "avatar"].include?(k)}
    user.update(attrs_to_update)
    user.to_json
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
  