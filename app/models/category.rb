class Category < ActiveHash::Base
  field :show_in_nav, default: true

  self.data = [
    {
      key: 'demo',
      name: 'Demo',
      show_in_nav: false
    },
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