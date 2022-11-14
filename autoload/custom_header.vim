" ----------------------------------------------------------
" set default global values
if !exists('g:custom_header_begin')
    let g:custom_header_begin = '============================================================================='
endif
if !exists('g:custom_header_end')
    let g:custom_header_end = '============================================================================='
endif
if !exists('g:custom_header_author')
    let g:custom_header_author = ''
endif
if !exists('g:custom_header_email')
    let g:custom_header_email = ''
endif
if !exists('g:custom_header_company')
    let g:custom_header_company = ''
endif
" enable switches
if !exists('g:custom_header_filename_en')
    let g:custom_header_filename_en = 1
endif
if !exists('g:custom_header_author_en')
    let g:custom_header_author_en = 1
endif
if !exists('g:custom_header_email_en')
    let g:custom_header_email_en = 1
endif
if !exists('g:custom_header_company_en')
    let g:custom_header_company_en = 1
endif
if !exists('g:custom_header_create_en')
    let g:custom_header_create_en = 1
endif
if !exists('g:custom_header_modify_en')
    let g:custom_header_modify_en = 1
endif
if !exists('g:custom_header_revision_en')
    let g:custom_header_revision_en = 1
endif
if !exists('g:custom_header_description_en')
    let g:custom_header_description_en = 1
endif
if !exists('g:custom_header_tformat')
    let g:custom_header_tformat = '%Y-%m-%d %X'
endif

" ----------------------------------------------------------
" set field format
function! s:set_format()
    let b:field_filename    = ' Filename      : '
    let b:field_author      = ' Author        : '
    let b:field_email       = ' Email         : '
    let b:field_company     = ' Company       : '
    let b:field_create      = ' Created on    : '
    let b:field_modify      = ' Last Modified : '
    let b:field_revision    = ' Revision      : '
    let b:field_description = ' Description   : '
    let b:comment_char      = '//'
endfunction

" ----------------------------------------------------------
" insert header
function! custom_header#insert_header()

    " record original postion
    let org_row = line(".")
    let org_col = col(".")

    " set field format
    call s:set_format()

    let i = 0
    " add begining always
    call append(i, b:comment_char . g:custom_header_begin)
    let i += 1
    " add filename if enable
    if g:custom_header_filename_en
        call append(i, b:comment_char . b:field_filename . expand("%:t"))
        let i += 1
    endif
    " add author if enable
    if g:custom_header_author_en
        call append(i, b:comment_char . b:field_author . g:custom_header_author)
        let i += 1
    endif
    " add email if enable
    if g:custom_header_email_en
        call append(i, b:comment_char . b:field_email . g:custom_header_email)
        let i += 1
    endif
    " add company if enable
    if g:custom_header_company_en
        call append(i, b:comment_char . b:field_company . g:custom_header_company)
        let i += 1
    endif
    " add create time if enable
    if g:custom_header_create_en
        call append(i, b:comment_char . b:field_create . strftime(g:custom_header_tformat))
        let i += 1
    endif
    " add modify time if enable
    if g:custom_header_modify_en
        call append(i, b:comment_char . b:field_modify . strftime(g:custom_header_tformat))
        let i += 1
    endif
    " add revision if enable
    if g:custom_header_revision_en
        call append(i, b:comment_char . b:field_revision)
        let i += 1
        call append(i, b:comment_char)
        let i += 1
    endif
    " add description if enable
    if g:custom_header_description_en
        call append(i, b:comment_char . b:field_description)
        let i += 1
        call append(i, b:comment_char)
        let i += 1
        call append(i, b:comment_char)
        let i += 1
    endif
    " add ending always
    call append(i, b:comment_char . g:custom_header_end)
    let i += 1

    " restore orignal position
    call cursor(org_row+i, org_col)

endfunction

" ----------------------------------------------------------
" update header
function! custom_header#update_header()

    " record original postion
    let org_row = line(".")
    let org_col = col(".")

    " set field format
    call s:set_format()

    let repl = b:field_modify . strftime(g:custom_header_tformat)
    execute ':1,10s/' . b:field_modify . '.*$/' . repl . '/g'

    " restore orignal position
    call cursor(org_row, org_col)

endfunction
