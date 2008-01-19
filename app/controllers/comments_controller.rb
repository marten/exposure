class CommentsController < ApplicationController
  
  layout 'comments'
  
  def index
    @post = Post.find(params[:post_id])
    @exif = EXIFR::JPEG.new(File.join(RAILS_ROOT, 'public', 'db', @post.photo)).exif.to_hash
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Post.find(params[:post_id]).comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to post_comments_url(@comment.post) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
