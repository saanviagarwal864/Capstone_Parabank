*** Settings ***
Library    RequestsLibrary
Library    XML
Library    Collections
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/common_keywords.robot

*** Keywords ***
Hybrid Setup
    Load Environment
    Load API Environment
