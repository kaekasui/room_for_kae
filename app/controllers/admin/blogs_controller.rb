class Admin::BlogsController < ApplicationController
  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @admin_blogs = Admin::Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_blogs }
    end
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
    @admin_blog = Admin::Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_blog }
    end
  end

  # GET /admin/blogs/new
  # GET /admin/blogs/new.json
  def new
    @admin_blog = Admin::Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_blog }
    end
  end

  # GET /admin/blogs/1/edit
  def edit
    @admin_blog = Admin::Blog.find(params[:id])
  end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @admin_blog = Admin::Blog.new(params[:admin_blog])

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to @admin_blog, notice: 'Blog was successfully created.' }
        format.json { render json: @admin_blog, status: :created, location: @admin_blog }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/blogs/1
  # PUT /admin/blogs/1.json
  def update
    @admin_blog = Admin::Blog.find(params[:id])

    respond_to do |format|
      if @admin_blog.update_attributes(params[:admin_blog])
        format.html { redirect_to @admin_blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @admin_blog = Admin::Blog.find(params[:id])
    @admin_blog.destroy

    respond_to do |format|
      format.html { redirect_to admin_blogs_url }
      format.json { head :no_content }
    end
  end
end