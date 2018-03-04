class MyDataMethods
  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.posts_by_author(properties)
    Post.joins(:author).group('authors.name').order('authors.name').count
  end

  # [
  #   [["Jul 3, 2016", "Hilton"], 2],
  #   [["Jul 10, 2016", "Hilton"], 2],
  #   ...
  #   [["Jul 3, 2016", "Carlee"], 3],
  #   [["Jul 10, 2016", "Carlee"], 5],
  #   ...
  # ]
  def self.posts_by_created_at_week_and_author(properties)
    # The `group_by_week` method is provided by the `groupdate` gem.
    Post.joins(:author).group_by_week('posts.created_at').group('authors.name').count.map do |(date, author_name), count|
      [[date.strftime('%b %-d, %Y'), author_name], count]
    end
  end

  # { 'Bernice' => 191, 'Carlee' => 160, 'Edison' => 60, ... }
  def self.posts_by_author_with_filters(properties)
    ui_filters = properties[:ui_filters]

    posts = Post.joins(:author).group('authors.name').order('authors.name')
    posts = posts.where(created_at: ReportsKit.parse_date_range(ui_filters[:created_at])) if ui_filters[:created_at].present?
    posts = posts.where(is_featured: true) if ui_filters[:is_featured]
    posts = posts.where(author_id: ui_filters[:author]) if ui_filters[:author].present?
    posts = posts.where('title ILIKE ?', "%#{ui_filters[:title]}%") if ui_filters[:title].present?
    posts.count
  end
end
