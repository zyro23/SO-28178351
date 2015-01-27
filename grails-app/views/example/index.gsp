<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main"/>

        <asset:javascript src="jquery" />
        <asset:javascript src="spring-websocket" />

        <script type="text/javascript">
        $(function() { 
            var socket = new SockJS("${createLink(uri: '/stomp')}");
            var client = Stomp.over(socket);

            client.connect({}, function() {
                client.subscribe("/topic/hello", function(message) {
                    $("#helloDiv").append(JSON.parse(message.body));
                });

            client.subscribe("/topic/project", function(message) {
                    $("#anotherHelloDiv").append(JSON.parse(message.body));
                });
            });

            $("#helloButton").click(function() {
                client.send("/app/hello", {}, JSON.stringify("world"));
                client.send("/app/project", {}, JSON.stringify("PR"));
            });
        });
        </script> 
    </head>
    <body>
        <button id="helloButton">hello</button>
        <div id="helloDiv"></div>
        <div id="anotherHelloDiv"></div>
    </body>
</html>