module ApplicationHelper

    def auth_token
        html = '<input type="hidden" name="authenticity_token" value='
        html+= '"<%=form_authenticity_token>">'
        html.html_safe
        # debugger
    end
end
