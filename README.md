# vimenv_ubuntu24.04
updateto-vim9+mkd+preview



note：
***1、rm all the submodule，include:***
./.vim/pack/thirdparty_manual/opt/vim-autotags/.git
./.vim/pack/thirdparty_manual/start/LeaderF/.git
./.vim/pack/thirdparty_manual/start/locate.vim/.git
./.vim/pack/thirdparty_manual/start/markdown-preview.nvim/.git
./.vim/pack/thirdparty_manual/start/mru/.git
./.vim/pack/thirdparty_manual/start/rainbow/.git
./.vim/pack/thirdparty_manual/start/ultisnips/.git
./.vim/pack/thirdparty_manual/start/vim-airline/.git
./.vim/pack/thirdparty_manual/start/vim-airline-themes/.git
./.vim/pack/thirdparty_manual/start/vim-commentary/.git
./.vim/pack/thirdparty_manual/start/vim-easy-align/.git
./.vim/pack/thirdparty_manual/start/vim-easymotion/.git
./.vim/pack/thirdparty_manual/start/vim-ingo-library/.git
./.vim/pack/thirdparty_manual/start/vim-javascript/.git
./.vim/pack/thirdparty_manual/start/vim-mark/.git
./.vim/pack/thirdparty_manual/start/vim-nerdtree/.git
./.vim/pack/thirdparty_manual/start/vim-snippets/.git
./.vim/pack/thirdparty_manual/start/vim-tagbar/.git
./.vim/plugin/img-paste.vim/.git
./.vim/plugin/vim-autotags/.git

***2. default add SCQA mindmap snippnet***
################
# zxk custom stuff #
################
snippet scqa "Pyramid mindmap-topdown"
\`\`\`plantuml
@startmindmap
top to bottom direction
* $1
  ** $2
  ** $3

top side
  **_: $4
S: $5
C: $6
Q: $7
;
$0
@endmindmap
\`\`\`
endsnippet

***3.update mermaid version to 11.2.2*** 
proxy:curl --proxy-user xxx:'password' -x http://xxproxy.com:8080 https://cdn.jsdelivr.net/npm/mermaid@11.12.2/dist/mermaid.min.js > ./mermaid.min.js
noproxy:curl https://cdn.jsdelivr.net/npm/mermaid@11.12.2/dist/mermaid.min.js > .app/_static/mermaid.min.js

