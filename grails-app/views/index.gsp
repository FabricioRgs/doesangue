<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Doe Sangue</title>
</head>
<body>
<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastros<span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li class="dropdown-item"><a href="/cadDoador">Doador</a></li>
            <li class="dropdown-item"><a href="/cadAgendamento">Agendamento</a></li>
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
        <h1>Doe Sangue</h1>

        <!--<p>
            Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display
            whatever content you may choose. Below is a list of controllers that are currently deployed in
            this application, click on each to execute its default action:
        </p> -->
        <div class="col-lg-6 container" style="border-style:solid;border-radius: 10px;">
            <h2 style ="text-align:center">Doadores</h2>

            <div id="DivA" class="col-lg-6" >
                <a href="/cadDoador">
                    <asset:image src="add.png" alt="Grails Documentation" class="float-left"/>
                </a>
                <p style = "text-align:Center">Cadastrar</p>
            </div>

            <div  id="DivLateral" class="col-lg-6 ">
                <a href="/listagemDoadores">
                    <asset:image src="list.png" alt="Grails Documentation" class="float-left"/>
                </a>
                <p style = "text-align:Center">Listar</p>
            </div>
        </div>


        <div class="col-lg-6 container" style="border-style:solid;border-radius: 10px;">
            <h2 style ="text-align:center">Agendamento</h2>
            <div style="align=center">
                <div id="DivA" class="col-lg-6" >
                    <a href="/cadAgendamento">
                        <asset:image src="agendar.png" alt="Grails Documentation" class="float-left"/>
                    </a>
                    <p style = "text-align:Center" >Agendar</p>
                </div>

                <div  id="DivLateral" class="col-lg-6 ">
                    <a href="/listagemAgendamento">
                        <asset:image src="list.png" alt="Grails Documentation" class="float-left"/>
                    </a>
                    <p style = "text-align:Center">Listar</p>
                </div>
            </div>
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
