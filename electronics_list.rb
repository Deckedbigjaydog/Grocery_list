#create list of groceries from store with price   ########done#########
## Create a menu option to add items to a user's grocery cart.
# Create a menu option to display all the items in the cart.
# Create a menu option to remove an item from the users cart.
# Create a menu option to show the total cost of all the items in the user's cart.
# Add new items to the grocery store.
puts "----------------------"
puts "| Ruby Grocery Store |"
puts "----------------------"
puts "what is your name? "
print "> "
Name = gets.chomp
puts " Hello, #{Name}."
puts "\nWelcome to the Ruby Grocery Store."
puts "You have $150 to spend at my store including tax"
puts "so watch your cart!\n"
@items = [
  {key:1, name: "Bananas", price:1},
  {key:2, name: "Lettuce", price:2},
  {key:3, name: "Pineapple", price:3},
  {key:4, name: "steak", price:12},
  {key:5, name: "chicken", price:5},
  {key:6, name: "Eggs", price:2},
  {key:7, name: "Cheese", price:7},
  {key:8, name: "Bread", price:4},
  {key:9, name: "Kobe Beef", price:99},
  {key:10, name: "Sushi", price:18},
]
@menus = [
  {key:1, name: "View store"},
  {key:2, name: "Add to cart from store items"},
  {key:3, name: "Remove Items From Cart"},
  {key:4, name: "Checkout"},
  {key:5, name: "View Cart Items"},
  {key:6, name: "Add Item To Store"},
  {key:7, name: "Leave"}
]
@checkouts = [
  {key:1, name: "Do you want to checkout?"},
  {key:2, name: "Return to list"},
]
# @wallets = [
#   {name: "Wallet", card:150}
# ]
@display_cart = []
def display_options
  @menus.each_with_index do | menu, index |
   puts " #{menu[:key]}, #{menu[:name]}"
  end
end
def view_items
  @items.each_with_index do | item, index |
  puts " #{item[:key]}, Type:#{item[:name]}, $#{item[:price]}"
  end
end
def view_display_cart
@display_cart.each_with_index do | item, index |
  puts "#{item[:key]}, #{item[:name]}, $#{item[:price]}"
  end 
end
def remove_item
  puts "what do you want to remove?"
  delete_item = gets.chomp.to_i
  @display_cart.delete_at(delete_item -1)
  view_display_cart
end
def total_price
  total = 150
  @display_cart.each do |item|
    total -= item[:price].to_i
  end
  puts "Your remaining balance is $#{total}"
end

def total_cart_amount
  total = 0
  @display_cart.each do |item|
    total += item[:price].to_i
  end
  puts "Your total amount is $#{total}"
end

def display_cart
  basket = {}
  puts "What would you like to add?"
  view_items
  selection = gets.chomp.to_i
  basket[:name] = @items[selection -1][:name]
  basket[:price] = @items[selection -1][:price]
  @display_cart << basket
  puts " You are getting #{basket}"
end
def adding_to_store
  puts "What do you want the name to be?"
  new_name = gets.chomp
  puts "What do you want the price to be?"
  new_price = gets.chomp.to_i
  new_item ={
    key: @items.length + 1,
    name:new_name,
    price:new_price,
  }
  @items<< new_item
end
def exit_store
  puts " Thank you for shopping at Ruby #{Name}!"
  puts "#{total_cart_amount}"
  puts "#{total_price}"
end
def display_menu
  puts "\n My store options"
  display_options
  choice = gets.chomp.to_i
  case choice
  when 1
    view_items
    display_menu
  when 2
    display_cart
    display_menu
  when 3
    view_display_cart
    remove_item
    display_menu
  when 4
    exit_store
  when 5 
    view_display_cart
    total_cart_amount
    total_price
    display_menu
  when 6 
    adding_to_store
    display_menu
  when 7
    exit_store
  else
    puts "goodbye"
  end
end
display_menu