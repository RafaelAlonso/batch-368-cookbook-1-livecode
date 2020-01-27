require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class ScrapeBbcGoodFoodService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    imported_recipes = []

    # Parse the HTML document to extract the first 5 recipes suggested
    # and store them in an Array
    doc.search('.view-content .node').first(5).each do |element|
      name = element.search('.teaser-item__title a').text.strip
      desc = element.search('.field-item.even').text.strip
      hour = element.search('.hours').text.strip
      mins = element.search('.mins').text.strip
      # diff = element.search('.teaser-item__info-item--skill-level').text.strip
      imported_recipes << Recipe.new(name, desc, "#{hour} #{mins}")
    end

    return imported_recipes
  end
end
