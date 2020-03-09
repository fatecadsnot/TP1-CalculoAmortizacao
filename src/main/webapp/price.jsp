<%-- 
    Document   : price
    Created on : 05/03/2020, 23:22:45
    Author     : iego_
--%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>        
<%@include file="WEB-INF/jspf/menu.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <title>Tabela Price</title>
    </head>
    <body>
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
        
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <center><h1>Simulação de amortização por Tabela Price</h1></center>

                    <%if (request.getParameter("enviar") == null) {  %>

                    <form>
                        <div class="marginEntradaDados">
                            <label><b> Valor do empréstimo </b></label><br/> 
                            <input type="number" class="form-control" name="valorFinanciadoInput" placeholder="Valor em reais (R$) Ex.: 1000" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> Parcelas </b></label><br/> 
                            <input type="number" class="form-control" name="prazoInput" placeholder="Prazo em meses (m) Ex.: 12" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> Taxa de Juros </b></label><br/> 
                            <input type="number" class="form-control" name="txJurosInput" placeholder="Taxa por cento (%): Ex.: 5" required />
                        </div>
                        <div>
                            <br/>
                            <input type="submit" class="btn btn-primary float-right" name="enviar" value="Enviar"/>
                        </div>
                    </form>

                    <% } else { %>

                        <% Locale localeBR = new Locale("pt","BR"); %>
                        <% NumberFormat currencyBr = NumberFormat.getCurrencyInstance(localeBR); %>
                        
                        <% try {
                        
                            double valorFinanciado = Double.valueOf(request.getParameter("valorFinanciadoInput"));
                            double prazo = Double.valueOf(request.getParameter("prazoInput"));
                            double txJuros = Double.valueOf(request.getParameter("txJurosInput"))/100;

                            double saldoDevedor = Double.valueOf(valorFinanciado);
                            double parcela = valorFinanciado * (txJuros/(1 - Math.pow((1+txJuros),(-prazo))));
                            double juros = 0;
                            double amortizacao = 0;

                            double somaParcelas = 0;
                            double somaAmortizacoes = 0;
                            double somaJuros = 0;
                        %>
                        
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
                              <td class="alignRight"><%= currencyBr.format(saldoDevedor) %></td>
                            </tr>

                            <% for (int i=1; i <= prazo; i++) {
                                juros = saldoDevedor * txJuros;
                                saldoDevedor += (juros - parcela);
                                amortizacao = parcela - juros; %>

                                <tr>         
                                  <td class="alignCenter"><%= i %></td>
                                  <td class="alignRight"><%= currencyBr.format(parcela) %></td>
                                  <td class="alignRight"><%= currencyBr.format(amortizacao) %></td>
                                  <td class="alignRight"><%= currencyBr.format(juros) %></td>
                                  <td class="alignRight"><%= currencyBr.format(saldoDevedor) %></td>
                                </tr>

                                <%  somaParcelas += parcela; 
                                    somaAmortizacoes += amortizacao;
                                    somaJuros += juros; 
                                %>

                            <% }%>
                            
                            <tr id="trTotais">
                              <td class="alignCenter">#</td>
                              <td class="alignCenter"><%= currencyBr.format(somaParcelas) %></td>
                              <td class="alignCenter"><%= currencyBr.format(somaAmortizacoes) %></td>
                              <td class="alignCenter"><%= currencyBr.format(somaJuros) %></td>
                              <td class="alignCenter">TOTAIS</td>
                            </tr>
                            
                        </table>
                            
                        <% }catch(Exception e){%>
                            <h2 class="valorInvalido">Valores Inválidos</h2>
                        <% }%>
                        
                    <% }%> 
                        
                </div>
            </div>
        </div>
    </body>

    <footer>
      <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </footer>
</html>
