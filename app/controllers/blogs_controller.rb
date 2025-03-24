class BlogsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @blogs = Blog.all
    end
  
    def new
      @blog = Blog.new
    end
  
    def create
      @blog = current_user.blogs.build(blog_params)
      if @blog.save
        flash[:notice] = "Blog created successfully!"
        redirect_to blogs_path
      else
        flash[:alert] = "Failed to create blog."
        render :new, status: :unprocessable_entity
      end
    end
    def edit
        @blog = Blog.find_by(id: params[:id])
      
        if @blog.nil?
          flash[:alert] = "Blog not found"
          redirect_to blogs_path
        end
      end
    
      def update
        @blog = Blog.find_by(id: params[:id])
      
        if @blog.update(blog_params)
          flash[:notice] = "Blog updated successfully!"
          redirect_to blog_path(@blog)
        else
          flash[:alert] = "Error updating blog."
          render :edit, status: :unprocessable_entity
        end
      end
      

    def show
        @blog = Blog.find_by(id: params[:id])
      
        if @blog.nil?
          flash[:alert] = "Blog not found"
          redirect_to blogs_path
        end
      end

      def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        flash[:notice] = "Blog deleted successfully."
        redirect_to blogs_path
      end      
      
      
    private
  
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
  end
  