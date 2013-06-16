module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Picture Book"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  # Image & Audio tags that can accept null
  def safe_image_tag(source, options = {})
    source ||= "/assets/picture_book.png"
    image_tag(source, options)
  end

  def safe_audio_tag(source, options = {})
  	if source != nil
  	  audio_tag(source, options)
  	else
  	end
  end
end
