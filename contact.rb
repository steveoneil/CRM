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

  def self.search_by_attribute(att_type, value)
    case att_type
      when 1
        found_contacts = @@contacts.find_all { |contact| contact.id.to_s == value}
      when 2
        found_contacts = @@contacts.find_all { |contact| contact.first_name == value}
      when 3
        found_contacts = @@contacts.find_all { |contact| contact.last_name == value}
      when 4
        found_contacts = @@contacts.find_all { |contact| contact.email == value}
      when 5
        found_contacts = @@contacts.find_all { |contact| contact.note == value}
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.update(id, att_type, value)
    index = @@contacts.index { |contact| contact.id.to_s == id}
    case att_type
      when 2
        @@contacts[index].first_name = value
      when 3
        @@contacts[index].last_name = value
      when 4
        @@contacts[index].email = value
      when 5
        @@contacts[index].note = value
    end
    @@contacts[index]
  end

  def self.delete(id)
    index = @@contacts.index { |contact| contact.id.to_s == id}
    @@contacts.delete_at(index)
  end
end
