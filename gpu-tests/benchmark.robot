*** Settings ***
Documentation               This is just a tutorial
Metadata                    VERSION     0.1
Library                     String
Library                     SeleniumLibrary
Library                     OperatingSystem
# Suite Setup                 ブラウザを開く
Suite Teardown              ブラウザを終了
Resource                    ./resources/common.robot

*** Variables ***
${SERVER}                   https://web.basemark.com

*** Test Cases ***
BASEMARK Web 3.0にアクセス
    ページアクセス  /
    Sleep  5

    Click Element  id:start

    Sleep  1200

    ブラウザを終了
