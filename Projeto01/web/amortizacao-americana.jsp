<%-- 
    Document   : amortizacao-americana
    Created on : 08/03/2020, 17:40:11
    Author     : GABRIELALEJANDROZELA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <style>
            html {
                font-family: sans-serif;
                -webkit-font-smoothing: antialiased;
                min-height: 100%;
            }
            *{ text-align: center;
              
            }
           
            body {
                 height: 100%;
                margin: 0;
                background: #00FFFF;
                background: #DD5E89;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #F7BB97, #DD5E89);  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to right, #F7BB97, #DD5E89);
                color: #fff;
                 background-repeat: no-repeat;
            }
            .categories .card{ width: 43%; padding: 20px;  }
            .categories p { color: gray;   }
            .team .card { width: 15%; text-align: center; margin: 20px 20px;;  }
            .team .card h4 { margin: 0; font-size: 20px;  padding: 3px 0; text-align: center;  }
            .team, .categories { display: flex; justify-content: space-between;  flex-wrap: wrap;  }
            .team .card img { width: 100%; }
            .fa {font-size: 20px; padding: 0px 2px; }
            .categories h2 { margin: 0;  text-align: center; }
            #constante, #americana, #tabela_price, #inicio { cursor: pointer;  transition: all .2s ease-in-out;  }
            #constante:hover, #americana:hover, #tabela_price:hover, #inicio:hover{  transform: scale(1.1);  }
          
            h1 {  text-align: center; }
          
            .card, .balao {
                background-color: white;
                border-radius: 4px;
                box-shadow: 12px 12px 15px rgba(46, 61, 73, 0.4);
                color: #36304a;
            }
            .balao{
                width: 600px;
                padding: 10px;
                margin: 1% 30%;
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
            .tabelaAmericana{
                margin-left: 30%;
                border: 5px solid black;
                border-collapse: collapse;
                
            }
            .content{
                min-height: 100vh;
            }
             .container{
                display: flex;
                justify-content: center;
                padding-bottom: 40px;
              }
        </style>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Hello World!</h1>
    </body>
</html>
