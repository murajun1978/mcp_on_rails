module Tools
  class ArticlesList < ::MCP::Tool
    description "List articles with optional partial title match. Supports pagination."
    input_schema(
      properties: {
        query:  { type: "string", description: "Partial match on title (optional)" },
        limit:  { type: "integer", minimum: 1, maximum: 100, default: 20 },
        offset: { type: "integer", minimum: 0, default: 0 }
      }
    )
    annotations(
      read_only_hint: true,
      idempotent_hint: true
    )

    class << self
      def call(query: nil, limit: 20, offset: 0, server_context:)
        articles = Article.search_by_title(query).order(id: :desc).limit(limit).offset(offset)

        rows = articles.pluck(:id, :title, :content)
        items = rows.map { |id, title, content|
          { id: id, title: title, content_preview: content.to_s[0, 120] }
        }

        MCP::Tool::Response.new([
          { type: "text", text: { count: items.size, items: items }.to_json }
        ])
      end
    end
  end
end