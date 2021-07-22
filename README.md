# vim-custom-header

- Add simple customed file header
- Update modified time automatically

## Installation

### Vundle

Add following line in your `.vimrc` file:

```
Plugin 'qian-gu/vim-custom-header'
```

open your vim and type `:VundleInstall` to complete installation.

### Manually

Clone into your `~/.vim/bundle/`

```sh
cd ~/.vim/bundle`
git clone https://github.com/qian-gu/vim-custom-header.git
```

or download and unzip to `~/.vim/bundle` directory.

## Usage

Type `:CustomHeaderInsert` to insert a new header, type `:CustomHeaderUpdate` to update the
modified time of the header, or you an map the commands to keys:

```vim
nmap <leader>chi :CustomHeaderInsert <CR>
nmap <leader>chu :CustomHeaderUpdate <CR>
```

The modified time is update automatically when saving the buffer by default, so in most case you
needn't to use `:CustomHeaderUpdate` command. You can turn this feature off using
`let g:custom_header_auto_update_en = 0`.

## Customization

All features and corresponding varibales are listed as bellow, you can change each value as you like.

| Feature            | Variable                    | Description                       |
| ------------------ | --------------------------- | --------------------------------- |
| header_begin       | `custom_header_begin`       | set value of first line of header |
| header_end         | `custom_header_end`         | set value of end line of header   |
| header_author      | `custom_header_author`      | set value of author               |
| header_email       | `custom_header_email`       | set value of email                |
| header_company     | `custom_header_company`     | set value of company              |

All feature are turn on by default, you can turn of each feature via following variables:

| Feature            | Variable                       | Description                          |
| ------------------ | ------------------------------ | ------------------------------------ |
| filename    | `custom_header_filename_en`    | 0 = disable, 1 = enable, default = 1 |
| author      | `custom_header_author_en`      | 0 = disable, 1 = enable, default = 1 |
| email       | `custom_header_email_en`       | 0 = disable, 1 = enable, default = 1 |
| company     | `custom_header_company_en`     | 0 = disable, 1 = enable, default = 1 |
| create time | `custom_header_create_en`      | 0 = disable, 1 = enable, default = 1 |
| modify time | `custom_header_modify_en`      | 0 = disable, 1 = enable, default = 1 |
| revision    | `custom_header_revision_en`    | 0 = disable, 1 = enable, default = 1 |
| description | `custom_header_description_en` | 0 = disable, 1 = enable, default = 1 |
| auto update | `custom_header_auto_update_en` | 0 = disable, 1 = enable, default = 1 |
