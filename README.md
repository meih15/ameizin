# Ameizin'

**Ameizin'** is an Fullstack clone of Amazon that allows users to browse, search for, checkout and review products from a diverse range of categories. Users are also able to access their past orders through the order history functionality. 

[Live Link](https://ameizin.herokuapp.com/)

## Technologies, Libraries, APIS Used

- PostgreSQL
- Ruby on Rails
- JavaScript
- React
- Redux
- HTML/CSS
- Swiper
- Amazon AWS
- NPM and Webpack

## Functionality & MVPS

- User Authentication:
  - Users are able to create and log-in/log-out of an account
  - Utilizes CSRF tokens for protection against cross-site forgery
  - Demo-user account allowing user to tour the application

- Search Functionality:
  - Category Navigation Bar
    - Accesible through most of the pages
    - Filters products based on category and renders a category index show page
  - Searching though search bar
    - Filters products based on name
    - Returns products show page that match the search term

- Shopping Cart
  - CRUD feature that allows users to:
    - Add items to their shopping cart.
      - Adding more of a pre-existing item to the cart will update the cart item quanitity instead of creating duplicate cart items.
    - Remove or update items in the cart.
      - Users can also update the number of a particular item in the cart through that product's show page.
    - Checkout items from their cart. 
  - Users are able to add perform all of the cart functionalities without being logged in. However, checking out requires user to be logged in.

- Order History
  - A random and unique order confirmation number is generated for each checked out order.
  - Users will be able to see their order history for the account under the order history section.
  - Users are able to delete their past orders in the order history.
  - Users are also able to leave reviews for the products they previously bought through order history. 

- Product Reviews 
  - Logged in users are able to:
    - Write new product reviews
      - There is error handling for creating reviews if a specific required portion is missing. 
    - Edit your existing reviews
    - Delete your existing reviews
  - Every product has an average rating that dynamically changes based on the total reviews/ratings of the product. 
  - Users are able to see all the reviews for a product on the product show page.


## Highlighted Features

### Shopping Cart

Users upon load-in to site are given a guest cart with a unique guest cart ID. Each account will also have their own unique cart ID that is associated with the account. This enables users to access all the cart functionalities (aside from checkout) without being logged-in.

``` ruby
  # Carts controller
    def show
        if current_user&.cart
            @cart = current_user.cart
            render :show
        else
            if cookies[:cart] && cookies[:cart] != ""
                @cart = Cart.find(cookies[:cart])
                render :show
            else
                @cart = Cart.create!
                cookies[:cart] = @cart.id
                render :show
            end
        end
    end
   ```
   
   

    


    
 

