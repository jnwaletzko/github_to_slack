module GithubToSlack
  class CommunicatorsController < ActionController::Base
    def create
      Communicator.new(params[:payload]).deliver_message
      render json: {}
    end
  end
end
