require 'rails_helper'

RSpec.describe MenuItem, type: :model do
   it "shouldn't create a menu_item with no information" do
    item = MenuItem.new
    expect(item).to_not be_valid
   end

   it "shouldn't create a category with no name" do
    category = Category.new
    expect(category).to_not be_valid
   end

   it "shouldn't create a user with no information" do
    user = User.new
    expect(user).to_not be_valid
   end

   it "shouldn't create a menu_item with in invalid price" do
    item = MenuItem.new(price: "foo")
    expect(item).to_not be_valid
   end
end 
