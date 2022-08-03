# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Event.destroy_all
Referral.destroy_all
Contact.destroy_all

first_contact = Contact.create(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
second_contact = Contact.create(name: Faker::Name.name, email: Faker::Internet.email, address: Faker::Address.full_address)
Referral.create(name: Faker::Name.name, email: Faker::Internet.email, contact: first_contact)
Referral.create(name: Faker::Name.name, email: Faker::Internet.email, contact: second_contact)
Referral.create(name: Faker::Name.name, email: Faker::Internet.email, contact: second_contact)
