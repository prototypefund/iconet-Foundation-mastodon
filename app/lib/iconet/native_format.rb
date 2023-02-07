# frozen_string_literal: true

class Iconet::NativeFormat < Iconet::Format

  def initialize(attributes)
    super(attributes)
    @text = @attributes[:text] || ''
  end

  def matches?
    true
  end

  def updated_attributes
    { iconet: template}
  end

  def template
    {
      # TODO Setting a context makes the json parser look up the (not existing) vocabulary
      "@context": "https://static.iconet-foundation.org/ns#",
      "@type": "Packet",
      # TODO set @id in note_serializer
      "@id": "localhost:3000/posts/TODO_ID",
      "interpreterManifests": [
        {
          "manifestUri": "http://neta.localhost/iconet/formats/mastodon-toot/manifest.json",
          "inputTypes": ["application/mastodontoot"],
          "targetTypes": ["application/iconet+html"],
          "sha-512": "<sha-512 hash of the manifest document linked>"
        }
      ],
      "content": [
        {
          "packetType": "application/mastodontoot",
          "payload": @text,
        }
      ]
    }
  end

end
