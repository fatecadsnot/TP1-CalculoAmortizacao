<%-- 
    Document   : price
    Created on : 05/03/2020, 23:22:45
    Author     : iego_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css" />

        <title>Tabela Price</title>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
    </head>
    <body>
      <div align="center">
        <h1>Tabela Price</h1>
        <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.</p>
        <p>A tabela Price usa o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado.</p>
        <br/>
        <img id="imgPrice" src="./formulaPrice.jpg" alt="Formula do cálculo de amortização PRICE">
      </div>
      
      <br/>
      <hr/>
      <br/>
    
      <table id="entradaDados">
        <tr>
          <td><label for="valorFinanciado">Valor Financiado: <input type="number" name="Valor Financiado" id="valorFinanciado"></label></td>
          <td><label for="prazo">Prazo (m): <input type="number" name="Prazo" id="prazo"></label></td>
          <td><label for="Taxa de juros">Taxa de Juros mensal (%): <input type="number" name="Juros" id="juros"></label></td>
          <td><input type="submit" name="calcular" value="calcular"></td>
        </tr>
      </table>
            
      <br/>

      <table id="tabelaPrice">
       
        <tr>
          <th>#</th>
          <th>Parcelas</th>
          <th>Amortizações</th>
          <th>Juros</th>
          <th>Saldo Devedor</th>
        </tr>

        <% int i = 0; %>

        <!-- <% if(request.getParameter("calcular")!=null){ %>          
          <% double valorFinanciado = Double.valueOf(request.getParameter("valorFinanciado")); %>
          <% double prazo = Double.valueOf(request.getParameter("prazo")); %>
          <% double juros = Double.valueOf(request.getParameter("juros")); %>

          <% for ( i=0; i < prazo; i++) { %> -->
      
                <tr>               
                  <td><%= i %></td>
                  <td><%= i %></td>
                  <td><%= i %></td>
                  <td><%= i %></td>
                  <td><%= i %></td>
                </tr>
          <!-- <% }%>
        <% }%> -->
        

        <tr>
          <td>Totais</td>
          <td><%= i %></td>
          <td><%= i %></td>
          <td><%= i %></td>
          <td><%= i %></td>
        </tr>

      </table>
    
      


    </body>

    <footer>
      <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </footer>
</html>
