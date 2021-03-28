function! llu#filename()
  let l:name = expand('%:.')
  if empty(l:name)
    return '[No Name]'
  else
    return l:name
  endif
endfunction

function! llu#fileencoding()
  if empty(&fileencoding)
    let l:fileencoding = &encoding
  else
    let l:fileencoding = &fileencoding
  endif
  return toupper(l:fileencoding)
endfunction

function! llu#fileformat()
  if &fileformat ==# 'dos'
    return 'CRLF'
  elseif &fileformat ==# 'unix'
    return 'LF'
  elseif &fileformat ==# 'mac'
    return 'CR'
  else
    return &fileformat
  endif
endfunction

let s:filetype_dic = {
  \   'c': 'C',
  \   'cpp': 'C++',
  \   'cs': 'C#',
  \   'fsharp': 'F#',
  \   'dockerfile': 'Dockerfile',
  \   'go': 'Go',
  \   'git': 'Git',
  \   'gitcommit': 'Git Commit Message',
  \   'gitrebase': 'Git Rebase Message',
  \   'html': 'HTML',
  \   'json': 'Json',
  \   'javascript': 'JavaScript',
  \   'javascriptreact': 'React',
  \   'kotlin': 'Kotlin',
  \   'lua': 'Lua',
  \   'markdown': 'Markdown',
  \   'perl': 'Perl',
  \   'php': 'PHP',
  \   'ps1': 'PowerShell',
  \   'python': 'Python',
  \   'ruby': 'Ruby',
  \   'rust': 'Rust',
  \   'sh': 'Shell',
  \   'sql': 'SQL',
  \   'swift': 'Swift',
  \   'typescript': 'TypeScript',
  \   'toml': 'TOML',
  \   'vim': 'Vim',
  \   'vue': 'Vue',
  \   'xml': 'XML',
  \   'yaml': 'YAML',
  \   'zsh': 'Zsh',
  \ }

function! llu#filetype() abort
  let l:formatted_filetype = get(s:filetype_dic, &filetype, &filetype)
  if ! exists('*WebDevIconsGetFileTypeSymbol')
    return l:formatted_filetype
  endif
  return WebDevIconsGetFileTypeSymbol() . ' ' . l:formatted_filetype
endfunction

function! llu#lineinfo()
  let l:lineinfo = 'L' . line('.') . ':C' . col('.')
  let l:padding = repeat(' ', 6 - len(l:lineinfo))
  return l:padding . l:lineinfo
endfunction
