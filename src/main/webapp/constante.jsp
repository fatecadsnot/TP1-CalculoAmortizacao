<%--  Document   : constante    Created on : 05/03/2020, 13:59:21    Author     : Wesley Ramos Neres Santiago--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>        
<%@include file="WEB-INF/jspf/menu.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização americana</title>
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
                  <center><h1>Simulação da amortização Constante</h1></center>
                    <%if (request.getParameter("enviar") == null) {  %><%-- Esta estrutura condicional verifica o input submit do formulário tem algum valor, caso seja null, o formulário é aberto para receber valores.--%>

                    <form> <%--Estrutura do formulário com os campos necessários para executar o cálculo --%>
                        <div>
                            <label><b> Valor do empréstimo </b></label><br/>
                            <input type="number" class="form-control" name="valorDivida" required="" />
                                    </div>
                        <div><label><b> Parcelas </b></label><br/>
                                    <input type="number" class="form-control" name="parcelaDivida" required="" />
                                    </div>
                        <div><label><b> Taxa de Juros </b></label><br/> 
                                    <input type="number" class="form-control" name="taxaDivida" step="0.01" required="" />
                                    </div>
                        <br/>
                        <div><input type="submit" class="btn btn-primary float-right" name="enviar" value="Enviar"/>
                    </form>

        <% } else { %>
        <%--Declarando variáveis para os cálculos --%>
        <%try {
                DecimalFormat formato = new DecimalFormat("#.##");
                double taxa = 0, parcela = 0, divida = 0, amortizacao = 0, juros = 0, totalAmortizado = 0, totalJuros = 0, prestacao = 0, totalPrestacao = 0;
                taxa = Double.parseDouble(request.getParameter("taxaDivida")) / 100;
                divida = Double.parseDouble(request.getParameter("valorDivida"));
                parcela = Double.parseDouble(request.getParameter("parcelaDivida"));
                amortizacao = divida / parcela;
        %>
        <%--Linha 34 - Cálculo da Amortização --%>

        <%-- Tabela com o resulados --%>
        <table border="1">
            <tr>
                <th>Parcelas</th>
                <th>Valor da parcela</th>
                <th>Juros</th>
                <th>Amortização</th>
                <th>Saldo Devedor</th>
            </tr>
            <tr >
                <td> 0 </td>
                <td> - </td>
                <td> - </td>
                <td> - </td>
                <td>R$ <%=formato.format(divida)%></td>
            </tr>
            <%for (int i = 1; i <= parcela; i++) {%> <%--Laço de repetição para criação das linhas --%>
            <tr>
                <td><%=i%></td> <%--Coluna das parcelas --%>
                <%prestacao = amortizacao + (divida * taxa);%> <%-- Cálculo do valor das parcelas --%>
                <td>R$ <%=formato.format(prestacao)%></td><%-- Exibição do resultado do valor das parcelas --%>
                <%totalPrestacao = prestacao + totalPrestacao;
                    juros = divida * taxa;
                    totalJuros = juros + totalJuros;
                    totalAmortizado = amortizacao + totalAmortizado;%> <%--Linha 58 -Cálculo do Total das parcelas; Linha 59 - Cálculo dos Juros; Linha 60 - Total de Juros; Linha 61 -  Total da Amortização  --%>
                    
                    <%--Exibição dos juros, amortização, cálculo da dívida e exibição da dívida --%>
                    
                <td>R$ <%=formato.format(juros)%></td>
                <td>R$ <%=formato.format(amortizacao)%></td>
                <%divida = divida - amortizacao;%>
                <td>R$ <%=formato.format(divida)%></td>


            </tr>
            <%}%>
            <tr>
                
                <%-- Exibição dos totais --%>
                <td> Totais →</td>
                <td >R$ <%=formato.format(totalPrestacao)%></td>
                <td >R$ <%=formato.format(totalJuros)%></td>
                <td >R$ <%=formato.format(totalAmortizado)%></td>
                <td >  -  </td>

            </tr>
        </table>

        <%} //fecha chave do try
        catch (Exception ex) {%>
        <h3 <%= ex.getMessage()%></h3>
        <%}%>
        <%}%> 
    </body>
</html>
