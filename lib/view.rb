class View
  def list_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      x = recipe.done? ? 'x' : ' '
      puts "#{index + 1}. [#{x}] #{recipe.name} (#{recipe.prep_time})"
      puts "  #{recipe.description}"
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

  def ask_for_prep_time
    puts "What is the prep time of the recipe?"
    gets.chomp
  end

  def ask_for_index
    puts 'What is the index of the recipe you want?'
    gets.chomp.to_i - 1
  end

  def ask_for_key
    puts "What is the keyword you want to search for?"
    gets.chomp
  end
end
