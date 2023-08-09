class ScopedUsersOver < Rectify::Query
  def initialize(age, scope = AllUsers.new) # rubocop:disable Lint/MissingSuper
    @age   = age
    @scope = scope
  end

  def query
    @scope.query.where("age > ?", @age)
  end
end
