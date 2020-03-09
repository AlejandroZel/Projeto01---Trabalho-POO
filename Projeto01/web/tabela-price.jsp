<%-- 
    Document   : tabela-price
    Created on : 08/03/2020, 12:56:52
    Author     : CPD
--%>

<%@page import="java.text.NumberFormat"%>
<%--biblioteca para localização, usando pt-br no Brasil--%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
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
                background: #00FFFF;
                background: #DD5E89;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to right, #F7BB97, #DD5E89);  /* Chrome 10-25, Safari 5.1-6 */
                background: #FFFFFF;
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
            #constante:hover, #americana:hover, #tabela_price:hover, #inicio:hover {  transform: scale(1.1);  }
          
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
            .tabela_price{
                margin-left: 20%;
                border: 0px solid white;
                border-collapse: collapse;
                
            }
            .price{
                margin-left: 40%;
                border: 2px solid white;
                border-collapse: collapse;
                
            }
            .table-hover > tbody > tr > td, .table-hover > tbody > tr > th, .table-hover > tfoot > tr > td, .table-hover > tfoot > tr > th, .table-hover > thead > tr > td, .table-hover > thead > tr > th {
                    border: 1px solid #7C064D;
                    font-size: 125%;
                    text-align: center;
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

       <h1 style="padding: 20px 0; color: black">Tabela Price</h1><br/>
        
        <form>
            <!--Criando a tabela-->
            
                    <!--Pedindo os valores-->
                    <b style="color: navy">[Valor da divida] <input type="number" name="valorDivida"></b>
                    <b style="color: navy">[Quantidade das parcelas] <input type="number" name="parcela"></b>
                    <b style="color: navy">[Taxa] <input type="number" name="juros"></b>
                    <!--Enviando informações através do botão-->
                   <input type="submit" name="calcular" value="Calcular">
              

            <br/><br/><br/>
            <% Locale localeBR = new Locale("pt","BR"); %>
            <% NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR); %>
            <%--Aqui, quando os parametros do calcular por diferente de vazio entra no if--%>
            <% if(request.getParameter("calcular")!=null){ %>
                
                <% try{ %>
                <% int i=1; %>
                <% double valorDivida = Double.valueOf(request.getParameter("valorDivida")); %>
                <% double meses = Double.valueOf(request.getParameter("parcela")); %>
                <% double juros = Double.valueOf(request.getParameter("juros")); %>
                <% double amort = 0; %>
                <% double totalAmort = 0; %>
                <% double parc = 0; %>
                <% double totalParc = 0; %>
                <% double jurosOutput = 0; %>
                <% double totalJurosOutput = 0; %>
                <% double saldoDevedor = 0; %>
                <% double juros100 = juros/100; %>  
     
                <div class="container">
                <table class="table-hover" style="color: navy">
                    <tr>
                        <th>Qtd Parcela</th>
                        <th>Valor Parcela</th>
                        <th>Amortizações</th>
                        <th>Juros</th>
                        <th>Saldo Devedor</th>
                    </tr>
                    <%--Calculo para criar a amortização price--%>
                    <% parc = valorDivida * ((Math.pow(1+juros100, meses)) * juros100)/((Math.pow(1+juros100, meses)) - 1); %>
                    <% jurosOutput = valorDivida * juros100; %>
                    <% amort = parc - jurosOutput; %>
                    <% saldoDevedor = valorDivida - amort; %>
                        <tr>
                            <td align="center"><%= i %></td>
                            <td align="right"><%= dinheiro.format(parc) %></td>
                            <td align="right"><%= dinheiro.format(amort) %></td>
                            <td align="right"><%= dinheiro.format(jurosOutput) %></td>
                            <td align="right"><%= dinheiro.format(saldoDevedor) %></td>  
                        </tr>
                    <% totalAmort = totalAmort + amort; %>
                    <% totalJurosOutput += jurosOutput; %>
                    <% totalParc += parc; %>                    
                    <% for(i =2 ; i<=meses; i++){%>
                    <% jurosOutput = saldoDevedor*juros100; %>
                    <% amort = parc - jurosOutput; %>
                    <% saldoDevedor = saldoDevedor - amort; %>
                        
                        <% if(i==meses){ %>
                        <% saldoDevedor = 0;%>
                        <% } %>
                        <tr>
                            <td align="center"><%= i %></td>
                            <td align="right"><%= dinheiro.format(parc) %></td>
                            <td align="right"><%= dinheiro.format(amort) %></td>
                            <td align="right"><%= dinheiro.format(jurosOutput) %></td>
                            <td align="right"><%= dinheiro.format(saldoDevedor) %></td>  
                        </tr>
                        <% totalAmort = totalAmort + amort; %>
                        <% totalJurosOutput += jurosOutput; %>
                        <% totalParc += parc; %>                            
                    <% }%>
                    <tr>
                        <td> >> </td>
                        <td align="right"><%= dinheiro.format(totalParc) %></td>
                        <td align="right"><%= dinheiro.format(totalAmort) %></td>
                        <td align="right"><%= dinheiro.format(totalJurosOutput) %></td>
                        <td><center><b><<-TOTAIS </b></center></td> 
                    </tr>
                </table>
                </div>
                <br/>    
                
                <% }catch(Exception e){%>
                    <h1 style="color:red">Favor preencher todos os campos</h1>
                <% }%>
            <% } %>
        </form>
          </div>

    </body>
</html>
