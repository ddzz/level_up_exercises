
class DinoDexCommandLine
  
  def initialize(dinos, dino_names)
    @dino_dex = dinos
    @dino_names = dino_names
  end

  def get_input
    
    puts "\nEnter command (type \"help\" for list of commands or \"exit\" to quit): \n"
    user_input = []
    user_input = gets.chomp.strip.downcase.split
    process_input_length(user_input)
    
  end
  
  def process_input_length(user_input)
    
    case
    when user_input.length == 0 then invalid_command
    when user_input.length == 1 then process_single_command(user_input[0])
    else process_multiple_inputs(user_input)
    end
    
  end
  
  def process_single_command(user_input)
    
    case user_input
    when "all_dinos" then print_all_dinos
    when "help" then print_help_menu
    when "exit" then exit
    when *@dino_names then print_all_dino_facts(user_input)
    when "filter" then puts "ERROR: Please specify at least one filter.
      To see a list of all dinos, enter \"all_dinos\""
    else invalid_command
    end
    
  end
  
  def process_multiple_inputs(user_inputs)
    
    if user_inputs[0] != "filter"
      check_for_command_chaining(user_inputs)
      invalid_command
    else
      process_filters(user_inputs)
    end
    
  end
  
  def print_help_menu
    file = File.open("dino_rules.txt", "r")
    help_doc = file.read
    puts "#{help_doc} \n"
  end
  
  def print_all_dinos
    puts "\nLIST OF ALL DINOS: \n"
    puts @dino_dex.to_s
  end
  
  def print_all_dino_facts(dino_name)
    puts @dino_dex.print_all_facts(dino_name)
  end
  
  def print_filtered_dinos(filters)
    filtered_dinos = @dino_dex.filter_dinos(filters)
    filtered_dinos.each { |dino| puts dino.name }
  end
  
  def invalid_command
    puts "\nInvalid command.  Please try again."
  end
  
  def check_for_command_chaining(user_input)
    @commands = %w( help exit all_dinos filter )
    
    case
    when user_input.uniq.length != user_input.length then puts "\nERROR: Duplicate commands entered.\n"
    when (user_input & @dino_names).length > 1 
      puts "\nERROR: Multiple dino names entered.  Please enter only one name at a time.\n"
    when (user_input & @dino_names.concat(@commands)).length > 1
      puts "\nERROR: Command chaning.  Please enter only one command at a time.\n"
    end
    
  end
  
  def process_filters(filters)

    case
    when (%w( fat small ) & filters).length == 2
      puts "Please enter only one weight (fat or small)."
      invalid_command
    when (%w( joe pirate_bay ) & filters).length > 1
      puts "Please enter only one collection (joe or pirate_bay)."
      invalid_command
    when (%w( jurassic albian cretaceous triassic permian oxfordian ) & filters).length > 1
      puts "Please enter only one period."
      invalid_command
    else
      print_filtered_dinos(filters[1..-1].map!(&:downcase))
    end
  end
  
end