<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield("title")</title>
    <link rel="stylesheet" href="{{ asset("css/app.css") }}">
    <link rel="stylesheet" href="{{ asset("css/all.css") }}">
</head>
<body>

    <div id="app">
        <div class="container-fluid">
            @yield("container")
        </div>
    </div>



    <script src="{{ asset("js/app.js") }}"></script>
</body>
</html>
