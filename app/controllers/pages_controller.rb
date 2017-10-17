class PagesController < ApplicationController
    def about
        @title = 'About us'
        @content = 'About content'
    end
end
