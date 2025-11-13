FROM selenium/node-chrome:136.0-20251101

RUN sudo apt update && sudo apt install -y locales tzdata language-pack-ja-base language-pack-ja fonts-noto-cjk

RUN sudo locale-gen ja_JP.UTF-8 \
 && sudo localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && sudo update-locale LANG=ja_JP.UTF-8 \
 && sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
