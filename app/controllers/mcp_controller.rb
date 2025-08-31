class McpController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    server = MCP::Server.new(
      name:  "Article MCP Server",
      tools: [Tools::ArticlesList],
      server_context: {
        request_id: request.uuid,
        current_user_id: (respond_to?(:current_user) && current_user&.id)
      }
    )

    render json: server.handle_json(request.body.read)
  end
end
