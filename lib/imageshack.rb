require "rest_client"
require 'nokogiri'

class ImageShack
  def rest_upload
    post_data = {}
    post_data['key'] = "#{ENV[IMAGESHACK_KEY]}"
    post_data['a_user_name'] =  "#{ENV[IMAGESHACK_UID]}"
    post_data['public'] = "no"
    post_data['fileupload'] = File.new("#{Rails.root}/assets/images/image_wall", "rb")
    response = RestClient.post('http://imageshack.us/upload_api.php', post_data)
    response = CGI::unescapeHTML(response)
    doc = Nokogiri::XML(response)
    puts doc.root.elements.last.elements.first.children.first.text if doc.root.elements.last.elements.first.name = "image_link" and doc.root.elements.last.name == "links"
    puts "rating = #{doc.root.elements.first.children[1].children.text.to_i}"
    puts "width = #{doc.root.elements[2].children[1].children.text.to_i}"
    puts "height = #{doc.root.elements[2].children[3].children.text.to_i}"
    puts "#{doc.root.elements[5].name} = #{doc.root.elements[5].children.text}"
  end
end