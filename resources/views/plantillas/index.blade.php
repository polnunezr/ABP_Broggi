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
        <finish-section></finish-section>
        <div class="container-fluid">
            @yield("container")
        </div>
    </div>


    <script src="https://kit.fontawesome.com/7fae944b38.js" crossorigin="anonymous"></script>
    <script src="{{ asset("js/app.js") }}"></script>
</body>
</html>
