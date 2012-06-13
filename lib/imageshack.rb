require "rest_client"
require 'nokogiri'

class ImageShack
  def rest_upload
    post_data = {}
    post_data['key'] =  "#{ENV[IMAGESHACK_KEY]}"
    post_data['a_user_name'] =  "#{ENV[IMAGESHACK_UID]}"
    post_data['public'] = "no"
    post_data['fileupload'] = File.new('/home/dknight/dinesh.jpg', "rb")
    response = RestClient.post('http://imageshack.us/upload_api.php', post_data)
    response = CGI::unescapeHTML(response)
    doc = Nokogiri::XML(response)
    puts doc.root.elements.last.elements.first.children.first.text if doc.root.elements.last.elements.first.name = "image_link" and doc.root.elements.last.name == "links"
  end
end