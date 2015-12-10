class Post
  attr_accessor :title, :text, :image, :author

  def initialize(args = {})
    args.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end
