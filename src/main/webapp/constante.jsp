<%-- 
    Document   : price
    Created on : 05/03/2020, 23:22:45
    Author     : iego_
--%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css" />

        <title>Tabela Constante</title>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
    </head>
    <body>
      <div align="center">
        <h1>Tabela Constante</h1>
        <!--<p>Tabela Constante... </p>-->
        <br/>
      </div>
      
      <br/>
      <hr/>
      <br/>

      <form>
      
        <table id="entradaDados">
          <tr>
            <td><label for="valorFinanciadoId">Valor Financiado: <input type="number" name="valorFinanciadoInput" id="valorFinanciadoId" required></label></td>
            <td><label for="prazoId">Prazo (m): <input type="number" name="prazoInput" id="prazoId" required></label></td>
            <td><label for="txJurosId">Taxa de Juros mensal (%): <input type="number" name="txJurosInput" id="txJurosId" required></label></td>
            <td><input type="submit" name="calcular" value="CALCULAR"></td>
          </tr>
        </table>
              
        <br/>

        <% Locale localeBR = new Locale("pt","BR"); %>
        <% NumberFormat currencyBr = NumberFormat.getCurrencyInstance(localeBR); %>
        
        <% if(request.getParameter("calcular") != null){ %>
        
        <% try{ %>

          <% double valorFinanciado = Double.valueOf(request.getParameter("valorFinanciadoInput")); %>
          <% double prazo = Double.valueOf(request.getParameter("prazoInput")); %>
          <% double txJuros = Double.valueOf(request.getParameter("txJurosInput"))/100; %>
          
          <div class="alignCenter">
            <b>Valor Financiado:</b> <%= currencyBr.format(valorFinanciado) %>  |  <b>Prazo:</b> <%= (int) prazo + " meses" %>  |  <b>Taxa de juros mensal:</b> <%= txJuros*100 + "%" %>
          </div>
          
          <br/>

          <table id="tabelaPrice">
            <tr>
              <th id="indice">#</th>
              <th>Parcelas</th>
              <th>Amortizações</th>
              <th>Juros</th>
              <th>Saldo Devedor</th>
            </tr>
            
            <tr>
              <td class="alignCenter">0</td>
              <td class="alignCenter">-</td>
              <td class="alignCenter">-</td>
              <td class="alignCenter">-</td>
              <td class="alignRight">-</td>
            </tr>

            <% for (int i=1; i <= prazo; i++) { %>
            
                  <tr>         
                    <td class="alignCenter"><%= i %></td>
                    <td class="alignRight"></td>
                    <td class="alignRight"></td>
                    <td class="alignRight"></td>
                    <td class="alignRight"></td>
                  </tr>
              
            <% }%>
            
            <tr id="trTotais">
              <td class="alignCenter">#</td>
              <td class="alignCenter"></td>
              <td class="alignCenter"></td>
              <td class="alignCenter"></td>
              <td class="alignCenter">TOTAIS</td>
            </tr>

          </table>
            
          <% }catch(Exception e){%>
            <h2 class="valorInvalido">Valores Inválidos</h2>
          <% }%>

        <% }%>
      </form>
    </body>

    <footer>
      <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </footer>
</html>
