class View
  def list_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_for_name
    puts "What is the name of the recipe?"
    gets.chomp
  end

  def ask_for_desc
    puts "What is the description of the recipe?"
    gets.chomp
  end

  def ask_for_index
    puts 'What is the index of the recipe you want to delete?'
    gets.chomp.to_i - 1
  end
end
