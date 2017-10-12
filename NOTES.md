1	Model tests:

    User

    has_many :carts
    belongs_to :current_cart, class_name: “Cart” # needs current_cart_id on user table

    in seeds.rb file
        User.create(name: “Avi”, email: “avit@flatiron.com”, password: “123456789”

    carts table
	   Has to have a user_id attribute

2	Feature Tests:

    Store
    Category

4	Cart
