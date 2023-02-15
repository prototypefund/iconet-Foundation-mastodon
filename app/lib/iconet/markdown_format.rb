# frozen_string_literal: true

class Iconet::MarkdownFormat < Iconet::Format

  def initialize(attributes)
    super(attributes)
    @text = @attributes[:text] || ''
  end

  def matches?
    markdown_code_syntax? || markdown_keyword?
  end

  def updated_attributes
    remove_keyword! if markdown_keyword?
    markdown
  end

  def markdown_code_syntax?
    @text.starts_with?('`')
  end

  def markdown_keyword?
    @text.starts_with?(markdown_keyword)
  end

  def markdown_keyword
    "markdown:\n"
  end

  def text_without_keyword
    @text[markdown_keyword.length..-1]
  end

  def markdown
    { iconet: markdown_template, text: @text }
  end

  def remove_keyword!
    @text = text_without_keyword
  end

  def markdown_template
    {
      # TODO Setting a context makes the json parser look up the (not existing) vocabulary
      "@context": "https://ns.iconet-foundation.org#",
      "@type": "Packet",
      # TODO set @id in note_serializer
      "@id": "localhost:3000/posts/TODO_ID",
      "interpreterManifests": [
        {
          "manifestUri": "http://neta.localhost/iconet/formats/markdown/manifest.json",
          "sourceTypes": ["text/markdown"],
          "targetTypes": ["application/iconet+html"],
          "sha-512": "<sha-512 hash of the manifest document linked>"
        }
      ],
      "content": [
        {
          "packetType": "text/markdown",
          "payload": @text,
        }
      ]
    }
  end
end
