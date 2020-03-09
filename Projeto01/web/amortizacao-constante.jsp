<%-- 
    Document   : amortizacao-constante
    Created on : 01/09/2019, 04:16:17
    Author     : Thiago de Sousa Costa
--%>

<%@page import="java.text.DecimalFormat"%>
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

            .table-hover > tbody > tr > td, .table-hover > tbody > tr > th, .table-hover > tfoot > tr > td, .table-hover > tfoot > tr > th, .table-hover > thead > tr > td, .table-hover > thead > tr > th {
                 border: 1px solid #000000;
                 font-size: 125%;
                 text-align: center;
        </style>
    </head>
    <body>
        <div class="content">
       <%@include file="WEB-INF/jspf/header.jspf" %> 
    
        <%@include file="WEB-INF/jspf/menu.jspf" %> 
        
        <h1 style="padding: 20px 0;">Amortização Constante</h1><br/>
        <% if(request.getParameter("enviar") == null){ %>
            <form>
               <b> Valor da Divida: <input type="number" name="divida"/>
               <b> | Quantidade de Parcelas: <input type="number" name="qtdParcelas"/>
               <b> | Taxa: <input type="number" step="0.01" name="taxa"/>
                <input type="submit" name="enviar" value="Enviar"/>
            </form>
            
         <% } else{ %>
         <%try {
                double taxa=0, qtdParcelas=0, divida=0, amortizacao=0, juros=0, totalAmortizacao=0, totalJuros=0, prestacao=0,totalPrestacao=0;
                DecimalFormat formato = new DecimalFormat("#.##");
                taxa = Double.parseDouble(request.getParameter("taxa"))/100;
                divida = Double.parseDouble(request.getParameter("divida"));
                qtdParcelas = Double.parseDouble(request.getParameter("qtdParcelas"));
                amortizacao = divida / qtdParcelas;%>
                
             <div class="container">
                 
                    <table class="table table-hover">
                        <thead>
                    <tr>
                        <th>Período(meses)</th>
                        <th>Prestação</th>
                        <th>Juros</th>
                        <th>Amortização</th>
                        <th>Saldo Devedor</th>
                    </tr>
                        </thead>
                    <tr >
                        <td> 0 </td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                        <td>R$ <%=formato.format(divida)%></td>
                    </tr>
                    <%for (int x = 1; x <= qtdParcelas; x++) {%>
                    <tr>
                        <td><%=x%></td>
                        <%prestacao = amortizacao + (divida * taxa);%>
                        <td>R$ <%=formato.format(prestacao)%></td>
                        <%totalPrestacao += prestacao;
                        juros = divida * taxa;
                        totalJuros += juros;
                        totalAmortizacao += amortizacao;
                        divida -= amortizacao;%>
                        <td>R$ <%=formato.format(juros)%></td>
                        <td>R$ <%=formato.format(amortizacao)%></td>
                        <td>R$ <%=formato.format(divida)%></td>

                    </tr>
                    <%}%>
                    <tr>
                        <td> ∑ →</td>
                        <td >R$ <%=formato.format(totalPrestacao)%></td>
                        <td >R$ <%=formato.format(totalJuros)%></td>
                        <td >R$ <%=formato.format(totalAmortizacao)%></td>
                        <td >  -  </td>
                        
                    </tr>
                </table>
                
             </div>
           <% } catch (Exception ex) { 
                     if (request.getParameter("taxa")!=null) {
            
            %>
            
                     <script>
                        alert("Parâmetro inválido. Digite os dados corretamente.");
                     </script>  
             <%
                     }
                }
     
         } %>
        </div>
    </body>
        <%@include file="WEB-INF/jspf/footer.jspf" %>    
    
</html>
