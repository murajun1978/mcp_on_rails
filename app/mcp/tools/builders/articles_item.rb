module Tools
  module Builders
    class ArticlesItem
      def self.build(rows)
        rows.map do |id, title, content|
          {
            id: id,
            title: title,
            content_preview: content.to_s[0, 120]
          }
        end
      end
    end
  end
end
