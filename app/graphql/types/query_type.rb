module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator" do
        argument :name, String, required: true
      end

    def test_field(name:)
      Rails.logger.info context[:time]
      "Hello #{name}!"
    end

    field :author, Types::AuthorType, null: true,
      description: "An author" do
        argument :id, ID, required: true
      end

    def author(id:)
      Author.find(id)
    end

    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end
  end
end
