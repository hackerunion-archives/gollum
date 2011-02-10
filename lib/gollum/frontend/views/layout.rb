require 'cgi'

module Precious
  module Views
    class Layout < Mustache
      include Rack::Utils
      alias_method :h, :escape_html

      attr_reader :name

      def escaped_name
        CGI.escape(@name)
      end

      def current_users
        `who | cut -f1 -d' ' | sort | uniq | wc -w`
      end

      def total_users
        `cat /etc/passwd | wc -l`.to_i - 31
      end

      def title
        "Home"
      end
    end
  end
end
