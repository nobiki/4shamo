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
${SERVER}                   https://7me.oji.0j0.jp

*** Test Cases ***
7meにアクセス
    [Documentation]  Memoページに行ってスクリーンショットを保存
    ページアクセス  /archives
    スクリーンショットを保存  7me-memo-access.png
    ブラウザを終了

キーワード検索のテスト
    [Documentation]  Memoページに行ってキーワード検索の結果をスクリーンショットに保存
    ページアクセス  /archives

    # example: List
    @{keywords}  Create List  vim  docker  selenium

    : FOR  ${INDEX}  IN RANGE  0  3
    \    Input Text  css:input[name='q_7me']  @{keywords}[${INDEX}]
    \
    \    スクリーンショットを保存  7me-@{keywords}[${INDEX}]-search.png

    # example: Dictionary(key loop)
    &{dict_keywords}  Create Dictionary  0=debian  1=linux  2=robotframework

    :FOR  ${KEY}  IN  @{dict_keywords.keys()}
    \    Input Text  css:input[name='q_7me']  @{keywords}[${KEY}]
    \
    \    スクリーンショットを保存  7me-dict-@{keywords}[${KEY}]-search.png

    # example: Dictionary(value loop)
    &{dict_keywords2}  Create Dictionary  0=apache  1=nginx  2=python

    :FOR  ${VALUE}  IN  @{dict_keywords2.values()}
    \    Input Text  css:input[name='q_7me']  ${VALUE}
    \
    \    スクリーンショットを保存  7me-dict-${VALUE}-search.png

    ブラウザを終了
