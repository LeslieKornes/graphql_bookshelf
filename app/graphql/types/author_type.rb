class Types::AuthorType < Types::BaseObject
  description "An author"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true
  field :full_name, String, null: true

  # custom field type
  field :coordinates, Types::CoordinatesType, null: false

  # array field example (recognized bc is method on model)
  field :publication_years, [Int], null: false

  def full_name
    ([object.first_name, object.last_name].compact).join(" ")
  end
end

# in Altair:
# {
#   author(id: 2) 
#   {
#     firstName
#     isAlive
#     lastName
#     fullName
#     coordinates {
#       latitude
#       longitude
#     }
#     publicationYears
#   }
# }