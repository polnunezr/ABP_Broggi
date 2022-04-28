<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="{{ asset('css/miCss.css') }}">

<link rel="icon" href="http://daw.abp-politecnics.com/daw03/images/logo/logo.ico" sizes="32x32" type="image/png">

<title>@yield('titol')</title>
</head>

<body>
    <nav class="navbar navbar-fixed-top  navbar-expand-lg navbar-dark" id="">
        <div class="logo2">
        <img
            src="http://daw.abp-politecnics.com/daw03/images/logo/cropp/logo.svg" alt="tag" height="45.25"
                width="70">
            </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        Dades mestres
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{ url('/expedients_controller') }} ">Expedient</a>
                        <a class="dropdown-item" href="{{ url('/grafica') }} ">Grafica</a>



                    </div>
                </li>

            </ul>

        </div>
    </nav>
    <div class="container">
        @yield('name')
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script>
        yield('script')
    </script>
    <script src="https://unpkg.com/feather-icons"></script>

    <script src="https://kit.fontawesome.com/606a75912f.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>
