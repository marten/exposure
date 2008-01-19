class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  def exif
    EXIFR::JPEG.new(File.join(RAILS_ROOT, 'public', 'db', photo)).exif.to_hash
  end

end
