class MarkdownConverter
    def initialize
            
    end

    def convert(text)
        html = text.dup # create text copy
        html = convert_headers(html)
        html = convert_bold(html)

        html

    end


    def convert_headers(text)
        text.gsub(/^# (.*)$/, '<h1>\1<h1>')   
    end
end