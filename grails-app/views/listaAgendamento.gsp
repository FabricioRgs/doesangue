<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Doe Sangue</title>

    <script>
        window.onload = populateSelect();

        function dateToYMD(date) {
            var d = date.getDate();
            var m = date.getMonth() + 1; //Month from 0 to 11
            var y = date.getFullYear();
            return '' + (d <= 9 ? '0' + d : d) + '-' +  (m<=9 ? '0' + m : m) + '-' + y;
        }

        function populateSelect() {
            var xhr = new XMLHttpRequest(), 
            method = 'GET',
            overrideMimeType = 'application/json',
            url = '/agendamento/index';       
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    var birds = JSON.parse(xhr.responseText);
                    var ele = document.getElementById('tabelaAgendamento');
                    for (var i = 0; i < birds.length; i++) {
                            var mydate = new Date(birds[i].dataAgendamento.substring(0,10));
                            ele.innerHTML = ele.innerHTML +
                                '<tr > <td>' + birds[i].doador.nome + '</td> ' + '<td>' + dateToYMD(mydate) + '</td> ' + '<td>' + birds[i].status + '</td> ' + '<td align:center><a href=/atualizarAgendamento/?id=' + birds[i].id + '> <asset:image src="wheel.png" alt="Grails Documentation" class="float-left"/></a></td>' + '<td align:center><a href=/agendamento/delete/' + birds[i].id + '> <asset:image src="delete.png" alt="Grails Documentation" class="float-left"/></a></td>'  ;
                    }
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
        <h1>Listagem de Doadores</h1>

        <!--<p>
            Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display
            whatever content you may choose. Below is a list of controllers that are currently deployed in
            this application, click on each to execute its default action:
        </p> -->

        <div class="w3-container">
            <table class="table table-striped" >
                <thead>
                    <tr>
                        <th scope="col">Doador</th>
                        <th scope="col">Data</th>
                        <th scope="col">Status</th>
                        <th scope="col">Editar</th>
                        <th scope="col">Deletar</th>
                    </tr>
                </thead>
                <tbody id="tabelaAgendamento">

                </tbody>
            </table>
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
