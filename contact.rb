class Contact

  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  def self.all
    # Implement this method
  end

  def self.get(id)
    # Implement this method
  end

  def self.search_by_attribute(name, value)
    # Implement this method
  end

  def self.delete_all
    # Implement this method
  end

  def full_name
    # Implement this method
  end

  def update(attribute, value)
    # Implement this method
  end

  def delete
    # Implement this method
  end

end
