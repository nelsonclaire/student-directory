def print_source_code(filename)
  if File.exists?(filename)
    File.foreach filename do |file_line|
      puts file_line
    end
  else
    puts "File #{filename} does not exist"
  end
end
  
  print_source_code(__FILE__)