class Paper < ApplicationRecord
  require 'open-uri'

  has_many :contents

  validates :url, presence: true

  after_create :squeeze_content

  ##
  # Grabbing content from the URL
  # Automatically called after Paper is created
  # Will save the content grabbed to Content directly
  def squeeze_content
    uri = URI.parse(self.url)
    uri.open { |f|
      f.each_line{ |line| 
        1.upto(3) do |i|
          # Get content of headings on the line with dynamic variable
          instance_variable_set("@heading#{i}", line.scan(/<h#{i}.*?>(.+?)<\/h#{i}>/im))

          # Check if there any headings on the line
          if instance_variable_get("@heading#{i}").any?
            instance_variable_get("@heading#{i}").each { |h| 
              # Create new content of Paper
              self.contents.create(:name => "h#{i}", :value => h[0].to_s)
            }
          end
        end
      }
    }
  end
end
