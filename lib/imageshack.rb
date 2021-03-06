require "rest_client"
require 'nokogiri'

class ImageShack
  def self.rest_upload(file)
    path = File.join(Rails.root, file)
    post_data = {}
    response = nil
    post_data['key'] = "#{ENV['IMAGESHACK_KEY']}"
    post_data['a_user_name'] =  "#{ENV['IMAGESHACK_ID']}"
    post_data['public'] = "no"
    post_data['fileupload'] = File.new(path, "rb")
    begin
      response = RestClient.post('http://imageshack.us/upload_api.php', post_data)
    rescue SocketError => e
      Rails.logger.debug e.inspect
    end

    if response.nil?
      return {:err => "Unable to reach hosting service as of now. Please try again later.", :url => nil}
    else
      response = CGI::unescapeHTML(response)
      doc = Nokogiri::XML(response)
      if doc.root.elements.first.name == "error"
        return {:err => doc.root.elements.first.attributes["id"].value, :url => nil}
      else
        puts doc.root.elements.last.elements.first.children.first.text if doc.root.elements.last.elements.first.name == "image_link" and doc.root.elements.last.name == "links"
        puts "rating = #{doc.root.elements.first.children[1].children.text.to_i}"
        puts "width = #{doc.root.elements[2].children[1].children.text.to_i}"
        puts "height = #{doc.root.elements[2].children[3].children.text.to_i}"
        puts "#{doc.root.elements[5].name} = #{doc.root.elements[5].children.text}"
        return {:err => nil, :url => doc.root.elements.last.elements.first.children.first.text}
      end
    end
  end
end