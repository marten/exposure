class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :title, :caption, :photo
  
  def exif
    EXIFR::JPEG.new(File.join(RAILS_ROOT, 'public', 'db', photo)).exif.to_hash rescue nil
  end

end
