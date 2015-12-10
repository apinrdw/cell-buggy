class HomeScreen < PM::TableScreen
  title "Your title here"
  stylesheet HomeScreenStylesheet

  attr_accessor :cell_class

  def on_load
    set_nav_bar_button :left, system_item: :camera, action: :nav_left_button
    set_nav_bar_button :right, title: "Right", action: :nav_right_button
  end

  def nav_left_button
    mp 'Left button'
  end

  def nav_right_button
    mp 'Right button'
  end

  def table_data
    params = {
      text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
      image: 'https://placehold.it/48x48',
      author: 'apinrdw'
    }

    [
      {
        cells: 20.times.map do |i|
          post = Post.new(params.merge(title: "Post #{i + 1}"))

          {
            cell_class: cell_class,
            height: 60,
            properties: {
              post: post
            }
          }
        end
      }
    ]
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
