class Category < ActiveHash::Base
  self.data = [
    {
      key: 'data',
      name: 'Data'
    },
    {
      key: 'visualization',
      name: 'Visualization'
    },
    {
      key: 'configuration',
      name: 'Configuration'
    }
  ]

  def subcategories
    Subcategory.where(category_key: key)
  end

  def to_param
    key
  end

  def to_s
    name
  end
end