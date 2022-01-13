
def input_students 
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# create an empty array
  students = []
# Get the first name
  name = gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
    hobbies = input_hobbies(name)
    countries = input_birth_country(name)
   # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, countries: countries}
    puts "Now we have #{students.count} students"
# get another name from the user
    name = gets.chomp
  end
  students
end    

def input_birth_country(name)
# Enter students' country of birth
puts "Please enter the country of birth for #{name}"
countries = []
country = gets.chomp
countries = country
countries
end

def input_hobbies(name)
# Enter students' hobbies
puts "Please enter the hobbies for #{name}"
puts 'To stop entering hobbies, hit return twice'
hobbies = []
hobby = gets.chomp
until hobby.empty?
  hobbies << hobby
  hobby = gets.chomp
end
hobbies
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end 

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index} #{student[:name].center(20)} (#{student[:cohort]} cohort) Hobbies: #{student[:hobbies].join(',').center(20)} Country of Birth: #{student[:countries].center(20)} "
  end
end      

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end

students = input_students
# Nothing will happen until we call the methods
print_header
print(students)
print_footer(students)