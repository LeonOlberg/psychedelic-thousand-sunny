# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Contact.destroy_all

joao_contact = Contact.create(name: 'João', email: 'joao@me.com', address: 'Av paulista 193 São Paulo Sp')
pedro_contact = Contact.create(name: 'Pedro', email: 'pedro@me.com', address: 'Av brasil 23423 Rio de Janeiro Rj')
Referral.create(name: 'Rafael', email: 'rafael@me.com', contact: joao_contact)
Referral.create(name: 'Joana', email: 'joana@me.com', contact: pedro_contact)
Referral.create(name: 'Daniela', email: 'daniela@me.com', contact: pedro_contact)
