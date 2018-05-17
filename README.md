# OzFeed 

### A Coder Academy Rails Marketplace assignment

## About OzFeed

OzFeed is a charity that accepts food donations from businesses and redistributes them to people in need. They pick up donations and then sort them before they are delivered out. Food services range from ready made meals for the homeless, to groceries for shelters and families in need. 

## Problem Definition

With so many deserving causes in the world, charities can struggle to distinguish themselves from each other when asking for donations. There is also a struggle to connect donors with end projects with donors often not understanding where their money is being spent. 

## Solution

I will attempt to solve this problem by building  marketpalce feature into the OzFeed website. Businesses will be able to upload details of their food donation and we will then calculate a pickup and handling cost associated with the listing. It will then be displayed as a product on our website which donors can login and 'purchase'. Once the donation is paid, we pickup the food and distribute where it is most needed. 

This system will help to build a relationship between OzFeed and its donors which will help increase donations. This system is very similar to Oxfam, for example, who allow you to 'buy a pig' for a family in need. 

# User Stories

![screen shot 2018-05-11 at 8 36 12 am](https://user-images.githubusercontent.com/32858232/39897626-75a1c2f0-54f6-11e8-8787-f9350cd87e05.png)


## How I accomplished selected User Stories

### As a donor I want to be able to add purchase multiple items at once. 

This story was accomplished by incorporating a line items and cart model into my project. Instead of prompting the user to buy the product straight away, the product would be added to a line item which was referenced by a cart. This line item could then be passed to the Order model on checkout. This feature was important as making donor do multiple transactions for multiple products may make them more reluctant to purchase more than one product. 

### As a Donor or Business I want to be able to download a PDF receipt for my tax records

This story was accomplished by incorporating the 'receipts' gem into my Order Show page. It generated a tax receipt with the donation amount (for donor) or product cost price (for business) from Ozfeed. You then have permanent access to the receipt through your login for whenever you need it

### As a donor I want to see a feed of recent donations 

This was accomplished by incorporating a list of the last orders into the right hand side of the page. The orders are displayed with the most recent at the top and donors also have the option of making their donation anonymous.

### As a donor/business I want to be able to log in securely. 

This was accomplished by incorporating the devise gem. Users will login with their email and a secure password and by also using Sendgrid I was able to ensure that the email addresses were valid as it sent a confirmation email. 


# User Flow Diagram

### From the Donor's Perspective
![screen shot 2018-05-11 at 6 20 13 am](https://user-images.githubusercontent.com/32858232/39897300-06971320-54f5-11e8-9bc8-9b37d7652d60.png)


### From a Business Perspective

![screen shot 2018-05-11 at 6 22 15 am](https://user-images.githubusercontent.com/32858232/39897304-0dd67aa4-54f5-11e8-8bda-3c41c2af6c53.png)


# Entity Relationship Diagram

![screen shot 2018-05-10 at 4 56 00 pm](https://user-images.githubusercontent.com/32858232/39897261-e182598c-54f4-11e8-8c1c-cb8a48e5be5e.png)

# Wireframes

## Mobile


![screen shot 2018-05-11 at 6 50 22 am](https://user-images.githubusercontent.com/32858232/39897346-3b319268-54f5-11e8-9380-99a7c6889be4.png)
![screen shot 2018-05-11 at 6 56 07 am](https://user-images.githubusercontent.com/32858232/39897355-4371bad4-54f5-11e8-9d52-de0551ed7bf0.png)
![screen shot 2018-05-11 at 7 00 37 am](https://user-images.githubusercontent.com/32858232/39897368-4dd8a00a-54f5-11e8-8e79-04d02bfc66af.png)
![screen shot 2018-05-11 at 7 03 57 am](https://user-images.githubusercontent.com/32858232/39897377-547a8018-54f5-11e8-9550-a092cf631759.png)

## Desktop


![screen shot 2018-05-11 at 6 53 51 am](https://user-images.githubusercontent.com/32858232/39897423-81992612-54f5-11e8-9417-8d7ed50c514e.png)
![screen shot 2018-05-11 at 7 05 41 am](https://user-images.githubusercontent.com/32858232/39897433-86b4f536-54f5-11e8-8cb0-692c92292b20.png)
![screen shot 2018-05-11 at 7 06 35 am](https://user-images.githubusercontent.com/32858232/39897443-8c5d0bfe-54f5-11e8-89fd-8393826babcf.png)
![screen shot 2018-05-11 at 7 08 20 am](https://user-images.githubusercontent.com/32858232/39897449-8ffc7614-54f5-11e8-9e8d-75d1214547c6.png)




![screen shot 2018-05-11 at 6 43 28 am](https://user-images.githubusercontent.com/32858232/39897412-780f7ae2-54f5-11e8-8bff-bd563828e642.png)

# Project Management via Trello

![screen shot 2018-05-11 at 8 46 30 am](https://user-images.githubusercontent.com/32858232/39897928-d705cd4c-54f7-11e8-9530-5fc514cab087.png)



# Peer Code Review

I worked closely on parts of this project with both Ash and Frank. We were all using the Agile Rails Development book as the basis for our line items, cart and order and so as we each encountered different problems we were able to review each others code and assist in ideas to work around the problem. 

The biggest problem we faced as a group was implimenting Stripe into our existing Order model. In particular I worked closely with Frank and we were each able to come up see where the other had gone wrong in incorporating the stripe button and ensuring that products were available through the order Show page once complete. 





