class UsersOver < Rectify::Query
  def initialize(age) # rubocop:disable Lint/MissingSuper
    @age = age
  end

  def query
    User.where("age > ?", @age)
  end
end
