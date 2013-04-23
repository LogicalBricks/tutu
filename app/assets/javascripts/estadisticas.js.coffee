# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  libros_color =  ["#FF6600", "#CC5200", "#FF8533", "#993D00", "#FFA366", "#662900", "#FFC299", "#4C1F00", "#FFE0CC" ]
  if $('#libros_frecuentes_chart').length > 0
    Morris.Donut
      element: 'libros_frecuentes_chart'
      data: $('#libros_frecuentes_chart').data('libros') 
      colors: libros_color

  if $('#libros_frecuentes_libros_chart').length > 0
    Morris.Donut
      element: 'libros_frecuentes_libros_chart'
      data: $('#libros_frecuentes_libros_chart').data('libros')
      colors: libros_color

  if $('#libros_frecuentes_juegos_chart').length > 0
    Morris.Donut
      element: 'libros_frecuentes_juegos_chart'
      data: $('#libros_frecuentes_juegos_chart').data('libros')
      colors: libros_color

  if $('#lectores_frecuentes_chart').length > 0
    Morris.Donut
      element: 'lectores_frecuentes_chart'
      data: $('#lectores_frecuentes_chart').data('lectores') 

  if $('#lectores_frecuentes_libros_chart').length > 0
    Morris.Donut
      element: 'lectores_frecuentes_libros_chart'
      data: $('#lectores_frecuentes_libros_chart').data('lectores')

  if $('#lectores_frecuentes_libros_chart').length > 0
    Morris.Donut
      element: 'lectores_frecuentes_juegos_chart'
      data: $('#lectores_frecuentes_juegos_chart').data('lectores')

