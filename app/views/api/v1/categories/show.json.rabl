object @category
attributes :id, :name
node(:product_ids) { |category| category.products.pluck(:id) }