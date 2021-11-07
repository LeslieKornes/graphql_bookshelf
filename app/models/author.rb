class Author < ApplicationRecord

  # option one for user entered type
  # def full_name
  #   ([first_name, last_name].compact).join(" ")
  # end

  def coordinates
    [rand(90), rand(90)]
  end
end