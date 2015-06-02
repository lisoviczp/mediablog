class VibesController < ApplicationController
  def index
  	@vibe = Vibe.order('created_at DESC') # .page(params[:page])
  end

  def edit
  	@vibe = Vibe.find(params[:id])
  end

  def show
  	@vibe = Vibe.find(params[:id])
  end

  def new
  	@vibe = Vibe.new
  end

  def create
    @vibe = Vibe.new(vibe_params)

    if @vibe.vibeType == "2"
	    start= 'content="soundcloud://sounds:'
	    i = open(@vibe.url).read.index(start)
	    @vibe.uid = open(@vibe.url).read[i+29..i+37] 
  	elsif @vibe.vibeType == "1"
  		@vibe.uid = @vibe.url
  	elsif @vibe.vibeType == "3"
      start = 'watch'
      i = @vibe.url.index(start)
      pp = @vibe.url[i, i+1]
  		@vibe.uid = pp[8,100]
	end
		

    respond_to do |format|
      if @vibe.save
        format.html { redirect_to root_path, notice: 'vibe was successfully created.' }
        format.json { render :show, status: :created, location: @vibe }
      else
        format.html { render :new }
        format.json { render json: @vibe.errors, status: :unprocessable_entity }
      end
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vibe
      @vibe = vibe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vibe_params
      params.require(:vibe).permit(:vibeType, :title, :body, :url, :approved)
    end
end

