require 'csv'
@students = [] # an empty array accessible to all methods
@filename = "" #file name accessible to all methods

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    write_student_file
  when "4"
    read_student_file   
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

#Input the student name
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def write_student_file
  input_filename("write")
  CSV.open(@filename,"w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  @students.count == 1 ? (puts "#{@students.count} student written to #{@filename}") : (puts "#{@students.count} students written to #{@filename}")
end

def read_student_file
  input_filename("read")
  user_action = "Y"
  if @students.length > 0
    puts "Any input not saved will be overwritten when reading the file. Enter 'Y' to continue or press any key to cancel and return to the main menu"
    user_action = STDIN.gets.chomp.upcase
  end
  if user_action == "Y"
    @students = []
    CSV.foreach(@filename) do |row|
      name, cohort = row
      @students << {name: name, cohort: cohort.to_sym}
     end
    @students.count == 1 ? (puts "Loaded #{@students.count} student from #{@filename}") : (puts "Loaded #{@students.count} students from #{@filename}")
    show_students
  else
    puts "Action to load students from #{@filename} cancelled"
  end
end

def add_students(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

#Try to load the file from the command line, if no file entered default to use the claire.csv file
def try_load_students
  @filename = ARGV.first
  @filename = "students.csv" if @filename.nil?
  if File.exists?(@filename)
    read_student_file
  else
    puts "Sorry #{@filename} doesn't exist."
    exit # quit the program
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

#Request the filename from the user
def input_filename(action) 
  puts "Please enter the name of the file you would like to #{action}"
  input_filename = STDIN.gets.chomp
  if !File.exists?(input_filename)
    puts "Sorry #{input_filename} doesn't exist."
    puts "Would you like to use the current default file #{@filename}? Enter 'Y' to continue or press any key to quit the program"
    user_input = STDIN.gets.chomp.upcase
    if !(user_input == "Y")
      exit # quit the program
    end
  end
end

interactive_menu 