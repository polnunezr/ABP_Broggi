<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield("title")</title>
    <link rel="icon" href="http://daw.abp-politecnics.com/daw03/images/logo/logo.ico" sizes="32x32" type="image/png">
    <link rel="stylesheet" href="{{ asset("css/app.css") }}">
    <link rel="stylesheet" href="{{ asset("css/all.css") }}">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.7.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.7.0/mapbox-gl.js"></script>
</head>
<body>

    <div id="app">
        @yield("container")

    </div>

    <script src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>
    <script src="https://kit.fontawesome.com/7fae944b38.js" crossorigin="anonymous"></script>
    <script src="{{ asset("js/app.js") }}"></script>
</body>
</html>

