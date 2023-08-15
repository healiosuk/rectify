class ArgsCommand < Rectify::Command
  def initialize(a, b, c) # rubocop:disable Lint/MissingSuper, Naming/MethodParameterName
    @a = a
    @b = b
    @c = c
  end

  def call
    [a, b, c].join(" ")
  end

  private

  attr_reader :a, :b, :c
end
