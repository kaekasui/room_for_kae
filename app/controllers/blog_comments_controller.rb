class BlogCommentsController < ApplicationController
  # GET /blog_comments
  # GET /blog_comments.json
  def index
    @blog_comments = BlogComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_comments }
    end
  end

  # GET /blog_comments/1
  # GET /blog_comments/1.json
  def show
    @blog_comment = BlogComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_comment }
    end
  end

  # GET /blog_comments/1/edit
  def edit
    @blog_comment = BlogComment.find(params[:id])
  end

  # POST /blog_comments
  # POST /blog_comments.json
  def create
    @blog_comment = BlogComment.new(params[:blog_comment])
    @blog_comment.update_attributes(blog_id: params[:blog_id], ip: request.remote_ip)
    @blog = Blog.find(params[:blog_id])

    respond_to do |format|
      if @blog_comment.save
        format.html { redirect_to @blog, notice: 'Blog comment was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog_comment }
        format.js { render }
      else
        format.html { render action: "confirm" }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_comments/1
  # PUT /blog_comments/1.json
  def update
    @blog_comment = BlogComment.find(params[:id])

    respond_to do |format|
      if @blog_comment.update_attributes(params[:blog_comment])
        format.html { redirect_to @blog_comment, notice: 'Blog comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_comments/1
  # DELETE /blog_comments/1.json
  def destroy
    @blog_comment = BlogComment.find(params[:id])
    @blog_comment.destroy

    respond_to do |format|
      format.html { redirect_to blog_comments_url }
      format.json { head :no_content }
    end
  end
end
