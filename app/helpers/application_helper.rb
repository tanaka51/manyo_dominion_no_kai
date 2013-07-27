# -*- coding: utf-8 -*-
module ApplicationHelper
  # このメソッドはどうにかした方がよいと思う
  def newline(text)
    raw(html_escape(text).gsub("\n", "<br />"))
  end

  def emojify(content)
    # herokuでデプロイ時にフックさせる方法わからないのでここでやる(きたない)
    emoji_dir = File.join(Rails.root, "public/assets/")
    if Rails.env == "production" && !File.directory?(emoji_dir)
      FileUtils.cp_r Emoji.images_path, emoji_dir
    end

    h(content).to_str.gsub(/:([a-z0-9\+\-_]+):/) do |match|
      if Emoji.names.include?($1)
        '<img alt="' + $1 + '" height="20" src="' + (Rails.env == "production" ? "/assets/images/emoji/#{$1}.png" : asset_path("emoji/#{$1}.png")) + '" style="vertical-align:middle" width="20" />'
      else
        match
      end
    end.html_safe if content.present?
  end
end
