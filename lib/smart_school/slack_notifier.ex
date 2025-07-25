defmodule SmartSchool.SlackNotifier do
  # This module is responsible for sending notifications to slack

  @webhook_url System.get_env("SLACK_WEBHOOK_URL")

  def send_login_notification(user) do
    payload = %{
      "text" => "User #{user.name} has logged in Smart School.",
      "attachements" => [
        %{
          "color" => "#36a64f",
          "fields" => [
            %{"title" => "User Name", "value" => user.name, "short" => true},
            %{"title" => "Email", "value" => user.email, "short" => true},
            %{"title" => "Role", "value" => user.role.name, "short" => true}
          ]
        }
      ]
    }

    client =
      Tesla.client([
        {Tesla.Middleware.BaseUrl, "https://hooks.slack.com/services"},
        {Tesla.Middleware.Headers, [{"Content-Type", "application/json"}]},
        Tesla.Middleware.JSON
      ])

    Tesla.post(client, @webhook_url, payload)
  end
end
