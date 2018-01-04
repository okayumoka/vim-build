cd ~/src/vim/vim/src
rm -rf ./build
mkdir -p ./build/vimfiles

# メッセージファイルを生成
python3 C:/Python36/tools/i18n/msgfmt.py ./po/ja.po

# ビルド（CUI）
mingw32-make -f Make_ming.mak  \
  GUI=no \
  ARCH=x86-64 \
  IME=yes \
  MBYTE=yes \
  ICONV=yes \
  FEAT_TERMGUICOLORS=yes \
  clean
mingw32-make -f Make_ming.mak \
  ARCH=x86-64 \
  IME=yes \
  MBYTE=yes \
  ICONV=yes \
  FEAT_TERMGUICOLORS=yes \
  PERL=C:/Strawberry/perl DYNAMIC_PERL=yes PERL_VER=526 \
  PYTHON=C:/tools/python2 DYNAMIC_PYTHON=yes PYTHON_VER=27 \
  PYTHON3=C:/python36 DYNAMIC_PYTHON3=yes PYTHON3_VER=36 \
  RUBY=C:/tools/ruby23 DYNAMIC_RUBY=yes RUBY_VER=23 RUBY_API_VER_LONG=2.3.0 \
  LUA=~/src/vim/lua-5.3.3/src DYNAMIC_LUA=yes LUA_VER=53 \
  GUI=no
cp vim.exe ./build/

# ビルド（GUI）
mingw32-make -f Make_ming.mak  \
  GUI=yes \
  ARCH=x86-64 \
  IME=yes \
  MBYTE=yes \
  ICONV=yes \
  FEAT_TERMGUICOLORS=yes \
  clean
mingw32-make -f Make_ming.mak \
  ARCH=x86-64 \
  IME=yes \
  MBYTE=yes \
  ICONV=yes \
  FEAT_TERMGUICOLORS=yes \
  PERL=C:/Strawberry/perl DYNAMIC_PERL=yes PERL_VER=526 \
  PYTHON=C:/tools/python2 DYNAMIC_PYTHON=yes PYTHON_VER=27 \
  PYTHON3=C:/python36 DYNAMIC_PYTHON3=yes PYTHON3_VER=36 \
  RUBY=C:/tools/ruby23 DYNAMIC_RUBY=yes RUBY_VER=23 RUBY_API_VER_LONG=2.3.0 \
  LUA=~/src/vim/lua-5.3.3/src DYNAMIC_LUA=yes LUA_VER=53 \
  GUI=yes \
  STATIC_STDCPLUS=yes \
  DIRECTX=yes
cp gvim.exe ./build/
cp vimrun.exe ./build/

# パッキング
cp C:/msys64/mingw64/bin/libiconv-2.dll ./build/
cp C:/msys64/mingw64/bin/libintl-8.dll ./build/
cp C:/msys64/mingw64/bin/libwinpthread-1.dll ./build/

cp C:/msys64/usr/bin/winpty.dll ./build/
cp C:/msys64/usr/bin/winpty-agent.exe ./build/

cp C:/Strawberry/perl/bin/perl526.dll ./build/
cp C:/tools/ruby23/bin/x64-msvcrt-ruby230.dll ./build/
cp C:/Windows/System32/python27.dll ./build/
cp C:/Python36/python36.dll ./build/
cp C:/ProgramData/chocolatey/lib/lua53/tools/lua53.dll ./build/
cp -r ../runtime ./build/vim80
mkdir -p ./build/vim80/lang/ja/LC_MESSAGES
cp ./po/ja.mo ./build/vim80/lang/ja/LC_MESSAGES/vim.mo

# 実行ファイル置き場に移動
mkdir -p ~/bin/vim/
cp -r ./build/* ~/bin/vim/
