command! CustomHeaderInsert call custom_header#insert_header()
command! CustomHeaderUpdate call custom_header#update_header()

" auto update header
if !exists('g:custom_header_auto_update_en') || g:custom_header_auto_update_en == 1
    autocmd BufWritePre * silent! :CustomHeaderUpdate
endif
