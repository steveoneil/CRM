require_relative 'contact.rb'

class CRM

  def self.run(name)
    # Implement this method
  end

  def initialize(name)
    # Implement this method
  end

  def main_menu
    while true
      print_main_menu
      user_selection = gets.to_i
      call_option(user_selection)
    end
  end

  def print_main_menu
    # puts "\e[H\e[2J" if @clear_screen == true
    # @clear_screen = true
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def call_option(user_selection)
    case user_selection
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then
    when 4 then
    when 5 then
    when 6 then exit
    when 7 then test_method
    else
      # puts "\e[H\e[2J"
      puts "Invalid entry. Please try again."
      puts " "
      # @clear_screen = false
    end
  end

  def test_method
    # puts "\e[H\e[2J"
    puts "Test Method"
    puts " "
    # @clear_screen = false

    print 'Enter ID: '
    id = gets.chomp.to_i
    contact = Contact.get(id)
    p "The contact is:"
    p contact
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    # Implement this method
  end

  def delete_contact
    # Implement this method
  end

  def display_all_contacts
    # Implement this method
    # HINT: Make use of the display_contacts method
  end

  def search_by_attribute
    # Implement this method
    # HINT: Make use of the display_contacts method
  end

  def display_contacts(contacts)
    # Implement this method
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods
  end

  # Add other methods here, if you need them.

end

# Run the program here (See 'Using a class method`)
@clear_screen = true
puts "\e[H\e[2J"

crm_app = CRM.new("DarkForce CRM")
crm_app.main_menu
