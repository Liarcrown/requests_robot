*** Settings ***
Library        Selenium2Library
Library        requestdata.py
Library        String
Variables      requestdata.py
Library        Collections 
Suite Setup    Open Browser    https://ipac.library.taichung.gov.tw/webpac/search.cfm    firefox    executable_path=./geckodriver

            #    Maximize Browser Window     #視窗最大化


*** Keywords ***
webdata
    ${result}=  requestdata
    [return]  ${result}         

GetDataTest
    [Documentation]  抓取內容
    Wait Until Element Is Visible  xpath=/html/body/div[4]/div[3]/div[2]/ul/li[3]/a  15s
    ${text}=  Get Text  xpath=/html/body/div[4]/div[3]/div[2]/ul/li[3]/a
    Log  ${text}
    [return]  ${text}

*** Test Cases ***
Verify Article Is Existing
    ${value}  webdata
    Log  ${value}
    ${text}=  GetDataTest
    Should Be Equal As Strings  ${text}  ${value}
    Close Browser





