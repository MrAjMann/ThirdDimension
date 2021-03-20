# ThirdDimension

### Two-Sided Marketplace

Designed and Developed by
Anthony Mann 2021

### Instalation Instructions.

1. Make a fork of this repo
2. Clone your fork to your local development environment
3. Install dependencies bundle install
4. Check node dependencies yarn install --check-files
5. Setup the database rails db:{create,migrate}
6. optionally you can run rails db:seed to add two registered users.

run rails s and check that everything is working.

### Application overview

Third Dimension is a two-sided marketplace for the sale of Dioramas, 3D printer Models, and relevent supplies. The current marketplace is underdeveloped and not very accessible for all those who wish to create and sell their amazing creations or for those who wish to order one-of-a-kind Dioramas or purchase 3D model designs online.

<hr>

### The Problem

This is a problem that I feel needs to be addressed as I have often found myself looking to purchase Dioramas that people have created, however, there is very limited availability, especially within Australia.

<hr>

### Special links

[Third Dimension Website](https://thirddimension.herokuapp.com/)

[GitHub Repo](https://github.com/MrAjMann/ThirdDimension)

<hr>

### Features and Functionality

- User Registration
- User Dashboard with Product management
- Each User can have an avatar - As a back-up it is connected to gravater
- **Stripe Connectivity**

<hr>

### Target audience

The target audience for my online marketplace is those interested in Buying, Selling and Creation of 3D Models and Dioramas.

<hr>

### Tech Stack:

Ruby on Rails - The heart of the application.
HTML - The layout of the application this includes **embedded ruby** code to help convey information to the user.
Bootstrap 4.6 - Used for a base styling
scss - Used to enhance / change Bootstraps initial styles
Heroku - Deployment of the Production Application
Cloudinary - Is used to store Images online in the cloud.
Github - Is used for version and source control.
Gravatar - Default profile Images

<hr>

## Wireframes and Mockups

### Design MockUps

[Designs on Figma](https://www.figma.com/file/0BKfLJqugqiiPCjpgB4TXq/Third-Dimension?node-id=0%3A1)

---

#### Landing Pages

![Landing Pages](./app/assets/images/LandingPages.png)

---

#### Sign Up Pages

![Sign Up Pages](./app/assets/images/SignUpPages.png)

---

#### Sign In Pages

![Sign In Pages](./app/assets/images/SignInPages.png)

---

#### Shop Pages

![Shop Pages](./app/assets/images/ShopPages.png)

<hr>

### Gems used

[Devise](https://github.com/heartcombo/devise)

[Simple Form](https://github.com/heartcombo/simple_form)

[Gravatar](https://github.com/mdeering/gravatar_image_tag)

<hr>

### User Stories

- As a Buyer, I want to be able to view all available products without have to sign in or register an account.

- As a Seller I want to be able easily add my models to the store including multiple images.

- As a Registered user I want to be able to edit and remove my account.

- As a Registered user I want to be able to add a profile image or a logo to my account.

- As a Buyer I want a safe and easy to use way to pay for my purchases.

- As a Buyer user I don't want my creditcard details stored in a database.

- As a Seller I want to be able to remove products when I no longer have them in stock.

- As Registered user I want my password to be encrypted and secure.

- As a Registered user I don't want another seller to be able to edit or remove my products.
