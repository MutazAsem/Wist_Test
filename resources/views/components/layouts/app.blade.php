<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>{{ $title ?? 'Page Title' }}</title>

    <link rel="apple-touch-icon" sizes="180x180" href="{{ asset('client/images/favicons/apple-touch-icon.png') }}" />
    <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('client/images/favicons/favicon-32x32.png') }}" />
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('client/images/favicons/favicon-16x16.png') }}" />
    <link rel="manifest" href="{{ asset('client/images/favicons/site.webmanifest')}}" />
    <meta name="description" content="Eduact HTML Template For Educaton & LMS" />

    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Urbanist:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;family=Water+Brush&amp;display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="{{ asset('client/vendors/bootstrap/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/bootstrap-select/bootstrap-select.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/jquery-ui/jquery-ui.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/animate/animate.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/fontawesome/css/all.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/eduact-icons/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/jarallax/jarallax.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/jquery-magnific-popup/jquery.magnific-popup.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/nouislider/nouislider.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/nouislider/nouislider.pips.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/odometer/odometer.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/tiny-slider/tiny-slider.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/owl-carousel/assets/owl.carousel.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('client/vendors/owl-carousel/assets/owl.theme.default.min.css') }}" />

    <!-- template styles -->
    <link rel="stylesheet" href="{{ asset('client/css/eduact.css') }}" />
    @livewireStyles
</head>

<body class="custom-cursor">

    @livewire('layouts.navbar')

    {{ $slot }}

    @livewire('layouts.footer')

    <script src="{{ asset('client/vendors/jquery/jquery-3.5.1.min.js') }}"></script>
    <script src="{{ asset('client/vendors/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('client/vendors/bootstrap-select/bootstrap-select.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-ui/jquery-ui.js') }}"></script>
    <script src="{{ asset('client/vendors/jarallax/jarallax.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-ajaxchimp/jquery.ajaxchimp.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-appear/jquery.appear.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-circle-progress/jquery.circle-progress.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-magnific-popup/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-validate/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('client/vendors/nouislider/nouislider.min.js') }}"></script>
    <script src="{{ asset('client/vendors/odometer/odometer.min.js') }}"></script>
    <script src="{{ asset('client/vendors/tiny-slider/tiny-slider.min.js') }}"></script>
    <script src="{{ asset('client/vendors/owl-carousel/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('client/vendors/wnumb/wNumb.min.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-circleType/jquery.circleType.js') }}"></script>
    <script src="{{ asset('client/vendors/jquery-lettering/jquery.lettering.min.js') }}"></script>
    <script src="{{ asset('client/vendors/tilt/tilt.jquery.js') }}"></script>
    <script src="{{ asset('client/vendors/wow/wow.js') }}"></script>
    <script src="{{ asset('client/vendors/isotope/isotope.js') }}"></script>
    <script src="{{ asset('client/vendors/countdown/countdown.min.js') }}"></script>
    <!-- template js -->
    <script src="{{ asset('client/js/eduact.js') }}"></script>
    @livewireScripts
</body>

</html>
