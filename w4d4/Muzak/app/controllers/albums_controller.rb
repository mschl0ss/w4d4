
class AlbumsController < ApplicationController


    def index

    end

    def new
        @album = Album.new
        
    end
end