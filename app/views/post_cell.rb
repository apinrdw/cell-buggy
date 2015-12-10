class PostCell < PM::TableViewCell
  attr_accessor :post

  def on_load
    apply_style :post_cell
  end

  def post=(post)
    @post = post
    content = find(self.contentView)

    content.tap do |c|
      @image ||= content.append!(UIImageView, :post_image_cell)
      find(@image).style { |st| st.remote_image = post.image }

      @title ||= content.append!(UILabel, :post_title_cell)
      find(@title).data(post.title)

      @text ||= content.append!(UILabel, :post_text_cell)
      find(@text).data(post.text)

      @author ||= content.append!(UILabel, :post_author_cell)
      find(@author).data(post.author)

      c.find(:post_title_cell, :post_text_cell, :post_author_cell).reapply_styles

      p post.title
      p c.find(:post_image_cell).count
      p '====='
    end
  end
end
