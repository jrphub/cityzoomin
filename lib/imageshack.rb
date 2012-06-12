require "rest_client"

class ImageShack
  def rest_upload
    post_data = {}
    post_data['key'] = "#{ENV[IMAGESHACK_KEY]}"
    post_data['a_user_name'] =  "#{ENV[IMAGESHACK_UID]}"
    post_data['public'] = "no"
    post_data['fileupload'] = File.new('/home/dknight/kwin trouble.png', "rb")
    response = RestClient.post('http://imageshack.us/upload_api.php', post_data)
    response = CGI::unescapeHTML(response)
    puts response
  end
end