class MyAutocompleteMethods
  def self.author(params, properties)
    authors = Author.order('LOWER(name)')
    authors.map { |result| { id: result.id, text: result.to_s } }
  end
end
