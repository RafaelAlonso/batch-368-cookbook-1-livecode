class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(name, desc, prep_time, done = false)
    @name = name
    @description = desc
    @prep_time = prep_time
    @done = done
  end

  def mark_as_done!
    @done = true
  end

  def done?
    @done
  end

end
