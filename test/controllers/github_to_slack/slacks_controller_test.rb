require 'test_helper'

module GithubToSlack
  class SlacksControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @slack = github_to_slack_slacks(:one)
    end

    test "should get index" do
      get slacks_url
      assert_response :success
    end

    test "should get new" do
      get new_slack_url
      assert_response :success
    end

    test "should create slack" do
      assert_difference('Slack.count') do
        post slacks_url, params: { slack: { channel_name: @slack.channel_name, username: @slack.username, webhook_url: @slack.webhook_url } }
      end

      assert_redirected_to slack_url(Slack.last)
    end

    test "should show slack" do
      get slack_url(@slack)
      assert_response :success
    end

    test "should get edit" do
      get edit_slack_url(@slack)
      assert_response :success
    end

    test "should update slack" do
      patch slack_url(@slack), params: { slack: { channel_name: @slack.channel_name, username: @slack.username, webhook_url: @slack.webhook_url } }
      assert_redirected_to slack_url(@slack)
    end

    test "should destroy slack" do
      assert_difference('Slack.count', -1) do
        delete slack_url(@slack)
      end

      assert_redirected_to slacks_url
    end
  end
end
