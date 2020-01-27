require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path

    # load the recipes from the CSV into @recipes
    CSV.foreach(csv_file_path) do |row_array|
      # create a new recipe with the info from each row
      recipe = Recipe.new(row_array[0], row_array[1], row_array[2], row_array[3])
      # push the created recipe into the @recipes
      @recipes << recipe
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe

    save
  end

  def mark_recipe_as_done(recipe_index)
    @recipes[recipe_index].mark_as_done!

    save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)

    save
  end

  private

  def save
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |receita|
        csv << [receita.name, receita.description, receita.prep_time, receita.done?]
      end
    end
  end
end
