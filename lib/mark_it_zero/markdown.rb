require 'redcarpet'

module MarkItZero
  class Markdown
    @@renderer = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        hard_wrap: true,
        link_attributes: { target: '_blank' }
      ),
      autolink: true,
      fenced_code_blocks: true,
      highlight: true,
      space_after_headers: true,
      strikethrough: true,
      tables: true,
      underline: true,
      fenced_code_blocks: true,
      qoute: true
    )

    def self.cleanse(text)
      return '' if text.blank?
      text.gsub(
        /(?:http[s]?:\/\/)?(?:www\.)?(?:youtu\.be)\/(?:watch\?v=)?(.+)/,
        '<iframe width="420" height="345" src="http://www.youtube.com/embed/\1" frameborder="0" allowfullscreen></iframe>'
      ).gsub(
        /[”“]/,
        '"'
      ).gsub(
        /\[file\:(.*)\]/,
        '<p class="file"><code>\1</code></p>'
      )
    end

    def self.to_html(text)
      @@renderer.render(cleanse(text))
    end

  end
end
