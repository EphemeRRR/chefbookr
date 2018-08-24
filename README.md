Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


for seeding

require 'faker'


first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
email = Faker::Internet.free_email("#{first_name}.#{last_name}")
avatar = Faker::LoremFlickr.image("50x60", ['people'])
phone = "0#{Faker::Number.leading_zero_number(9)}"
location = "Faker::Nation.capital_city"
pass = "aaaaaa"
pass_conf = "aaaaaa"

text = ""
exp = (1..20).to_a.sample
