1	Get through model tests first

User
    has_many :carts
    belongs_to :current_cart, class_name: “Cart” # needs current_cart_id on user table

    in seeds.rb file

        User.create(name: “Avi”, email: “avit@flatiron.com”, password: “123456789”

carts table

	Has to have a user_id attribute

2	Feature Test: Category

app/views/categories/show.html.erb

<h1><%= @category.title %></h1>
<ul>
    <% @category.items.each do |item| %>    
    		       <li><%= link_to item.title, item_path(item) %> | <%= "$#{item.price.to_f/100}" %></li>
		     <% if current_user %>
		      <% form_tag “/line_items/#{item.id}” do %>
              	   <% submit_tag “Add to Cart” %>
              <% end %>
           <% end %>
       <% end %>
</ul>

3	Store
4	Cart
