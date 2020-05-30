<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Doe Sangue - Alterar Agendamento</title>

    <script>
        window.onload = PreencheCombo();
        window.onload = populateSelect();

        function dateToYMD(date) {
            var d = date.getDate();
            var m = date.getMonth() + 1; //Month from 0 to 11
            var y = date.getFullYear();
            return '' + (d <= 9 ? '0' + d : d) + '-' +  (m<=9 ? '0' + m : m) + '-' + y;
        }

        function PreencheCombo()
        {
            var xhr2 = new XMLHttpRequest(), 
            method = 'GET',
            overrideMimeType = 'application/json',
            url = '/doador/index';       
            xhr2.onreadystatechange = function () {
                if (xhr2.readyState === XMLHttpRequest.DONE && xhr2.status === 200) {
                    var birds = JSON.parse(xhr2.responseText);
                    var ele = document.getElementById('sel');
                    for (var i = 0; i < birds.length; i++) {
                        ele.innerHTML = ele.innerHTML +
                            '<option value="' + birds[i].id + '">' + birds[i].nome + '</option>';
                    }
                }
            };
            xhr2.open(method, url, true);
            xhr2.send();
        }

        function populateSelect() {

            let searchParams = new URLSearchParams(window.location.search);
            var urlCriada;
            if(searchParams.has('id'))
            {
                let param = searchParams.get('id');
                urlCriada = "/agendamento/?id=" + param;
            } 

            
            var xhr = new XMLHttpRequest(), 
            method = 'GET',
            overrideMimeType = 'application/json',
            url = urlCriada;    
            //alert(urlCriada); 
            
            xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {

                
                var birds = JSON.parse(xhr.responseText);
                $('#id').val(birds.id);
                $("#sel").val(birds.doador.id);
                $("#form").attr('action', '/agendamento/update/' + birds.id);
                var dataAgendamento_ = new Date(birds.dataAgendamento.substring(0,10));
                var d = dataAgendamento_.getDate();
                var m = dataAgendamento_.getMonth() + 1; //Month from 0 to 11
                var y = dataAgendamento_.getFullYear();

                $("#diaAgendamento").val(d);
                $("#mesAgendamento").val(m);
                $("#AnoAgendamento").val(y);
        
                $("#status").val(birds.status);
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
        <h1>Alterar Agendamento</h1>

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
                    <label for="nome">Doador</label>
                    <select id="sel" required class="custom-select" name="doador" onchange="show(this)">
                        <option value="">Selecione o Doador</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="dataAgendamento">Data</label>
                
                          <span class='required-indicator'>*</span>
                        </label><input type="hidden" name="dataAgendamento" value="date.struct" />
                        <div class="form-row">
                      <select id="diaAgendamento" class="custom-select col-lg-4" name="dataAgendamento_day" id="dataAgendamento_day" aria-labelledby="dataAgendamento"
                      ><option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26" selected="selected">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                      </select>
                      <select id="MesAgendamento" class="custom-select col-lg-4" name="dataAgendamento_month" id="dataAgendamento_month" aria-labelledby="dataAgendamento"
                      ><option value="1">Janeiro</option>
                      <option value="2">Fevereiro</option>
                      <option value="3">Março</option>
                      <option value="4">Abril</option>
                      <option value="5" selected="selected">Maio</option>
                      <option value="6">Junho</option>
                      <option value="7">Julho</option>
                      <option value="8">Agosto</option>
                      <option value="9">Setembro</option>
                      <option value="10">Outubro</option>
                      <option value="11">Novembro</option>
                      <option value="12">Dezembro</option>
                      </select>
                      <select id="AnoAgendamento" class="custom-select col-lg-4" name="dataAgendamento_year" id="dataAgendamento_year" aria-labelledby="dataAgendamento"
                      ><option value="2120">2120</option>
                      <option value="2119">2119</option>
                      <option value="2118">2118</option>
                      <option value="2117">2117</option>
                      <option value="2116">2116</option>
                      <option value="2115">2115</option>
                      <option value="2114">2114</option>
                      <option value="2113">2113</option>
                      <option value="2112">2112</option>
                      <option value="2111">2111</option>
                      <option value="2110">2110</option>
                      <option value="2109">2109</option>
                      <option value="2108">2108</option>
                      <option value="2107">2107</option>
                      <option value="2106">2106</option>
                      <option value="2105">2105</option>
                      <option value="2104">2104</option>
                      <option value="2103">2103</option>
                      <option value="2102">2102</option>
                      <option value="2101">2101</option>
                      <option value="2100">2100</option>
                      <option value="2099">2099</option>
                      <option value="2098">2098</option>
                      <option value="2097">2097</option>
                      <option value="2096">2096</option>
                      <option value="2095">2095</option>
                      <option value="2094">2094</option>
                      <option value="2093">2093</option>
                      <option value="2092">2092</option>
                      <option value="2091">2091</option>
                      <option value="2090">2090</option>
                      <option value="2089">2089</option>
                      <option value="2088">2088</option>
                      <option value="2087">2087</option>
                      <option value="2086">2086</option>
                      <option value="2085">2085</option>
                      <option value="2084">2084</option>
                      <option value="2083">2083</option>
                      <option value="2082">2082</option>
                      <option value="2081">2081</option>
                      <option value="2080">2080</option>
                      <option value="2079">2079</option>
                      <option value="2078">2078</option>
                      <option value="2077">2077</option>
                      <option value="2076">2076</option>
                      <option value="2075">2075</option>
                      <option value="2074">2074</option>
                      <option value="2073">2073</option>
                      <option value="2072">2072</option>
                      <option value="2071">2071</option>
                      <option value="2070">2070</option>
                      <option value="2069">2069</option>
                      <option value="2068">2068</option>
                      <option value="2067">2067</option>
                      <option value="2066">2066</option>
                      <option value="2065">2065</option>
                      <option value="2064">2064</option>
                      <option value="2063">2063</option>
                      <option value="2062">2062</option>
                      <option value="2061">2061</option>
                      <option value="2060">2060</option>
                      <option value="2059">2059</option>
                      <option value="2058">2058</option>
                      <option value="2057">2057</option>
                      <option value="2056">2056</option>
                      <option value="2055">2055</option>
                      <option value="2054">2054</option>
                      <option value="2053">2053</option>
                      <option value="2052">2052</option>
                      <option value="2051">2051</option>
                      <option value="2050">2050</option>
                      <option value="2049">2049</option>
                      <option value="2048">2048</option>
                      <option value="2047">2047</option>
                      <option value="2046">2046</option>
                      <option value="2045">2045</option>
                      <option value="2044">2044</option>
                      <option value="2043">2043</option>
                      <option value="2042">2042</option>
                      <option value="2041">2041</option>
                      <option value="2040">2040</option>
                      <option value="2039">2039</option>
                      <option value="2038">2038</option>
                      <option value="2037">2037</option>
                      <option value="2036">2036</option>
                      <option value="2035">2035</option>
                      <option value="2034">2034</option>
                      <option value="2033">2033</option>
                      <option value="2032">2032</option>
                      <option value="2031">2031</option>
                      <option value="2030">2030</option>
                      <option value="2029">2029</option>
                      <option value="2028">2028</option>
                      <option value="2027">2027</option>
                      <option value="2026">2026</option>
                      <option value="2025">2025</option>
                      <option value="2024">2024</option>
                      <option value="2023">2023</option>
                      <option value="2022">2022</option>
                      <option value="2021">2021</option>
                      <option value="2020" selected="selected">2020</option>
                      <option value="2019">2019</option>
                      <option value="2018">2018</option>
                      <option value="2017">2017</option>
                      <option value="2016">2016</option>
                      <option value="2015">2015</option>
                      <option value="2014">2014</option>
                      <option value="2013">2013</option>
                      <option value="2012">2012</option>
                      <option value="2011">2011</option>
                      <option value="2010">2010</option>
                      <option value="2009">2009</option>
                      <option value="2008">2008</option>
                      <option value="2007">2007</option>
                      <option value="2006">2006</option>
                      <option value="2005">2005</option>
                      <option value="2004">2004</option>
                      <option value="2003">2003</option>
                      <option value="2002">2002</option>
                      <option value="2001">2001</option>
                      <option value="2000">2000</option>
                      <option value="1999">1999</option>
                      <option value="1998">1998</option>
                      <option value="1997">1997</option>
                      <option value="1996">1996</option>
                      <option value="1995">1995</option>
                      <option value="1994">1994</option>
                      <option value="1993">1993</option>
                      <option value="1992">1992</option>
                      <option value="1991">1991</option>
                      <option value="1990">1990</option>
                      <option value="1989">1989</option>
                      <option value="1988">1988</option>
                      <option value="1987">1987</option>
                      <option value="1986">1986</option>
                      <option value="1985">1985</option>
                      <option value="1984">1984</option>
                      <option value="1983">1983</option>
                      <option value="1982">1982</option>
                      <option value="1981">1981</option>
                      <option value="1980">1980</option>
                      <option value="1979">1979</option>
                      <option value="1978">1978</option>
                      <option value="1977">1977</option>
                      <option value="1976">1976</option>
                      <option value="1975">1975</option>
                      <option value="1974">1974</option>
                      <option value="1973">1973</option>
                      <option value="1972">1972</option>
                      <option value="1971">1971</option>
                      <option value="1970">1970</option>
                      <option value="1969">1969</option>
                      <option value="1968">1968</option>
                      <option value="1967">1967</option>
                      <option value="1966">1966</option>
                      <option value="1965">1965</option>
                      <option value="1964">1964</option>
                      <option value="1963">1963</option>
                      <option value="1962">1962</option>
                      <option value="1961">1961</option>
                      <option value="1960">1960</option>
                      <option value="1959">1959</option>
                      <option value="1958">1958</option>
                      <option value="1957">1957</option>
                      <option value="1956">1956</option>
                      <option value="1955">1955</option>
                      <option value="1954">1954</option>
                      <option value="1953">1953</option>
                      <option value="1952">1952</option>
                      <option value="1951">1951</option>
                      <option value="1950">1950</option>
                      <option value="1949">1949</option>
                      <option value="1948">1948</option>
                      <option value="1947">1947</option>
                      <option value="1946">1946</option>
                      <option value="1945">1945</option>
                      <option value="1944">1944</option>
                      <option value="1943">1943</option>
                      <option value="1942">1942</option>
                      <option value="1941">1941</option>
                      <option value="1940">1940</option>
                      <option value="1939">1939</option>
                      <option value="1938">1938</option>
                      <option value="1937">1937</option>
                      <option value="1936">1936</option>
                      <option value="1935">1935</option>
                      <option value="1934">1934</option>
                      <option value="1933">1933</option>
                      <option value="1932">1932</option>
                      <option value="1931">1931</option>
                      <option value="1930">1930</option>
                      <option value="1929">1929</option>
                      <option value="1928">1928</option>
                      <option value="1927">1927</option>
                      <option value="1926">1926</option>
                      <option value="1925">1925</option>
                      <option value="1924">1924</option>
                      <option value="1923">1923</option>
                      <option value="1922">1922</option>
                      <option value="1921">1921</option>
                      <option value="1920">1920</option>
                      </select>
                    </div>
                      
                      
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <select required id="status" class="custom-select" name="status" >
                        <option value="">Selecione o Status</option>
                        <option value="Aguardando">Aguardando</option>
                        <option value="Cancelado">Cancelado</option>
                    </select>
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
