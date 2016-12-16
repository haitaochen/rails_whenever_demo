class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show

   @post = Post.find(params[:id])

 end

 def new
   @post = Post.new
 end
 def create
   @post = Post.new(post_params)
   if @post.save
			respond_to do |format|
				format.html do
    				redirect_to  :back
    			end
    			format.js
    			end
		end
    #以上respond_to 为固定方法，先返回，在加载一个js.erb文件，即views/posts/create.js.erb
 end
 def destroy
   @post = Post.find(params[:id])
   if Post.delete(params[:id])
     respond_to do |format|
       format.html do
           redirect_to  posts_path
         end

         end
   end
   # 删除完返回即可
 end
 def post_params
   params.require(:post).permit(:name)
 end
end
