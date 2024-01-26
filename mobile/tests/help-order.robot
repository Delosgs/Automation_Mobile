*** Settings ***
Documentation            Suite de testes de pedido de ajuda "Só API"

Resource    ../resources/base.resource

Test Setup       Start App     # Para cortar a interação com a interface mobile é so comentar
Test Teardown    Finish App    #...as Key words "Test Setup e Test Teardown"

*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}     Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student       ${papito}[student][email]

    ${token}            Get Service Token     ${admin}
    ${student_id}       POST New Student      ${token}       ${papito}[student]
    POST New Enroll     ${token}              ${student_id}

    Login With Student Id        ${student_id}
    Confirm Popup
    Go To Help Order
    Submit Help Order            ${papito}[help]
    Wait Until Page Contains     Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.




