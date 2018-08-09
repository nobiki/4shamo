*** Settings ***
Documentation               This is just a tutorial
Metadata                    VERSION     0.1
Library                     String
Library                     SeleniumLibrary
Library                     OperatingSystem
Suite Setup                 ブラウザを開く
Suite Teardown              ブラウザを終了
Resource                    ./resources/common.robot

*** Variables ***
${SERVER}                   http://google.com/

*** Test Cases ***
Googleにアクセスする
    [Documentation]         検索ページのスクリーンショットを保存
    スクリーンショットを保存  google-search.png
