
class AlbumsController < ApplicationController


    def index

    end

    def new
        @band = Band.find(params[:band_id])
        @bands = Band.all
        @album = Album.new

        render :new

    end

    def create
        @album = Album.new(album_params)
        # debugger
        if @album.save!
            redirect_to bands_url
        else
            flash.now[:errors] = ['bad album.  I mean possibly a good album, but you did it wrong.']
            render :new
        end

    end


    private
    def album_params
        params.require(:album).permit(:title,:year,:band_id)
    end
end