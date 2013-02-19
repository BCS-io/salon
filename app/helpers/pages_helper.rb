module PagesHelper

  def current_page_path?(my_page_path)
    request.fullpath == page_path(my_page_path)
  end

  def root_path?
    request.fullpath == root_path
  end

end