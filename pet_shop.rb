require 'pry-byebug'

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  return pet_shop[:pets].select{|pet| pet[:breed] == breed}
end

def find_pet_by_name(pet_shop, pet_name)
  return pet_shop[:pets].find{|pet| pet[:name] == pet_name}
  # for pet in pet_shop[:pets]
  #   return pet if pet[:name] == pet_name
  # end
  # return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete_if {|pet| pet[:name] == pet_name}
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  customer[:cash] >= new_pet[:price] ? (return true) : (return false)
  # return true if customer[:cash] >= new_pet[:price]
  # return false
end

def sell_pet_to_customer (pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
