module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 40 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    default = "wavatar"
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=#{default}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

=begin
In addition to allowing you to use your own image, Gravatar has a number of built in options which you can also use as defaults. Most of these work by taking the requested email hash and using it to generate a themed image that is unique to that email address. To use these options, just pass one of the following keywords as the d= parameter to an image request:

404: do not load any image if none is associated with the email hash, instead return an HTTP 404 (File Not Found) response
mm: (mystery-man) a simple, cartoon-style silhouetted outline of a person (does not vary by email hash)
identicon: a geometric pattern based on an email hash
monsterid: a generated 'monster' with different colors, faces, etc
wavatar: generated faces with differing features and backgrounds
retro: awesome generated, 8-bit arcade-style pixelated faces
blank: a transparent PNG image (border added to HTML below for demonstration purposes)
=end
