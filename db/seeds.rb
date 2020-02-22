puts "Begin seeding"

Task.destroy_all
Category.destroy_all
User.destroy_all

user_one = User.create!(email: "test@test.com", password: "123456", first_name: "hello", last_name: "world")
user_two = User.create!(email: "tested@test.com", password: "123456", first_name: "hello", last_name: "world")

category_one = Category.create!(name: "General", user: user_one)
category_two = Category.create!(name: "Work", user: user_one)
category_three = Category.create!(name: "General", user: user_two)

task_one = Task.create!(title: "Go shopping", category: category_one)
task_two = Task.create!(title: "Renew car insurance", category: category_one)
task_three = Task.create!(title: "Book holiday", category: category_one)
task_four = Task.create!(title: "Upload to ODR", category: category_two)
task_five = Task.create!(title: "Write Cpl SJARs", category: category_two)
task_six = Task.create!(title: "Write Sgt SJARs", category: category_three)

puts "--- Results ---"
puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Task.count} tasks created"
puts "Seeding completed"
