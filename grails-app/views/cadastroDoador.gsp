<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Doe Sangue</title>

    <script type="text/javascript">

			function fMasc(objeto,mascara) {
				obj=objeto
				masc=mascara
				setTimeout("fMascEx()",1)
			}
			function fMascEx() {
				obj.value=masc(obj.value)
			}
			function mCPF(cpf){
				cpf=cpf.replace(/\D/g,"")
				cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
				cpf=cpf.replace(/(\d{3})(\d)/,"$1.$2")
				cpf=cpf.replace(/(\d{3})(\d{1,2})$/,"$1-$2")
				return cpf
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
        <h1>Cadastro de Doador</h1>

        <!--<p>
            Congratulations, you have successfully started your first Grails application! At the moment
            this is the default page, feel free to modify it to either redirect to a controller or display
            whatever content you may choose. Below is a list of controllers that are currently deployed in
            this application, click on each to execute its default action:
        </p> -->

        <div class="col-lg-12">
            
            <form action="/doador/save" method="post">
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

                <button type="submit" class="btn btn-danger" style="align:center">Cadastrar</button>
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
