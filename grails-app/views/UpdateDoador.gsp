<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Doe Sangue - Alterar Doador</title>

    <script>
        window.onload = populateSelect();

        function dateToYMD(date) {
            var d = date.getDate();
            var m = date.getMonth() + 1; //Month from 0 to 11
            var y = date.getFullYear();
            return '' + (d <= 9 ? '0' + d : d) + '-' +  (m<=9 ? '0' + m : m) + '-' + y;
        }


        function populateSelect() {
            
            let searchParams = new URLSearchParams(window.location.search);
            var urlCriada;
            if(searchParams.has('id'))
            {
                let param = searchParams.get('id');
                urlCriada = "doador/?id=" + param;
            } 

            //alert(urlCriada);
            var xhr = new XMLHttpRequest(), 
            method = 'GET',
            overrideMimeType = 'application/json',
            url = urlCriada;     
            
            xhr.onreadystatechange = function () {
                
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

                    var birds = JSON.parse(xhr.responseText);
                    //for (var i = 0; i < birds.length; i++) {
                        //alert(birds.nome);
                    $('#nome').val(birds.nome);
                    $('#id').val(birds.id);
                    $('#cpf').val(birds.cpf);
                    $('#endereco').val(birds.endereco);
                    $('#email').val(birds.email);
                    $("#form").attr('action', '/doador/update/' + birds.id);
                    //}
                }
            };
            xhr.open(method, url, true);
            xhr.send();
        }
    </script>


</head>
<body>
<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastros<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="/cadDoador">Doador</a></li>
            <li class="dropdown-item"><a href="/cadDoador">Agendamento</a></li>
        </ul>
    </li>
</content>

<!--<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="doesangue.png" class="grails-logo"/>
    </div>
</div>-->

<div id="content" role="main" style="background-color:#fffff;height:600px">
    <section class="row colset-2-its">
        <h1>Alterar Doador</h1>

        <!--<p>
            Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display
            whatever content you may choose. Below is a list of controllers that are currently deployed in
            this application, click on each to execute its default action:
        </p> -->
        <div class="col-lg-12">
            
            <form id="form" method="post">
                <input required type="text" class="form-control" id="id" name="id" hidden>
                <div class="form-group">
                    <label for="nome">Nome</label>
                    <input required type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do doador">
                </div>
                <div class="form-group">
                    <label for="cpf">CPF</label>
                    <input required type="text" onkeydown="javascript: fMasc( this, mCPF );" class="form-control cpf-mask" id="cpf" name= "cpf" placeholder="Digite o cpf do doador">
                </div>
                <div class="form-group">
                    <label for="endereco">Endereço</label>
                    <input required type="text" class="form-control" id="endereco" name="endereco" placeholder="Digite o endereço do doador">
                </div>
                <div class="form-group">
                    <label for="email">E-mail</label>
                    <input required type="email" class="form-control" id="email" name="email" placeholder="E-mail do doador">
                </div>

                <button type="submit" class="btn btn-danger" style="align:center">Alterar</button>
            </form>

        </div>


        </br>
        </br>
        </br>

        <!--<div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div> 
    </section>
</div> -->

</body>
</html>
