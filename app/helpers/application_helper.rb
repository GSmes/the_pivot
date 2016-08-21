module ApplicationHelper
  def login_path?
    request.path == login_path
  end

  private

  def formatted_referrer
    '/' + request.referrer.split('/')[-2..-1].join('/') if request.referrer
  end
end
