module ApplicationHelper
  def include_meta_tags
    name = @settings[:general][:website_title]
    title = @settings[:general][:website_tagline]
    description = @settings[:general][:website_description]
    description = ActionController::Base.helpers.strip_tags(description).
      gsub("\n", "").
      gsub("\r", "")
    url = @settings[:general][:website_url]
    image_url = @settings[:general][:website_logo_url]

    if Rails.env.production?
      unless image_url.include?('//')
        host = ENV.fetch("HOST")
        protocole = Rails.application.config.force_ssl ? "https://" : "http://"
        image_url = "#{protocole}#{host}#{image_url}"
      end
    end

    display_meta_tags({
      site: name,
      title: title,
      description: description,
      canonical: url,
      og: {
        site_name: name,
        url: url,
        title: title,
        description: description,
        image: image_url,
        type: "website"
      },
      twitter: {
        url: url,
        title: title,
        description: description,
        image: image_url,
        card: "summary"
      }
    })
  end

  def sidebar_image_tag
    tagline = @settings[:general][:website_tagline].presence
    image_url = @settings[:general][:website_logo_url].presence
    if image_url
      image_tag(image_url, alt: tagline)
    else
      ""
    end
  end

  def sidebar_tagline
    tagline = @settings[:general][:website_description].presence
    (tagline || "").html_safe
  end

  def social_links
    links = @settings[:general][:social_links] || []
    links.reject! { |l| l.empty? }

    social_icons_map = {
      "facebook.com" => "facebook",
      "vk.com" => "vk",
      "twitter.com" => "twitter",
      "behance.net" => "behance",
      "github.com" => "github",
      "pinterest.com" => "pinterest",
      "instagram.com" => "instagram",
      "youtube.com" => "youtube-play",
      "linkedin.com" => "linkedin",
      "medium.com" => "medium",
      "vimeo.com" => "vimeo",
      "slack.com" => "slack",
      "dribbble.com" => "dribbble",
      "soundcloud.com" => "soundcloud",
      "mailto:" => "envelope"
    }
    social_icons_domains = social_icons_map.keys

    html = links.collect do |l|
      key = social_icons_domains.select { |domain| l.include?(domain) }.first
      icon = social_icons_map[key]

      link_to l, target: "_blank" do
        fa_stacked_icon("#{icon} inverse", base: "circle", class: "fa-1x")
      end
    end
    .join("")

    html.html_safe
  end

  def footer_copyright
    title = @settings[:general][:website_title]
    year = Date.today.year
    html = "#{title} &copy; #{year}"
    """<div class='footer-copyright'>
         #{html}
       </div>""".html_safe
  end
end
