" =============================================================================
" Filename: autoload/lightline/colorscheme/broedli.vim
" Author: broedli
" License: MIT License
" Last Change: 2016/03/13 08:37:43.
" =============================================================================
let s:base03 = [ '#242424', 240 ]
let s:base023 = [ '#353535 ', 240 ]
let s:base02 = [ '#444444 ', 254 ]
let s:base01 = [ '#585858', 250 ]
let s:base00 = [ '#666666', 231 ]
let s:base0 = [ '#808080', 243 ]
let s:base1 = [ '#969696', 236 ]
let s:base2 = [ '#a8a8a8', 242 ]
let s:base3 = [ '#d0d0d0', 255 ]
let s:yellow = [ '#cae682', 3 ]
let s:orange = [ '#e5786d', 11 ]
let s:red = [ '#e5786d', 9 ]
let s:magenta = [ '#f2c68a', 13 ]
let s:blue = [ '#8ac6f2', 12 ]
let s:cyan = [ '#8ac6f2', 14 ]
let s:green = [ '#95e454', 2 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base00, s:blue ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base0 ], [ s:base02, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.insert.left = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base023, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base00, s:yellow ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base023 ] ]
let s:p.tabline.left = [ [ s:base3, s:base01 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base03 ] ]
let s:p.tabline.middle = [ [ s:base2, s:base02 ] ]
let s:p.tabline.right = [ [ s:base3, s:base03 ] ]
let s:p.normal.error = [ [ s:base00, s:red ] ]
let s:p.normal.warning = [ [ s:base00, s:orange ] ]

let g:lightline#colorscheme#broedli#palette = lightline#colorscheme#flatten(s:p)
