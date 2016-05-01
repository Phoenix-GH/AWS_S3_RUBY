module ApplicationHelper

  def fa_icon type
    ('<i class="fa fa-<%=type%>"></i>').html_safe
  end

  def get_download_link document
    document.attachment.url+'?dl=1' unless document.attachment.try(:url).nil?
  end
end
