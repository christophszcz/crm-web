class Rolodex 
attr_accessor :contacts
  @@ids = 1  
  def initialize
    @contacts = []
  end

  def add_contact(contact)
    contact.id = @@ids
    @contacts << contact
    @@ids += 1 
    contact
  end

  def modify_contact(contact_id)
    modified_contact = find_contact(contact_id)
    puts "The following can be changed:"
    puts "[1] First Name" 
    puts "[2] Last Name" 
    puts "[3] Email"
    puts "[4] Notes"
    puts "Enter a number: "
    
    modify_number = gets.chomp.to_i

    case modify_number
      when 1
        print "Modified First Name: "
        new_first_name = gets.chomp
        modified_contact.first_name = new_first_name

      when 2 
        print "Modified Last Name: "
        new_last_name = gets.chomp
        modified_contact.last_name = new_last_name

      when 3
        print "Modified Email: "
        new_email = gets.chomp
        modified_contact.email = new_email

      when 4
        print "Modified Note: "
        new_note = gets.chomp
        modified_contact.note = new_note

      else 
        puts "Incorrect option, try again"
    end   
  end

  def display_attribute(attribute)    
    case attribute
    
    when 1 then @contacts.each { |the_contact| puts the_contact.first_name }
    when 2 then @contacts.each { |the_contact| puts the_contact.last_name }
    when 3 then @contacts.each { |the_contact| puts the_contact.email }
    when 4 then @contacts.each { |the_contact| puts the_contact.note }
    
    else 
      puts "Incorrect option, try again"
    end   
  end

  def find_contact(id)
    @contacts.find {|contact| contact.id == id}
  end

  def display_one_contact(id)
    one_contact = find_contact(id)
      print one_contact.display
  end

  def display_all_contacts
    @contacts.each { |contact| puts contact.display}
  end

  def delete_contact(id)
    contact = find_contact(id)
    @contacts.delete(contact)
  end
end 