require "active_support/core_ext/string"

class UsersOverUsingSql < Rectify::Query
  include Rectify::SqlQuery

  def initialize(age) # rubocop:disable Lint/MissingSuper
    @age = age
  end

  def model
    User
  end

  def sql
    <<~SQL.strip_heredoc
      SELECT *
      FROM users
      WHERE age > :age
      ORDER BY age ASC
    SQL
  end

  def params
    { age: @age }
  end
end
