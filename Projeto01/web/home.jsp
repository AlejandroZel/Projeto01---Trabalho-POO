<%-- 
    Document   : home
    Created on : 08/03/2020, 17:13:05
    Author     : Débora Franco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cálculo de amortização</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" crossorigin="anonymous" >
        
        <style>
            @import url('https://fonts.googleapis.com/css?family=Nunito&display=swap');
            html {
                font-family: 'Nunito', sans-serif;
                -webkit-font-smoothing: antialiased;
                min-height: 100%;
            }
            *{ text-align: center;
              
            }
           
            body {
                 height: 100%;
                margin: 0;
                color: #000;
                 background-repeat: no-repeat;
            }
            .categories .card{ width: 43%; padding: 20px;  }
            .categories p { color: gray;   }
            .card { width: 15%; text-align: center; margin: 20px 20px;;  }
            .card h4 { margin: 0; font-size: 20px;  padding: 3px 0; text-align: center;  }
            .categories { display: flex; justify-content: space-between;  flex-wrap: wrap;  padding: 60px}
            .fa {font-size: 20px; padding: 0px 2px; }
            .categories h2 { padding-bottom: 10px; margin: 0;  text-align: center; }
            #constante, #americana, #tabela_price, #inicio { cursor: pointer;  transition: all .2s ease-in-out;  }
            #constante:hover, #americana:hover, #tabela_price:hover, #inicio:hover {  transform: scale(1.1);  }
          
            h1 {  text-align: center; }
          
            .card, .balao {
                background-color: white;
                border-radius: 4px;
                box-shadow: 12px 12px 15px rgba(46, 61, 73, 0.4);
                color: #36304a;
            }
            .balao{
                width: 30%;
                padding: 10px;
  
            }
           

            .categories h2 {
                margin: 0;
                text-align: center;
            }
            
            #acesso {
                cursor: pointer;
                transition: all .2s ease-in-out;
            }
            
            #acesso:hover{
                transform: scale(1.1);
            }
            .profile{
                width: 200px;
                
            }
         
             .card {
                width: 220px;
                padding:  10px 10px;
                margin: 1% 40%;
            }
            .titulotime{
                background: -webkit-linear-gradient(45deg,#4B0082,#8B008B);
            }
          
        </style>
    </head>
    <body>
        <div>
        <%@include file="WEB-INF/jspf/header.jspf" %> 
    
        
        </div>
         <div class='categories'>
            <div id='constante' class='balao' >  <h2>Amortização Constante</h2> <p>Forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo. Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação. </p> </div>
            <div id='americana' class='balao' > <h2>Amortização Americana</h2><p>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal. Observe as planilhas demonstrativas desse modelo de amortização. </p> </div>
            <div id='tabela_price' class='balao' >  <h2>Tabela Price</h2> <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.</p> </div>
 
      </div>                 
                       
     
        
                         
       <script>
            document.getElementById('constante').addEventListener('click', function(event) { document.location.href = '/Projeto01/amortizacao-constante.jsp';});
            document.getElementById('americana').addEventListener('click', function(event) { document.location.href = '/Projeto01/amortizacao-americana.jsp';});
            document.getElementById('tabela_price').addEventListener('click', function(event) {document.location.href = '/Projto01/tabela-price.jsp';});
       </script>
          <%@include file="WEB-INF/jspf/footer.jspf" %>              
    </body>
</html>