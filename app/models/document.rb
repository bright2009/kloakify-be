class Document < ApplicationRecord
  has_many_attached :files

  def file_urls
    files.map { |file| Rails.application.routes.url_helpers.url_for(file) } if files.attached?
  end
end
