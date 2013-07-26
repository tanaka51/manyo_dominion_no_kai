# -*- coding: utf-8 -*-
module ApplicationHelper
  # このメソッドはどうにかした方がよいと思う
  def newline(text)
    raw(html_escape(text).gsub("\n", "<br />"))
  end
end
