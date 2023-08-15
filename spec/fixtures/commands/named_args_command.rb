class NamedArgsCommand < Rectify::Command
  def initialize(first_name, last_name, height:, location:, hobbies:) # rubocop:disable Lint/MissingSuper
    @first_name = first_name
    @last_name = last_name
    @height = height
    @location = location
    @hobbies = hobbies
  end

  def call
    broadcast(:ok, message)
  end

  def message
    "#{full_name} is from #{location} and is #{height_in_inches} inches tall, and they enjoy #{hobbies_list}."
  end

  private

  attr_reader :first_name, :last_name, :height, :location, :hobbies

  def full_name
    [first_name, last_name].join(" ")
  end

  def height_in_inches
    height * 0.393
  end

  def hobbies_list
    hobbies_array = [hobbies].flatten

    if hobbies_array.length > 1
      last_hobby = "and #{hobbies_array.pop}"
      hobbies_array.push(last_hobby)
    end

    hobbies_array.join(", ")
  end
end
