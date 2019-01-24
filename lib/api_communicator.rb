# require 'rest-client'
# require 'json'
# require 'pry'

# search for the drink name using API, return JSON info for that drink
def get_drink_hash_by_name(user_drink)
  response_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{user_drink}")
  JSON.parse(response_string.body)
end

# return the name of the drink from the JSON information
def get_drink_name_from_api(drink_hash)
  return drink_hash["drinks"][0]["strDrink"]
end

def get_three_drink_names_from_api(drink_hash)
  drink_array = []
  drink_array << drink_hash["drinks"][0]["strDrink"]
  if drink_hash["drinks"].length > 1
    drink_array << drink_hash["drinks"][1]["strDrink"]
  end
  if drink_hash["drinks"].length > 2
    drink_array << drink_hash["drinks"][2]["strDrink"]
  end
  drink_array
end

# return the ID of the drink from the JSON information
def get_drink_ID_from_api(drink_hash)
  return drink_hash["drinks"][0]["idDrink"]
end

# return the catagory of the drink from the JSON information
def get_drink_catagory_from_api(drink_hash)
  return drink_hash["drinks"][0]["strIBA"]
end

# return the instructions of the drink from the JSON information
def get_drink_instructions_from_api(drink_hash)
  return drink_hash["drinks"][0]["strInstructions"]
end

# return the list of ingredients of the drink from the JSON information
def get_drink_ingredients_from_api(drink_hash)
  i = 1
  string = nil
  ingredients_array =[]
  until string == ""
    string = drink_hash["drinks"][0]["strIngredient#{i}"]
    if string == ""
      break
    else
      ingredients_array << drink_hash["drinks"][0]["strIngredient#{i}"]
      i += 1
    end
  end
  ingredients_array
end

  # return the url image of the drink from the JSON information
def get_drink_image_from_api(drink_hash)
  return drink_hash["drinks"][0]["strDrinkThumb"]
end

def get_drinks_by_ingredient
  response_string = RestClient.get("http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{most_common_ingredient_name[0]}")
  drink_hash = JSON.parse(response_string.body)
  all_drinks_from_ingredient = drink_hash["drinks"].map do |drink|
    drink["strDrink"]
  end
end
