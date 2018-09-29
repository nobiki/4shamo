*** Settings ***
Documentation  共通定義

*** Keywords ***
ブラウザを開く
    [Documentation]  Start ${BROWSER} browser on Selenium Grid
    Open Browser  ${SERVER}  ${BROWSER}  None  ${GRID_URL}

ページアクセス
    [Documentation]  Start ${BROWSER} browser on Selenium Grid
    [Arguments]  ${REQUEST-URI}
    Open Browser  ${SERVER}${REQUEST-URI}  ${BROWSER}  None  ${GRID_URL}
    Maximize Browser Window

スクリーンショットを保存
    [Arguments]  ${fn}
    Capture Page Screenshot  filename=capture/${fn}

ブラウザを終了
    Close Browser

すべてのブラウザを終了
    Close All Browsers
