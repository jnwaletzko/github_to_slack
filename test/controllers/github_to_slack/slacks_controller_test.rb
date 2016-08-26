require 'test_helper'

module GithubToSlack
  class SlacksControllerTest < ActionController::TestCase
    setup do
      @slack = github_to_slack_slacks(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:slacks)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create slack" do
      assert_difference('Slack.count') do
        post :create, slack: { channel_name: @slack.channel_name, username: @slack.username, webhook_url: @slack.webhook_url }
      end

      assert_redirected_to slack_path(assigns(:slack))
    end

    test "should show slack" do
      get :show, id: @slack
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @slack
      assert_response :success
    end

    test "should update slack" do
      patch :update, id: @slack, slack: { channel_name: @slack.channel_name, username: @slack.username, webhook_url: @slack.webhook_url }
      assert_redirected_to slack_path(assigns(:slack))
    end

    test "should destroy slack" do
      assert_difference('Slack.count', -1) do
        delete :destroy, id: @slack
      end

      assert_redirected_to slacks_path
    end
  end
end
