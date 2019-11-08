*** Settings ***
Documentation               This is just a tutorial
Metadata                    VERSION     0.1
Library                     String
Library                     SeleniumLibrary
Library                     OperatingSystem
# Suite Setup                 ブラウザを開く
Suite Teardown              ブラウザを終了
Resource                    ./resources/common.robot

*** Test Cases ***
スペック確認
    Open Browser  chrome://gpu  ${BROWSER}  None  ${GRID_URL}
    Sleep  1
    スクリーンショットを保存  gpu-spec.png
    Sleep  1
    ブラウザを終了

