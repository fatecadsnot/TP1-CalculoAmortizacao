<%-- Document   : index Created on : 05/03/2020, 19:43:00 Author     : guiit --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>        
<%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <header class="masthead" style="background-image: url('home-bg.jpg')">
          <div class="overlay"></div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                  <h1>Amortização</h1>
                  <span class="subheading">TP01 - Programação Orientada Objetos</span>
                </div>
              </div>
            </div>
          </div>
        </header>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Gabriel Fernandes Bento</label></center>
                </div>
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Guilherme Roberto Torato</label></center>
                </div>
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Iego Aguiar Ribeiro</label></center>
                </div>
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Vinícius Teodosio Alves</label></center>
                </div>
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Wagner de Almeida</label></center>
                </div>
                <div class="col-lg-2 col-md-12 mx-auto">
                    <center><label><img src="avatar.png" width=100 height=80></label></center>
                    <center><label>Wesley Ramos Neres Santiago</label></center>
                </div>
            </div>
            <br>        
        <hr>
        <br>
        <h1>Amortização Americana</h1>
        <p> O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
        
        <br>
        <h1>Amortização Constante</h1>
        <p>Forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo. Neste sistema o saldo devedor é reembolsado em valores de amortização iguais. Desta forma, no sistema SAC o valor das prestações é decrescente, já que os juros diminuem a cada prestação.</p>
        
        <br>
        <h1>Tabela Price</h1>
        <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais.</p>
        <p>A tabela Price usa o regime de juros compostos para calcular o valor das parcelas de um empréstimo e, dessa parcela, há uma proporção relativa ao pagamento de juros e amortização do valor emprestado.</p>
        </div>
        
    </body>
    <footer>
      <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </footer>
</html>