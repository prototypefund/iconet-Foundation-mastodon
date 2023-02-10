# frozen_string_literal: true

class IconetFormatter

  def initialize(status)
    @status    = status
  end

  def generate
    with_overwritten_fields
  end

  private

  def with_overwritten_fields
    @status.iconet.merge(updated_field)
  end

  def updated_field
    {
      '@id': ActivityPub::TagManager.instance.uri_for(@status),
      actor: ActivityPub::TagManager.instance.url_for(@status.account),
      to: mentioned_uris
    }
  end

  def mentioned_uris
    @status.mentions.map { |mention| ActivityPub::TagManager.instance.url_for(mention.account) }
  end
end
