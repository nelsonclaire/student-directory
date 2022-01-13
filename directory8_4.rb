
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
  counter = 0
  # or use While loop below
  # while counter < students.count
  until counter == students.count
    puts (students[counter][:name]).to_s + ' Cohort: ' + (students[counter][:cohort]).to_s
    counter += 1
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