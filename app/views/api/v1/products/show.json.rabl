object @product
attributes :name, :price, :released_at

child :category do
  attributes :id, :name
end