require 'test_helper'

module GithubToSlack
  class SlackersControllerTest < ActionController::TestCase
    setup do
      @slacker = github_to_slack_slackers(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:slackers)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create slacker" do
      assert_difference('Slacker.count') do
        post :create, slacker: { channel_name: @slacker.channel_name, username: @slacker.username, webhook_url: @slacker.webhook_url }
      end

      assert_redirected_to slacker_path(assigns(:slacker))
    end

    test "should show slacker" do
      get :show, id: @slacker
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @slacker
      assert_response :success
    end

    test "should update slacker" do
      patch :update, id: @slacker, slacker: { channel_name: @slacker.channel_name, username: @slacker.username, webhook_url: @slacker.webhook_url }
      assert_redirected_to slacker_path(assigns(:slacker))
    end

    test "should destroy slacker" do
      assert_difference('Slacker.count', -1) do
        delete :destroy, id: @slacker
      end

      assert_redirected_to slackers_path
    end
  end
end
