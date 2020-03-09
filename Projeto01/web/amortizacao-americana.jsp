<%-- 
    Document   : amortizacao-americana
    Created on : 01/09/2019, 04:16:44
    Author     : Gabriel Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            .categories { display: flex; justify-content: space-between;  flex-wrap: wrap;  }
            .card img { width: 100%; }
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
        <div class="content">
       <%@include file="WEB-INF/jspf/header.jspf" %> 
    
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        <h1 style="padding: 20px 0;"> Amortização Americana</h1><br/>
        <% if (request.getParameter("enviar") == null) { %>
        <form>
        <b>Valor da Divida: <input type="number" name="valorDivida"/>
        <b> | Quantidade de Parcelas: <input type="number" name="nParcelas"/>
        <b> | Taxa: <input type="number" step="0.01" name="taxa"/>
            <input type="submit" name="enviar" value="Enviar"/>
        </form>
        <% } else { %>

        <%try {%>
        <%double divida = Double.parseDouble(request.getParameter("valorDivida"));%>
        <%double nParcelas = Double.parseDouble(request.getParameter("nParcelas"));%>
        <%double tax = Double.parseDouble(request.getParameter("taxa")); %>
        <%double parcela = 0;%>
        <%double montante = 0;%>
         <style>
                 .table-hover > tbody > tr > td, .table-hover > tbody > tr > th, .table-hover > tfoot > tr > td, .table-hover > tfoot > tr > th, .table-hover > thead > tr > td, .table-hover > thead > tr > th {
                    border: 1px solid #7C064D;
                    font-size: 125%;
                    text-align: center;
                  }
             </style>
        <div class="container">
        <table border="1" class="table table-hover">
            <tr>
               <th> N° Parcelas</th> 
                <th>Amortização</th>
                <th>Juros (<%=tax%> de <%=divida%>)</th>
                <th>Dívida</th>
                <th>Montante</th>
            </tr>
            <% for (int i = 0; i <= nParcelas +1 ; i++) {%>

            <tr>
                <td >
                    <% if(i <= nParcelas){%>
                    <%=i%>  
                    <%}else{%> -----
                    <% }%>
                </td>
                <td>
                    <% if (i < nParcelas) {%>
                    0
                    <%} else if(i==nParcelas) {%>
                    <%= divida%>
                    <%}else{%> -----
                    <% }%>
                </td>
                <td>
                    <% if(i == 0){%>0 <%} else if(i < nParcelas +1){ %>
                    <%parcela = (divida/100)*tax;%>
                    <%=parcela%>
                    <% montante = montante + parcela;%>
                    <% }else{ %> -----
                    <% }%>
                </td>
                <td>
                    <% if(i < nParcelas){%>
                    <%=divida%>
                    <% }else if(i == nParcelas){%>Total pago em juros:
                    <% }else{%> Total quitado:
                    <% }%>
                </td>
                <td>
                    <% if(i < nParcelas){%>   
                        <%=montante%>
                    <%}else if(i == nParcelas){%>
                    <%=montante%>
                    <%}else { %>
                    <% montante = montante + divida;%>
                    <%=montante%>
            </b>
                    <%}%>
                </td>
            </tr>
            <%}%>
        </table>
         </div>
        <%} catch (Exception ex) {%>
        <h3 style="color: red"><%= ex.getMessage()%></h3>
        <%}%>

        <% }%>
         </div>
        </body>
       <%@include file="WEB-INF/jspf/footer.jspf" %>  
       
</html>
