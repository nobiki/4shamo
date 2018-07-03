*** Settings ***
Documentation  共通定義

*** Keywords ***
ブラウザを開く
    [Documentation]         Start ${BROWSER} browser on Selenium Grid
    Open Browser            ${SERVER}   ${BROWSER}   None  ${GRID_URL}

ページアクセス
    [Arguments]  ${request-uri}
    Open Browser  ${base-url}${request-uri}  ${browser}
    Maximize Browser Window
    Set Selenium Speed  ${sel_speed_short}

スクリーンショットを保存
    [Arguments]  ${fn}
    Capture Page Screenshot  filename=${fn}

ブラウザを終了
    Close Browser

すべてのブラウザを終了
    Close All Browsers
