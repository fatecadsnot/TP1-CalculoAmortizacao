<%--     Document   : price    Created on : 05/03/2020, 23:22:45    Author     : iego_--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>        
<%@include file="WEB-INF/jspf/menu.jspf" %>

        <header class="masthead2" style="background-color: #868e96">
          <div class="overlay"></div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                  
                </div>
              </div>
            </div>
          </div>
        </header>
        
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
    
      <%if (request.getParameter("enviar") == null) {  %><%-- Esta estrutura condicional verifica o input submit do formulário tem algum valor, caso seja null, o formulário é aberto para receber valores.--%>

    <form> <%--Estrutura do formulário com os campos necessários para executar o cálculo --%>
        <div>
            <label><b> Valor do empréstimo </b></label><br/> 
            <input type="number" class="form-control" name="valorDivida" required="" />
        </div>
        <div>
            <label><b> Parcelas </b></label><br/> 
            <input type="number" class="form-control" name="parcelaDivida" required="" />
        </div>
        <div>
            <label><b> Taxa de Juros </b></label><br/> 
            <input type="number" class="form-control" name="taxaDivida" required="" />
        </div>
        <br/>
        <input type="submit" class="btn btn-primary float-right" name="enviar" value="Enviar"/>
    </form>

    <% } else { %>

    <%--Declarando variáveis para os cálculos --%>

    <% try {
            DecimalFormat formato = new DecimalFormat("#.##");
            int i = 1;
            double valorDivida = Double.valueOf(request.getParameter("valorDivida"));
            double meses = Double.valueOf(request.getParameter("parcelaDivida"));
            double juros = Double.valueOf(request.getParameter("taxaDivida"));
            double amortizacao = 0;
            double totalAmortizacao = 0;
            double parcela = 0;
            double totalParcela = 0;
            double jurosReais = 0;
            double totalJuros = 0;
            double saldoDevedor = 0;
            double jurosPercentual = juros / 100; %>

    <table border="1">
        <tr>
            <th>Qtd Parcela</th>
            <th>Valor Parcela</th>
            <th>Amortizações</th>
            <th>Juros</th>
            <th>Saldo Devedor</th>
        </tr>
        <%--Calculo para criar a Tabele Price--%>
        <% parcela = valorDivida * ((Math.pow(1 + jurosPercentual, meses)) * jurosPercentual) / ((Math.pow(1 + jurosPercentual, meses)) - 1); %>
        <% jurosReais = valorDivida * jurosPercentual; %>
        <% amortizacao = parcela - jurosReais; %>
        <% saldoDevedor = valorDivida - amortizacao;%>
        <tr>
            <%-- Exibição da primeira rodada de cálculos da tabela --%>
            <td><%= i%></td>
            <td><%= formato.format(parcela)%></td>
            <td><%= formato.format(amortizacao)%></td>
            <td><%= formato.format(jurosReais)%></td>
            <td><%= formato.format(saldoDevedor)%></td>  
        </tr>

        <%--Cálculos de total da amortização, total de juros, total de parcelas, laço de repetição partindo da segunda rodada, cálculo dos Juros Reais (Saldo devedor * a taxa de Juros, cálculo de amortização e cálculo de saldo devedor --%>
        <% totalAmortizacao = totalAmortizacao + amortizacao; %>
        <% totalJuros += jurosReais; %>
        <% totalParcela += parcela; %>                    
        <% for (i = 2; i <= meses; i++) {%>
        <% jurosReais = saldoDevedor * jurosPercentual; %>
        <% amortizacao = parcela - jurosReais; %>
        <% saldoDevedor = saldoDevedor - amortizacao; %>

        <%--Estrutura de decisão para definir o fim da tabela e preencher a última linha de rodadas --%>
        
        <% if (i == meses) { %>
        <% saldoDevedor = 0;%>
        <% }%>
        <tr>
            <td><%= i%></td>
            <td><%= formato.format(parcela)%></td>
            <td><%= formato.format(amortizacao)%></td>
            <td><%= formato.format(jurosReais)%></td>
            <td><%= formato.format(saldoDevedor)%></td>  
        </tr>
        
        <%--Cálculo dos totais e exibição dos resultados --%>
        <% totalAmortizacao = totalAmortizacao + amortizacao; %>
        <% totalJuros += jurosReais; %>
        <% totalParcela += parcela; %>                            
        <% }%>
        <tr>
            <td> ------- </td>
            <td><%= formato.format(totalParcela)%></td>
            <td><%= formato.format(totalAmortizacao)%></td>
            <td><%= formato.format(totalJuros)%></td>
            <td>TOTAIS</td> 
        </tr>
    </table>

    <%} //fecha chave do try
        catch (Exception ex) {%>
    <h3 <%= ex.getMessage()%></h3>
    <%}%>
    <%}%> 

    </body>

    <footer>
      <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </footer>
</html>
