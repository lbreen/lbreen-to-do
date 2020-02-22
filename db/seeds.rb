puts "Begin seeding"

Task.destroy_all
User.destroy_all

user_one = User.create!(email: "test@test.com", password: "123456", first_name: "hello", last_name: "world")
user_two = User.create!(email: "test2@test.com", password: "123456", first_name: "alexa", last_name: "google")

task_one = Task.create!(title: "Go shopping", user: user_one)
task_two = Task.create!(title: "Renew car insurance", user: user_one)
task_three = Task.create!(title: "Book holiday", user: user_one, description: "Book easter holiday. Maldives? Barbados?")
task_four = Task.create!(title: "Upload to ODR", user: user_one, category: "Work")
task_five = Task.create!(title: "Write Cpl SJARs", user: user_one, description: "5 x Cpl SJARS", category: "Work")
task_six = Task.create!(title: "Write Sgt SJARs", user: user_two)

puts "--- Results ---"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"
puts "Seeding completed"
