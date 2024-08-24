;; extends



(
  (string_fragment) @string_content @injection.content
  (#match? @string_content "--sql")
  (#set! injection.language "sql")
)


; (
;  (comment) @_comment-text
;  (#match? @_comment-text "sql")
;  (template_string) @sql
; )

; (
;  (comment) @_comment-text
;  (#match? @_comment-text "sql")
;  (template_string (string_fragment) @injection.content) 
;  (#set! injection.language "sql")
; )
;
; (
;  (comment) @_comment-text
;  (#match? @_comment-text "sql")
;  (template_string) @injection.content
;  (#set! injection.language "sql")
; )


; ; /* html */ `<html>`
; ; /* sql */ `SELECT * FROM foo`
; (variable_declarator
;   (comment) @injection.language (#offset! @injection.language 0 3 0 -3)
;   (template_string) @injection.content (#offset! @injection.content 0 1 0 -1)
;   )
;
