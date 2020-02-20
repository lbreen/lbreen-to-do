puts "Begin seeding"

Task.destroy_all
Category.destroy_all
User.destroy_all

user = User.create!(email: "test@test.com", password: "123456", first_name: "hello", last_name: "world")

category_one = Category.create!(name: "General", user: user)
category_two = Category.create!(name: "General", user: user)

task_one = Task.create!(title: "Go shopping", category: category_one)
task_two = Task.create!(title: "Renew car insurance", category: category_one)
task_three = Task.create!(title: "Book holiday", category: category_one)
task_four = Task.create!(title: "Upload to ODR", category: category_two)
task_five = Task.create!(title: "Write SJARs", category: category_two)

puts "--- Results ---"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Task.count} tasks created"
puts "Seeding completed"
