const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .vue()
<<<<<<< HEAD
    .sass('resources/sass/app.scss', 'public/css');
=======
    .sass('resources/sass/app.scss', 'public/css')
    .postCss("resources/css/style.css","public/css/all.css");
>>>>>>> e2baaf3b70cc3d165b4ec3147321dff6cc077d14
