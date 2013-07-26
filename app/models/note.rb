# -*- coding: utf-8 -*-
class Note < ActiveRecord::Base
  acts_as_tree

  validates :title, presence: true
  validates :body, presence: true

  def build_replay
    children.new(title: replied_title)
  end

  # TODO: ActiveDecorator 案件な気がする
  def human_creator
    return "名無し" if creator.blank?
    creator
  end

  def replied_title
    "Re:: #{title}"
  end
end
