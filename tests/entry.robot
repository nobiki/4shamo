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
${SERVER}                   https://7me.oji.0j0.jp/archives/

*** Test Cases ***
Memoでキーワード検索
    [Documentation]  vimとdockerを検索
    スクリーンショットを保存  7me-memo-search.png
