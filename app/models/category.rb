class Category < ActiveHash::Base
  self.data = [
    {
      key: 'getting_started',
      name: 'Getting Started'
    },
    {
      key: 'data',
      name: 'Data'
    },
    {
      key: 'visualization',
      name: 'Visualization'
    },
    {
      key: 'interaction',
      name: 'Interaction'
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