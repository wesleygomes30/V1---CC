FUNCTION Main()

    CLS
    SETMODE(26,90)

    SET SCORE OFF
    SET MESSAGE TO 23 CENTER

    @00,01 SAY " Projeto Conta Corrente v1.0 " COLOR "w+/b"
    
    nMenu := 1
    nSaldo := 0
    DO WHILE .T.

        IF nSaldo < 0
            @01,00 SAY PADC( "Saldo em C/C: " + Transform( nSaldo, "@E 999,999,999.99" ))
        ELSE
            @01,00 SAY PADC( "Saldo em C/C: " + Transform( nSaldo, "@E 999,999,999.99" )) 
        ENDIF

        SET CURSOR OFF

        @02,03 TO 08,25 
        @04,05 PROMPT " [1] Deposito"
        @05,05 PROMPT " [2] Saque" 
        @06,05 PROMPT " [3] Sair" 
        MENU TO nMenu

        SET CURSOR ON

            IF nMenu = 0 .or. nMenu = 3 .or. LastKey() == 27
                EXIT
            ELSEIF nMenu = 1
                nValor := 0
                @10,20 SAY "Valor do Deposito: " GET nValor PICTURE "@E 999,999,999.99" 
                READ
                IF LastKey() <> 27
                    nSaldo += nValor
                EXIT
                ENDIF
            ELSEIF nMenu = 2
                nValor := 0
                @20,30 SAY "Valor do Saque: " GET nValor PICTURE "@E 999,999,999.99" 
                READ
                IF LastKey() <> 27
                    nSaldo -= nValor
                EXIT
                ENDIF
            ENDIF

        ENDDO

        CLS
        ? "Obrigado, ate a proxima!"
        
    RETURN
          
    