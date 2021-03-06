class BuggyPostCell < PM::TableViewCell
  attr_accessor :post

  def on_load
    apply_style :post_cell

    find(self.contentView).tap do |view|
      view.append!(UIImageView, :post_image_cell)
      view.append!(UILabel, :post_title_cell)
      view.append!(UILabel, :post_text_cell)
      view.append!(UILabel, :post_author_cell)
    end
  end

  def post=(post)
    @post = post
    find(self.contentView).tap do |c|
      c.find(UILabel).data('')
      c.find(:post_image_cell).style { |st| st.remote_image = post.image }
      c.find(:post_title_cell).data(post.title)
      c.find(:post_text_cell).data(post.text)
      c.find(:post_author_cell).data(post.author)

      c.find(:post_title_cell, :post_text_cell, :post_author_cell).reapply_styles

      p post.title
      p c.find(:post_image_cell).count
      p '====='
    end
  end
end
