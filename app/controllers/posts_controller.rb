class PostsController < ApplicationController

  def index
  	@post = Post.order('created_at DESC') # .page(params[:page])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)


    start= 'content="soundcloud://sounds:'
    i = open(@post.url).read.index(start)

    @post.uid = open(@post.url).read[i+29..i+37] 

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :url, :uid)
    end
end



# # in ruby we can use open-uri

# # require 'open-uri'
# # open("http://soundcloud.com") do |f|
# # 	puts f.base_uri
# # 	puts f.status
# # end

# page_source.index('content="soundcloud://sounds:')

# # page_source[2799:]

# start = 'content="soundcloud://sounds:'
# end = '"><meta property='
# s = page_source.index(start)

# # get the first index of end in the range starting at the index of s and to the end
# e = page_source.index(end, s)

# ourLine = page_source[s:e]

# # 'content="soundcloud://sounds:198813741'


#  tracknum = ourline[ourline.index("sounds:")+7:]