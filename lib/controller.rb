require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_bbc_good_food_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.list_recipes(recipes)
  end

  def create
    # call view to ask for name
    name = @view.ask_for_name
    # call view to ask for description
    desc = @view.ask_for_desc
    # call view to ask for prep time
    prep_time = @view.ask_for_prep_time
    # create the recipe
    recipe = Recipe.new(name, desc, prep_time)
    # store it
    @cookbook.add_recipe(recipe)
  end

  def import
    # Ask a user for a keyword to search
    keyword = @view.ask_for_key

    # Create a new service to scrape bbc good food
    service = ScrapeBbcGoodFoodService.new(keyword)

    # Ask the service to scrape the page and return 5 recipes
    imported_recipes = service.call

    # Display them in an indexed list
    @view.list_recipes(imported_recipes)

    # Ask the user which recipe they want to import (ask for an index)
    ind = @view.ask_for_index

    # Add it to the Cookbook
    @cookbook.add_recipe(imported_recipes[ind])
  end

  def mark
    list

    ind = @view.ask_for_index

    @cookbook.mark_recipe_as_done(ind)
  end

  def destroy
    # list the recipes
    list
    # ask user which recipe he/she wants to delete
    ind = @view.ask_for_index
    # ask repo to delete the recipe in the given index
    @cookbook.remove_recipe(ind)
  end
end
