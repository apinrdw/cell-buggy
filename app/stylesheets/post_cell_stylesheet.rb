module PostCellStylesheet
  def layout_cell(view)
    view.append!(UIImageView, :post_image_cell)
    view.append!(UILabel, :post_title_cell)
    view.append!(UILabel, :post_text_cell)
    view.append!(UILabel, :post_author_cell)
  end

  def post_cell(st)
    st.frame = { w: screen_width }
  end

  def post_image_cell(st)
    st.frame = { l: 5, t: 5, w: 48, h: 48 }
    st.view.layer.cornerRadius = st.frame.width / 2
    st.clips_to_bounds = true
  end

  def post_title_cell(st)
    st.frame = { rop: 10, t: 5, fr: 5, h: 18 }
    st.font = font.system(16)
    st.color = color.from_hex('#2483c5')
  end

  def post_text_cell(st)
    st.frame = { l: 63, bp: 0, fr: 5, h: 18 }
    st.font = font.system(12)
  end

  def post_author_cell(st)
    st.frame = { l: 63, bp: 0, fr: 5, h: 18 }
    st.font = font.system(14)
    st.text_alignment = :right
    st.color = color.from_hex('#2483c5')
  end
end
