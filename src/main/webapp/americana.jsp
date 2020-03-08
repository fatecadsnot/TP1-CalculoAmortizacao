<%-- Document   : americana     Created on : 06/03/2020, 13:15:31    Author     : Wesley Ramos Neres Santiago--%>

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
                  <center><h1>Simulação da amortização americana</h1></center>
                    <%if (request.getParameter("enviar") == null){  %><%-- Esta estrutura condicional verifica o input submit do formulário tem algum valor, caso seja null, o formulário é aberto para receber valores.--%>

                    <form> <%--Estrutura do formulário com os campos necessários para executar o cálculo --%>
                        <div>
                            <label><b> Valor do empréstimo </b></label><br/>
                            <input type="number" class="form-control" name="valorDivida" required=""/>
                        </div>
                        <div>
                            <label><b> Parcelas </b></label><br/>
                            <input type="number" class="form-control" name="parcelaDivida" required=""/>
                        </div>
                        <div>
                            <label><b> Taxa de Juros </b></label><br />
                            <input type="number" class="form-control" name="taxaDivida" step="0.01" required="" />
                        </div>
                        <div>
                            <br/>
                            <input type="submit" class="btn btn-primary float-right" name="enviar" value="Enviar"/>
                        </div>
                        

                    </form></center>

                    <% } else { %> <%--Caso haja valores, o calculo de amortização é executado --%>
                    <%--Declarando variaveis para os cálculos --%>
                    <% try{
                        double divida = Double.parseDouble(request.getParameter("valorDivida"));
                        double parcela = Double.parseDouble(request.getParameter("parcelaDivida"));
                        double taxa = Double.parseDouble(request.getParameter("taxaDivida"));          
                        double montante = 0; 
                        double parcelas = 0;
                        DecimalFormat formato = new DecimalFormat("#.##");%>


                        <table border="1"><%-- Tabela com o resulados --%>
                        <tr>
                            <th>N° Parcelas</th> 
                            <th>Amortização</th>
                            <th>Juros (<%=taxa%> de <%=divida%>)</th>
                            <th>Dívida</th>
                            <th>Montante</th>
                        </tr>
                        <% for (int i = 0; i <= parcela +1 ; i++) {%><%-- Laço de repetição para que se crie a coluna com as parcelas numeradas uma a uma. --%>
                        <tr>
                            <td><%--Coluna das parcelas --%>
                               <% if(i < parcela){%><%--Abre chave do if --%>
                               <%=i%>
                               <%}else{%> ------- <%--Fecha chave do if e abre chave do else --%>
                               <% } %><%--Fecha chave do else--%>

                            </td>

                            <td><%--Coluna da amortização --%>
                                 <% if (i < parcela) {%>
                                0
                                <%} else if(i==parcela) {%>
                                R$ <%= formato.format(divida)%>
                                <%}else{%> -----
                                <% }%>
                            </td>

                            <td><%--Coluna dos juros --%>
                                <% if(i == 0){%>0 <%} else if(i < parcela +1){ %>
                                <%parcelas = (divida/100)*taxa;%>
                                <%=parcelas %> %
                                <% montante = montante + parcelas;%>
                                <% }else{ %> ----- 
                                <% }%>
                            </td>

                            <td><%--Coluna da dívida --%>
                                <% if(i < parcela){%>
                                R$ <%=formato.format(divida)%>
                                <% }else if(i == parcela){%>Total pago em juros:
                                <% }else{%> Total quitado:
                                <% }%>
                            </td>

                            <td><%--Coluna do montante --%>
                                 <% if(i < parcela){%>   
                                    R$ <%=formato.format(montante)%>
                                <%}else if(i == parcela){%>
                                R$ <%=formato.format(montante)%>
                                <%}else { %>
                                <% montante = montante + divida;%>
                                R$ <%=formato.format(montante)%>

                                <%}%>
                            </td>
                        <% } %><%--Fecha chave do for --%>    
                        </tr>

                    </table>
                        <%} //fecha chave do try
                        catch (Exception ex) {%>
                        <h3 <%= ex.getMessage()%></h3>
                      <%}%>

                    <%}%> 
                </div>
            </div>
        </div>
    </body>
</html>
