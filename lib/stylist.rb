class Stylist
  @@all_stylists = []

define_method(:initialize) do |name|
    @name = name
  end

  define_method(:name) do
    @name
  end

  define_singleton_method(:all) do
    @@all_stylists
  end

  define_method(:save) do
    @@all_stylists.push(self)
  end
end
