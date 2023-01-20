require "open-uri"
require "json"

User.destroy_all
Seller.destroy_all

iben = User.create!(name: "Iben Polanco", email: "iben@lewagon.com", password: "123456", address: "Lima Peru")
Seller.create!(phone_number: "+51 901 447 382", user: iben)

p "creating books"
Book.destroy_all

books_api = URI.open("https://www.omdbapi.com/?s=harry%20potter&apikey=adf1f2d7").read
books = JSON.parse(books_api)

books["Search"].each do |book|
  Book.create(title: book["Title"], description: "magic kiddo fights noseless asshole", author: "J. K. Rowling", price: 60.0, seller: iben.seller)
end
