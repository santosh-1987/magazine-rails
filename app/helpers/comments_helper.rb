module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:ul, nested_comments(sub_comments), :class => "nested_comments")
    end.join.html_safe
  end
end