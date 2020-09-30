class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :price do |object|
    object.price.to_s
  end
end
