module GithubToSlack
  class SlackersController < ActionController::Base
    before_action :set_slacker, only: [:show, :edit, :update, :destroy]

    # GET /slackers
    def index
      @slackers = Slacker.all
    end

    # GET /slackers/1
    def show
    end

    # GET /slackers/new
    def new
      @slacker = Slacker.new
    end

    # GET /slackers/1/edit
    def edit
    end

    # POST /slackers
    def create
      @slacker = Slacker.new(slacker_params)

      if @slacker.save
        redirect_to @slacker, notice: 'Slacker was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /slackers/1
    def update
      if @slacker.update(slacker_params)
        redirect_to @slacker, notice: 'Slacker was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /slackers/1
    def destroy
      @slacker.destroy
      redirect_to slackers_url, notice: 'Slacker was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_slacker
        @slacker = Slacker.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def slacker_params
        params.require(:slacker).permit(:webhook_url, :channel_name, :username)
      end
  end
end
