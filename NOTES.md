Tests Sequence

1	Model tests:

    . User

      has_many :carts
      belongs_to :current_cart, class_name: "Cart" # needs current_cart_id on user table

      in seeds.rb file
        User.create(email: "avi@flatiron.com", password: "123456789")

      carts table
	      Has to have a user_id attribute

    . Category
    . Item
    . Line Item
    . Cart

2	Feature Tests:

    . Store
    . Category
    . Cart
