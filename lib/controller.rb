require_relative 'view'
require_relative 'recipe'

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
    # create the recipe
    recipe = Recipe.new(name, desc)
    # store it
    @cookbook.add_recipe(recipe)
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
