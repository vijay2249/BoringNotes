import javascript

// Define a predicate to identify JavaScript code within Markdown files
predicate javascriptInMarkdown(CodeFile file, Comment comment) {
  exists(Javascript code |
    code.getAncestorOrSelfOfType(CommentBlock) = comment and
    code.hasComment(comment) and
    file = code.getFile()
  )
}

import python

// Define a predicate to identify Python code within Markdown files
predicate pythonInMarkdown(CodeFile file, Comment comment) {
  exists(Python code |
    code.getAncestorOrSelfOfType(CommentBlock) = comment and
    code.hasComment(comment) and
    file = code.getFile()
  )
}

from CodeFile file, Comment comment
where
  file.hasName("*.md") and
  (javascriptInMarkdown(file, comment) or pythonInMarkdown(file, comment))
select
  file,
  comment
