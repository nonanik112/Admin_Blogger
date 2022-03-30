class PostsController < ApplicationController
	def index
		# @posts = Post.all.order('created_at DESC')
		# @post = Post.published
		@posts = Post.all
		@categories = Category.all
	end

  def create
		@posts = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render "new"
		end
  end

	def new
	  @post = Post.new
	end

	def edit
	  @post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
		@posts = Post.order("created_at desc").limit(4).offset(1)
	end

  def update
    @post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render "edit"
		end
  end

	def destroy
	  @post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :image, :category_id, :author_id)
		end
end

# https://github.com/MMagdys/Blog/blob/master/app/admin/dashboard.rb#L5
