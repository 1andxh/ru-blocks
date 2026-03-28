class MarkdownConverter
    def initialize
            
    end

    def convert(text)
        if text.start_with?("# ")
            content = text.sub("# ", "").strip
            "<h1>#{content}</h1>"
        else
            "<p>#{text.strip}</p>"
        end

    end


    def convert_headers(text)
        text.gsub(/^# (.*)$/, '<h1>\1<h1>')   
    end
end

converter = MarkdownConverter.new 
puts converter.convert("# If you see this, it works!")
puts converter.convert("# If you don't? it didn't work")