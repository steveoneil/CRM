class Contact

  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 1

  def initialize(id, first_name, last_name, email, note)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def self.create(first_name, last_name, email, note)
    new_contact = new(@@id, first_name, last_name, email, note)
    @@contacts << new_contact
    @@id += 1
    new_contact
  end

  def self.all
    @@contacts
  end

  def self.get(id)
    @@contacts.find { |contact| contact.id == id}
  end

  def self.search_by_attribute(name, value)
    @@contacts.find_all { |contact| contact.name == value}
  end

  def self.delete_all
    # Implement this method
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update(attribute, value)
    # Implement this method
  end

  def delete
    # Implement this method
  end

end
