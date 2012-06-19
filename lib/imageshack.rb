require "rest_client"
require 'nokogiri'

#TODO http://stackoverflow.com/questions/9568753/how-to-upload-files-in-rails
# TODO http://stackoverflow.com/questions/5776252/rails-3-upload-files-to-public-directory
#TODO http://www.practicalecommerce.com/blogs/post/432-Multiple-Attachments-in-Rails
#TODO http://shinylittlething.com/2009/07/20/multiple-file-upload-using-jquery-and-ruby-on-rails-tutorial/
#TODO http://stackoverflow.com/questions/5525972/how-to-select-multiple-files-for-upload
#TODO http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-button_tag
#TODO http://stackoverflow.com/questions/7352444/how-can-i-render-a-partial-page-on-click-a-html-button

class ImageShack
  def self.rest_upload(file)
    post_data = {}
    post_data['key'] = "#{ENV['IMAGESHACK_KEY']}"
    post_data['a_user_name'] =  "#{ENV['IMAGESHACK_UID']}"
    post_data['public'] = "no"
    #post_data['fileupload'] = File.new("#{Rails.root}/app/assets/images/bg.png", "rb")
    post_data['fileupload'] = file
    response = RestClient.post('http://imageshack.us/upload_api.php', post_data)
    response = CGI::unescapeHTML(response)
    doc = Nokogiri::XML(response)
    puts doc.root.elements.last.elements.first.children.first.text if doc.root.elements.last.elements.first.name == "image_link" and doc.root.elements.last.name == "links"
    puts "rating = #{doc.root.elements.first.children[1].children.text.to_i}"
    puts "width = #{doc.root.elements[2].children[1].children.text.to_i}"
    puts "height = #{doc.root.elements[2].children[3].children.text.to_i}"
    puts "#{doc.root.elements[5].name} = #{doc.root.elements[5].children.text}"
    return doc.root.elements.last.elements.first.children.first.text
  end
end