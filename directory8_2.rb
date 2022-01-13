
def input_students 
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
# create an empty array
    students = []
# Get the first name
    name = gets.chomp
# while the name is not empty, repeat this code
    while !name.empty? do
# add the student hash to the array
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
# get another name from the user
      name = gets.chomp
    end
    students
end    



def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end      

def initial_letter(students)
    puts 'Please enter an initial letter'
    initial = gets.chomp.upcase
    students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].chr.upcase ==  initial
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
initial_letter(students)