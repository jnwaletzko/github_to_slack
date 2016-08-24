module GithubToSlack
  class SlacksController < ActionController::Base
    before_action :set_slack, only: [:show, :edit, :update, :destroy]

    # GET /slacks
    def index
      @slacks = Slack.all
    end

    # GET /slacks/1
    def show
    end

    # GET /slacks/new
    def new
      @slack = Slack.new
    end

    # GET /slacks/1/edit
    def edit
    end

    # POST /slacks
    def create
      @slack = Slack.new(slack_params)

      if @slack.save
        redirect_to @slack, notice: 'Slack was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /slacks/1
    def update
      if @slack.update(slack_params)
        redirect_to @slack, notice: 'Slack was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /slacks/1
    def destroy
      @slack.destroy
      redirect_to slacks_url, notice: 'Slack was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_slack
        @slack = Slack.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def slack_params
        params.require(:slack).permit(:webhook_url, :channel_name, :username)
      end
  end
end
