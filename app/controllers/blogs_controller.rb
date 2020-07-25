class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout 'blog'
  access all: [:show, :index], user: {except: [:edit, :new, :create, :update, :destroy, :toggle_status]}, site_admin: :all
  #May include test at a later time to access param

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.page(params[:page]).per(5)
    @page_title = "My Portfolio Blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body # This would be better used with tags instead of the body of the blog post.
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :topic_id)
    end
end
