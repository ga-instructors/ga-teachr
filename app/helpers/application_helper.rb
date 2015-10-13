module ApplicationHelper
  def gravatar_url(email, size=256)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def silly_pun_generator
    [
      "Thank You!",
      "Your feedback is appreciated",
      "TPS Reports",
      "Yeah, those are Promises.",
      "# TODO:",
      "LEARNING OBJECTIVES"
    ].sample
  end

end
