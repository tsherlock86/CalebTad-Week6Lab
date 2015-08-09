tag = "~hello, how are you"

@tag_regex = /~([A-Za-z0-9]+)/

def create_search_link(string)
  "<%= link_to '#{string}', search_path(search_item: '#{string}') %>".html_safe
end

def check_for_tag(tag)
  @tag_regex.match(tag)
end

def replace_with_link(tag)
  tag.gsub!(check_for_tag(tag), create_search_link(check_for_tag(tag)))
end
