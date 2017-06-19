class Document < ApplicationRecord
    
    
    def initialize(params = {})
        file = params.delete(:file)
        super
        if file
            self.filename = sanitize_filename(file.original_filename)
            self.content_type = file.content_type
            self.file_contents = file.read
        end
    end
    
    after_commit { notify }
    
    private
        def sanitize_filename(filename)
            # Get only the filename, not the whole path (for IE)
            return File.basename(filename)
        end
        
        def notify
            Notification.create(event: "New Document: #{self.filename}")
        end
end
