
def input_students 
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
# create an empty array
    students = []
# Get the first name
    name = gets.chomp
# while the name is not empty, repeat this code
    while !name.empty? do
      # Enter the cohort
      puts 'Please enter cohort, leave blank for default value'
      cohort = gets.chomp
      cohort = 'default' if cohort.empty?
      hobbies = input_hobbies(name)
      countries = input_birth_country(name)
       # Check for typos, does the user need to make amendments
       puts "Name: #{name}, Cohort: #{cohort}, Hobbies: #{hobbies.join(',')}, Country of Birth: #{countries} "
       puts "Are these details correct? if so type 'Y' otherwise type 'N' and re-enter details"
       response = gets.chomp
       if response.upcase == 'Y'
         # add the student hash to the array
         students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, countries: countries}
         if students.count == 1
           puts "Now we have #{students.count} student"
         else
           puts "Now we have #{students.count} students"
         end
       else
         puts 'Student data has not been saved, please re-enter again'
       end
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

def print_students_by_cohort(students)
  students.map { |student| student[:cohort] }.uniq.sort.each do |cohort|
    puts "Students enrolled in cohort: #{cohort}"
    students.each do |student|
      if student[:cohort] == cohort
        hobbies = "Hobbies: #{student[:hobbies].join(',')}"
        countries = "Country of Birth: #{student[:countries]}"
        puts "#{student[:name].center(20)} #{hobbies.center(20)} #{student[:countries].center(20)}"
      end
    end
  end
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
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

students = input_students
# Nothing will happen until we call the methods
print_header
print_students_by_cohort(students)
print_footer(students)