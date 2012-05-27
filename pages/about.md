
<ul>
{{# posts_limit_3 }}
  <li>
    <a href="{{url}}">{{title}}</a><br>
    {{content}}
  </li>
{{/ posts_limit_3 }}
</ul>

## Test mustache helper

The output below should be blank in production!

{{hello}}

## Test autolink

http://google.com

## Test fenced code blocks

````ruby
class Ruhoh
  module Templaters
    module Helpers
      def hello
        "Why hello there!"
      end
    end
  end
end
````
