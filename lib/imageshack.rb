require "rest_client"

class ImageShack
  def rest_upload
    post_data = {}
    post_data['key'] = "479DNRXY61263849b91ad44aeb92a46a3b6224d3"
    post_data['fileupload'] = File.new('/home/dknight/kwin trouble.png', "rb")
    RestClient.post('http://imageshack.us/upload_api.php', post_data)
  end
end