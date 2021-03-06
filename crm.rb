require_relative 'contact.rb'

class CRM

  def self.run(name)
  end

  def initialize(name)
  end

  def main_menu
    while true
      print_main_menu
      user_selection = gets.to_i
      call_option(user_selection)
    end
  end

  def print_main_menu
    puts "\e[H\e[2J" if @clear_screen == true
    @clear_screen = true
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
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    else
      puts "\e[H\e[2J"
      puts "Invalid entry. Please try again."
      puts " "
      @clear_screen = false
    end
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
    puts "\e[H\e[2J" if @clear_screen == true
    @clear_screen = true
    puts "Enter ID of contact to be modified:"
    id = gets.chomp
    contact = Contact.search_by_attribute(1, id)
    puts "Are you sure want to modify the contact id #{id} info? (yes / no)"
    proceed = gets.chomp
    if proceed == "no"
      return
    else
      if contact.empty? == true
        puts "No contacts found"
        return
      end

      puts "Select attribute to be modified:"
      puts "[1] First Name"
      puts "[2] Last Name"
      puts "[3] Email Address"
      puts "[4] Note"
      puts "[5] Return to Main Menu"
      print "Enter a number: "
      att_type = (gets.chomp.to_i) + 1
      if (2..5).include?(att_type)
          print "Enter new (modified) value: "
          att_value = gets.chomp
          contact = Contact.update(id, att_type, att_value)
      else
        return
      end
      puts "\e[H\e[2J"
      puts "Contact ID: #{contact.id}, Name: #{contact.full_name}, Email: #{contact.email}, Note: #{contact.note}"
      puts " "
      @clear_screen = false
    end
  end

  def delete_contact
    puts "\e[H\e[2J" if @clear_screen == true
    @clear_screen = true
    puts "Enter ID of contact to be deleted:"
    id = gets.chomp
    Contact.delete(id)
  end

  def display_all_contacts
    display_contacts(Contact.all)
  end

  def search_by_attribute
    puts "\e[H\e[2J" if @clear_screen == true
    @clear_screen = true
    puts "Select Attribute Type"
    puts "[1] Contact ID"
    puts "[2] First Name"
    puts "[3] Last Name"
    puts "[4] Email Address"
    puts "[5] Note"
    puts "[6] Return to Main Menu"
    print "Enter a number: "
    att_type = gets.chomp.to_i
    if (1..5).include?(att_type)
        print "Enter Value: "
        att_value = gets.chomp
          contacts = Contact.search_by_attribute(att_type, att_value)
        if contacts.empty? == true
          puts "No contacts found"
        end
    else
      return
    end
    display_contacts(contacts)
  end

  def display_contacts(contacts)
    puts "\e[H\e[2J"
    contacts.each { |contact| puts "Contact ID: #{contact.id}, Name: #{contact.full_name}, Email: #{contact.email}, Note: #{contact.note}"}
    puts " "
    @clear_screen = false
  end

end

@clear_screen = true
puts "\e[H\e[2J"

crm_app = CRM.new("DarkForce CRM")
crm_app.main_menu
