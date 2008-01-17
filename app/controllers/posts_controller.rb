class PostsController < ApplicationController

  # GET /posts
  # GET /posts.xml
  def index
    @post, @prev = Post.find(:all, :order => "photo DESC", :limit => 2)
    
    respond_to do |format|
      format.html { render :action => :show}
      format.xml { render :xml => @post }
    end
  end

  # GET /posts/list
  # GET /posts/list.xml
  def list
    @posts = Post.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    # TODO Make this Fotocie-style code GO AWAY!
    posts = Post.find(:all, :order => "photo DESC")
    @post = Post.find(params[:id])
    index = posts.index(@post)
    @prev = posts[index+1]
    @next = posts[index-1] if index > 0

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @files = Dir[RAILS_ROOT + "/public/db/*.jpg"].map{|i| File.basename(i)}.map{|i| [i,i]}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @files = Dir[RAILS_ROOT + "/public/db/*.jpg"].map{|i| File.basename(i)}.map{|i| [i,i]}
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
