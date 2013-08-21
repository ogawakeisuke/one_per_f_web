class MainsController < ApplicationController
  def index

  end

  def parse
    render "aiff please" and return unless "audio/aiff" == params[:attachment].content_type

    data = params[:attachment].read.force_encoding("UTF-8")

    File.write("#{Rails.root}/tmp/hoge.aif", data)
    @result = OnePerF.parse("#{Rails.root}/tmp/hoge.aif")
    File.delete("#{Rails.root}/tmp/hoge.aif")
  end

end
