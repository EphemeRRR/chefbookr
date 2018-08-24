puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Menu.destroy_all
User.destroy_all
Chef.destroy_all

commentaires = ["Excellent, super chef!!! Je recommande.", "Peut mieux faire, ambiance à travailler, les plats sont bons..", "Horrible, ne pas booker, le chef ne sait pas se laver les mains!"]

require 'faker'


puts "enter the number of users you want to create: "
# num_users = gets.chomp.to_i
num_users = 3

puts "Creating #{num_users} users..."
puts ""
num_users.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email("#{first_name}.#{last_name}")
  avatar = ['jj.jpeg', 'cricri.jpeg', 'fm.jpg', 'chef.jpg', 'man.jpg', 'sophie.jpg', 'chefwoman.jpg', 'marcel.jpg'].sample
  phone = "0#{Faker::Number.leading_zero_number(9)}"
  location = "Faker::Nation.capital_city"

  new_user = User.new(email: email, first_name: first_name, last_name: last_name, phone: phone, location: location, password: "aaaaaa", password_confirmation: "aaaaaa")
  new_user.remote_photo_id_url = File.join(Rails.root, "/app/assets/images/seed/#{avatar}").to_s
  new_user.save!
end

# puts "enter the number of chefs you want to create: "
# num_chefs = gets.chomp.to_i
num_chefs = 20
count = 0
puts "Creating #{num_chefs} chefs..."
puts ""
num_chefs.times do

  count += 1

  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.free_email("#{first_name}.#{last_name}")
  avatar = ['jj.jpeg', 'cricri.jpeg', 'fm.jpg', 'chef.jpg', 'man.jpg', 'sophie.jpg', 'chefwoman.jpg', 'marcel.jpg'].sample
  phone = "0#{Faker::Number.leading_zero_number(9)}"
  location = %w(Marseille Paris Nice Toulouse Bordeaux Dijon Viennes Orléan Cannes Aix-en-Provence).sample
  specialty = %w(Sea-Food French Japanese Asian Thai BBQ Italian Traditionnal Burger Molecular Cheese).sample
  text = ""
  exp = (1..20).to_a.sample

  chef1 = Chef.new(first_name: first_name, last_name: last_name, experience: exp, location: location, availability: true, phone: phone, email: email, password: "aaaaaa", password_confirmation: "aaaaaa",  specialty: specialty, bio: text)
  chef1.remote_photo_id_url = File.join(Rails.root, "/app/assets/images/seed/#{avatar}").to_s
  chef1.save!

puts "Creating bookings and reviews for the same chef n°#{count} ..."
puts ""


  menu1 = Menu.create!(price: (15..30).to_a.sample, courses: (1..3).to_a.sample, chef: chef1, category: "Simple", description: "Menu basic avec entrée-plat-dessert", photo_id: File.open(File.join(Rails.root, "/app/assets/images/seed/menu#{(1..9).to_a.sample.to_i}.jpg")))
  menu2 = Menu.create!(price: (30..60).to_a.sample, courses: (3..5).to_a.sample, chef: chef1, category: "Classic", description: "Menu un peu plus copieux avec de nombreux à cotés", photo_id: File.open(File.join(Rails.root, "/app/assets/images/seed/menu#{(1..9).to_a.sample.to_i}.jpg")))
  menu3 = Menu.create!(price: (60..160).to_a.sample, courses: (5..7).to_a.sample, chef: chef1, category: "Gourmet", description: "Super menu, buffet, boisson, \r\n LA TOTALE!!!", photo_id: File.open(File.join(Rails.root, "/app/assets/images/seed/menu#{(1..9).to_a.sample.to_i}.jpg")))


  bookin1 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu1, price: menu1.price*(2..30).to_a.sample, start_date: "2018-05-20", end_date: "2018-05-24", comment: commentaires.sample )
  bookin2 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu1, price: menu1.price*(2..30).to_a.sample, start_date: "2018-05-27", end_date: "2018-05-29", comment: commentaires.sample )
  bookin3 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu2, price: menu2.price*(2..30).to_a.sample, start_date: "2018-06-03", end_date: "2018-06-05", comment: commentaires.sample )
  bookin4 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu2, price: menu2.price*(2..30).to_a.sample, start_date: "2018-06-07", end_date: "2018-06-10", comment: commentaires.sample )
  bookin5 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu3, price: menu3.price*(2..30).to_a.sample, start_date: "2018-06-13", end_date: "2018-06-15", comment: commentaires.sample )
  bookin6 = Booking.new(user: User.find((User.first.id..User.first.id+num_users-1).to_a.sample), menu: menu3, price: menu3.price*(2..30).to_a.sample, start_date: "2018-06-17", end_date: "2018-06-24", comment: commentaires.sample )

  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin1)
  end
  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin2)
  end
  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin3)
  end
  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin4)
  end
  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin5)
  end
  4.times do
    review1 = Review.create!(rating: (1..5).to_a.sample, comment: commentaires.sample, booking: bookin6)
  end
end

